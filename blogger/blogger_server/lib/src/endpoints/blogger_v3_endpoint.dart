import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Serverpod Endpoint porting Google Blogger API v3 REST specification
class BloggerV3Endpoint extends Endpoint {
  // --- Auth Verification Helpers ---
  bool _verifyAccess(String? apiKey, String? authToken) {
    if (apiKey != null && apiKey.isNotEmpty) return true;
    if (authToken != null && authToken.isNotEmpty) return true;
    return true; // Permissive for local dev / sandbox testing
  }

  // --- Users Resource (Blogger v3 API) ---

  /// GET /blogger/v3/users/{userId}
  Future<Map<String, dynamic>> usersGet(
    Session session, {
    required String userId,
    String? apiKey,
    String? authToken,
  }) async {
    final uId = int.tryParse(userId) ?? 1;
    final user = await UserProfile.db.findById(session, uId);

    return {
      'kind': 'blogger#user',
      'id': '${user?.id ?? 1}',
      'displayName': user?.name ?? 'Blogger Admin',
      'about': user?.bio ?? 'Blogger Author Profile',
      'url': 'https://www.blogger.com/profile/${user?.id ?? 1}',
      'blogs': {
        'selfLink': 'https://www.googleapis.com/blogger/v3/users/${user?.id ?? 1}/blogs'
      }
    };
  }

  // --- Blogs Resource (Blogger v3 API) ---

  /// GET /blogger/v3/blogs/{blogId}
  Future<Map<String, dynamic>> blogsGet(
    Session session, {
    required String blogId,
    String? apiKey,
    String? authToken,
  }) async {
    final id = int.tryParse(blogId) ?? 1;
    final blog = await BlogSite.db.findById(session, id);
    if (blog == null) {
      return {'kind': 'blogger#blog', 'error': {'code': 404, 'message': 'Blog not found'}};
    }

    final posts = await BlogPost.db.find(session, where: (t) => t.blogId.equals(id));
    final pages = await BlogPage.db.find(session, where: (t) => t.blogId.equals(id));

    return {
      'kind': 'blogger#blog',
      'id': '${blog.id}',
      'name': blog.title,
      'description': blog.description ?? '',
      'published': blog.createdAt.toIso8601String(),
      'updated': blog.createdAt.toIso8601String(),
      'url': blog.customDomain ?? 'https://${blog.subdomain}.blogger.com',
      'selfLink': 'https://www.googleapis.com/blogger/v3/blogs/${blog.id}',
      'posts': {
        'totalItems': posts.length,
        'selfLink': 'https://www.googleapis.com/blogger/v3/blogs/${blog.id}/posts'
      },
      'pages': {
        'totalItems': pages.length,
        'selfLink': 'https://www.googleapis.com/blogger/v3/blogs/${blog.id}/pages'
      },
      'locale': {'language': 'en', 'country': 'US'}
    };
  }

  /// GET /blogger/v3/blogs/byurl?url={url}
  Future<Map<String, dynamic>> blogsGetByUrl(
    Session session, {
    required String url,
    String? apiKey,
  }) async {
    final blog = await BlogSite.db.findFirstRow(
      session,
      where: (t) => t.customDomain.equals(url) | t.subdomain.equals(url.replaceAll('https://', '').replaceAll('.blogger.com', '')),
    );
    if (blog == null) {
      return {'kind': 'blogger#blog', 'error': {'code': 404, 'message': 'Blog not found by URL'}};
    }
    return blogsGet(session, blogId: '${blog.id}', apiKey: apiKey);
  }

  // --- Pages Resource (Blogger v3 API) ---

  /// GET /blogger/v3/blogs/{blogId}/pages/{pageId}
  Future<Map<String, dynamic>> pagesGet(
    Session session, {
    required String blogId,
    required String pageId,
    String? apiKey,
    String? authToken,
  }) async {
    final pgId = int.tryParse(pageId);
    if (pgId == null) {
      return {'kind': 'blogger#page', 'error': {'code': 400, 'message': 'Invalid Page ID'}};
    }
    final page = await BlogPage.db.findById(session, pgId);
    if (page == null) {
      return {'kind': 'blogger#page', 'error': {'code': 404, 'message': 'Page not found'}};
    }

    return {
      'kind': 'blogger#page',
      'id': '${page.id}',
      'blog': {'id': '${page.blogId}'},
      'published': page.publishedDate.toIso8601String(),
      'updated': page.publishedDate.toIso8601String(),
      'url': '/${page.slug}',
      'title': page.title ?? page.slug,
      'content': page.jsonLdPayload,
      'author': {'displayName': 'Blogger Author'},
    };
  }

  // --- Posts Resource (Blogger v3 API) ---

  /// GET /blogger/v3/blogs/{blogId}/posts/search?q={q}
  Future<Map<String, dynamic>> postsSearch(
    Session session, {
    required String blogId,
    required String q,
    String? apiKey,
    String? authToken,
  }) async {
    final id = int.tryParse(blogId) ?? 1;
    final lower = q.toLowerCase();
    final posts = await BlogPost.db.find(
      session,
      where: (t) => t.blogId.equals(id) & (t.title.like('%$lower%') | t.summary.like('%$lower%')),
      orderBy: (t) => t.publishedDate,
      orderDescending: true,
    );

    final items = posts.map((p) => {
      'kind': 'blogger#post',
      'id': '${p.id}',
      'blog': {'id': '$id'},
      'published': p.publishedDate.toIso8601String(),
      'updated': p.publishedDate.toIso8601String(),
      'url': '/${p.slug}',
      'title': p.title ?? p.slug,
      'content': p.jsonLdPayload,
    }).toList();

    return {
      'kind': 'blogger#postList',
      'items': items,
    };
  }

  /// GET /blogger/v3/blogs/{blogId}/posts
  Future<Map<String, dynamic>> postsList(
    Session session, {
    required String blogId,
    String? labels,
    String? status,
    int? maxResults,
    String? pageToken,
    String? apiKey,
    String? authToken,
  }) async {
    final id = int.tryParse(blogId) ?? 1;
    final posts = await BlogPost.db.find(
      session,
      where: (t) => t.blogId.equals(id),
      orderBy: (t) => t.publishedDate,
      orderDescending: true,
    );

    final items = posts.map((p) => {
      'kind': 'blogger#post',
      'id': '${p.id}',
      'blog': {'id': '$id'},
      'published': p.publishedDate.toIso8601String(),
      'updated': p.publishedDate.toIso8601String(),
      'url': '/${p.slug}',
      'selfLink': 'https://www.googleapis.com/blogger/v3/blogs/$id/posts/${p.id}',
      'title': p.title ?? p.slug,
      'content': p.jsonLdPayload,
      'author': {'id': '${p.authorId}', 'displayName': 'Blogger Author'},
      'labels': p.labels,
      'customMetaData': {
        'schemaType': p.schemaType,
        'slug': p.slug,
      }
    }).toList();

    return {
      'kind': 'blogger#postList',
      'items': items,
      'etag': 'W/"${DateTime.now().millisecondsSinceEpoch}"'
    };
  }

  /// GET /blogger/v3/blogs/{blogId}/posts/{postId}
  Future<Map<String, dynamic>> postsGet(
    Session session, {
    required String blogId,
    required String postId,
    String? apiKey,
    String? authToken,
  }) async {
    final pId = int.tryParse(postId);
    if (pId == null) {
      return {'kind': 'blogger#post', 'error': {'code': 400, 'message': 'Invalid Post ID'}};
    }
    final post = await BlogPost.db.findById(session, pId);
    if (post == null) {
      return {'kind': 'blogger#post', 'error': {'code': 404, 'message': 'Post not found'}};
    }

    return {
      'kind': 'blogger#post',
      'id': '${post.id}',
      'blog': {'id': '${post.blogId}'},
      'published': post.publishedDate.toIso8601String(),
      'updated': post.publishedDate.toIso8601String(),
      'url': '/${post.slug}',
      'selfLink': 'https://www.googleapis.com/blogger/v3/blogs/${post.blogId}/posts/${post.id}',
      'title': post.title ?? post.slug,
      'content': post.jsonLdPayload,
      'author': {'id': '${post.authorId}', 'displayName': 'Blogger Author'},
      'labels': post.labels,
      'customMetaData': {
        'schemaType': post.schemaType,
        'slug': post.slug,
      }
    };
  }

  /// POST /blogger/v3/blogs/{blogId}/posts
  Future<Map<String, dynamic>> postsInsert(
    Session session, {
    required String blogId,
    required String title,
    required String contentJsonLd,
    List<String>? labels,
    String? apiKey,
    String? authToken,
  }) async {
    final bId = int.tryParse(blogId) ?? 1;
    Map<String, dynamic> data = {};
    try {
      data = jsonDecode(contentJsonLd);
    } catch (_) {}

    final schemaType = data['@type']?.toString() ?? 'Article';
    final slug = title.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '-').replaceAll(RegExp(r'^-|-$'), '');

    final newPost = BlogPost(
      blogId: bId,
      authorId: 1,
      slug: slug,
      publishedDate: DateTime.now(),
      status: 'Published',
      labels: labels ?? [],
      schemaType: schemaType,
      jsonLdPayload: contentJsonLd,
      title: title,
      summary: data['description']?.toString(),
    );

    final saved = await BlogPost.db.insertRow(session, newPost);
    return postsGet(session, blogId: blogId, postId: '${saved.id}');
  }

  /// DELETE /blogger/v3/blogs/{blogId}/posts/{postId}
  Future<bool> postsDelete(
    Session session, {
    required String blogId,
    required String postId,
    String? apiKey,
    String? authToken,
  }) async {
    final pId = int.tryParse(postId);
    if (pId == null) return false;
    final res = await BlogPost.db.deleteWhere(session, where: (t) => t.id.equals(pId));
    return res.isNotEmpty;
  }

  // --- Comments Resource (Blogger v3 API) ---

  /// GET /blogger/v3/blogs/{blogId}/posts/{postId}/comments
  Future<Map<String, dynamic>> commentsList(
    Session session, {
    required String blogId,
    required String postId,
    String? apiKey,
    String? authToken,
  }) async {
    final bId = int.tryParse(blogId) ?? 1;
    final pId = int.tryParse(postId) ?? 1;

    final comments = await Comment.db.find(
      session,
      where: (t) => t.blogId.equals(bId) & t.postId.equals(pId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    final items = comments.map((c) => {
      'kind': 'blogger#comment',
      'id': '${c.id}',
      'post': {'id': '$pId'},
      'blog': {'id': '$bId'},
      'published': c.createdAt.toIso8601String(),
      'updated': c.createdAt.toIso8601String(),
      'content': c.content,
      'author': {'displayName': c.authorName},
    }).toList();

    return {
      'kind': 'blogger#commentList',
      'items': items,
    };
  }
}

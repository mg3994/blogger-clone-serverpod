import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class BloggerEndpoint extends Endpoint {
  // --- Posts & Pages ---
  Future<List<BlogPost>> getPosts(Session session, int blogId) async {
    return await BlogPost.db.find(
      session,
      where: (t) => t.blogId.equals(blogId),
      orderBy: (t) => t.publishedDate,
      orderDescending: true,
    );
  }

  Future<BlogPost?> getPostBySlug(Session session, int blogId, String slug) async {
    return await BlogPost.db.findFirstRow(
      session,
      where: (t) => t.blogId.equals(blogId) & t.slug.equals(slug),
    );
  }

  Future<BlogPost> createOrUpdatePost(Session session, BlogPost post) async {
    if (post.id == null) {
      return await BlogPost.db.insertRow(session, post);
    } else {
      return await BlogPost.db.updateRow(session, post);
    }
  }

  Future<bool> deletePost(Session session, int id) async {
    var result = await BlogPost.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
    return result.isNotEmpty;
  }

  Future<List<BlogPage>> getPages(Session session, int blogId) async {
    return await BlogPage.db.find(
      session,
      where: (t) => t.blogId.equals(blogId),
      orderBy: (t) => t.publishedDate,
      orderDescending: true,
    );
  }

  Future<BlogPage?> getPageBySlug(Session session, int blogId, String slug) async {
    return await BlogPage.db.findFirstRow(
      session,
      where: (t) => t.blogId.equals(blogId) & t.slug.equals(slug),
    );
  }

  Future<BlogPage> createOrUpdatePage(Session session, BlogPage page) async {
    if (page.id == null) {
      return await BlogPage.db.insertRow(session, page);
    } else {
      return await BlogPage.db.updateRow(session, page);
    }
  }

  Future<bool> deletePage(Session session, int id) async {
    var result = await BlogPage.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
    return result.isNotEmpty;
  }

  // --- Comments ---
  Future<List<Comment>> getComments(Session session, int blogId, {int? postId}) async {
    return await Comment.db.find(
      session,
      where: (t) => t.blogId.equals(blogId) & (postId != null ? t.postId.equals(postId) : Constant.bool(true)),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  Future<Comment> addComment(Session session, Comment comment) async {
    return await Comment.db.insertRow(session, comment);
  }

  Future<Comment> updateCommentStatus(Session session, int commentId, bool isApproved) async {
    var comment = await Comment.db.findById(session, commentId);
    if (comment == null) throw Exception('Comment not found');
    comment.isApproved = isApproved;
    return await Comment.db.updateRow(session, comment);
  }

  Future<bool> deleteComment(Session session, int commentId) async {
    var result = await Comment.db.deleteWhere(
      session,
      where: (t) => t.id.equals(commentId),
    );
    return result.isNotEmpty;
  }

  // --- Stats ---
  Future<List<BlogStat>> getBlogStats(Session session, int blogId) async {
    return await BlogStat.db.find(
      session,
      where: (t) => t.blogId.equals(blogId),
      orderBy: (t) => t.recordedDate,
      orderDescending: true,
    );
  }

  Future<BlogStat> recordStat(Session session, BlogStat stat) async {
    return await BlogStat.db.insertRow(session, stat);
  }

  // --- Earnings ---
  Future<BlogEarning?> getBlogEarning(Session session, int blogId) async {
    return await BlogEarning.db.findFirstRow(
      session,
      where: (t) => t.blogId.equals(blogId),
    );
  }

  Future<BlogEarning> updateBlogEarning(Session session, BlogEarning earning) async {
    if (earning.id == null) {
      return await BlogEarning.db.insertRow(session, earning);
    } else {
      return await BlogEarning.db.updateRow(session, earning);
    }
  }

  // --- Layout Widgets ---
  Future<List<LayoutWidget>> getLayoutWidgets(Session session, int blogId) async {
    return await LayoutWidget.db.find(
      session,
      where: (t) => t.blogId.equals(blogId),
      orderBy: (t) => t.sortOrder,
    );
  }

  Future<LayoutWidget> saveLayoutWidget(Session session, LayoutWidget widget) async {
    if (widget.id == null) {
      return await LayoutWidget.db.insertRow(session, widget);
    } else {
      return await LayoutWidget.db.updateRow(session, widget);
    }
  }

  Future<bool> deleteLayoutWidget(Session session, int widgetId) async {
    var result = await LayoutWidget.db.deleteWhere(
      session,
      where: (t) => t.id.equals(widgetId),
    );
    return result.isNotEmpty;
  }

  // --- Settings & Blog ---
  Future<BlogSettings?> getBlogSettings(Session session, int blogId) async {
    return await BlogSettings.db.findFirstRow(
      session,
      where: (t) => t.blogId.equals(blogId),
    );
  }

  Future<BlogSettings> updateBlogSettings(Session session, BlogSettings settings) async {
    if (settings.id == null) {
      return await BlogSettings.db.insertRow(session, settings);
    } else {
      return await BlogSettings.db.updateRow(session, settings);
    }
  }

  Future<BlogSite?> getBlog(Session session, int blogId) async {
    return await BlogSite.db.findById(session, blogId);
  }

  Future<BlogSite> createOrUpdateBlog(Session session, BlogSite blog) async {
    if (blog.id == null) {
      return await BlogSite.db.insertRow(session, blog);
    } else {
      return await BlogSite.db.updateRow(session, blog);
    }
  }

  // --- Ingestion Webhook Endpoint ---
  /// Universal Ingestion Webhook for external design tools posting raw JSON-LD schemas
  Future<BlogPost> ingestJsonLdContent(
    Session session, {
    required int blogId,
    required int authorId,
    required String rawJsonLd,
    String? customSlug,
  }) async {
    final Map<String, dynamic> data = jsonDecode(rawJsonLd);

    // Extract @type (Universal Schema.org support)
    final schemaType = data['@type']?.toString() ?? 'Article';

    // Extract title if available
    final title = data['headline']?.toString() ??
        data['name']?.toString() ??
        data['title']?.toString() ??
        'Untitled Post';

    // Extract summary/description
    final summary = data['description']?.toString() ?? data['articleBody']?.toString();

    // Extract/determine slug
    String slug = customSlug ??
        data['identifier']?.toString() ??
        (data['url'] != null ? data['url'].toString().split('/').last : null) ??
        title.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '-').replaceAll(RegExp(r'^-|-$'), '');

    if (slug.isEmpty) {
      slug = 'post-${DateTime.now().millisecondsSinceEpoch}';
    }

    // Extract labels/keywords
    List<String> labels = [];
    if (data['keywords'] != null) {
      if (data['keywords'] is List) {
        labels = (data['keywords'] as List).map((e) => e.toString()).toList();
      } else if (data['keywords'] is String) {
        labels = (data['keywords'] as String).split(',').map((e) => e.trim()).toList();
      }
    }

    // Check if post already exists with this slug for this blog
    final existingPost = await BlogPost.db.findFirstRow(
      session,
      where: (t) => t.blogId.equals(blogId) & t.slug.equals(slug),
    );

    if (existingPost != null) {
      existingPost.schemaType = schemaType;
      existingPost.jsonLdPayload = rawJsonLd;
      existingPost.title = title;
      existingPost.summary = summary;
      existingPost.labels = labels;
      existingPost.publishedDate = DateTime.now();
      return await BlogPost.db.updateRow(session, existingPost);
    } else {
      final newPost = BlogPost(
        blogId: blogId,
        authorId: authorId,
        slug: slug,
        publishedDate: DateTime.now(),
        status: 'Published',
        labels: labels,
        schemaType: schemaType,
        jsonLdPayload: rawJsonLd,
        title: title,
        summary: summary,
      );
      return await BlogPost.db.insertRow(session, newPost);
    }
  }
}

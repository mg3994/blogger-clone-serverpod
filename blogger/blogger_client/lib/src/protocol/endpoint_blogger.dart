import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'protocol.dart';

class EndpointBlogger {
  final _isc.EndpointCaller caller;
  EndpointBlogger(this.caller);

  Future<List<BlogPost>> getPosts(int blogId) async {
    final List result = await caller.callServerEndpoint<List>('blogger', 'getPosts', {'blogId': blogId});
    return result.map((e) => BlogPost.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  Future<List<BlogPost>> searchPosts(int blogId, String query) async {
    final List result = await caller.callServerEndpoint<List>('blogger', 'searchPosts', {'blogId': blogId, 'query': query});
    return result.map((e) => BlogPost.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  Future<BlogPost?> getPostBySlug(int blogId, String slug) async {
    final res = await caller.callServerEndpoint<Map?>('blogger', 'getPostBySlug', {'blogId': blogId, 'slug': slug});
    return res != null ? BlogPost.fromJson(Map<String, dynamic>.from(res)) : null;
  }

  Future<BlogPost> createOrUpdatePost(BlogPost post) async {
    final res = await caller.callServerEndpoint<Map>('blogger', 'createOrUpdatePost', {'post': post.toJson()});
    return BlogPost.fromJson(Map<String, dynamic>.from(res));
  }

  Future<bool> deletePost(int id) async {
    return await caller.callServerEndpoint<bool>('blogger', 'deletePost', {'id': id});
  }

  Future<List<BlogPage>> getPages(int blogId) async {
    final List result = await caller.callServerEndpoint<List>('blogger', 'getPages', {'blogId': blogId});
    return result.map((e) => BlogPage.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  Future<BlogPage?> getPageBySlug(int blogId, String slug) async {
    final res = await caller.callServerEndpoint<Map?>('blogger', 'getPageBySlug', {'blogId': blogId, 'slug': slug});
    return res != null ? BlogPage.fromJson(Map<String, dynamic>.from(res)) : null;
  }

  Future<BlogPage> createOrUpdatePage(BlogPage page) async {
    final res = await caller.callServerEndpoint<Map>('blogger', 'createOrUpdatePage', {'page': page.toJson()});
    return BlogPage.fromJson(Map<String, dynamic>.from(res));
  }

  Future<bool> deletePage(int id) async {
    return await caller.callServerEndpoint<bool>('blogger', 'deletePage', {'id': id});
  }

  Future<List<Comment>> getComments(int blogId, {int? postId}) async {
    final List result = await caller.callServerEndpoint<List>('blogger', 'getComments', {'blogId': blogId, 'postId': postId});
    return result.map((e) => Comment.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  Future<Comment> addComment(Comment comment) async {
    final res = await caller.callServerEndpoint<Map>('blogger', 'addComment', {'comment': comment.toJson()});
    return Comment.fromJson(Map<String, dynamic>.from(res));
  }

  Future<Comment> updateCommentStatus(int commentId, bool isApproved) async {
    final res = await caller.callServerEndpoint<Map>('blogger', 'updateCommentStatus', {'commentId': commentId, 'isApproved': isApproved});
    return Comment.fromJson(Map<String, dynamic>.from(res));
  }

  Future<bool> deleteComment(int commentId) async {
    return await caller.callServerEndpoint<bool>('blogger', 'deleteComment', {'commentId': commentId});
  }

  Future<List<BlogStat>> getBlogStats(int blogId) async {
    final List result = await caller.callServerEndpoint<List>('blogger', 'getBlogStats', {'blogId': blogId});
    return result.map((e) => BlogStat.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  Future<BlogEarning?> getBlogEarning(int blogId) async {
    final res = await caller.callServerEndpoint<Map?>('blogger', 'getBlogEarning', {'blogId': blogId});
    return res != null ? BlogEarning.fromJson(Map<String, dynamic>.from(res)) : null;
  }

  Future<List<LayoutWidget>> getLayoutWidgets(int blogId) async {
    final List result = await caller.callServerEndpoint<List>('blogger', 'getLayoutWidgets', {'blogId': blogId});
    return result.map((e) => LayoutWidget.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  Future<BlogSettings?> getBlogSettings(int blogId) async {
    final res = await caller.callServerEndpoint<Map?>('blogger', 'getBlogSettings', {'blogId': blogId});
    return res != null ? BlogSettings.fromJson(Map<String, dynamic>.from(res)) : null;
  }

  Future<BlogTheme?> getBlogTheme(int blogId) async {
    final res = await caller.callServerEndpoint<Map?>('blogger', 'getBlogTheme', {'blogId': blogId});
    return res != null ? BlogTheme.fromJson(Map<String, dynamic>.from(res)) : null;
  }

  Future<BlogTheme> updateBlogTheme(BlogTheme theme) async {
    final res = await caller.callServerEndpoint<Map>('blogger', 'updateBlogTheme', {'theme': theme.toJson()});
    return BlogTheme.fromJson(Map<String, dynamic>.from(res));
  }

  Future<List<FollowedBlog>> getFollowedBlogs(int userId) async {
    final List result = await caller.callServerEndpoint<List>('blogger', 'getFollowedBlogs', {'userId': userId});
    return result.map((e) => FollowedBlog.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  Future<FollowedBlog> followBlog(FollowedBlog followedBlog) async {
    final res = await caller.callServerEndpoint<Map>('blogger', 'followBlog', {'followedBlog': followedBlog.toJson()});
    return FollowedBlog.fromJson(Map<String, dynamic>.from(res));
  }

  Future<String> exportBlogData(int blogId) async {
    return await caller.callServerEndpoint<String>('blogger', 'exportBlogData', {'blogId': blogId});
  }

  Future<bool> importBlogData(int blogId, String rawBackupJson) async {
    return await caller.callServerEndpoint<bool>('blogger', 'importBlogData', {'blogId': blogId, 'rawBackupJson': rawBackupJson});
  }

  Future<BlogPost> ingestJsonLdContent({
    required int blogId,
    required int authorId,
    required String rawJsonLd,
    String? customSlug,
  }) async {
    final res = await caller.callServerEndpoint<Map>('blogger', 'ingestJsonLdContent', {
      'blogId': blogId,
      'authorId': authorId,
      'rawJsonLd': rawJsonLd,
      'customSlug': customSlug,
    });
    return BlogPost.fromJson(Map<String, dynamic>.from(res));
  }
}

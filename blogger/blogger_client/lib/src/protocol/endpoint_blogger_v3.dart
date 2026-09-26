import 'package:serverpod_client/serverpod_client.dart' as _isc;

class EndpointBloggerV3 {
  final _isc.EndpointCaller caller;
  EndpointBloggerV3(this.caller);

  Future<Map<String, dynamic>> blogsGet({required String blogId, String? apiKey, String? authToken}) async {
    final res = await caller.callServerEndpoint<Map>('bloggerV3', 'blogsGet', {'blogId': blogId, 'apiKey': apiKey, 'authToken': authToken});
    return Map<String, dynamic>.from(res);
  }

  Future<Map<String, dynamic>> blogsGetByUrl({required String url, String? apiKey}) async {
    final res = await caller.callServerEndpoint<Map>('bloggerV3', 'blogsGetByUrl', {'url': url, 'apiKey': apiKey});
    return Map<String, dynamic>.from(res);
  }

  Future<Map<String, dynamic>> postsList({
    required String blogId,
    String? labels,
    String? status,
    int? maxResults,
    String? pageToken,
    String? apiKey,
    String? authToken,
  }) async {
    final res = await caller.callServerEndpoint<Map>('bloggerV3', 'postsList', {
      'blogId': blogId,
      'labels': labels,
      'status': status,
      'maxResults': maxResults,
      'pageToken': pageToken,
      'apiKey': apiKey,
      'authToken': authToken,
    });
    return Map<String, dynamic>.from(res);
  }

  Future<Map<String, dynamic>> postsGet({required String blogId, required String postId, String? apiKey, String? authToken}) async {
    final res = await caller.callServerEndpoint<Map>('bloggerV3', 'postsGet', {'blogId': blogId, 'postId': postId, 'apiKey': apiKey, 'authToken': authToken});
    return Map<String, dynamic>.from(res);
  }

  Future<Map<String, dynamic>> postsInsert({
    required String blogId,
    required String title,
    required String contentJsonLd,
    List<String>? labels,
    String? apiKey,
    String? authToken,
  }) async {
    final res = await caller.callServerEndpoint<Map>('bloggerV3', 'postsInsert', {
      'blogId': blogId,
      'title': title,
      'contentJsonLd': contentJsonLd,
      'labels': labels,
      'apiKey': apiKey,
      'authToken': authToken,
    });
    return Map<String, dynamic>.from(res);
  }

  Future<bool> postsDelete({required String blogId, required String postId, String? apiKey, String? authToken}) async {
    return await caller.callServerEndpoint<bool>('bloggerV3', 'postsDelete', {'blogId': blogId, 'postId': postId, 'apiKey': apiKey, 'authToken': authToken});
  }

  Future<Map<String, dynamic>> commentsList({required String blogId, required String postId, String? apiKey, String? authToken}) async {
    final res = await caller.callServerEndpoint<Map>('bloggerV3', 'commentsList', {'blogId': blogId, 'postId': postId, 'apiKey': apiKey, 'authToken': authToken});
    return Map<String, dynamic>.from(res);
  }
}

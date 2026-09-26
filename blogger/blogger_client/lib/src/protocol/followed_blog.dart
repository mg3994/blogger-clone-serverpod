/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class FollowedBlog
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  FollowedBlog._({
    this.id,
    required this.userId,
    required this.blogId,
    required this.blogTitle,
    required this.blogUrl,
    required this.followedAt,
  });

  factory FollowedBlog({
    int? id,
    required int userId,
    required int blogId,
    required String blogTitle,
    required String blogUrl,
    required DateTime followedAt,
  }) = _FollowedBlogImpl;

  factory FollowedBlog.fromJson(Map<String, dynamic> jsonSerialization) {
    return FollowedBlog(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      blogId: jsonSerialization['blogId'] as int,
      blogTitle: jsonSerialization['blogTitle'] as String,
      blogUrl: jsonSerialization['blogUrl'] as String,
      followedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['followedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int blogId;

  String blogTitle;

  String blogUrl;

  DateTime followedAt;

  /// Returns a shallow copy of this [FollowedBlog]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  FollowedBlog copyWith({
    int? id,
    int? userId,
    int? blogId,
    String? blogTitle,
    String? blogUrl,
    DateTime? followedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FollowedBlog',
      if (id != null) 'id': id,
      'userId': userId,
      'blogId': blogId,
      'blogTitle': blogTitle,
      'blogUrl': blogUrl,
      'followedAt': followedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FollowedBlog',
      if (id != null) 'id': id,
      'userId': userId,
      'blogId': blogId,
      'blogTitle': blogTitle,
      'blogUrl': blogUrl,
      'followedAt': followedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FollowedBlogImpl extends FollowedBlog {
  _FollowedBlogImpl({
    int? id,
    required int userId,
    required int blogId,
    required String blogTitle,
    required String blogUrl,
    required DateTime followedAt,
  }) : super._(
         id: id,
         userId: userId,
         blogId: blogId,
         blogTitle: blogTitle,
         blogUrl: blogUrl,
         followedAt: followedAt,
       );

  /// Returns a shallow copy of this [FollowedBlog]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  FollowedBlog copyWith({
    Object? id = _Undefined,
    int? userId,
    int? blogId,
    String? blogTitle,
    String? blogUrl,
    DateTime? followedAt,
  }) {
    return FollowedBlog(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      blogId: blogId ?? this.blogId,
      blogTitle: blogTitle ?? this.blogTitle,
      blogUrl: blogUrl ?? this.blogUrl,
      followedAt: followedAt ?? this.followedAt,
    );
  }
}

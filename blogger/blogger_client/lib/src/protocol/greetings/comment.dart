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

abstract class Comment
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Comment._({
    this.id,
    required this.blogId,
    required this.postId,
    this.parentCommentId,
    required this.authorName,
    this.authorEmail,
    required this.content,
    required this.createdAt,
    required this.isApproved,
  });

  factory Comment({
    int? id,
    required int blogId,
    required int postId,
    int? parentCommentId,
    required String authorName,
    String? authorEmail,
    required String content,
    required DateTime createdAt,
    required bool isApproved,
  }) = _CommentImpl;

  factory Comment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Comment(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      postId: jsonSerialization['postId'] as int,
      parentCommentId: jsonSerialization['parentCommentId'] as int?,
      authorName: jsonSerialization['authorName'] as String,
      authorEmail: jsonSerialization['authorEmail'] as String?,
      content: jsonSerialization['content'] as String,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      isApproved: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isApproved'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int blogId;

  int postId;

  int? parentCommentId;

  String authorName;

  String? authorEmail;

  String content;

  DateTime createdAt;

  bool isApproved;

  /// Returns a shallow copy of this [Comment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Comment copyWith({
    int? id,
    int? blogId,
    int? postId,
    int? parentCommentId,
    String? authorName,
    String? authorEmail,
    String? content,
    DateTime? createdAt,
    bool? isApproved,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Comment',
      if (id != null) 'id': id,
      'blogId': blogId,
      'postId': postId,
      if (parentCommentId != null) 'parentCommentId': parentCommentId,
      'authorName': authorName,
      if (authorEmail != null) 'authorEmail': authorEmail,
      'content': content,
      'createdAt': createdAt.toJson(),
      'isApproved': isApproved,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Comment',
      if (id != null) 'id': id,
      'blogId': blogId,
      'postId': postId,
      if (parentCommentId != null) 'parentCommentId': parentCommentId,
      'authorName': authorName,
      if (authorEmail != null) 'authorEmail': authorEmail,
      'content': content,
      'createdAt': createdAt.toJson(),
      'isApproved': isApproved,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommentImpl extends Comment {
  _CommentImpl({
    int? id,
    required int blogId,
    required int postId,
    int? parentCommentId,
    required String authorName,
    String? authorEmail,
    required String content,
    required DateTime createdAt,
    required bool isApproved,
  }) : super._(
         id: id,
         blogId: blogId,
         postId: postId,
         parentCommentId: parentCommentId,
         authorName: authorName,
         authorEmail: authorEmail,
         content: content,
         createdAt: createdAt,
         isApproved: isApproved,
       );

  /// Returns a shallow copy of this [Comment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Comment copyWith({
    Object? id = _Undefined,
    int? blogId,
    int? postId,
    Object? parentCommentId = _Undefined,
    String? authorName,
    Object? authorEmail = _Undefined,
    String? content,
    DateTime? createdAt,
    bool? isApproved,
  }) {
    return Comment(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      postId: postId ?? this.postId,
      parentCommentId: parentCommentId is int?
          ? parentCommentId
          : this.parentCommentId,
      authorName: authorName ?? this.authorName,
      authorEmail: authorEmail is String? ? authorEmail : this.authorEmail,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isApproved: isApproved ?? this.isApproved,
    );
  }
}

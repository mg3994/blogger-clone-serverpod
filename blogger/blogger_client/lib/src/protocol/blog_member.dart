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

abstract class BlogMember
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  BlogMember._({
    this.id,
    required this.blogId,
    required this.userId,
    required this.userEmail,
    required this.role,
    required this.status,
    required this.joinedAt,
  });

  factory BlogMember({
    int? id,
    required int blogId,
    required int userId,
    required String userEmail,
    required String role,
    required String status,
    required DateTime joinedAt,
  }) = _BlogMemberImpl;

  factory BlogMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlogMember(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      userId: jsonSerialization['userId'] as int,
      userEmail: jsonSerialization['userEmail'] as String,
      role: jsonSerialization['role'] as String,
      status: jsonSerialization['status'] as String,
      joinedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['joinedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int blogId;

  int userId;

  String userEmail;

  String role;

  String status;

  DateTime joinedAt;

  /// Returns a shallow copy of this [BlogMember]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  BlogMember copyWith({
    int? id,
    int? blogId,
    int? userId,
    String? userEmail,
    String? role,
    String? status,
    DateTime? joinedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BlogMember',
      if (id != null) 'id': id,
      'blogId': blogId,
      'userId': userId,
      'userEmail': userEmail,
      'role': role,
      'status': status,
      'joinedAt': joinedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BlogMember',
      if (id != null) 'id': id,
      'blogId': blogId,
      'userId': userId,
      'userEmail': userEmail,
      'role': role,
      'status': status,
      'joinedAt': joinedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlogMemberImpl extends BlogMember {
  _BlogMemberImpl({
    int? id,
    required int blogId,
    required int userId,
    required String userEmail,
    required String role,
    required String status,
    required DateTime joinedAt,
  }) : super._(
         id: id,
         blogId: blogId,
         userId: userId,
         userEmail: userEmail,
         role: role,
         status: status,
         joinedAt: joinedAt,
       );

  /// Returns a shallow copy of this [BlogMember]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  BlogMember copyWith({
    Object? id = _Undefined,
    int? blogId,
    int? userId,
    String? userEmail,
    String? role,
    String? status,
    DateTime? joinedAt,
  }) {
    return BlogMember(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      role: role ?? this.role,
      status: status ?? this.status,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }
}

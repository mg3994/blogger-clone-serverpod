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

abstract class CustomRedirect
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CustomRedirect._({
    this.id,
    required this.blogId,
    required this.fromPath,
    required this.toPath,
    required this.isPermanent,
    required this.createdAt,
  });

  factory CustomRedirect({
    int? id,
    required int blogId,
    required String fromPath,
    required String toPath,
    required bool isPermanent,
    required DateTime createdAt,
  }) = _CustomRedirectImpl;

  factory CustomRedirect.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomRedirect(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      fromPath: jsonSerialization['fromPath'] as String,
      toPath: jsonSerialization['toPath'] as String,
      isPermanent: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isPermanent'],
      ),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int blogId;

  String fromPath;

  String toPath;

  bool isPermanent;

  DateTime createdAt;

  /// Returns a shallow copy of this [CustomRedirect]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CustomRedirect copyWith({
    int? id,
    int? blogId,
    String? fromPath,
    String? toPath,
    bool? isPermanent,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CustomRedirect',
      if (id != null) 'id': id,
      'blogId': blogId,
      'fromPath': fromPath,
      'toPath': toPath,
      'isPermanent': isPermanent,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CustomRedirect',
      if (id != null) 'id': id,
      'blogId': blogId,
      'fromPath': fromPath,
      'toPath': toPath,
      'isPermanent': isPermanent,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomRedirectImpl extends CustomRedirect {
  _CustomRedirectImpl({
    int? id,
    required int blogId,
    required String fromPath,
    required String toPath,
    required bool isPermanent,
    required DateTime createdAt,
  }) : super._(
         id: id,
         blogId: blogId,
         fromPath: fromPath,
         toPath: toPath,
         isPermanent: isPermanent,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CustomRedirect]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CustomRedirect copyWith({
    Object? id = _Undefined,
    int? blogId,
    String? fromPath,
    String? toPath,
    bool? isPermanent,
    DateTime? createdAt,
  }) {
    return CustomRedirect(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      fromPath: fromPath ?? this.fromPath,
      toPath: toPath ?? this.toPath,
      isPermanent: isPermanent ?? this.isPermanent,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

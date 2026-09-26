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

abstract class EmailSubscriber
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  EmailSubscriber._({
    this.id,
    required this.blogId,
    required this.email,
    required this.isConfirmed,
    required this.subscribedAt,
  });

  factory EmailSubscriber({
    int? id,
    required int blogId,
    required String email,
    required bool isConfirmed,
    required DateTime subscribedAt,
  }) = _EmailSubscriberImpl;

  factory EmailSubscriber.fromJson(Map<String, dynamic> jsonSerialization) {
    return EmailSubscriber(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      email: jsonSerialization['email'] as String,
      isConfirmed: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isConfirmed'],
      ),
      subscribedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['subscribedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int blogId;

  String email;

  bool isConfirmed;

  DateTime subscribedAt;

  /// Returns a shallow copy of this [EmailSubscriber]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  EmailSubscriber copyWith({
    int? id,
    int? blogId,
    String? email,
    bool? isConfirmed,
    DateTime? subscribedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EmailSubscriber',
      if (id != null) 'id': id,
      'blogId': blogId,
      'email': email,
      'isConfirmed': isConfirmed,
      'subscribedAt': subscribedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EmailSubscriber',
      if (id != null) 'id': id,
      'blogId': blogId,
      'email': email,
      'isConfirmed': isConfirmed,
      'subscribedAt': subscribedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EmailSubscriberImpl extends EmailSubscriber {
  _EmailSubscriberImpl({
    int? id,
    required int blogId,
    required String email,
    required bool isConfirmed,
    required DateTime subscribedAt,
  }) : super._(
         id: id,
         blogId: blogId,
         email: email,
         isConfirmed: isConfirmed,
         subscribedAt: subscribedAt,
       );

  /// Returns a shallow copy of this [EmailSubscriber]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  EmailSubscriber copyWith({
    Object? id = _Undefined,
    int? blogId,
    String? email,
    bool? isConfirmed,
    DateTime? subscribedAt,
  }) {
    return EmailSubscriber(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      email: email ?? this.email,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      subscribedAt: subscribedAt ?? this.subscribedAt,
    );
  }
}

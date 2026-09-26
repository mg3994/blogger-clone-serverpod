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

abstract class BlogStat
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  BlogStat._({
    this.id,
    required this.blogId,
    this.postId,
    required this.pageViews,
    required this.uniqueVisitors,
    required this.referrerSource,
    required this.country,
    required this.recordedDate,
  });

  factory BlogStat({
    int? id,
    required int blogId,
    int? postId,
    required int pageViews,
    required int uniqueVisitors,
    required String referrerSource,
    required String country,
    required DateTime recordedDate,
  }) = _BlogStatImpl;

  factory BlogStat.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlogStat(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      postId: jsonSerialization['postId'] as int?,
      pageViews: jsonSerialization['pageViews'] as int,
      uniqueVisitors: jsonSerialization['uniqueVisitors'] as int,
      referrerSource: jsonSerialization['referrerSource'] as String,
      country: jsonSerialization['country'] as String,
      recordedDate: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['recordedDate'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int blogId;

  int? postId;

  int pageViews;

  int uniqueVisitors;

  String referrerSource;

  String country;

  DateTime recordedDate;

  /// Returns a shallow copy of this [BlogStat]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  BlogStat copyWith({
    int? id,
    int? blogId,
    int? postId,
    int? pageViews,
    int? uniqueVisitors,
    String? referrerSource,
    String? country,
    DateTime? recordedDate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BlogStat',
      if (id != null) 'id': id,
      'blogId': blogId,
      if (postId != null) 'postId': postId,
      'pageViews': pageViews,
      'uniqueVisitors': uniqueVisitors,
      'referrerSource': referrerSource,
      'country': country,
      'recordedDate': recordedDate.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BlogStat',
      if (id != null) 'id': id,
      'blogId': blogId,
      if (postId != null) 'postId': postId,
      'pageViews': pageViews,
      'uniqueVisitors': uniqueVisitors,
      'referrerSource': referrerSource,
      'country': country,
      'recordedDate': recordedDate.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlogStatImpl extends BlogStat {
  _BlogStatImpl({
    int? id,
    required int blogId,
    int? postId,
    required int pageViews,
    required int uniqueVisitors,
    required String referrerSource,
    required String country,
    required DateTime recordedDate,
  }) : super._(
         id: id,
         blogId: blogId,
         postId: postId,
         pageViews: pageViews,
         uniqueVisitors: uniqueVisitors,
         referrerSource: referrerSource,
         country: country,
         recordedDate: recordedDate,
       );

  /// Returns a shallow copy of this [BlogStat]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  BlogStat copyWith({
    Object? id = _Undefined,
    int? blogId,
    Object? postId = _Undefined,
    int? pageViews,
    int? uniqueVisitors,
    String? referrerSource,
    String? country,
    DateTime? recordedDate,
  }) {
    return BlogStat(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      postId: postId is int? ? postId : this.postId,
      pageViews: pageViews ?? this.pageViews,
      uniqueVisitors: uniqueVisitors ?? this.uniqueVisitors,
      referrerSource: referrerSource ?? this.referrerSource,
      country: country ?? this.country,
      recordedDate: recordedDate ?? this.recordedDate,
    );
  }
}

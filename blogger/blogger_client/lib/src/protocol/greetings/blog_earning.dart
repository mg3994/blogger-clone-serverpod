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

abstract class BlogEarning
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  BlogEarning._({
    this.id,
    required this.blogId,
    this.adSensePublisherId,
    required this.autoAdsEnabled,
    required this.estimatedRevenue,
    required this.impressions,
    required this.clicks,
    required this.updatedAt,
  });

  factory BlogEarning({
    int? id,
    required int blogId,
    String? adSensePublisherId,
    required bool autoAdsEnabled,
    required double estimatedRevenue,
    required int impressions,
    required int clicks,
    required DateTime updatedAt,
  }) = _BlogEarningImpl;

  factory BlogEarning.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlogEarning(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      adSensePublisherId: jsonSerialization['adSensePublisherId'] as String?,
      autoAdsEnabled: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['autoAdsEnabled'],
      ),
      estimatedRevenue: (jsonSerialization['estimatedRevenue'] as num)
          .toDouble(),
      impressions: jsonSerialization['impressions'] as int,
      clicks: jsonSerialization['clicks'] as int,
      updatedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int blogId;

  String? adSensePublisherId;

  bool autoAdsEnabled;

  double estimatedRevenue;

  int impressions;

  int clicks;

  DateTime updatedAt;

  /// Returns a shallow copy of this [BlogEarning]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  BlogEarning copyWith({
    int? id,
    int? blogId,
    String? adSensePublisherId,
    bool? autoAdsEnabled,
    double? estimatedRevenue,
    int? impressions,
    int? clicks,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BlogEarning',
      if (id != null) 'id': id,
      'blogId': blogId,
      if (adSensePublisherId != null) 'adSensePublisherId': adSensePublisherId,
      'autoAdsEnabled': autoAdsEnabled,
      'estimatedRevenue': estimatedRevenue,
      'impressions': impressions,
      'clicks': clicks,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BlogEarning',
      if (id != null) 'id': id,
      'blogId': blogId,
      if (adSensePublisherId != null) 'adSensePublisherId': adSensePublisherId,
      'autoAdsEnabled': autoAdsEnabled,
      'estimatedRevenue': estimatedRevenue,
      'impressions': impressions,
      'clicks': clicks,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlogEarningImpl extends BlogEarning {
  _BlogEarningImpl({
    int? id,
    required int blogId,
    String? adSensePublisherId,
    required bool autoAdsEnabled,
    required double estimatedRevenue,
    required int impressions,
    required int clicks,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         blogId: blogId,
         adSensePublisherId: adSensePublisherId,
         autoAdsEnabled: autoAdsEnabled,
         estimatedRevenue: estimatedRevenue,
         impressions: impressions,
         clicks: clicks,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [BlogEarning]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  BlogEarning copyWith({
    Object? id = _Undefined,
    int? blogId,
    Object? adSensePublisherId = _Undefined,
    bool? autoAdsEnabled,
    double? estimatedRevenue,
    int? impressions,
    int? clicks,
    DateTime? updatedAt,
  }) {
    return BlogEarning(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      adSensePublisherId: adSensePublisherId is String?
          ? adSensePublisherId
          : this.adSensePublisherId,
      autoAdsEnabled: autoAdsEnabled ?? this.autoAdsEnabled,
      estimatedRevenue: estimatedRevenue ?? this.estimatedRevenue,
      impressions: impressions ?? this.impressions,
      clicks: clicks ?? this.clicks,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

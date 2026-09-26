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

abstract class BlogSettings
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  BlogSettings._({
    this.id,
    required this.blogId,
    required this.language,
    required this.adultContent,
    this.faviconUrl,
    this.metaDescription,
    this.customRobotsTxt,
    required this.enableCustomAdsTxt,
    this.customAdsTxt,
    required this.allowCommenting,
    required this.commentModeration,
  });

  factory BlogSettings({
    int? id,
    required int blogId,
    required String language,
    required bool adultContent,
    String? faviconUrl,
    String? metaDescription,
    String? customRobotsTxt,
    required bool enableCustomAdsTxt,
    String? customAdsTxt,
    required bool allowCommenting,
    required String commentModeration,
  }) = _BlogSettingsImpl;

  factory BlogSettings.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlogSettings(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      language: jsonSerialization['language'] as String,
      adultContent: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['adultContent'],
      ),
      faviconUrl: jsonSerialization['faviconUrl'] as String?,
      metaDescription: jsonSerialization['metaDescription'] as String?,
      customRobotsTxt: jsonSerialization['customRobotsTxt'] as String?,
      enableCustomAdsTxt: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['enableCustomAdsTxt'],
      ),
      customAdsTxt: jsonSerialization['customAdsTxt'] as String?,
      allowCommenting: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['allowCommenting'],
      ),
      commentModeration: jsonSerialization['commentModeration'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int blogId;

  String language;

  bool adultContent;

  String? faviconUrl;

  String? metaDescription;

  String? customRobotsTxt;

  bool enableCustomAdsTxt;

  String? customAdsTxt;

  bool allowCommenting;

  String commentModeration;

  /// Returns a shallow copy of this [BlogSettings]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  BlogSettings copyWith({
    int? id,
    int? blogId,
    String? language,
    bool? adultContent,
    String? faviconUrl,
    String? metaDescription,
    String? customRobotsTxt,
    bool? enableCustomAdsTxt,
    String? customAdsTxt,
    bool? allowCommenting,
    String? commentModeration,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BlogSettings',
      if (id != null) 'id': id,
      'blogId': blogId,
      'language': language,
      'adultContent': adultContent,
      if (faviconUrl != null) 'faviconUrl': faviconUrl,
      if (metaDescription != null) 'metaDescription': metaDescription,
      if (customRobotsTxt != null) 'customRobotsTxt': customRobotsTxt,
      'enableCustomAdsTxt': enableCustomAdsTxt,
      if (customAdsTxt != null) 'customAdsTxt': customAdsTxt,
      'allowCommenting': allowCommenting,
      'commentModeration': commentModeration,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BlogSettings',
      if (id != null) 'id': id,
      'blogId': blogId,
      'language': language,
      'adultContent': adultContent,
      if (faviconUrl != null) 'faviconUrl': faviconUrl,
      if (metaDescription != null) 'metaDescription': metaDescription,
      if (customRobotsTxt != null) 'customRobotsTxt': customRobotsTxt,
      'enableCustomAdsTxt': enableCustomAdsTxt,
      if (customAdsTxt != null) 'customAdsTxt': customAdsTxt,
      'allowCommenting': allowCommenting,
      'commentModeration': commentModeration,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlogSettingsImpl extends BlogSettings {
  _BlogSettingsImpl({
    int? id,
    required int blogId,
    required String language,
    required bool adultContent,
    String? faviconUrl,
    String? metaDescription,
    String? customRobotsTxt,
    required bool enableCustomAdsTxt,
    String? customAdsTxt,
    required bool allowCommenting,
    required String commentModeration,
  }) : super._(
         id: id,
         blogId: blogId,
         language: language,
         adultContent: adultContent,
         faviconUrl: faviconUrl,
         metaDescription: metaDescription,
         customRobotsTxt: customRobotsTxt,
         enableCustomAdsTxt: enableCustomAdsTxt,
         customAdsTxt: customAdsTxt,
         allowCommenting: allowCommenting,
         commentModeration: commentModeration,
       );

  /// Returns a shallow copy of this [BlogSettings]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  BlogSettings copyWith({
    Object? id = _Undefined,
    int? blogId,
    String? language,
    bool? adultContent,
    Object? faviconUrl = _Undefined,
    Object? metaDescription = _Undefined,
    Object? customRobotsTxt = _Undefined,
    bool? enableCustomAdsTxt,
    Object? customAdsTxt = _Undefined,
    bool? allowCommenting,
    String? commentModeration,
  }) {
    return BlogSettings(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      language: language ?? this.language,
      adultContent: adultContent ?? this.adultContent,
      faviconUrl: faviconUrl is String? ? faviconUrl : this.faviconUrl,
      metaDescription: metaDescription is String?
          ? metaDescription
          : this.metaDescription,
      customRobotsTxt: customRobotsTxt is String?
          ? customRobotsTxt
          : this.customRobotsTxt,
      enableCustomAdsTxt: enableCustomAdsTxt ?? this.enableCustomAdsTxt,
      customAdsTxt: customAdsTxt is String? ? customAdsTxt : this.customAdsTxt,
      allowCommenting: allowCommenting ?? this.allowCommenting,
      commentModeration: commentModeration ?? this.commentModeration,
    );
  }
}

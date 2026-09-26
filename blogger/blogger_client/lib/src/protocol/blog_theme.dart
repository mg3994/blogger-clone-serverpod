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

abstract class BlogTheme
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  BlogTheme._({
    this.id,
    required this.blogId,
    required this.themeName,
    required this.primaryColor,
    required this.fontFamily,
    this.customCss,
    required this.layoutVariant,
    required this.updatedAt,
  });

  factory BlogTheme({
    int? id,
    required int blogId,
    required String themeName,
    required String primaryColor,
    required String fontFamily,
    String? customCss,
    required String layoutVariant,
    required DateTime updatedAt,
  }) = _BlogThemeImpl;

  factory BlogTheme.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlogTheme(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      themeName: jsonSerialization['themeName'] as String,
      primaryColor: jsonSerialization['primaryColor'] as String,
      fontFamily: jsonSerialization['fontFamily'] as String,
      customCss: jsonSerialization['customCss'] as String?,
      layoutVariant: jsonSerialization['layoutVariant'] as String,
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

  String themeName;

  String primaryColor;

  String fontFamily;

  String? customCss;

  String layoutVariant;

  DateTime updatedAt;

  /// Returns a shallow copy of this [BlogTheme]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  BlogTheme copyWith({
    int? id,
    int? blogId,
    String? themeName,
    String? primaryColor,
    String? fontFamily,
    String? customCss,
    String? layoutVariant,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BlogTheme',
      if (id != null) 'id': id,
      'blogId': blogId,
      'themeName': themeName,
      'primaryColor': primaryColor,
      'fontFamily': fontFamily,
      if (customCss != null) 'customCss': customCss,
      'layoutVariant': layoutVariant,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BlogTheme',
      if (id != null) 'id': id,
      'blogId': blogId,
      'themeName': themeName,
      'primaryColor': primaryColor,
      'fontFamily': fontFamily,
      if (customCss != null) 'customCss': customCss,
      'layoutVariant': layoutVariant,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlogThemeImpl extends BlogTheme {
  _BlogThemeImpl({
    int? id,
    required int blogId,
    required String themeName,
    required String primaryColor,
    required String fontFamily,
    String? customCss,
    required String layoutVariant,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         blogId: blogId,
         themeName: themeName,
         primaryColor: primaryColor,
         fontFamily: fontFamily,
         customCss: customCss,
         layoutVariant: layoutVariant,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [BlogTheme]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  BlogTheme copyWith({
    Object? id = _Undefined,
    int? blogId,
    String? themeName,
    String? primaryColor,
    String? fontFamily,
    Object? customCss = _Undefined,
    String? layoutVariant,
    DateTime? updatedAt,
  }) {
    return BlogTheme(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      themeName: themeName ?? this.themeName,
      primaryColor: primaryColor ?? this.primaryColor,
      fontFamily: fontFamily ?? this.fontFamily,
      customCss: customCss is String? ? customCss : this.customCss,
      layoutVariant: layoutVariant ?? this.layoutVariant,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

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

abstract class LayoutWidget
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  LayoutWidget._({
    this.id,
    required this.blogId,
    required this.section,
    required this.widgetType,
    required this.title,
    required this.configJson,
    required this.sortOrder,
    required this.isVisible,
  });

  factory LayoutWidget({
    int? id,
    required int blogId,
    required String section,
    required String widgetType,
    required String title,
    required String configJson,
    required int sortOrder,
    required bool isVisible,
  }) = _LayoutWidgetImpl;

  factory LayoutWidget.fromJson(Map<String, dynamic> jsonSerialization) {
    return LayoutWidget(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      section: jsonSerialization['section'] as String,
      widgetType: jsonSerialization['widgetType'] as String,
      title: jsonSerialization['title'] as String,
      configJson: jsonSerialization['configJson'] as String,
      sortOrder: jsonSerialization['sortOrder'] as int,
      isVisible: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isVisible'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int blogId;

  String section;

  String widgetType;

  String title;

  String configJson;

  int sortOrder;

  bool isVisible;

  /// Returns a shallow copy of this [LayoutWidget]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  LayoutWidget copyWith({
    int? id,
    int? blogId,
    String? section,
    String? widgetType,
    String? title,
    String? configJson,
    int? sortOrder,
    bool? isVisible,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LayoutWidget',
      if (id != null) 'id': id,
      'blogId': blogId,
      'section': section,
      'widgetType': widgetType,
      'title': title,
      'configJson': configJson,
      'sortOrder': sortOrder,
      'isVisible': isVisible,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LayoutWidget',
      if (id != null) 'id': id,
      'blogId': blogId,
      'section': section,
      'widgetType': widgetType,
      'title': title,
      'configJson': configJson,
      'sortOrder': sortOrder,
      'isVisible': isVisible,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LayoutWidgetImpl extends LayoutWidget {
  _LayoutWidgetImpl({
    int? id,
    required int blogId,
    required String section,
    required String widgetType,
    required String title,
    required String configJson,
    required int sortOrder,
    required bool isVisible,
  }) : super._(
         id: id,
         blogId: blogId,
         section: section,
         widgetType: widgetType,
         title: title,
         configJson: configJson,
         sortOrder: sortOrder,
         isVisible: isVisible,
       );

  /// Returns a shallow copy of this [LayoutWidget]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  LayoutWidget copyWith({
    Object? id = _Undefined,
    int? blogId,
    String? section,
    String? widgetType,
    String? title,
    String? configJson,
    int? sortOrder,
    bool? isVisible,
  }) {
    return LayoutWidget(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      section: section ?? this.section,
      widgetType: widgetType ?? this.widgetType,
      title: title ?? this.title,
      configJson: configJson ?? this.configJson,
      sortOrder: sortOrder ?? this.sortOrder,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

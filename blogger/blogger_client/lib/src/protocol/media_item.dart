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

abstract class MediaItem
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  MediaItem._({
    this.id,
    required this.blogId,
    required this.filename,
    required this.url,
    required this.mimeType,
    required this.sizeInBytes,
    required this.uploadedAt,
  });

  factory MediaItem({
    int? id,
    required int blogId,
    required String filename,
    required String url,
    required String mimeType,
    required int sizeInBytes,
    required DateTime uploadedAt,
  }) = _MediaItemImpl;

  factory MediaItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return MediaItem(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      filename: jsonSerialization['filename'] as String,
      url: jsonSerialization['url'] as String,
      mimeType: jsonSerialization['mimeType'] as String,
      sizeInBytes: jsonSerialization['sizeInBytes'] as int,
      uploadedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['uploadedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int blogId;

  String filename;

  String url;

  String mimeType;

  int sizeInBytes;

  DateTime uploadedAt;

  /// Returns a shallow copy of this [MediaItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  MediaItem copyWith({
    int? id,
    int? blogId,
    String? filename,
    String? url,
    String? mimeType,
    int? sizeInBytes,
    DateTime? uploadedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MediaItem',
      if (id != null) 'id': id,
      'blogId': blogId,
      'filename': filename,
      'url': url,
      'mimeType': mimeType,
      'sizeInBytes': sizeInBytes,
      'uploadedAt': uploadedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MediaItem',
      if (id != null) 'id': id,
      'blogId': blogId,
      'filename': filename,
      'url': url,
      'mimeType': mimeType,
      'sizeInBytes': sizeInBytes,
      'uploadedAt': uploadedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MediaItemImpl extends MediaItem {
  _MediaItemImpl({
    int? id,
    required int blogId,
    required String filename,
    required String url,
    required String mimeType,
    required int sizeInBytes,
    required DateTime uploadedAt,
  }) : super._(
         id: id,
         blogId: blogId,
         filename: filename,
         url: url,
         mimeType: mimeType,
         sizeInBytes: sizeInBytes,
         uploadedAt: uploadedAt,
       );

  /// Returns a shallow copy of this [MediaItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  MediaItem copyWith({
    Object? id = _Undefined,
    int? blogId,
    String? filename,
    String? url,
    String? mimeType,
    int? sizeInBytes,
    DateTime? uploadedAt,
  }) {
    return MediaItem(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      filename: filename ?? this.filename,
      url: url ?? this.url,
      mimeType: mimeType ?? this.mimeType,
      sizeInBytes: sizeInBytes ?? this.sizeInBytes,
      uploadedAt: uploadedAt ?? this.uploadedAt,
    );
  }
}

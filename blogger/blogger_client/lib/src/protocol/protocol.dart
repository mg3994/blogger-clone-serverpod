/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'blog_member.dart' as _izav6usd;
import 'blog_theme.dart' as _iyyhuw3y;
import 'custom_redirect.dart' as _i5u25blx;
import 'email_subscriber.dart' as _i2wrmvqb;
import 'followed_blog.dart' as _ivvitb3k;
import 'greetings/blog_earning.dart' as _i0mlid7s;
import 'greetings/blog_settings.dart' as _i3xr9bbi;
import 'greetings/blog_stat.dart' as _ilhipm04;
import 'greetings/comment.dart' as _ixi3ig7t;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'greetings/layout_widget.dart' as _i17h9ogf;
import 'greetings/user_profile.dart' as _icxpg38s;
import 'media_item.dart' as _i1519v01;
export 'blog_member.dart';
export 'blog_theme.dart';
export 'custom_redirect.dart';
export 'email_subscriber.dart';
export 'followed_blog.dart';
export 'greetings/blog_earning.dart';
export 'greetings/blog_settings.dart';
export 'greetings/blog_stat.dart';
export 'greetings/comment.dart';
export 'greetings/greeting.dart';
export 'greetings/layout_widget.dart';
export 'greetings/user_profile.dart';
export 'media_item.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _izav6usd.BlogMember) {
      return _izav6usd.BlogMember.fromJson(data) as T;
    }
    if (t == _iyyhuw3y.BlogTheme) {
      return _iyyhuw3y.BlogTheme.fromJson(data) as T;
    }
    if (t == _i5u25blx.CustomRedirect) {
      return _i5u25blx.CustomRedirect.fromJson(data) as T;
    }
    if (t == _i2wrmvqb.EmailSubscriber) {
      return _i2wrmvqb.EmailSubscriber.fromJson(data) as T;
    }
    if (t == _ivvitb3k.FollowedBlog) {
      return _ivvitb3k.FollowedBlog.fromJson(data) as T;
    }
    if (t == _i0mlid7s.BlogEarning) {
      return _i0mlid7s.BlogEarning.fromJson(data) as T;
    }
    if (t == _i3xr9bbi.BlogSettings) {
      return _i3xr9bbi.BlogSettings.fromJson(data) as T;
    }
    if (t == _ilhipm04.BlogStat) {
      return _ilhipm04.BlogStat.fromJson(data) as T;
    }
    if (t == _ixi3ig7t.Comment) {
      return _ixi3ig7t.Comment.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _i17h9ogf.LayoutWidget) {
      return _i17h9ogf.LayoutWidget.fromJson(data) as T;
    }
    if (t == _icxpg38s.UserProfile) {
      return _icxpg38s.UserProfile.fromJson(data) as T;
    }
    if (t == _i1519v01.MediaItem) {
      return _i1519v01.MediaItem.fromJson(data) as T;
    }
    if (t == _isc.getType<_izav6usd.BlogMember?>()) {
      return (data != null ? _izav6usd.BlogMember.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iyyhuw3y.BlogTheme?>()) {
      return (data != null ? _iyyhuw3y.BlogTheme.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i5u25blx.CustomRedirect?>()) {
      return (data != null ? _i5u25blx.CustomRedirect.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i2wrmvqb.EmailSubscriber?>()) {
      return (data != null ? _i2wrmvqb.EmailSubscriber.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ivvitb3k.FollowedBlog?>()) {
      return (data != null ? _ivvitb3k.FollowedBlog.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i0mlid7s.BlogEarning?>()) {
      return (data != null ? _i0mlid7s.BlogEarning.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i3xr9bbi.BlogSettings?>()) {
      return (data != null ? _i3xr9bbi.BlogSettings.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ilhipm04.BlogStat?>()) {
      return (data != null ? _ilhipm04.BlogStat.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ixi3ig7t.Comment?>()) {
      return (data != null ? _ixi3ig7t.Comment.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i17h9ogf.LayoutWidget?>()) {
      return (data != null ? _i17h9ogf.LayoutWidget.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_icxpg38s.UserProfile?>()) {
      return (data != null ? _icxpg38s.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i1519v01.MediaItem?>()) {
      return (data != null ? _i1519v01.MediaItem.fromJson(data) : null) as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _izav6usd.BlogMember => 'BlogMember',
      _iyyhuw3y.BlogTheme => 'BlogTheme',
      _i5u25blx.CustomRedirect => 'CustomRedirect',
      _i2wrmvqb.EmailSubscriber => 'EmailSubscriber',
      _ivvitb3k.FollowedBlog => 'FollowedBlog',
      _i0mlid7s.BlogEarning => 'BlogEarning',
      _i3xr9bbi.BlogSettings => 'BlogSettings',
      _ilhipm04.BlogStat => 'BlogStat',
      _ixi3ig7t.Comment => 'Comment',
      _izw8z7ou.Greeting => 'Greeting',
      _i17h9ogf.LayoutWidget => 'LayoutWidget',
      _icxpg38s.UserProfile => 'UserProfile',
      _i1519v01.MediaItem => 'MediaItem',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('blogger.', '');
    }

    switch (data) {
      case _izav6usd.BlogMember():
        return 'BlogMember';
      case _iyyhuw3y.BlogTheme():
        return 'BlogTheme';
      case _i5u25blx.CustomRedirect():
        return 'CustomRedirect';
      case _i2wrmvqb.EmailSubscriber():
        return 'EmailSubscriber';
      case _ivvitb3k.FollowedBlog():
        return 'FollowedBlog';
      case _i0mlid7s.BlogEarning():
        return 'BlogEarning';
      case _i3xr9bbi.BlogSettings():
        return 'BlogSettings';
      case _ilhipm04.BlogStat():
        return 'BlogStat';
      case _ixi3ig7t.Comment():
        return 'Comment';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _i17h9ogf.LayoutWidget():
        return 'LayoutWidget';
      case _icxpg38s.UserProfile():
        return 'UserProfile';
      case _i1519v01.MediaItem():
        return 'MediaItem';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'BlogMember') {
      return deserialize<_izav6usd.BlogMember>(data['data']);
    }
    if (dataClassName == 'BlogTheme') {
      return deserialize<_iyyhuw3y.BlogTheme>(data['data']);
    }
    if (dataClassName == 'CustomRedirect') {
      return deserialize<_i5u25blx.CustomRedirect>(data['data']);
    }
    if (dataClassName == 'EmailSubscriber') {
      return deserialize<_i2wrmvqb.EmailSubscriber>(data['data']);
    }
    if (dataClassName == 'FollowedBlog') {
      return deserialize<_ivvitb3k.FollowedBlog>(data['data']);
    }
    if (dataClassName == 'BlogEarning') {
      return deserialize<_i0mlid7s.BlogEarning>(data['data']);
    }
    if (dataClassName == 'BlogSettings') {
      return deserialize<_i3xr9bbi.BlogSettings>(data['data']);
    }
    if (dataClassName == 'BlogStat') {
      return deserialize<_ilhipm04.BlogStat>(data['data']);
    }
    if (dataClassName == 'Comment') {
      return deserialize<_ixi3ig7t.Comment>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'LayoutWidget') {
      return deserialize<_i17h9ogf.LayoutWidget>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_icxpg38s.UserProfile>(data['data']);
    }
    if (dataClassName == 'MediaItem') {
      return deserialize<_i1519v01.MediaItem>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('blogger', this);
    _iacc.Protocol().registerHostProtocol('blogger', this);
  }

  @override
  String getModuleName() => 'blogger';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}

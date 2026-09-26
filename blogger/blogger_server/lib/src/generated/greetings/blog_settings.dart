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
import 'dart:async' as _ida;
import 'package:serverpod/serverpod.dart' as _is;

abstract class BlogSettings
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      adultContent: _is.BoolJsonExtension.fromJson(
        jsonSerialization['adultContent'],
      ),
      faviconUrl: jsonSerialization['faviconUrl'] as String?,
      metaDescription: jsonSerialization['metaDescription'] as String?,
      customRobotsTxt: jsonSerialization['customRobotsTxt'] as String?,
      enableCustomAdsTxt: _is.BoolJsonExtension.fromJson(
        jsonSerialization['enableCustomAdsTxt'],
      ),
      customAdsTxt: jsonSerialization['customAdsTxt'] as String?,
      allowCommenting: _is.BoolJsonExtension.fromJson(
        jsonSerialization['allowCommenting'],
      ),
      commentModeration: jsonSerialization['commentModeration'] as String,
    );
  }

  static final t = BlogSettingsTable();

  static const db = BlogSettingsRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [BlogSettings]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static BlogSettingsInclude include() {
    return BlogSettingsInclude._();
  }

  static BlogSettingsIncludeList includeList({
    _is.WhereExpressionBuilder<BlogSettingsTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogSettingsTable>? orderBy,
    _is.OrderByListBuilder<BlogSettingsTable>? orderByList,
    BlogSettingsInclude? include,
  }) {
    return BlogSettingsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogSettings.t),
      orderByList: orderByList?.call(BlogSettings.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class BlogSettingsUpdateTable extends _is.UpdateTable<BlogSettingsTable> {
  BlogSettingsUpdateTable(super.table);

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<String, String> language(String value) => _is.ColumnValue(
    table.language,
    value,
  );

  _is.ColumnValue<bool, bool> adultContent(bool value) => _is.ColumnValue(
    table.adultContent,
    value,
  );

  _is.ColumnValue<String, String> faviconUrl(String? value) => _is.ColumnValue(
    table.faviconUrl,
    value,
  );

  _is.ColumnValue<String, String> metaDescription(String? value) =>
      _is.ColumnValue(
        table.metaDescription,
        value,
      );

  _is.ColumnValue<String, String> customRobotsTxt(String? value) =>
      _is.ColumnValue(
        table.customRobotsTxt,
        value,
      );

  _is.ColumnValue<bool, bool> enableCustomAdsTxt(bool value) => _is.ColumnValue(
    table.enableCustomAdsTxt,
    value,
  );

  _is.ColumnValue<String, String> customAdsTxt(String? value) =>
      _is.ColumnValue(
        table.customAdsTxt,
        value,
      );

  _is.ColumnValue<bool, bool> allowCommenting(bool value) => _is.ColumnValue(
    table.allowCommenting,
    value,
  );

  _is.ColumnValue<String, String> commentModeration(String value) =>
      _is.ColumnValue(
        table.commentModeration,
        value,
      );
}

class BlogSettingsTable extends _is.Table<int?> {
  BlogSettingsTable({super.tableRelation})
    : super(tableName: 'blogger_settings') {
    updateTable = BlogSettingsUpdateTable(this);
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    language = _is.ColumnString(
      'language',
      this,
    );
    adultContent = _is.ColumnBool(
      'adultContent',
      this,
    );
    faviconUrl = _is.ColumnString(
      'faviconUrl',
      this,
    );
    metaDescription = _is.ColumnString(
      'metaDescription',
      this,
    );
    customRobotsTxt = _is.ColumnString(
      'customRobotsTxt',
      this,
    );
    enableCustomAdsTxt = _is.ColumnBool(
      'enableCustomAdsTxt',
      this,
    );
    customAdsTxt = _is.ColumnString(
      'customAdsTxt',
      this,
    );
    allowCommenting = _is.ColumnBool(
      'allowCommenting',
      this,
    );
    commentModeration = _is.ColumnString(
      'commentModeration',
      this,
    );
  }

  late final BlogSettingsUpdateTable updateTable;

  late final _is.ColumnInt blogId;

  late final _is.ColumnString language;

  late final _is.ColumnBool adultContent;

  late final _is.ColumnString faviconUrl;

  late final _is.ColumnString metaDescription;

  late final _is.ColumnString customRobotsTxt;

  late final _is.ColumnBool enableCustomAdsTxt;

  late final _is.ColumnString customAdsTxt;

  late final _is.ColumnBool allowCommenting;

  late final _is.ColumnString commentModeration;

  @override
  List<_is.Column> get columns => [
    id,
    blogId,
    language,
    adultContent,
    faviconUrl,
    metaDescription,
    customRobotsTxt,
    enableCustomAdsTxt,
    customAdsTxt,
    allowCommenting,
    commentModeration,
  ];
}

class BlogSettingsInclude extends _is.IncludeObject {
  BlogSettingsInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => BlogSettings.t;
}

class BlogSettingsIncludeList extends _is.IncludeList {
  BlogSettingsIncludeList._({
    _is.WhereExpressionBuilder<BlogSettingsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BlogSettings.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => BlogSettings.t;
}

class BlogSettingsRepository {
  const BlogSettingsRepository._();

  /// Returns a list of [BlogSettings]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<BlogSettings>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogSettingsTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogSettingsTable>? orderBy,
    _is.OrderByListBuilder<BlogSettingsTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<BlogSettings>(
      where: where?.call(BlogSettings.t),
      orderBy: orderBy?.call(BlogSettings.t),
      orderByList: orderByList?.call(BlogSettings.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [BlogSettings]s matching the given query parameters every time the
  /// source tables are modified.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// Use [throttle] to specify the minimum interval between queries. It can
  /// also be set to `null`, in which case the stream will only be throttled
  /// when its subscription is paused.
  ///
  /// Source tables are collected from the queried table, [where], [orderBy],
  /// [orderByList], and the [include] graph. [alsoTriggerOnTables] is added
  /// to that set. Pass [Table] instances such as `BlogSettings.t`.
  ///
  /// Raw [Expression] SQL is not inspected. Tables referenced only in raw
  /// SQL must be passed via [alsoTriggerOnTables].
  ///
  /// The stream always reads committed state and never joins an ambient
  /// [Transaction]. Emissions for a write fire after that write commits.
  ///
  /// Currently only supported on SQLite. Calling this method on PostgreSQL
  /// throws an [UnsupportedError].
  ///
  /// ```dart
  /// var subscription = Persons.db.watch(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// ).listen((persons) {
  ///   // Handle the latest matching rows.
  /// });
  /// ```
  _ida.Stream<List<BlogSettings>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogSettingsTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogSettingsTable>? orderBy,
    _is.OrderByListBuilder<BlogSettingsTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<BlogSettings>(
      where: where?.call(BlogSettings.t),
      orderBy: orderBy?.call(BlogSettings.t),
      orderByList: orderByList?.call(BlogSettings.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [BlogSettings] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<BlogSettings?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogSettingsTable>? where,
    int? offset,
    _is.OrderByBuilder<BlogSettingsTable>? orderBy,
    _is.OrderByListBuilder<BlogSettingsTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<BlogSettings>(
      where: where?.call(BlogSettings.t),
      orderBy: orderBy?.call(BlogSettings.t),
      orderByList: orderByList?.call(BlogSettings.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [BlogSettings] by its [id] or null if no such row exists.
  Future<BlogSettings?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<BlogSettings>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [BlogSettings]s in the list and returns the inserted rows.
  ///
  /// The returned [BlogSettings]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogSettings>> insert(
    _is.DatabaseSession session,
    List<BlogSettings> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<BlogSettings>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [BlogSettings] and returns the inserted row.
  ///
  /// The returned [BlogSettings] will have its `id` field set.
  Future<BlogSettings> insertRow(
    _is.DatabaseSession session,
    BlogSettings row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<BlogSettings>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [BlogSettings]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [BlogSettings]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogSettings>> upsert(
    _is.DatabaseSession session,
    List<BlogSettings> rows, {
    required _is.ColumnSelections<BlogSettingsTable> conflictColumns,
    _is.ColumnSelections<BlogSettingsTable>? updateColumns,
    _is.WhereExpressionBuilder<BlogSettingsTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<BlogSettings>(
      rows,
      conflictColumns: conflictColumns(BlogSettings.t),
      updateColumns: updateColumns?.call(BlogSettings.t),
      updateWhere: updateWhere?.call(BlogSettings.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [BlogSettings] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [BlogSettings] will have its `id` field set.
  Future<BlogSettings?> upsertRow(
    _is.DatabaseSession session,
    BlogSettings row, {
    required _is.ColumnSelections<BlogSettingsTable> conflictColumns,
    _is.ColumnSelections<BlogSettingsTable>? updateColumns,
    _is.WhereExpressionBuilder<BlogSettingsTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<BlogSettings>(
      row,
      conflictColumns: conflictColumns(BlogSettings.t),
      updateColumns: updateColumns?.call(BlogSettings.t),
      updateWhere: updateWhere?.call(BlogSettings.t),
      transaction: transaction,
    );
  }

  /// Updates all [BlogSettings]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogSettings>> update(
    _is.DatabaseSession session,
    List<BlogSettings> rows, {
    _is.ColumnSelections<BlogSettingsTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<BlogSettings>(
      rows,
      columns: columns?.call(BlogSettings.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [BlogSettings]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BlogSettings> updateRow(
    _is.DatabaseSession session,
    BlogSettings row, {
    _is.ColumnSelections<BlogSettingsTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<BlogSettings>(
      row,
      columns: columns?.call(BlogSettings.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BlogSettings] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BlogSettings?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BlogSettingsUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<BlogSettings>(
      id,
      columnValues: columnValues(BlogSettings.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BlogSettings]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogSettings>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BlogSettingsUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BlogSettingsTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogSettingsTable>? orderBy,
    _is.OrderByListBuilder<BlogSettingsTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<BlogSettings>(
      columnValues: columnValues(BlogSettings.t.updateTable),
      where: where(BlogSettings.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogSettings.t),
      orderByList: orderByList?.call(BlogSettings.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [BlogSettings]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogSettings>> delete(
    _is.DatabaseSession session,
    List<BlogSettings> rows, {
    _is.OrderByBuilder<BlogSettingsTable>? orderBy,
    _is.OrderByListBuilder<BlogSettingsTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<BlogSettings>(
      rows,
      orderBy: orderBy?.call(BlogSettings.t),
      orderByList: orderByList?.call(BlogSettings.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [BlogSettings].
  Future<BlogSettings> deleteRow(
    _is.DatabaseSession session,
    BlogSettings row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BlogSettings>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogSettings>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlogSettingsTable> where,
    _is.OrderByBuilder<BlogSettingsTable>? orderBy,
    _is.OrderByListBuilder<BlogSettingsTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<BlogSettings>(
      where: where(BlogSettings.t),
      orderBy: orderBy?.call(BlogSettings.t),
      orderByList: orderByList?.call(BlogSettings.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogSettingsTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<BlogSettings>(
      where: where?.call(BlogSettings.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [BlogSettings] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlogSettingsTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<BlogSettings>(
      where: where(BlogSettings.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

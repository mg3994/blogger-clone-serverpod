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

abstract class BlogTheme
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      updatedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = BlogThemeTable();

  static const db = BlogThemeRepository._();

  @override
  int? id;

  int blogId;

  String themeName;

  String primaryColor;

  String fontFamily;

  String? customCss;

  String layoutVariant;

  DateTime updatedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [BlogTheme]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static BlogThemeInclude include() {
    return BlogThemeInclude._();
  }

  static BlogThemeIncludeList includeList({
    _is.WhereExpressionBuilder<BlogThemeTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogThemeTable>? orderBy,
    _is.OrderByListBuilder<BlogThemeTable>? orderByList,
    BlogThemeInclude? include,
  }) {
    return BlogThemeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogTheme.t),
      orderByList: orderByList?.call(BlogTheme.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class BlogThemeUpdateTable extends _is.UpdateTable<BlogThemeTable> {
  BlogThemeUpdateTable(super.table);

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<String, String> themeName(String value) => _is.ColumnValue(
    table.themeName,
    value,
  );

  _is.ColumnValue<String, String> primaryColor(String value) => _is.ColumnValue(
    table.primaryColor,
    value,
  );

  _is.ColumnValue<String, String> fontFamily(String value) => _is.ColumnValue(
    table.fontFamily,
    value,
  );

  _is.ColumnValue<String, String> customCss(String? value) => _is.ColumnValue(
    table.customCss,
    value,
  );

  _is.ColumnValue<String, String> layoutVariant(String value) =>
      _is.ColumnValue(
        table.layoutVariant,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );
}

class BlogThemeTable extends _is.Table<int?> {
  BlogThemeTable({super.tableRelation}) : super(tableName: 'blogger_theme') {
    updateTable = BlogThemeUpdateTable(this);
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    themeName = _is.ColumnString(
      'themeName',
      this,
    );
    primaryColor = _is.ColumnString(
      'primaryColor',
      this,
    );
    fontFamily = _is.ColumnString(
      'fontFamily',
      this,
    );
    customCss = _is.ColumnString(
      'customCss',
      this,
    );
    layoutVariant = _is.ColumnString(
      'layoutVariant',
      this,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final BlogThemeUpdateTable updateTable;

  late final _is.ColumnInt blogId;

  late final _is.ColumnString themeName;

  late final _is.ColumnString primaryColor;

  late final _is.ColumnString fontFamily;

  late final _is.ColumnString customCss;

  late final _is.ColumnString layoutVariant;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    blogId,
    themeName,
    primaryColor,
    fontFamily,
    customCss,
    layoutVariant,
    updatedAt,
  ];
}

class BlogThemeInclude extends _is.IncludeObject {
  BlogThemeInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => BlogTheme.t;
}

class BlogThemeIncludeList extends _is.IncludeList {
  BlogThemeIncludeList._({
    _is.WhereExpressionBuilder<BlogThemeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BlogTheme.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => BlogTheme.t;
}

class BlogThemeRepository {
  const BlogThemeRepository._();

  /// Returns a list of [BlogTheme]s matching the given query parameters.
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
  Future<List<BlogTheme>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogThemeTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogThemeTable>? orderBy,
    _is.OrderByListBuilder<BlogThemeTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<BlogTheme>(
      where: where?.call(BlogTheme.t),
      orderBy: orderBy?.call(BlogTheme.t),
      orderByList: orderByList?.call(BlogTheme.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [BlogTheme]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `BlogTheme.t`.
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
  _ida.Stream<List<BlogTheme>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogThemeTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogThemeTable>? orderBy,
    _is.OrderByListBuilder<BlogThemeTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<BlogTheme>(
      where: where?.call(BlogTheme.t),
      orderBy: orderBy?.call(BlogTheme.t),
      orderByList: orderByList?.call(BlogTheme.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [BlogTheme] matching the given query parameters.
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
  Future<BlogTheme?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogThemeTable>? where,
    int? offset,
    _is.OrderByBuilder<BlogThemeTable>? orderBy,
    _is.OrderByListBuilder<BlogThemeTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<BlogTheme>(
      where: where?.call(BlogTheme.t),
      orderBy: orderBy?.call(BlogTheme.t),
      orderByList: orderByList?.call(BlogTheme.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [BlogTheme] by its [id] or null if no such row exists.
  Future<BlogTheme?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<BlogTheme>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [BlogTheme]s in the list and returns the inserted rows.
  ///
  /// The returned [BlogTheme]s will have their `id` fields set.
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
  Future<List<BlogTheme>> insert(
    _is.DatabaseSession session,
    List<BlogTheme> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<BlogTheme>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [BlogTheme] and returns the inserted row.
  ///
  /// The returned [BlogTheme] will have its `id` field set.
  Future<BlogTheme> insertRow(
    _is.DatabaseSession session,
    BlogTheme row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<BlogTheme>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [BlogTheme]s in the list and returns the resulting rows.
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
  /// The returned [BlogTheme]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogTheme>> upsert(
    _is.DatabaseSession session,
    List<BlogTheme> rows, {
    required _is.ColumnSelections<BlogThemeTable> conflictColumns,
    _is.ColumnSelections<BlogThemeTable>? updateColumns,
    _is.WhereExpressionBuilder<BlogThemeTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<BlogTheme>(
      rows,
      conflictColumns: conflictColumns(BlogTheme.t),
      updateColumns: updateColumns?.call(BlogTheme.t),
      updateWhere: updateWhere?.call(BlogTheme.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [BlogTheme] and returns the resulting row.
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
  /// The returned [BlogTheme] will have its `id` field set.
  Future<BlogTheme?> upsertRow(
    _is.DatabaseSession session,
    BlogTheme row, {
    required _is.ColumnSelections<BlogThemeTable> conflictColumns,
    _is.ColumnSelections<BlogThemeTable>? updateColumns,
    _is.WhereExpressionBuilder<BlogThemeTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<BlogTheme>(
      row,
      conflictColumns: conflictColumns(BlogTheme.t),
      updateColumns: updateColumns?.call(BlogTheme.t),
      updateWhere: updateWhere?.call(BlogTheme.t),
      transaction: transaction,
    );
  }

  /// Updates all [BlogTheme]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogTheme>> update(
    _is.DatabaseSession session,
    List<BlogTheme> rows, {
    _is.ColumnSelections<BlogThemeTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<BlogTheme>(
      rows,
      columns: columns?.call(BlogTheme.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [BlogTheme]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BlogTheme> updateRow(
    _is.DatabaseSession session,
    BlogTheme row, {
    _is.ColumnSelections<BlogThemeTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<BlogTheme>(
      row,
      columns: columns?.call(BlogTheme.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BlogTheme] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BlogTheme?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BlogThemeUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<BlogTheme>(
      id,
      columnValues: columnValues(BlogTheme.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BlogTheme]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogTheme>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BlogThemeUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BlogThemeTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogThemeTable>? orderBy,
    _is.OrderByListBuilder<BlogThemeTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<BlogTheme>(
      columnValues: columnValues(BlogTheme.t.updateTable),
      where: where(BlogTheme.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogTheme.t),
      orderByList: orderByList?.call(BlogTheme.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [BlogTheme]s in the list and returns the deleted rows.
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
  Future<List<BlogTheme>> delete(
    _is.DatabaseSession session,
    List<BlogTheme> rows, {
    _is.OrderByBuilder<BlogThemeTable>? orderBy,
    _is.OrderByListBuilder<BlogThemeTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<BlogTheme>(
      rows,
      orderBy: orderBy?.call(BlogTheme.t),
      orderByList: orderByList?.call(BlogTheme.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [BlogTheme].
  Future<BlogTheme> deleteRow(
    _is.DatabaseSession session,
    BlogTheme row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BlogTheme>(
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
  Future<List<BlogTheme>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlogThemeTable> where,
    _is.OrderByBuilder<BlogThemeTable>? orderBy,
    _is.OrderByListBuilder<BlogThemeTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<BlogTheme>(
      where: where(BlogTheme.t),
      orderBy: orderBy?.call(BlogTheme.t),
      orderByList: orderByList?.call(BlogTheme.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogThemeTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<BlogTheme>(
      where: where?.call(BlogTheme.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [BlogTheme] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlogThemeTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<BlogTheme>(
      where: where(BlogTheme.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

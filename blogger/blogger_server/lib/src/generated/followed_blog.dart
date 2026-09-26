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

abstract class FollowedBlog
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  FollowedBlog._({
    this.id,
    required this.userId,
    required this.blogId,
    required this.blogTitle,
    required this.blogUrl,
    required this.followedAt,
  });

  factory FollowedBlog({
    int? id,
    required int userId,
    required int blogId,
    required String blogTitle,
    required String blogUrl,
    required DateTime followedAt,
  }) = _FollowedBlogImpl;

  factory FollowedBlog.fromJson(Map<String, dynamic> jsonSerialization) {
    return FollowedBlog(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      blogId: jsonSerialization['blogId'] as int,
      blogTitle: jsonSerialization['blogTitle'] as String,
      blogUrl: jsonSerialization['blogUrl'] as String,
      followedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['followedAt'],
      ),
    );
  }

  static final t = FollowedBlogTable();

  static const db = FollowedBlogRepository._();

  @override
  int? id;

  int userId;

  int blogId;

  String blogTitle;

  String blogUrl;

  DateTime followedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [FollowedBlog]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  FollowedBlog copyWith({
    int? id,
    int? userId,
    int? blogId,
    String? blogTitle,
    String? blogUrl,
    DateTime? followedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FollowedBlog',
      if (id != null) 'id': id,
      'userId': userId,
      'blogId': blogId,
      'blogTitle': blogTitle,
      'blogUrl': blogUrl,
      'followedAt': followedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FollowedBlog',
      if (id != null) 'id': id,
      'userId': userId,
      'blogId': blogId,
      'blogTitle': blogTitle,
      'blogUrl': blogUrl,
      'followedAt': followedAt.toJson(),
    };
  }

  static FollowedBlogInclude include() {
    return FollowedBlogInclude._();
  }

  static FollowedBlogIncludeList includeList({
    _is.WhereExpressionBuilder<FollowedBlogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FollowedBlogTable>? orderBy,
    _is.OrderByListBuilder<FollowedBlogTable>? orderByList,
    FollowedBlogInclude? include,
  }) {
    return FollowedBlogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FollowedBlog.t),
      orderByList: orderByList?.call(FollowedBlog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FollowedBlogImpl extends FollowedBlog {
  _FollowedBlogImpl({
    int? id,
    required int userId,
    required int blogId,
    required String blogTitle,
    required String blogUrl,
    required DateTime followedAt,
  }) : super._(
         id: id,
         userId: userId,
         blogId: blogId,
         blogTitle: blogTitle,
         blogUrl: blogUrl,
         followedAt: followedAt,
       );

  /// Returns a shallow copy of this [FollowedBlog]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  FollowedBlog copyWith({
    Object? id = _Undefined,
    int? userId,
    int? blogId,
    String? blogTitle,
    String? blogUrl,
    DateTime? followedAt,
  }) {
    return FollowedBlog(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      blogId: blogId ?? this.blogId,
      blogTitle: blogTitle ?? this.blogTitle,
      blogUrl: blogUrl ?? this.blogUrl,
      followedAt: followedAt ?? this.followedAt,
    );
  }
}

class FollowedBlogUpdateTable extends _is.UpdateTable<FollowedBlogTable> {
  FollowedBlogUpdateTable(super.table);

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<String, String> blogTitle(String value) => _is.ColumnValue(
    table.blogTitle,
    value,
  );

  _is.ColumnValue<String, String> blogUrl(String value) => _is.ColumnValue(
    table.blogUrl,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> followedAt(DateTime value) =>
      _is.ColumnValue(
        table.followedAt,
        value,
      );
}

class FollowedBlogTable extends _is.Table<int?> {
  FollowedBlogTable({super.tableRelation})
    : super(tableName: 'blogger_followed_blog') {
    updateTable = FollowedBlogUpdateTable(this);
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    blogTitle = _is.ColumnString(
      'blogTitle',
      this,
    );
    blogUrl = _is.ColumnString(
      'blogUrl',
      this,
    );
    followedAt = _is.ColumnDateTime(
      'followedAt',
      this,
    );
  }

  late final FollowedBlogUpdateTable updateTable;

  late final _is.ColumnInt userId;

  late final _is.ColumnInt blogId;

  late final _is.ColumnString blogTitle;

  late final _is.ColumnString blogUrl;

  late final _is.ColumnDateTime followedAt;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    blogId,
    blogTitle,
    blogUrl,
    followedAt,
  ];
}

class FollowedBlogInclude extends _is.IncludeObject {
  FollowedBlogInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => FollowedBlog.t;
}

class FollowedBlogIncludeList extends _is.IncludeList {
  FollowedBlogIncludeList._({
    _is.WhereExpressionBuilder<FollowedBlogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FollowedBlog.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => FollowedBlog.t;
}

class FollowedBlogRepository {
  const FollowedBlogRepository._();

  /// Returns a list of [FollowedBlog]s matching the given query parameters.
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
  Future<List<FollowedBlog>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FollowedBlogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FollowedBlogTable>? orderBy,
    _is.OrderByListBuilder<FollowedBlogTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<FollowedBlog>(
      where: where?.call(FollowedBlog.t),
      orderBy: orderBy?.call(FollowedBlog.t),
      orderByList: orderByList?.call(FollowedBlog.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [FollowedBlog]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `FollowedBlog.t`.
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
  _ida.Stream<List<FollowedBlog>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FollowedBlogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FollowedBlogTable>? orderBy,
    _is.OrderByListBuilder<FollowedBlogTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<FollowedBlog>(
      where: where?.call(FollowedBlog.t),
      orderBy: orderBy?.call(FollowedBlog.t),
      orderByList: orderByList?.call(FollowedBlog.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [FollowedBlog] matching the given query parameters.
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
  Future<FollowedBlog?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FollowedBlogTable>? where,
    int? offset,
    _is.OrderByBuilder<FollowedBlogTable>? orderBy,
    _is.OrderByListBuilder<FollowedBlogTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<FollowedBlog>(
      where: where?.call(FollowedBlog.t),
      orderBy: orderBy?.call(FollowedBlog.t),
      orderByList: orderByList?.call(FollowedBlog.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [FollowedBlog] by its [id] or null if no such row exists.
  Future<FollowedBlog?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<FollowedBlog>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [FollowedBlog]s in the list and returns the inserted rows.
  ///
  /// The returned [FollowedBlog]s will have their `id` fields set.
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
  Future<List<FollowedBlog>> insert(
    _is.DatabaseSession session,
    List<FollowedBlog> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<FollowedBlog>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [FollowedBlog] and returns the inserted row.
  ///
  /// The returned [FollowedBlog] will have its `id` field set.
  Future<FollowedBlog> insertRow(
    _is.DatabaseSession session,
    FollowedBlog row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<FollowedBlog>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [FollowedBlog]s in the list and returns the resulting rows.
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
  /// The returned [FollowedBlog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FollowedBlog>> upsert(
    _is.DatabaseSession session,
    List<FollowedBlog> rows, {
    required _is.ColumnSelections<FollowedBlogTable> conflictColumns,
    _is.ColumnSelections<FollowedBlogTable>? updateColumns,
    _is.WhereExpressionBuilder<FollowedBlogTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<FollowedBlog>(
      rows,
      conflictColumns: conflictColumns(FollowedBlog.t),
      updateColumns: updateColumns?.call(FollowedBlog.t),
      updateWhere: updateWhere?.call(FollowedBlog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [FollowedBlog] and returns the resulting row.
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
  /// The returned [FollowedBlog] will have its `id` field set.
  Future<FollowedBlog?> upsertRow(
    _is.DatabaseSession session,
    FollowedBlog row, {
    required _is.ColumnSelections<FollowedBlogTable> conflictColumns,
    _is.ColumnSelections<FollowedBlogTable>? updateColumns,
    _is.WhereExpressionBuilder<FollowedBlogTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<FollowedBlog>(
      row,
      conflictColumns: conflictColumns(FollowedBlog.t),
      updateColumns: updateColumns?.call(FollowedBlog.t),
      updateWhere: updateWhere?.call(FollowedBlog.t),
      transaction: transaction,
    );
  }

  /// Updates all [FollowedBlog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FollowedBlog>> update(
    _is.DatabaseSession session,
    List<FollowedBlog> rows, {
    _is.ColumnSelections<FollowedBlogTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<FollowedBlog>(
      rows,
      columns: columns?.call(FollowedBlog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [FollowedBlog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FollowedBlog> updateRow(
    _is.DatabaseSession session,
    FollowedBlog row, {
    _is.ColumnSelections<FollowedBlogTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<FollowedBlog>(
      row,
      columns: columns?.call(FollowedBlog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FollowedBlog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<FollowedBlog?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<FollowedBlogUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<FollowedBlog>(
      id,
      columnValues: columnValues(FollowedBlog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [FollowedBlog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FollowedBlog>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<FollowedBlogUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<FollowedBlogTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FollowedBlogTable>? orderBy,
    _is.OrderByListBuilder<FollowedBlogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<FollowedBlog>(
      columnValues: columnValues(FollowedBlog.t.updateTable),
      where: where(FollowedBlog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FollowedBlog.t),
      orderByList: orderByList?.call(FollowedBlog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [FollowedBlog]s in the list and returns the deleted rows.
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
  Future<List<FollowedBlog>> delete(
    _is.DatabaseSession session,
    List<FollowedBlog> rows, {
    _is.OrderByBuilder<FollowedBlogTable>? orderBy,
    _is.OrderByListBuilder<FollowedBlogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<FollowedBlog>(
      rows,
      orderBy: orderBy?.call(FollowedBlog.t),
      orderByList: orderByList?.call(FollowedBlog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [FollowedBlog].
  Future<FollowedBlog> deleteRow(
    _is.DatabaseSession session,
    FollowedBlog row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FollowedBlog>(
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
  Future<List<FollowedBlog>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FollowedBlogTable> where,
    _is.OrderByBuilder<FollowedBlogTable>? orderBy,
    _is.OrderByListBuilder<FollowedBlogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<FollowedBlog>(
      where: where(FollowedBlog.t),
      orderBy: orderBy?.call(FollowedBlog.t),
      orderByList: orderByList?.call(FollowedBlog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FollowedBlogTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<FollowedBlog>(
      where: where?.call(FollowedBlog.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [FollowedBlog] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FollowedBlogTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<FollowedBlog>(
      where: where(FollowedBlog.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

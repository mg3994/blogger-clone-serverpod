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

abstract class BlogStat
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      recordedDate: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['recordedDate'],
      ),
    );
  }

  static final t = BlogStatTable();

  static const db = BlogStatRepository._();

  @override
  int? id;

  int blogId;

  int? postId;

  int pageViews;

  int uniqueVisitors;

  String referrerSource;

  String country;

  DateTime recordedDate;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [BlogStat]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static BlogStatInclude include() {
    return BlogStatInclude._();
  }

  static BlogStatIncludeList includeList({
    _is.WhereExpressionBuilder<BlogStatTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogStatTable>? orderBy,
    _is.OrderByListBuilder<BlogStatTable>? orderByList,
    BlogStatInclude? include,
  }) {
    return BlogStatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogStat.t),
      orderByList: orderByList?.call(BlogStat.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class BlogStatUpdateTable extends _is.UpdateTable<BlogStatTable> {
  BlogStatUpdateTable(super.table);

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<int, int> postId(int? value) => _is.ColumnValue(
    table.postId,
    value,
  );

  _is.ColumnValue<int, int> pageViews(int value) => _is.ColumnValue(
    table.pageViews,
    value,
  );

  _is.ColumnValue<int, int> uniqueVisitors(int value) => _is.ColumnValue(
    table.uniqueVisitors,
    value,
  );

  _is.ColumnValue<String, String> referrerSource(String value) =>
      _is.ColumnValue(
        table.referrerSource,
        value,
      );

  _is.ColumnValue<String, String> country(String value) => _is.ColumnValue(
    table.country,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> recordedDate(DateTime value) =>
      _is.ColumnValue(
        table.recordedDate,
        value,
      );
}

class BlogStatTable extends _is.Table<int?> {
  BlogStatTable({super.tableRelation}) : super(tableName: 'blogger_stat') {
    updateTable = BlogStatUpdateTable(this);
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    postId = _is.ColumnInt(
      'postId',
      this,
    );
    pageViews = _is.ColumnInt(
      'pageViews',
      this,
    );
    uniqueVisitors = _is.ColumnInt(
      'uniqueVisitors',
      this,
    );
    referrerSource = _is.ColumnString(
      'referrerSource',
      this,
    );
    country = _is.ColumnString(
      'country',
      this,
    );
    recordedDate = _is.ColumnDateTime(
      'recordedDate',
      this,
    );
  }

  late final BlogStatUpdateTable updateTable;

  late final _is.ColumnInt blogId;

  late final _is.ColumnInt postId;

  late final _is.ColumnInt pageViews;

  late final _is.ColumnInt uniqueVisitors;

  late final _is.ColumnString referrerSource;

  late final _is.ColumnString country;

  late final _is.ColumnDateTime recordedDate;

  @override
  List<_is.Column> get columns => [
    id,
    blogId,
    postId,
    pageViews,
    uniqueVisitors,
    referrerSource,
    country,
    recordedDate,
  ];
}

class BlogStatInclude extends _is.IncludeObject {
  BlogStatInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => BlogStat.t;
}

class BlogStatIncludeList extends _is.IncludeList {
  BlogStatIncludeList._({
    _is.WhereExpressionBuilder<BlogStatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BlogStat.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => BlogStat.t;
}

class BlogStatRepository {
  const BlogStatRepository._();

  /// Returns a list of [BlogStat]s matching the given query parameters.
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
  Future<List<BlogStat>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogStatTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogStatTable>? orderBy,
    _is.OrderByListBuilder<BlogStatTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<BlogStat>(
      where: where?.call(BlogStat.t),
      orderBy: orderBy?.call(BlogStat.t),
      orderByList: orderByList?.call(BlogStat.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [BlogStat]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `BlogStat.t`.
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
  _ida.Stream<List<BlogStat>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogStatTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogStatTable>? orderBy,
    _is.OrderByListBuilder<BlogStatTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<BlogStat>(
      where: where?.call(BlogStat.t),
      orderBy: orderBy?.call(BlogStat.t),
      orderByList: orderByList?.call(BlogStat.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [BlogStat] matching the given query parameters.
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
  Future<BlogStat?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogStatTable>? where,
    int? offset,
    _is.OrderByBuilder<BlogStatTable>? orderBy,
    _is.OrderByListBuilder<BlogStatTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<BlogStat>(
      where: where?.call(BlogStat.t),
      orderBy: orderBy?.call(BlogStat.t),
      orderByList: orderByList?.call(BlogStat.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [BlogStat] by its [id] or null if no such row exists.
  Future<BlogStat?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<BlogStat>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [BlogStat]s in the list and returns the inserted rows.
  ///
  /// The returned [BlogStat]s will have their `id` fields set.
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
  Future<List<BlogStat>> insert(
    _is.DatabaseSession session,
    List<BlogStat> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<BlogStat>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [BlogStat] and returns the inserted row.
  ///
  /// The returned [BlogStat] will have its `id` field set.
  Future<BlogStat> insertRow(
    _is.DatabaseSession session,
    BlogStat row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<BlogStat>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [BlogStat]s in the list and returns the resulting rows.
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
  /// The returned [BlogStat]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogStat>> upsert(
    _is.DatabaseSession session,
    List<BlogStat> rows, {
    required _is.ColumnSelections<BlogStatTable> conflictColumns,
    _is.ColumnSelections<BlogStatTable>? updateColumns,
    _is.WhereExpressionBuilder<BlogStatTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<BlogStat>(
      rows,
      conflictColumns: conflictColumns(BlogStat.t),
      updateColumns: updateColumns?.call(BlogStat.t),
      updateWhere: updateWhere?.call(BlogStat.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [BlogStat] and returns the resulting row.
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
  /// The returned [BlogStat] will have its `id` field set.
  Future<BlogStat?> upsertRow(
    _is.DatabaseSession session,
    BlogStat row, {
    required _is.ColumnSelections<BlogStatTable> conflictColumns,
    _is.ColumnSelections<BlogStatTable>? updateColumns,
    _is.WhereExpressionBuilder<BlogStatTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<BlogStat>(
      row,
      conflictColumns: conflictColumns(BlogStat.t),
      updateColumns: updateColumns?.call(BlogStat.t),
      updateWhere: updateWhere?.call(BlogStat.t),
      transaction: transaction,
    );
  }

  /// Updates all [BlogStat]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogStat>> update(
    _is.DatabaseSession session,
    List<BlogStat> rows, {
    _is.ColumnSelections<BlogStatTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<BlogStat>(
      rows,
      columns: columns?.call(BlogStat.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [BlogStat]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BlogStat> updateRow(
    _is.DatabaseSession session,
    BlogStat row, {
    _is.ColumnSelections<BlogStatTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<BlogStat>(
      row,
      columns: columns?.call(BlogStat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BlogStat] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BlogStat?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BlogStatUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<BlogStat>(
      id,
      columnValues: columnValues(BlogStat.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BlogStat]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogStat>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BlogStatUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BlogStatTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogStatTable>? orderBy,
    _is.OrderByListBuilder<BlogStatTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<BlogStat>(
      columnValues: columnValues(BlogStat.t.updateTable),
      where: where(BlogStat.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogStat.t),
      orderByList: orderByList?.call(BlogStat.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [BlogStat]s in the list and returns the deleted rows.
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
  Future<List<BlogStat>> delete(
    _is.DatabaseSession session,
    List<BlogStat> rows, {
    _is.OrderByBuilder<BlogStatTable>? orderBy,
    _is.OrderByListBuilder<BlogStatTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<BlogStat>(
      rows,
      orderBy: orderBy?.call(BlogStat.t),
      orderByList: orderByList?.call(BlogStat.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [BlogStat].
  Future<BlogStat> deleteRow(
    _is.DatabaseSession session,
    BlogStat row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BlogStat>(
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
  Future<List<BlogStat>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlogStatTable> where,
    _is.OrderByBuilder<BlogStatTable>? orderBy,
    _is.OrderByListBuilder<BlogStatTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<BlogStat>(
      where: where(BlogStat.t),
      orderBy: orderBy?.call(BlogStat.t),
      orderByList: orderByList?.call(BlogStat.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogStatTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<BlogStat>(
      where: where?.call(BlogStat.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [BlogStat] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlogStatTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<BlogStat>(
      where: where(BlogStat.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

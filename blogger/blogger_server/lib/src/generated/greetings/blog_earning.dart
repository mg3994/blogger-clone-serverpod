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

abstract class BlogEarning
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      autoAdsEnabled: _is.BoolJsonExtension.fromJson(
        jsonSerialization['autoAdsEnabled'],
      ),
      estimatedRevenue: (jsonSerialization['estimatedRevenue'] as num)
          .toDouble(),
      impressions: jsonSerialization['impressions'] as int,
      clicks: jsonSerialization['clicks'] as int,
      updatedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = BlogEarningTable();

  static const db = BlogEarningRepository._();

  @override
  int? id;

  int blogId;

  String? adSensePublisherId;

  bool autoAdsEnabled;

  double estimatedRevenue;

  int impressions;

  int clicks;

  DateTime updatedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [BlogEarning]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static BlogEarningInclude include() {
    return BlogEarningInclude._();
  }

  static BlogEarningIncludeList includeList({
    _is.WhereExpressionBuilder<BlogEarningTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogEarningTable>? orderBy,
    _is.OrderByListBuilder<BlogEarningTable>? orderByList,
    BlogEarningInclude? include,
  }) {
    return BlogEarningIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogEarning.t),
      orderByList: orderByList?.call(BlogEarning.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class BlogEarningUpdateTable extends _is.UpdateTable<BlogEarningTable> {
  BlogEarningUpdateTable(super.table);

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<String, String> adSensePublisherId(String? value) =>
      _is.ColumnValue(
        table.adSensePublisherId,
        value,
      );

  _is.ColumnValue<bool, bool> autoAdsEnabled(bool value) => _is.ColumnValue(
    table.autoAdsEnabled,
    value,
  );

  _is.ColumnValue<double, double> estimatedRevenue(double value) =>
      _is.ColumnValue(
        table.estimatedRevenue,
        value,
      );

  _is.ColumnValue<int, int> impressions(int value) => _is.ColumnValue(
    table.impressions,
    value,
  );

  _is.ColumnValue<int, int> clicks(int value) => _is.ColumnValue(
    table.clicks,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );
}

class BlogEarningTable extends _is.Table<int?> {
  BlogEarningTable({super.tableRelation})
    : super(tableName: 'blogger_earning') {
    updateTable = BlogEarningUpdateTable(this);
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    adSensePublisherId = _is.ColumnString(
      'adSensePublisherId',
      this,
    );
    autoAdsEnabled = _is.ColumnBool(
      'autoAdsEnabled',
      this,
    );
    estimatedRevenue = _is.ColumnDouble(
      'estimatedRevenue',
      this,
    );
    impressions = _is.ColumnInt(
      'impressions',
      this,
    );
    clicks = _is.ColumnInt(
      'clicks',
      this,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final BlogEarningUpdateTable updateTable;

  late final _is.ColumnInt blogId;

  late final _is.ColumnString adSensePublisherId;

  late final _is.ColumnBool autoAdsEnabled;

  late final _is.ColumnDouble estimatedRevenue;

  late final _is.ColumnInt impressions;

  late final _is.ColumnInt clicks;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    blogId,
    adSensePublisherId,
    autoAdsEnabled,
    estimatedRevenue,
    impressions,
    clicks,
    updatedAt,
  ];
}

class BlogEarningInclude extends _is.IncludeObject {
  BlogEarningInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => BlogEarning.t;
}

class BlogEarningIncludeList extends _is.IncludeList {
  BlogEarningIncludeList._({
    _is.WhereExpressionBuilder<BlogEarningTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BlogEarning.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => BlogEarning.t;
}

class BlogEarningRepository {
  const BlogEarningRepository._();

  /// Returns a list of [BlogEarning]s matching the given query parameters.
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
  Future<List<BlogEarning>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogEarningTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogEarningTable>? orderBy,
    _is.OrderByListBuilder<BlogEarningTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<BlogEarning>(
      where: where?.call(BlogEarning.t),
      orderBy: orderBy?.call(BlogEarning.t),
      orderByList: orderByList?.call(BlogEarning.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [BlogEarning]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `BlogEarning.t`.
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
  _ida.Stream<List<BlogEarning>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogEarningTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogEarningTable>? orderBy,
    _is.OrderByListBuilder<BlogEarningTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<BlogEarning>(
      where: where?.call(BlogEarning.t),
      orderBy: orderBy?.call(BlogEarning.t),
      orderByList: orderByList?.call(BlogEarning.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [BlogEarning] matching the given query parameters.
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
  Future<BlogEarning?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogEarningTable>? where,
    int? offset,
    _is.OrderByBuilder<BlogEarningTable>? orderBy,
    _is.OrderByListBuilder<BlogEarningTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<BlogEarning>(
      where: where?.call(BlogEarning.t),
      orderBy: orderBy?.call(BlogEarning.t),
      orderByList: orderByList?.call(BlogEarning.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [BlogEarning] by its [id] or null if no such row exists.
  Future<BlogEarning?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<BlogEarning>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [BlogEarning]s in the list and returns the inserted rows.
  ///
  /// The returned [BlogEarning]s will have their `id` fields set.
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
  Future<List<BlogEarning>> insert(
    _is.DatabaseSession session,
    List<BlogEarning> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<BlogEarning>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [BlogEarning] and returns the inserted row.
  ///
  /// The returned [BlogEarning] will have its `id` field set.
  Future<BlogEarning> insertRow(
    _is.DatabaseSession session,
    BlogEarning row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<BlogEarning>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [BlogEarning]s in the list and returns the resulting rows.
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
  /// The returned [BlogEarning]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogEarning>> upsert(
    _is.DatabaseSession session,
    List<BlogEarning> rows, {
    required _is.ColumnSelections<BlogEarningTable> conflictColumns,
    _is.ColumnSelections<BlogEarningTable>? updateColumns,
    _is.WhereExpressionBuilder<BlogEarningTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<BlogEarning>(
      rows,
      conflictColumns: conflictColumns(BlogEarning.t),
      updateColumns: updateColumns?.call(BlogEarning.t),
      updateWhere: updateWhere?.call(BlogEarning.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [BlogEarning] and returns the resulting row.
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
  /// The returned [BlogEarning] will have its `id` field set.
  Future<BlogEarning?> upsertRow(
    _is.DatabaseSession session,
    BlogEarning row, {
    required _is.ColumnSelections<BlogEarningTable> conflictColumns,
    _is.ColumnSelections<BlogEarningTable>? updateColumns,
    _is.WhereExpressionBuilder<BlogEarningTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<BlogEarning>(
      row,
      conflictColumns: conflictColumns(BlogEarning.t),
      updateColumns: updateColumns?.call(BlogEarning.t),
      updateWhere: updateWhere?.call(BlogEarning.t),
      transaction: transaction,
    );
  }

  /// Updates all [BlogEarning]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogEarning>> update(
    _is.DatabaseSession session,
    List<BlogEarning> rows, {
    _is.ColumnSelections<BlogEarningTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<BlogEarning>(
      rows,
      columns: columns?.call(BlogEarning.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [BlogEarning]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BlogEarning> updateRow(
    _is.DatabaseSession session,
    BlogEarning row, {
    _is.ColumnSelections<BlogEarningTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<BlogEarning>(
      row,
      columns: columns?.call(BlogEarning.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BlogEarning] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BlogEarning?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BlogEarningUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<BlogEarning>(
      id,
      columnValues: columnValues(BlogEarning.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BlogEarning]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogEarning>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BlogEarningUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BlogEarningTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogEarningTable>? orderBy,
    _is.OrderByListBuilder<BlogEarningTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<BlogEarning>(
      columnValues: columnValues(BlogEarning.t.updateTable),
      where: where(BlogEarning.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogEarning.t),
      orderByList: orderByList?.call(BlogEarning.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [BlogEarning]s in the list and returns the deleted rows.
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
  Future<List<BlogEarning>> delete(
    _is.DatabaseSession session,
    List<BlogEarning> rows, {
    _is.OrderByBuilder<BlogEarningTable>? orderBy,
    _is.OrderByListBuilder<BlogEarningTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<BlogEarning>(
      rows,
      orderBy: orderBy?.call(BlogEarning.t),
      orderByList: orderByList?.call(BlogEarning.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [BlogEarning].
  Future<BlogEarning> deleteRow(
    _is.DatabaseSession session,
    BlogEarning row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BlogEarning>(
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
  Future<List<BlogEarning>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlogEarningTable> where,
    _is.OrderByBuilder<BlogEarningTable>? orderBy,
    _is.OrderByListBuilder<BlogEarningTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<BlogEarning>(
      where: where(BlogEarning.t),
      orderBy: orderBy?.call(BlogEarning.t),
      orderByList: orderByList?.call(BlogEarning.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogEarningTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<BlogEarning>(
      where: where?.call(BlogEarning.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [BlogEarning] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlogEarningTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<BlogEarning>(
      where: where(BlogEarning.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

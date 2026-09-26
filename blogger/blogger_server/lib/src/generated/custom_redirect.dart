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

abstract class CustomRedirect
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  CustomRedirect._({
    this.id,
    required this.blogId,
    required this.fromPath,
    required this.toPath,
    required this.isPermanent,
    required this.createdAt,
  });

  factory CustomRedirect({
    int? id,
    required int blogId,
    required String fromPath,
    required String toPath,
    required bool isPermanent,
    required DateTime createdAt,
  }) = _CustomRedirectImpl;

  factory CustomRedirect.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomRedirect(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      fromPath: jsonSerialization['fromPath'] as String,
      toPath: jsonSerialization['toPath'] as String,
      isPermanent: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isPermanent'],
      ),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = CustomRedirectTable();

  static const db = CustomRedirectRepository._();

  @override
  int? id;

  int blogId;

  String fromPath;

  String toPath;

  bool isPermanent;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [CustomRedirect]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CustomRedirect copyWith({
    int? id,
    int? blogId,
    String? fromPath,
    String? toPath,
    bool? isPermanent,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CustomRedirect',
      if (id != null) 'id': id,
      'blogId': blogId,
      'fromPath': fromPath,
      'toPath': toPath,
      'isPermanent': isPermanent,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CustomRedirect',
      if (id != null) 'id': id,
      'blogId': blogId,
      'fromPath': fromPath,
      'toPath': toPath,
      'isPermanent': isPermanent,
      'createdAt': createdAt.toJson(),
    };
  }

  static CustomRedirectInclude include() {
    return CustomRedirectInclude._();
  }

  static CustomRedirectIncludeList includeList({
    _is.WhereExpressionBuilder<CustomRedirectTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CustomRedirectTable>? orderBy,
    _is.OrderByListBuilder<CustomRedirectTable>? orderByList,
    CustomRedirectInclude? include,
  }) {
    return CustomRedirectIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomRedirect.t),
      orderByList: orderByList?.call(CustomRedirect.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomRedirectImpl extends CustomRedirect {
  _CustomRedirectImpl({
    int? id,
    required int blogId,
    required String fromPath,
    required String toPath,
    required bool isPermanent,
    required DateTime createdAt,
  }) : super._(
         id: id,
         blogId: blogId,
         fromPath: fromPath,
         toPath: toPath,
         isPermanent: isPermanent,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CustomRedirect]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CustomRedirect copyWith({
    Object? id = _Undefined,
    int? blogId,
    String? fromPath,
    String? toPath,
    bool? isPermanent,
    DateTime? createdAt,
  }) {
    return CustomRedirect(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      fromPath: fromPath ?? this.fromPath,
      toPath: toPath ?? this.toPath,
      isPermanent: isPermanent ?? this.isPermanent,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CustomRedirectUpdateTable extends _is.UpdateTable<CustomRedirectTable> {
  CustomRedirectUpdateTable(super.table);

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<String, String> fromPath(String value) => _is.ColumnValue(
    table.fromPath,
    value,
  );

  _is.ColumnValue<String, String> toPath(String value) => _is.ColumnValue(
    table.toPath,
    value,
  );

  _is.ColumnValue<bool, bool> isPermanent(bool value) => _is.ColumnValue(
    table.isPermanent,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class CustomRedirectTable extends _is.Table<int?> {
  CustomRedirectTable({super.tableRelation})
    : super(tableName: 'blogger_custom_redirect') {
    updateTable = CustomRedirectUpdateTable(this);
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    fromPath = _is.ColumnString(
      'fromPath',
      this,
    );
    toPath = _is.ColumnString(
      'toPath',
      this,
    );
    isPermanent = _is.ColumnBool(
      'isPermanent',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final CustomRedirectUpdateTable updateTable;

  late final _is.ColumnInt blogId;

  late final _is.ColumnString fromPath;

  late final _is.ColumnString toPath;

  late final _is.ColumnBool isPermanent;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    blogId,
    fromPath,
    toPath,
    isPermanent,
    createdAt,
  ];
}

class CustomRedirectInclude extends _is.IncludeObject {
  CustomRedirectInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => CustomRedirect.t;
}

class CustomRedirectIncludeList extends _is.IncludeList {
  CustomRedirectIncludeList._({
    _is.WhereExpressionBuilder<CustomRedirectTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomRedirect.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => CustomRedirect.t;
}

class CustomRedirectRepository {
  const CustomRedirectRepository._();

  /// Returns a list of [CustomRedirect]s matching the given query parameters.
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
  Future<List<CustomRedirect>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CustomRedirectTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CustomRedirectTable>? orderBy,
    _is.OrderByListBuilder<CustomRedirectTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CustomRedirect>(
      where: where?.call(CustomRedirect.t),
      orderBy: orderBy?.call(CustomRedirect.t),
      orderByList: orderByList?.call(CustomRedirect.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [CustomRedirect]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `CustomRedirect.t`.
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
  _ida.Stream<List<CustomRedirect>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CustomRedirectTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CustomRedirectTable>? orderBy,
    _is.OrderByListBuilder<CustomRedirectTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<CustomRedirect>(
      where: where?.call(CustomRedirect.t),
      orderBy: orderBy?.call(CustomRedirect.t),
      orderByList: orderByList?.call(CustomRedirect.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [CustomRedirect] matching the given query parameters.
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
  Future<CustomRedirect?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CustomRedirectTable>? where,
    int? offset,
    _is.OrderByBuilder<CustomRedirectTable>? orderBy,
    _is.OrderByListBuilder<CustomRedirectTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CustomRedirect>(
      where: where?.call(CustomRedirect.t),
      orderBy: orderBy?.call(CustomRedirect.t),
      orderByList: orderByList?.call(CustomRedirect.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CustomRedirect] by its [id] or null if no such row exists.
  Future<CustomRedirect?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CustomRedirect>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CustomRedirect]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomRedirect]s will have their `id` fields set.
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
  Future<List<CustomRedirect>> insert(
    _is.DatabaseSession session,
    List<CustomRedirect> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CustomRedirect>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CustomRedirect] and returns the inserted row.
  ///
  /// The returned [CustomRedirect] will have its `id` field set.
  Future<CustomRedirect> insertRow(
    _is.DatabaseSession session,
    CustomRedirect row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomRedirect>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CustomRedirect]s in the list and returns the resulting rows.
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
  /// The returned [CustomRedirect]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CustomRedirect>> upsert(
    _is.DatabaseSession session,
    List<CustomRedirect> rows, {
    required _is.ColumnSelections<CustomRedirectTable> conflictColumns,
    _is.ColumnSelections<CustomRedirectTable>? updateColumns,
    _is.WhereExpressionBuilder<CustomRedirectTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CustomRedirect>(
      rows,
      conflictColumns: conflictColumns(CustomRedirect.t),
      updateColumns: updateColumns?.call(CustomRedirect.t),
      updateWhere: updateWhere?.call(CustomRedirect.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CustomRedirect] and returns the resulting row.
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
  /// The returned [CustomRedirect] will have its `id` field set.
  Future<CustomRedirect?> upsertRow(
    _is.DatabaseSession session,
    CustomRedirect row, {
    required _is.ColumnSelections<CustomRedirectTable> conflictColumns,
    _is.ColumnSelections<CustomRedirectTable>? updateColumns,
    _is.WhereExpressionBuilder<CustomRedirectTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CustomRedirect>(
      row,
      conflictColumns: conflictColumns(CustomRedirect.t),
      updateColumns: updateColumns?.call(CustomRedirect.t),
      updateWhere: updateWhere?.call(CustomRedirect.t),
      transaction: transaction,
    );
  }

  /// Updates all [CustomRedirect]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CustomRedirect>> update(
    _is.DatabaseSession session,
    List<CustomRedirect> rows, {
    _is.ColumnSelections<CustomRedirectTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CustomRedirect>(
      rows,
      columns: columns?.call(CustomRedirect.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CustomRedirect]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomRedirect> updateRow(
    _is.DatabaseSession session,
    CustomRedirect row, {
    _is.ColumnSelections<CustomRedirectTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomRedirect>(
      row,
      columns: columns?.call(CustomRedirect.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomRedirect] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CustomRedirect?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CustomRedirectUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CustomRedirect>(
      id,
      columnValues: columnValues(CustomRedirect.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CustomRedirect]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CustomRedirect>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CustomRedirectUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CustomRedirectTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CustomRedirectTable>? orderBy,
    _is.OrderByListBuilder<CustomRedirectTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CustomRedirect>(
      columnValues: columnValues(CustomRedirect.t.updateTable),
      where: where(CustomRedirect.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomRedirect.t),
      orderByList: orderByList?.call(CustomRedirect.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CustomRedirect]s in the list and returns the deleted rows.
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
  Future<List<CustomRedirect>> delete(
    _is.DatabaseSession session,
    List<CustomRedirect> rows, {
    _is.OrderByBuilder<CustomRedirectTable>? orderBy,
    _is.OrderByListBuilder<CustomRedirectTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CustomRedirect>(
      rows,
      orderBy: orderBy?.call(CustomRedirect.t),
      orderByList: orderByList?.call(CustomRedirect.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CustomRedirect].
  Future<CustomRedirect> deleteRow(
    _is.DatabaseSession session,
    CustomRedirect row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomRedirect>(
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
  Future<List<CustomRedirect>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CustomRedirectTable> where,
    _is.OrderByBuilder<CustomRedirectTable>? orderBy,
    _is.OrderByListBuilder<CustomRedirectTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CustomRedirect>(
      where: where(CustomRedirect.t),
      orderBy: orderBy?.call(CustomRedirect.t),
      orderByList: orderByList?.call(CustomRedirect.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CustomRedirectTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CustomRedirect>(
      where: where?.call(CustomRedirect.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CustomRedirect] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CustomRedirectTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CustomRedirect>(
      where: where(CustomRedirect.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

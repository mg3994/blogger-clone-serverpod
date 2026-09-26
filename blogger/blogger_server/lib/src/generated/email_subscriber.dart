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

abstract class EmailSubscriber
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  EmailSubscriber._({
    this.id,
    required this.blogId,
    required this.email,
    required this.isConfirmed,
    required this.subscribedAt,
  });

  factory EmailSubscriber({
    int? id,
    required int blogId,
    required String email,
    required bool isConfirmed,
    required DateTime subscribedAt,
  }) = _EmailSubscriberImpl;

  factory EmailSubscriber.fromJson(Map<String, dynamic> jsonSerialization) {
    return EmailSubscriber(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      email: jsonSerialization['email'] as String,
      isConfirmed: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isConfirmed'],
      ),
      subscribedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['subscribedAt'],
      ),
    );
  }

  static final t = EmailSubscriberTable();

  static const db = EmailSubscriberRepository._();

  @override
  int? id;

  int blogId;

  String email;

  bool isConfirmed;

  DateTime subscribedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [EmailSubscriber]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  EmailSubscriber copyWith({
    int? id,
    int? blogId,
    String? email,
    bool? isConfirmed,
    DateTime? subscribedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EmailSubscriber',
      if (id != null) 'id': id,
      'blogId': blogId,
      'email': email,
      'isConfirmed': isConfirmed,
      'subscribedAt': subscribedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EmailSubscriber',
      if (id != null) 'id': id,
      'blogId': blogId,
      'email': email,
      'isConfirmed': isConfirmed,
      'subscribedAt': subscribedAt.toJson(),
    };
  }

  static EmailSubscriberInclude include() {
    return EmailSubscriberInclude._();
  }

  static EmailSubscriberIncludeList includeList({
    _is.WhereExpressionBuilder<EmailSubscriberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EmailSubscriberTable>? orderBy,
    _is.OrderByListBuilder<EmailSubscriberTable>? orderByList,
    EmailSubscriberInclude? include,
  }) {
    return EmailSubscriberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EmailSubscriber.t),
      orderByList: orderByList?.call(EmailSubscriber.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EmailSubscriberImpl extends EmailSubscriber {
  _EmailSubscriberImpl({
    int? id,
    required int blogId,
    required String email,
    required bool isConfirmed,
    required DateTime subscribedAt,
  }) : super._(
         id: id,
         blogId: blogId,
         email: email,
         isConfirmed: isConfirmed,
         subscribedAt: subscribedAt,
       );

  /// Returns a shallow copy of this [EmailSubscriber]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  EmailSubscriber copyWith({
    Object? id = _Undefined,
    int? blogId,
    String? email,
    bool? isConfirmed,
    DateTime? subscribedAt,
  }) {
    return EmailSubscriber(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      email: email ?? this.email,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      subscribedAt: subscribedAt ?? this.subscribedAt,
    );
  }
}

class EmailSubscriberUpdateTable extends _is.UpdateTable<EmailSubscriberTable> {
  EmailSubscriberUpdateTable(super.table);

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<String, String> email(String value) => _is.ColumnValue(
    table.email,
    value,
  );

  _is.ColumnValue<bool, bool> isConfirmed(bool value) => _is.ColumnValue(
    table.isConfirmed,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> subscribedAt(DateTime value) =>
      _is.ColumnValue(
        table.subscribedAt,
        value,
      );
}

class EmailSubscriberTable extends _is.Table<int?> {
  EmailSubscriberTable({super.tableRelation})
    : super(tableName: 'blogger_subscriber') {
    updateTable = EmailSubscriberUpdateTable(this);
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    email = _is.ColumnString(
      'email',
      this,
    );
    isConfirmed = _is.ColumnBool(
      'isConfirmed',
      this,
    );
    subscribedAt = _is.ColumnDateTime(
      'subscribedAt',
      this,
    );
  }

  late final EmailSubscriberUpdateTable updateTable;

  late final _is.ColumnInt blogId;

  late final _is.ColumnString email;

  late final _is.ColumnBool isConfirmed;

  late final _is.ColumnDateTime subscribedAt;

  @override
  List<_is.Column> get columns => [
    id,
    blogId,
    email,
    isConfirmed,
    subscribedAt,
  ];
}

class EmailSubscriberInclude extends _is.IncludeObject {
  EmailSubscriberInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => EmailSubscriber.t;
}

class EmailSubscriberIncludeList extends _is.IncludeList {
  EmailSubscriberIncludeList._({
    _is.WhereExpressionBuilder<EmailSubscriberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EmailSubscriber.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => EmailSubscriber.t;
}

class EmailSubscriberRepository {
  const EmailSubscriberRepository._();

  /// Returns a list of [EmailSubscriber]s matching the given query parameters.
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
  Future<List<EmailSubscriber>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EmailSubscriberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EmailSubscriberTable>? orderBy,
    _is.OrderByListBuilder<EmailSubscriberTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<EmailSubscriber>(
      where: where?.call(EmailSubscriber.t),
      orderBy: orderBy?.call(EmailSubscriber.t),
      orderByList: orderByList?.call(EmailSubscriber.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [EmailSubscriber]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `EmailSubscriber.t`.
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
  _ida.Stream<List<EmailSubscriber>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EmailSubscriberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EmailSubscriberTable>? orderBy,
    _is.OrderByListBuilder<EmailSubscriberTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<EmailSubscriber>(
      where: where?.call(EmailSubscriber.t),
      orderBy: orderBy?.call(EmailSubscriber.t),
      orderByList: orderByList?.call(EmailSubscriber.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [EmailSubscriber] matching the given query parameters.
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
  Future<EmailSubscriber?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EmailSubscriberTable>? where,
    int? offset,
    _is.OrderByBuilder<EmailSubscriberTable>? orderBy,
    _is.OrderByListBuilder<EmailSubscriberTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<EmailSubscriber>(
      where: where?.call(EmailSubscriber.t),
      orderBy: orderBy?.call(EmailSubscriber.t),
      orderByList: orderByList?.call(EmailSubscriber.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [EmailSubscriber] by its [id] or null if no such row exists.
  Future<EmailSubscriber?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<EmailSubscriber>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [EmailSubscriber]s in the list and returns the inserted rows.
  ///
  /// The returned [EmailSubscriber]s will have their `id` fields set.
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
  Future<List<EmailSubscriber>> insert(
    _is.DatabaseSession session,
    List<EmailSubscriber> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<EmailSubscriber>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [EmailSubscriber] and returns the inserted row.
  ///
  /// The returned [EmailSubscriber] will have its `id` field set.
  Future<EmailSubscriber> insertRow(
    _is.DatabaseSession session,
    EmailSubscriber row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<EmailSubscriber>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [EmailSubscriber]s in the list and returns the resulting rows.
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
  /// The returned [EmailSubscriber]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EmailSubscriber>> upsert(
    _is.DatabaseSession session,
    List<EmailSubscriber> rows, {
    required _is.ColumnSelections<EmailSubscriberTable> conflictColumns,
    _is.ColumnSelections<EmailSubscriberTable>? updateColumns,
    _is.WhereExpressionBuilder<EmailSubscriberTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<EmailSubscriber>(
      rows,
      conflictColumns: conflictColumns(EmailSubscriber.t),
      updateColumns: updateColumns?.call(EmailSubscriber.t),
      updateWhere: updateWhere?.call(EmailSubscriber.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [EmailSubscriber] and returns the resulting row.
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
  /// The returned [EmailSubscriber] will have its `id` field set.
  Future<EmailSubscriber?> upsertRow(
    _is.DatabaseSession session,
    EmailSubscriber row, {
    required _is.ColumnSelections<EmailSubscriberTable> conflictColumns,
    _is.ColumnSelections<EmailSubscriberTable>? updateColumns,
    _is.WhereExpressionBuilder<EmailSubscriberTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<EmailSubscriber>(
      row,
      conflictColumns: conflictColumns(EmailSubscriber.t),
      updateColumns: updateColumns?.call(EmailSubscriber.t),
      updateWhere: updateWhere?.call(EmailSubscriber.t),
      transaction: transaction,
    );
  }

  /// Updates all [EmailSubscriber]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EmailSubscriber>> update(
    _is.DatabaseSession session,
    List<EmailSubscriber> rows, {
    _is.ColumnSelections<EmailSubscriberTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<EmailSubscriber>(
      rows,
      columns: columns?.call(EmailSubscriber.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [EmailSubscriber]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EmailSubscriber> updateRow(
    _is.DatabaseSession session,
    EmailSubscriber row, {
    _is.ColumnSelections<EmailSubscriberTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<EmailSubscriber>(
      row,
      columns: columns?.call(EmailSubscriber.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EmailSubscriber] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EmailSubscriber?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<EmailSubscriberUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<EmailSubscriber>(
      id,
      columnValues: columnValues(EmailSubscriber.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EmailSubscriber]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EmailSubscriber>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<EmailSubscriberUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<EmailSubscriberTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EmailSubscriberTable>? orderBy,
    _is.OrderByListBuilder<EmailSubscriberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<EmailSubscriber>(
      columnValues: columnValues(EmailSubscriber.t.updateTable),
      where: where(EmailSubscriber.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EmailSubscriber.t),
      orderByList: orderByList?.call(EmailSubscriber.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [EmailSubscriber]s in the list and returns the deleted rows.
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
  Future<List<EmailSubscriber>> delete(
    _is.DatabaseSession session,
    List<EmailSubscriber> rows, {
    _is.OrderByBuilder<EmailSubscriberTable>? orderBy,
    _is.OrderByListBuilder<EmailSubscriberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<EmailSubscriber>(
      rows,
      orderBy: orderBy?.call(EmailSubscriber.t),
      orderByList: orderByList?.call(EmailSubscriber.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [EmailSubscriber].
  Future<EmailSubscriber> deleteRow(
    _is.DatabaseSession session,
    EmailSubscriber row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EmailSubscriber>(
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
  Future<List<EmailSubscriber>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EmailSubscriberTable> where,
    _is.OrderByBuilder<EmailSubscriberTable>? orderBy,
    _is.OrderByListBuilder<EmailSubscriberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<EmailSubscriber>(
      where: where(EmailSubscriber.t),
      orderBy: orderBy?.call(EmailSubscriber.t),
      orderByList: orderByList?.call(EmailSubscriber.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EmailSubscriberTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<EmailSubscriber>(
      where: where?.call(EmailSubscriber.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [EmailSubscriber] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EmailSubscriberTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<EmailSubscriber>(
      where: where(EmailSubscriber.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

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

abstract class BlogMember
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  BlogMember._({
    this.id,
    required this.blogId,
    required this.userId,
    required this.userEmail,
    required this.role,
    required this.status,
    required this.joinedAt,
  });

  factory BlogMember({
    int? id,
    required int blogId,
    required int userId,
    required String userEmail,
    required String role,
    required String status,
    required DateTime joinedAt,
  }) = _BlogMemberImpl;

  factory BlogMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlogMember(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      userId: jsonSerialization['userId'] as int,
      userEmail: jsonSerialization['userEmail'] as String,
      role: jsonSerialization['role'] as String,
      status: jsonSerialization['status'] as String,
      joinedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['joinedAt'],
      ),
    );
  }

  static final t = BlogMemberTable();

  static const db = BlogMemberRepository._();

  @override
  int? id;

  int blogId;

  int userId;

  String userEmail;

  String role;

  String status;

  DateTime joinedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [BlogMember]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  BlogMember copyWith({
    int? id,
    int? blogId,
    int? userId,
    String? userEmail,
    String? role,
    String? status,
    DateTime? joinedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BlogMember',
      if (id != null) 'id': id,
      'blogId': blogId,
      'userId': userId,
      'userEmail': userEmail,
      'role': role,
      'status': status,
      'joinedAt': joinedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BlogMember',
      if (id != null) 'id': id,
      'blogId': blogId,
      'userId': userId,
      'userEmail': userEmail,
      'role': role,
      'status': status,
      'joinedAt': joinedAt.toJson(),
    };
  }

  static BlogMemberInclude include() {
    return BlogMemberInclude._();
  }

  static BlogMemberIncludeList includeList({
    _is.WhereExpressionBuilder<BlogMemberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogMemberTable>? orderBy,
    _is.OrderByListBuilder<BlogMemberTable>? orderByList,
    BlogMemberInclude? include,
  }) {
    return BlogMemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogMember.t),
      orderByList: orderByList?.call(BlogMember.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlogMemberImpl extends BlogMember {
  _BlogMemberImpl({
    int? id,
    required int blogId,
    required int userId,
    required String userEmail,
    required String role,
    required String status,
    required DateTime joinedAt,
  }) : super._(
         id: id,
         blogId: blogId,
         userId: userId,
         userEmail: userEmail,
         role: role,
         status: status,
         joinedAt: joinedAt,
       );

  /// Returns a shallow copy of this [BlogMember]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  BlogMember copyWith({
    Object? id = _Undefined,
    int? blogId,
    int? userId,
    String? userEmail,
    String? role,
    String? status,
    DateTime? joinedAt,
  }) {
    return BlogMember(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      role: role ?? this.role,
      status: status ?? this.status,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }
}

class BlogMemberUpdateTable extends _is.UpdateTable<BlogMemberTable> {
  BlogMemberUpdateTable(super.table);

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<String, String> userEmail(String value) => _is.ColumnValue(
    table.userEmail,
    value,
  );

  _is.ColumnValue<String, String> role(String value) => _is.ColumnValue(
    table.role,
    value,
  );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> joinedAt(DateTime value) =>
      _is.ColumnValue(
        table.joinedAt,
        value,
      );
}

class BlogMemberTable extends _is.Table<int?> {
  BlogMemberTable({super.tableRelation}) : super(tableName: 'blogger_member') {
    updateTable = BlogMemberUpdateTable(this);
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    userEmail = _is.ColumnString(
      'userEmail',
      this,
    );
    role = _is.ColumnString(
      'role',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    joinedAt = _is.ColumnDateTime(
      'joinedAt',
      this,
    );
  }

  late final BlogMemberUpdateTable updateTable;

  late final _is.ColumnInt blogId;

  late final _is.ColumnInt userId;

  late final _is.ColumnString userEmail;

  late final _is.ColumnString role;

  late final _is.ColumnString status;

  late final _is.ColumnDateTime joinedAt;

  @override
  List<_is.Column> get columns => [
    id,
    blogId,
    userId,
    userEmail,
    role,
    status,
    joinedAt,
  ];
}

class BlogMemberInclude extends _is.IncludeObject {
  BlogMemberInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => BlogMember.t;
}

class BlogMemberIncludeList extends _is.IncludeList {
  BlogMemberIncludeList._({
    _is.WhereExpressionBuilder<BlogMemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BlogMember.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => BlogMember.t;
}

class BlogMemberRepository {
  const BlogMemberRepository._();

  /// Returns a list of [BlogMember]s matching the given query parameters.
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
  Future<List<BlogMember>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogMemberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogMemberTable>? orderBy,
    _is.OrderByListBuilder<BlogMemberTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<BlogMember>(
      where: where?.call(BlogMember.t),
      orderBy: orderBy?.call(BlogMember.t),
      orderByList: orderByList?.call(BlogMember.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [BlogMember]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `BlogMember.t`.
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
  _ida.Stream<List<BlogMember>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogMemberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogMemberTable>? orderBy,
    _is.OrderByListBuilder<BlogMemberTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<BlogMember>(
      where: where?.call(BlogMember.t),
      orderBy: orderBy?.call(BlogMember.t),
      orderByList: orderByList?.call(BlogMember.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [BlogMember] matching the given query parameters.
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
  Future<BlogMember?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogMemberTable>? where,
    int? offset,
    _is.OrderByBuilder<BlogMemberTable>? orderBy,
    _is.OrderByListBuilder<BlogMemberTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<BlogMember>(
      where: where?.call(BlogMember.t),
      orderBy: orderBy?.call(BlogMember.t),
      orderByList: orderByList?.call(BlogMember.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [BlogMember] by its [id] or null if no such row exists.
  Future<BlogMember?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<BlogMember>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [BlogMember]s in the list and returns the inserted rows.
  ///
  /// The returned [BlogMember]s will have their `id` fields set.
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
  Future<List<BlogMember>> insert(
    _is.DatabaseSession session,
    List<BlogMember> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<BlogMember>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [BlogMember] and returns the inserted row.
  ///
  /// The returned [BlogMember] will have its `id` field set.
  Future<BlogMember> insertRow(
    _is.DatabaseSession session,
    BlogMember row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<BlogMember>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [BlogMember]s in the list and returns the resulting rows.
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
  /// The returned [BlogMember]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogMember>> upsert(
    _is.DatabaseSession session,
    List<BlogMember> rows, {
    required _is.ColumnSelections<BlogMemberTable> conflictColumns,
    _is.ColumnSelections<BlogMemberTable>? updateColumns,
    _is.WhereExpressionBuilder<BlogMemberTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<BlogMember>(
      rows,
      conflictColumns: conflictColumns(BlogMember.t),
      updateColumns: updateColumns?.call(BlogMember.t),
      updateWhere: updateWhere?.call(BlogMember.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [BlogMember] and returns the resulting row.
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
  /// The returned [BlogMember] will have its `id` field set.
  Future<BlogMember?> upsertRow(
    _is.DatabaseSession session,
    BlogMember row, {
    required _is.ColumnSelections<BlogMemberTable> conflictColumns,
    _is.ColumnSelections<BlogMemberTable>? updateColumns,
    _is.WhereExpressionBuilder<BlogMemberTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<BlogMember>(
      row,
      conflictColumns: conflictColumns(BlogMember.t),
      updateColumns: updateColumns?.call(BlogMember.t),
      updateWhere: updateWhere?.call(BlogMember.t),
      transaction: transaction,
    );
  }

  /// Updates all [BlogMember]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogMember>> update(
    _is.DatabaseSession session,
    List<BlogMember> rows, {
    _is.ColumnSelections<BlogMemberTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<BlogMember>(
      rows,
      columns: columns?.call(BlogMember.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [BlogMember]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BlogMember> updateRow(
    _is.DatabaseSession session,
    BlogMember row, {
    _is.ColumnSelections<BlogMemberTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<BlogMember>(
      row,
      columns: columns?.call(BlogMember.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BlogMember] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BlogMember?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BlogMemberUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<BlogMember>(
      id,
      columnValues: columnValues(BlogMember.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BlogMember]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BlogMember>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BlogMemberUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BlogMemberTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BlogMemberTable>? orderBy,
    _is.OrderByListBuilder<BlogMemberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<BlogMember>(
      columnValues: columnValues(BlogMember.t.updateTable),
      where: where(BlogMember.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogMember.t),
      orderByList: orderByList?.call(BlogMember.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [BlogMember]s in the list and returns the deleted rows.
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
  Future<List<BlogMember>> delete(
    _is.DatabaseSession session,
    List<BlogMember> rows, {
    _is.OrderByBuilder<BlogMemberTable>? orderBy,
    _is.OrderByListBuilder<BlogMemberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<BlogMember>(
      rows,
      orderBy: orderBy?.call(BlogMember.t),
      orderByList: orderByList?.call(BlogMember.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [BlogMember].
  Future<BlogMember> deleteRow(
    _is.DatabaseSession session,
    BlogMember row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BlogMember>(
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
  Future<List<BlogMember>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlogMemberTable> where,
    _is.OrderByBuilder<BlogMemberTable>? orderBy,
    _is.OrderByListBuilder<BlogMemberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<BlogMember>(
      where: where(BlogMember.t),
      orderBy: orderBy?.call(BlogMember.t),
      orderByList: orderByList?.call(BlogMember.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BlogMemberTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<BlogMember>(
      where: where?.call(BlogMember.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [BlogMember] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BlogMemberTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<BlogMember>(
      where: where(BlogMember.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

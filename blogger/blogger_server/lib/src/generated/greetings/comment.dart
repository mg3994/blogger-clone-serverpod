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

abstract class Comment
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  Comment._({
    this.id,
    required this.blogId,
    required this.postId,
    this.parentCommentId,
    required this.authorName,
    this.authorEmail,
    required this.content,
    required this.createdAt,
    required this.isApproved,
  });

  factory Comment({
    int? id,
    required int blogId,
    required int postId,
    int? parentCommentId,
    required String authorName,
    String? authorEmail,
    required String content,
    required DateTime createdAt,
    required bool isApproved,
  }) = _CommentImpl;

  factory Comment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Comment(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      postId: jsonSerialization['postId'] as int,
      parentCommentId: jsonSerialization['parentCommentId'] as int?,
      authorName: jsonSerialization['authorName'] as String,
      authorEmail: jsonSerialization['authorEmail'] as String?,
      content: jsonSerialization['content'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      isApproved: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isApproved'],
      ),
    );
  }

  static final t = CommentTable();

  static const db = CommentRepository._();

  @override
  int? id;

  int blogId;

  int postId;

  int? parentCommentId;

  String authorName;

  String? authorEmail;

  String content;

  DateTime createdAt;

  bool isApproved;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Comment]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Comment copyWith({
    int? id,
    int? blogId,
    int? postId,
    int? parentCommentId,
    String? authorName,
    String? authorEmail,
    String? content,
    DateTime? createdAt,
    bool? isApproved,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Comment',
      if (id != null) 'id': id,
      'blogId': blogId,
      'postId': postId,
      if (parentCommentId != null) 'parentCommentId': parentCommentId,
      'authorName': authorName,
      if (authorEmail != null) 'authorEmail': authorEmail,
      'content': content,
      'createdAt': createdAt.toJson(),
      'isApproved': isApproved,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Comment',
      if (id != null) 'id': id,
      'blogId': blogId,
      'postId': postId,
      if (parentCommentId != null) 'parentCommentId': parentCommentId,
      'authorName': authorName,
      if (authorEmail != null) 'authorEmail': authorEmail,
      'content': content,
      'createdAt': createdAt.toJson(),
      'isApproved': isApproved,
    };
  }

  static CommentInclude include() {
    return CommentInclude._();
  }

  static CommentIncludeList includeList({
    _is.WhereExpressionBuilder<CommentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommentTable>? orderBy,
    _is.OrderByListBuilder<CommentTable>? orderByList,
    CommentInclude? include,
  }) {
    return CommentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommentImpl extends Comment {
  _CommentImpl({
    int? id,
    required int blogId,
    required int postId,
    int? parentCommentId,
    required String authorName,
    String? authorEmail,
    required String content,
    required DateTime createdAt,
    required bool isApproved,
  }) : super._(
         id: id,
         blogId: blogId,
         postId: postId,
         parentCommentId: parentCommentId,
         authorName: authorName,
         authorEmail: authorEmail,
         content: content,
         createdAt: createdAt,
         isApproved: isApproved,
       );

  /// Returns a shallow copy of this [Comment]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Comment copyWith({
    Object? id = _Undefined,
    int? blogId,
    int? postId,
    Object? parentCommentId = _Undefined,
    String? authorName,
    Object? authorEmail = _Undefined,
    String? content,
    DateTime? createdAt,
    bool? isApproved,
  }) {
    return Comment(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      postId: postId ?? this.postId,
      parentCommentId: parentCommentId is int?
          ? parentCommentId
          : this.parentCommentId,
      authorName: authorName ?? this.authorName,
      authorEmail: authorEmail is String? ? authorEmail : this.authorEmail,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isApproved: isApproved ?? this.isApproved,
    );
  }
}

class CommentUpdateTable extends _is.UpdateTable<CommentTable> {
  CommentUpdateTable(super.table);

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<int, int> postId(int value) => _is.ColumnValue(
    table.postId,
    value,
  );

  _is.ColumnValue<int, int> parentCommentId(int? value) => _is.ColumnValue(
    table.parentCommentId,
    value,
  );

  _is.ColumnValue<String, String> authorName(String value) => _is.ColumnValue(
    table.authorName,
    value,
  );

  _is.ColumnValue<String, String> authorEmail(String? value) => _is.ColumnValue(
    table.authorEmail,
    value,
  );

  _is.ColumnValue<String, String> content(String value) => _is.ColumnValue(
    table.content,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<bool, bool> isApproved(bool value) => _is.ColumnValue(
    table.isApproved,
    value,
  );
}

class CommentTable extends _is.Table<int?> {
  CommentTable({super.tableRelation}) : super(tableName: 'blogger_comment') {
    updateTable = CommentUpdateTable(this);
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    postId = _is.ColumnInt(
      'postId',
      this,
    );
    parentCommentId = _is.ColumnInt(
      'parentCommentId',
      this,
    );
    authorName = _is.ColumnString(
      'authorName',
      this,
    );
    authorEmail = _is.ColumnString(
      'authorEmail',
      this,
    );
    content = _is.ColumnString(
      'content',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
    isApproved = _is.ColumnBool(
      'isApproved',
      this,
    );
  }

  late final CommentUpdateTable updateTable;

  late final _is.ColumnInt blogId;

  late final _is.ColumnInt postId;

  late final _is.ColumnInt parentCommentId;

  late final _is.ColumnString authorName;

  late final _is.ColumnString authorEmail;

  late final _is.ColumnString content;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnBool isApproved;

  @override
  List<_is.Column> get columns => [
    id,
    blogId,
    postId,
    parentCommentId,
    authorName,
    authorEmail,
    content,
    createdAt,
    isApproved,
  ];
}

class CommentInclude extends _is.IncludeObject {
  CommentInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Comment.t;
}

class CommentIncludeList extends _is.IncludeList {
  CommentIncludeList._({
    _is.WhereExpressionBuilder<CommentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Comment.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Comment.t;
}

class CommentRepository {
  const CommentRepository._();

  /// Returns a list of [Comment]s matching the given query parameters.
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
  Future<List<Comment>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommentTable>? orderBy,
    _is.OrderByListBuilder<CommentTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Comment>(
      where: where?.call(Comment.t),
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [Comment]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `Comment.t`.
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
  _ida.Stream<List<Comment>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommentTable>? orderBy,
    _is.OrderByListBuilder<CommentTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<Comment>(
      where: where?.call(Comment.t),
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [Comment] matching the given query parameters.
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
  Future<Comment?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommentTable>? where,
    int? offset,
    _is.OrderByBuilder<CommentTable>? orderBy,
    _is.OrderByListBuilder<CommentTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Comment>(
      where: where?.call(Comment.t),
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Comment] by its [id] or null if no such row exists.
  Future<Comment?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Comment>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Comment]s in the list and returns the inserted rows.
  ///
  /// The returned [Comment]s will have their `id` fields set.
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
  Future<List<Comment>> insert(
    _is.DatabaseSession session,
    List<Comment> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Comment>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Comment] and returns the inserted row.
  ///
  /// The returned [Comment] will have its `id` field set.
  Future<Comment> insertRow(
    _is.DatabaseSession session,
    Comment row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Comment>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Comment]s in the list and returns the resulting rows.
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
  /// The returned [Comment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Comment>> upsert(
    _is.DatabaseSession session,
    List<Comment> rows, {
    required _is.ColumnSelections<CommentTable> conflictColumns,
    _is.ColumnSelections<CommentTable>? updateColumns,
    _is.WhereExpressionBuilder<CommentTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Comment>(
      rows,
      conflictColumns: conflictColumns(Comment.t),
      updateColumns: updateColumns?.call(Comment.t),
      updateWhere: updateWhere?.call(Comment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Comment] and returns the resulting row.
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
  /// The returned [Comment] will have its `id` field set.
  Future<Comment?> upsertRow(
    _is.DatabaseSession session,
    Comment row, {
    required _is.ColumnSelections<CommentTable> conflictColumns,
    _is.ColumnSelections<CommentTable>? updateColumns,
    _is.WhereExpressionBuilder<CommentTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Comment>(
      row,
      conflictColumns: conflictColumns(Comment.t),
      updateColumns: updateColumns?.call(Comment.t),
      updateWhere: updateWhere?.call(Comment.t),
      transaction: transaction,
    );
  }

  /// Updates all [Comment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Comment>> update(
    _is.DatabaseSession session,
    List<Comment> rows, {
    _is.ColumnSelections<CommentTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Comment>(
      rows,
      columns: columns?.call(Comment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Comment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Comment> updateRow(
    _is.DatabaseSession session,
    Comment row, {
    _is.ColumnSelections<CommentTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Comment>(
      row,
      columns: columns?.call(Comment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Comment] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Comment?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CommentUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Comment>(
      id,
      columnValues: columnValues(Comment.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Comment]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Comment>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CommentUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CommentTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommentTable>? orderBy,
    _is.OrderByListBuilder<CommentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Comment>(
      columnValues: columnValues(Comment.t.updateTable),
      where: where(Comment.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Comment]s in the list and returns the deleted rows.
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
  Future<List<Comment>> delete(
    _is.DatabaseSession session,
    List<Comment> rows, {
    _is.OrderByBuilder<CommentTable>? orderBy,
    _is.OrderByListBuilder<CommentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Comment>(
      rows,
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Comment].
  Future<Comment> deleteRow(
    _is.DatabaseSession session,
    Comment row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Comment>(
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
  Future<List<Comment>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommentTable> where,
    _is.OrderByBuilder<CommentTable>? orderBy,
    _is.OrderByListBuilder<CommentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Comment>(
      where: where(Comment.t),
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommentTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Comment>(
      where: where?.call(Comment.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Comment] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommentTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Comment>(
      where: where(Comment.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

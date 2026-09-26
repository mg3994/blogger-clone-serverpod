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

abstract class MediaItem
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  MediaItem._({
    this.id,
    required this.blogId,
    required this.filename,
    required this.url,
    required this.mimeType,
    required this.sizeInBytes,
    required this.uploadedAt,
  });

  factory MediaItem({
    int? id,
    required int blogId,
    required String filename,
    required String url,
    required String mimeType,
    required int sizeInBytes,
    required DateTime uploadedAt,
  }) = _MediaItemImpl;

  factory MediaItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return MediaItem(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      filename: jsonSerialization['filename'] as String,
      url: jsonSerialization['url'] as String,
      mimeType: jsonSerialization['mimeType'] as String,
      sizeInBytes: jsonSerialization['sizeInBytes'] as int,
      uploadedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['uploadedAt'],
      ),
    );
  }

  static final t = MediaItemTable();

  static const db = MediaItemRepository._();

  @override
  int? id;

  int blogId;

  String filename;

  String url;

  String mimeType;

  int sizeInBytes;

  DateTime uploadedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [MediaItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  MediaItem copyWith({
    int? id,
    int? blogId,
    String? filename,
    String? url,
    String? mimeType,
    int? sizeInBytes,
    DateTime? uploadedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MediaItem',
      if (id != null) 'id': id,
      'blogId': blogId,
      'filename': filename,
      'url': url,
      'mimeType': mimeType,
      'sizeInBytes': sizeInBytes,
      'uploadedAt': uploadedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MediaItem',
      if (id != null) 'id': id,
      'blogId': blogId,
      'filename': filename,
      'url': url,
      'mimeType': mimeType,
      'sizeInBytes': sizeInBytes,
      'uploadedAt': uploadedAt.toJson(),
    };
  }

  static MediaItemInclude include() {
    return MediaItemInclude._();
  }

  static MediaItemIncludeList includeList({
    _is.WhereExpressionBuilder<MediaItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MediaItemTable>? orderBy,
    _is.OrderByListBuilder<MediaItemTable>? orderByList,
    MediaItemInclude? include,
  }) {
    return MediaItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MediaItem.t),
      orderByList: orderByList?.call(MediaItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MediaItemImpl extends MediaItem {
  _MediaItemImpl({
    int? id,
    required int blogId,
    required String filename,
    required String url,
    required String mimeType,
    required int sizeInBytes,
    required DateTime uploadedAt,
  }) : super._(
         id: id,
         blogId: blogId,
         filename: filename,
         url: url,
         mimeType: mimeType,
         sizeInBytes: sizeInBytes,
         uploadedAt: uploadedAt,
       );

  /// Returns a shallow copy of this [MediaItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  MediaItem copyWith({
    Object? id = _Undefined,
    int? blogId,
    String? filename,
    String? url,
    String? mimeType,
    int? sizeInBytes,
    DateTime? uploadedAt,
  }) {
    return MediaItem(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      filename: filename ?? this.filename,
      url: url ?? this.url,
      mimeType: mimeType ?? this.mimeType,
      sizeInBytes: sizeInBytes ?? this.sizeInBytes,
      uploadedAt: uploadedAt ?? this.uploadedAt,
    );
  }
}

class MediaItemUpdateTable extends _is.UpdateTable<MediaItemTable> {
  MediaItemUpdateTable(super.table);

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<String, String> filename(String value) => _is.ColumnValue(
    table.filename,
    value,
  );

  _is.ColumnValue<String, String> url(String value) => _is.ColumnValue(
    table.url,
    value,
  );

  _is.ColumnValue<String, String> mimeType(String value) => _is.ColumnValue(
    table.mimeType,
    value,
  );

  _is.ColumnValue<int, int> sizeInBytes(int value) => _is.ColumnValue(
    table.sizeInBytes,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> uploadedAt(DateTime value) =>
      _is.ColumnValue(
        table.uploadedAt,
        value,
      );
}

class MediaItemTable extends _is.Table<int?> {
  MediaItemTable({super.tableRelation}) : super(tableName: 'blogger_media') {
    updateTable = MediaItemUpdateTable(this);
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    filename = _is.ColumnString(
      'filename',
      this,
    );
    url = _is.ColumnString(
      'url',
      this,
    );
    mimeType = _is.ColumnString(
      'mimeType',
      this,
    );
    sizeInBytes = _is.ColumnInt(
      'sizeInBytes',
      this,
    );
    uploadedAt = _is.ColumnDateTime(
      'uploadedAt',
      this,
    );
  }

  late final MediaItemUpdateTable updateTable;

  late final _is.ColumnInt blogId;

  late final _is.ColumnString filename;

  late final _is.ColumnString url;

  late final _is.ColumnString mimeType;

  late final _is.ColumnInt sizeInBytes;

  late final _is.ColumnDateTime uploadedAt;

  @override
  List<_is.Column> get columns => [
    id,
    blogId,
    filename,
    url,
    mimeType,
    sizeInBytes,
    uploadedAt,
  ];
}

class MediaItemInclude extends _is.IncludeObject {
  MediaItemInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => MediaItem.t;
}

class MediaItemIncludeList extends _is.IncludeList {
  MediaItemIncludeList._({
    _is.WhereExpressionBuilder<MediaItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MediaItem.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => MediaItem.t;
}

class MediaItemRepository {
  const MediaItemRepository._();

  /// Returns a list of [MediaItem]s matching the given query parameters.
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
  Future<List<MediaItem>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MediaItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MediaItemTable>? orderBy,
    _is.OrderByListBuilder<MediaItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<MediaItem>(
      where: where?.call(MediaItem.t),
      orderBy: orderBy?.call(MediaItem.t),
      orderByList: orderByList?.call(MediaItem.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [MediaItem]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `MediaItem.t`.
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
  _ida.Stream<List<MediaItem>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MediaItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MediaItemTable>? orderBy,
    _is.OrderByListBuilder<MediaItemTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<MediaItem>(
      where: where?.call(MediaItem.t),
      orderBy: orderBy?.call(MediaItem.t),
      orderByList: orderByList?.call(MediaItem.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [MediaItem] matching the given query parameters.
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
  Future<MediaItem?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MediaItemTable>? where,
    int? offset,
    _is.OrderByBuilder<MediaItemTable>? orderBy,
    _is.OrderByListBuilder<MediaItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<MediaItem>(
      where: where?.call(MediaItem.t),
      orderBy: orderBy?.call(MediaItem.t),
      orderByList: orderByList?.call(MediaItem.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [MediaItem] by its [id] or null if no such row exists.
  Future<MediaItem?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<MediaItem>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [MediaItem]s in the list and returns the inserted rows.
  ///
  /// The returned [MediaItem]s will have their `id` fields set.
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
  Future<List<MediaItem>> insert(
    _is.DatabaseSession session,
    List<MediaItem> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<MediaItem>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [MediaItem] and returns the inserted row.
  ///
  /// The returned [MediaItem] will have its `id` field set.
  Future<MediaItem> insertRow(
    _is.DatabaseSession session,
    MediaItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<MediaItem>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [MediaItem]s in the list and returns the resulting rows.
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
  /// The returned [MediaItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<MediaItem>> upsert(
    _is.DatabaseSession session,
    List<MediaItem> rows, {
    required _is.ColumnSelections<MediaItemTable> conflictColumns,
    _is.ColumnSelections<MediaItemTable>? updateColumns,
    _is.WhereExpressionBuilder<MediaItemTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<MediaItem>(
      rows,
      conflictColumns: conflictColumns(MediaItem.t),
      updateColumns: updateColumns?.call(MediaItem.t),
      updateWhere: updateWhere?.call(MediaItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [MediaItem] and returns the resulting row.
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
  /// The returned [MediaItem] will have its `id` field set.
  Future<MediaItem?> upsertRow(
    _is.DatabaseSession session,
    MediaItem row, {
    required _is.ColumnSelections<MediaItemTable> conflictColumns,
    _is.ColumnSelections<MediaItemTable>? updateColumns,
    _is.WhereExpressionBuilder<MediaItemTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<MediaItem>(
      row,
      conflictColumns: conflictColumns(MediaItem.t),
      updateColumns: updateColumns?.call(MediaItem.t),
      updateWhere: updateWhere?.call(MediaItem.t),
      transaction: transaction,
    );
  }

  /// Updates all [MediaItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<MediaItem>> update(
    _is.DatabaseSession session,
    List<MediaItem> rows, {
    _is.ColumnSelections<MediaItemTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<MediaItem>(
      rows,
      columns: columns?.call(MediaItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [MediaItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MediaItem> updateRow(
    _is.DatabaseSession session,
    MediaItem row, {
    _is.ColumnSelections<MediaItemTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<MediaItem>(
      row,
      columns: columns?.call(MediaItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MediaItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MediaItem?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<MediaItemUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<MediaItem>(
      id,
      columnValues: columnValues(MediaItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MediaItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<MediaItem>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<MediaItemUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<MediaItemTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MediaItemTable>? orderBy,
    _is.OrderByListBuilder<MediaItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<MediaItem>(
      columnValues: columnValues(MediaItem.t.updateTable),
      where: where(MediaItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MediaItem.t),
      orderByList: orderByList?.call(MediaItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [MediaItem]s in the list and returns the deleted rows.
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
  Future<List<MediaItem>> delete(
    _is.DatabaseSession session,
    List<MediaItem> rows, {
    _is.OrderByBuilder<MediaItemTable>? orderBy,
    _is.OrderByListBuilder<MediaItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<MediaItem>(
      rows,
      orderBy: orderBy?.call(MediaItem.t),
      orderByList: orderByList?.call(MediaItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [MediaItem].
  Future<MediaItem> deleteRow(
    _is.DatabaseSession session,
    MediaItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MediaItem>(
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
  Future<List<MediaItem>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<MediaItemTable> where,
    _is.OrderByBuilder<MediaItemTable>? orderBy,
    _is.OrderByListBuilder<MediaItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<MediaItem>(
      where: where(MediaItem.t),
      orderBy: orderBy?.call(MediaItem.t),
      orderByList: orderByList?.call(MediaItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MediaItemTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<MediaItem>(
      where: where?.call(MediaItem.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [MediaItem] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<MediaItemTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<MediaItem>(
      where: where(MediaItem.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

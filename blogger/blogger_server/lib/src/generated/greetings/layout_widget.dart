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

abstract class LayoutWidget
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  LayoutWidget._({
    this.id,
    required this.blogId,
    required this.section,
    required this.widgetType,
    required this.title,
    required this.configJson,
    required this.sortOrder,
    required this.isVisible,
  });

  factory LayoutWidget({
    int? id,
    required int blogId,
    required String section,
    required String widgetType,
    required String title,
    required String configJson,
    required int sortOrder,
    required bool isVisible,
  }) = _LayoutWidgetImpl;

  factory LayoutWidget.fromJson(Map<String, dynamic> jsonSerialization) {
    return LayoutWidget(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      section: jsonSerialization['section'] as String,
      widgetType: jsonSerialization['widgetType'] as String,
      title: jsonSerialization['title'] as String,
      configJson: jsonSerialization['configJson'] as String,
      sortOrder: jsonSerialization['sortOrder'] as int,
      isVisible: _is.BoolJsonExtension.fromJson(jsonSerialization['isVisible']),
    );
  }

  static final t = LayoutWidgetTable();

  static const db = LayoutWidgetRepository._();

  @override
  int? id;

  int blogId;

  String section;

  String widgetType;

  String title;

  String configJson;

  int sortOrder;

  bool isVisible;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [LayoutWidget]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  LayoutWidget copyWith({
    int? id,
    int? blogId,
    String? section,
    String? widgetType,
    String? title,
    String? configJson,
    int? sortOrder,
    bool? isVisible,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LayoutWidget',
      if (id != null) 'id': id,
      'blogId': blogId,
      'section': section,
      'widgetType': widgetType,
      'title': title,
      'configJson': configJson,
      'sortOrder': sortOrder,
      'isVisible': isVisible,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LayoutWidget',
      if (id != null) 'id': id,
      'blogId': blogId,
      'section': section,
      'widgetType': widgetType,
      'title': title,
      'configJson': configJson,
      'sortOrder': sortOrder,
      'isVisible': isVisible,
    };
  }

  static LayoutWidgetInclude include() {
    return LayoutWidgetInclude._();
  }

  static LayoutWidgetIncludeList includeList({
    _is.WhereExpressionBuilder<LayoutWidgetTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LayoutWidgetTable>? orderBy,
    _is.OrderByListBuilder<LayoutWidgetTable>? orderByList,
    LayoutWidgetInclude? include,
  }) {
    return LayoutWidgetIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LayoutWidget.t),
      orderByList: orderByList?.call(LayoutWidget.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LayoutWidgetImpl extends LayoutWidget {
  _LayoutWidgetImpl({
    int? id,
    required int blogId,
    required String section,
    required String widgetType,
    required String title,
    required String configJson,
    required int sortOrder,
    required bool isVisible,
  }) : super._(
         id: id,
         blogId: blogId,
         section: section,
         widgetType: widgetType,
         title: title,
         configJson: configJson,
         sortOrder: sortOrder,
         isVisible: isVisible,
       );

  /// Returns a shallow copy of this [LayoutWidget]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  LayoutWidget copyWith({
    Object? id = _Undefined,
    int? blogId,
    String? section,
    String? widgetType,
    String? title,
    String? configJson,
    int? sortOrder,
    bool? isVisible,
  }) {
    return LayoutWidget(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      section: section ?? this.section,
      widgetType: widgetType ?? this.widgetType,
      title: title ?? this.title,
      configJson: configJson ?? this.configJson,
      sortOrder: sortOrder ?? this.sortOrder,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

class LayoutWidgetUpdateTable extends _is.UpdateTable<LayoutWidgetTable> {
  LayoutWidgetUpdateTable(super.table);

  _is.ColumnValue<int, int> blogId(int value) => _is.ColumnValue(
    table.blogId,
    value,
  );

  _is.ColumnValue<String, String> section(String value) => _is.ColumnValue(
    table.section,
    value,
  );

  _is.ColumnValue<String, String> widgetType(String value) => _is.ColumnValue(
    table.widgetType,
    value,
  );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> configJson(String value) => _is.ColumnValue(
    table.configJson,
    value,
  );

  _is.ColumnValue<int, int> sortOrder(int value) => _is.ColumnValue(
    table.sortOrder,
    value,
  );

  _is.ColumnValue<bool, bool> isVisible(bool value) => _is.ColumnValue(
    table.isVisible,
    value,
  );
}

class LayoutWidgetTable extends _is.Table<int?> {
  LayoutWidgetTable({super.tableRelation})
    : super(tableName: 'blogger_layout_widget') {
    updateTable = LayoutWidgetUpdateTable(this);
    blogId = _is.ColumnInt(
      'blogId',
      this,
    );
    section = _is.ColumnString(
      'section',
      this,
    );
    widgetType = _is.ColumnString(
      'widgetType',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
    configJson = _is.ColumnString(
      'configJson',
      this,
    );
    sortOrder = _is.ColumnInt(
      'sortOrder',
      this,
    );
    isVisible = _is.ColumnBool(
      'isVisible',
      this,
    );
  }

  late final LayoutWidgetUpdateTable updateTable;

  late final _is.ColumnInt blogId;

  late final _is.ColumnString section;

  late final _is.ColumnString widgetType;

  late final _is.ColumnString title;

  late final _is.ColumnString configJson;

  late final _is.ColumnInt sortOrder;

  late final _is.ColumnBool isVisible;

  @override
  List<_is.Column> get columns => [
    id,
    blogId,
    section,
    widgetType,
    title,
    configJson,
    sortOrder,
    isVisible,
  ];
}

class LayoutWidgetInclude extends _is.IncludeObject {
  LayoutWidgetInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => LayoutWidget.t;
}

class LayoutWidgetIncludeList extends _is.IncludeList {
  LayoutWidgetIncludeList._({
    _is.WhereExpressionBuilder<LayoutWidgetTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LayoutWidget.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => LayoutWidget.t;
}

class LayoutWidgetRepository {
  const LayoutWidgetRepository._();

  /// Returns a list of [LayoutWidget]s matching the given query parameters.
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
  Future<List<LayoutWidget>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LayoutWidgetTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LayoutWidgetTable>? orderBy,
    _is.OrderByListBuilder<LayoutWidgetTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<LayoutWidget>(
      where: where?.call(LayoutWidget.t),
      orderBy: orderBy?.call(LayoutWidget.t),
      orderByList: orderByList?.call(LayoutWidget.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [LayoutWidget]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `LayoutWidget.t`.
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
  _ida.Stream<List<LayoutWidget>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LayoutWidgetTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LayoutWidgetTable>? orderBy,
    _is.OrderByListBuilder<LayoutWidgetTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<LayoutWidget>(
      where: where?.call(LayoutWidget.t),
      orderBy: orderBy?.call(LayoutWidget.t),
      orderByList: orderByList?.call(LayoutWidget.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [LayoutWidget] matching the given query parameters.
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
  Future<LayoutWidget?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LayoutWidgetTable>? where,
    int? offset,
    _is.OrderByBuilder<LayoutWidgetTable>? orderBy,
    _is.OrderByListBuilder<LayoutWidgetTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<LayoutWidget>(
      where: where?.call(LayoutWidget.t),
      orderBy: orderBy?.call(LayoutWidget.t),
      orderByList: orderByList?.call(LayoutWidget.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [LayoutWidget] by its [id] or null if no such row exists.
  Future<LayoutWidget?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<LayoutWidget>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [LayoutWidget]s in the list and returns the inserted rows.
  ///
  /// The returned [LayoutWidget]s will have their `id` fields set.
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
  Future<List<LayoutWidget>> insert(
    _is.DatabaseSession session,
    List<LayoutWidget> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<LayoutWidget>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [LayoutWidget] and returns the inserted row.
  ///
  /// The returned [LayoutWidget] will have its `id` field set.
  Future<LayoutWidget> insertRow(
    _is.DatabaseSession session,
    LayoutWidget row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<LayoutWidget>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [LayoutWidget]s in the list and returns the resulting rows.
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
  /// The returned [LayoutWidget]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LayoutWidget>> upsert(
    _is.DatabaseSession session,
    List<LayoutWidget> rows, {
    required _is.ColumnSelections<LayoutWidgetTable> conflictColumns,
    _is.ColumnSelections<LayoutWidgetTable>? updateColumns,
    _is.WhereExpressionBuilder<LayoutWidgetTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<LayoutWidget>(
      rows,
      conflictColumns: conflictColumns(LayoutWidget.t),
      updateColumns: updateColumns?.call(LayoutWidget.t),
      updateWhere: updateWhere?.call(LayoutWidget.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [LayoutWidget] and returns the resulting row.
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
  /// The returned [LayoutWidget] will have its `id` field set.
  Future<LayoutWidget?> upsertRow(
    _is.DatabaseSession session,
    LayoutWidget row, {
    required _is.ColumnSelections<LayoutWidgetTable> conflictColumns,
    _is.ColumnSelections<LayoutWidgetTable>? updateColumns,
    _is.WhereExpressionBuilder<LayoutWidgetTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<LayoutWidget>(
      row,
      conflictColumns: conflictColumns(LayoutWidget.t),
      updateColumns: updateColumns?.call(LayoutWidget.t),
      updateWhere: updateWhere?.call(LayoutWidget.t),
      transaction: transaction,
    );
  }

  /// Updates all [LayoutWidget]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LayoutWidget>> update(
    _is.DatabaseSession session,
    List<LayoutWidget> rows, {
    _is.ColumnSelections<LayoutWidgetTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<LayoutWidget>(
      rows,
      columns: columns?.call(LayoutWidget.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [LayoutWidget]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LayoutWidget> updateRow(
    _is.DatabaseSession session,
    LayoutWidget row, {
    _is.ColumnSelections<LayoutWidgetTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<LayoutWidget>(
      row,
      columns: columns?.call(LayoutWidget.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LayoutWidget] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LayoutWidget?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<LayoutWidgetUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<LayoutWidget>(
      id,
      columnValues: columnValues(LayoutWidget.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LayoutWidget]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LayoutWidget>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<LayoutWidgetUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<LayoutWidgetTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LayoutWidgetTable>? orderBy,
    _is.OrderByListBuilder<LayoutWidgetTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<LayoutWidget>(
      columnValues: columnValues(LayoutWidget.t.updateTable),
      where: where(LayoutWidget.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LayoutWidget.t),
      orderByList: orderByList?.call(LayoutWidget.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [LayoutWidget]s in the list and returns the deleted rows.
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
  Future<List<LayoutWidget>> delete(
    _is.DatabaseSession session,
    List<LayoutWidget> rows, {
    _is.OrderByBuilder<LayoutWidgetTable>? orderBy,
    _is.OrderByListBuilder<LayoutWidgetTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<LayoutWidget>(
      rows,
      orderBy: orderBy?.call(LayoutWidget.t),
      orderByList: orderByList?.call(LayoutWidget.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [LayoutWidget].
  Future<LayoutWidget> deleteRow(
    _is.DatabaseSession session,
    LayoutWidget row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LayoutWidget>(
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
  Future<List<LayoutWidget>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LayoutWidgetTable> where,
    _is.OrderByBuilder<LayoutWidgetTable>? orderBy,
    _is.OrderByListBuilder<LayoutWidgetTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<LayoutWidget>(
      where: where(LayoutWidget.t),
      orderBy: orderBy?.call(LayoutWidget.t),
      orderByList: orderByList?.call(LayoutWidget.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LayoutWidgetTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<LayoutWidget>(
      where: where?.call(LayoutWidget.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [LayoutWidget] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LayoutWidgetTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<LayoutWidget>(
      where: where(LayoutWidget.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

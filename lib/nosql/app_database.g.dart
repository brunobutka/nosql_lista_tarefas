// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TarefaDao? _tarefaDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Tarefa` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `disciplina` TEXT NOT NULL, `nome` TEXT NOT NULL, `data` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TarefaDao get tarefaDao {
    return _tarefaDaoInstance ??= _$TarefaDao(database, changeListener);
  }
}

class _$TarefaDao extends TarefaDao {
  _$TarefaDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _tarefaInsertionAdapter = InsertionAdapter(
            database,
            'Tarefa',
            (Tarefa item) => <String, Object?>{
                  'id': item.id,
                  'disciplina': item.disciplina,
                  'nome': item.nome,
                  'data': item.data
                },
            changeListener),
        _tarefaDeletionAdapter = DeletionAdapter(
            database,
            'Tarefa',
            ['id'],
            (Tarefa item) => <String, Object?>{
                  'id': item.id,
                  'disciplina': item.disciplina,
                  'nome': item.nome,
                  'data': item.data
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Tarefa> _tarefaInsertionAdapter;

  final DeletionAdapter<Tarefa> _tarefaDeletionAdapter;

  @override
  Future<List<Tarefa>> findAllTarefa() async {
    return _queryAdapter.queryList('SELECT * FROM Tarefa',
        mapper: (Map<String, Object?> row) => Tarefa(
            id: row['id'] as int?,
            disciplina: row['disciplina'] as String,
            nome: row['nome'] as String,
            data: row['data'] as String));
  }

  @override
  Stream<Tarefa?> findTarefaById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Tarefa WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Tarefa(
            id: row['id'] as int?,
            disciplina: row['disciplina'] as String,
            nome: row['nome'] as String,
            data: row['data'] as String),
        arguments: [id],
        queryableName: 'Tarefa',
        isView: false);
  }

  @override
  Future<void> insertTarefa(Tarefa tarefa) async {
    await _tarefaInsertionAdapter.insert(tarefa, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTarefa(Tarefa tarefa) async {
    await _tarefaDeletionAdapter.delete(tarefa);
  }
}

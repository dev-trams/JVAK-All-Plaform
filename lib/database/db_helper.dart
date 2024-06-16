import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instence = DBHelper._();
  static Database? _database;
  DBHelper._();

  factory DBHelper() => _instence;

  //데이터베이스 인스턴스를 가져오는 메드
  Future<Database> get database async {
    if (_database != null) {
      //인스턴스가 이미 존재하다면
      return _database!; // 저장된 데터베이스 인스턴스를 반환
    }
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbFath = await getDatabasesPath();
    final path = join(dbFath, 'jvak.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE bookMarkTbl (id INTEGER PRIMARY KEY, state INTEGER NOT NULL) ');
      },
    );
  }

  // 데이터 추가 메소드
  Future<void> insertData(int state) async {
    final db = await database; // 데이터베이스 인스턴스 가져오기
    await db.insert(
      'bookMarkTbl', // 데이터를 추가할 테이블 이름
      {
        'state': state,
      }, // 추가할 데이터
      conflictAlgorithm: ConflictAlgorithm.replace, // 중복 데이터 처리 방법 설정
    );
  }

  // 데이터 조회 메소드
  Future<List<Map<String, dynamic>>> selectData() async {
    final db = await database; // 데이터베이스 인스턴스 가져오기
    return await db.query('bookMarkTbl'); // 데이터베이스에서 모든 데이터 조회
  }

  // 데이터 수정 메소드
  Future<void> updateData(int id, int state) async {
    final db = await database; // 데이터베이스 인스턴스 가져오기
    await db.update(
      'bookMarkTbl', // 수정할 테이블 이름
      {
        'state': state,
      }, // 수정할 데이터
      where: 'id = ?', // 수정할 데이터의 조건 설정
      whereArgs: [id], // 수정할 데이터의 조건 값
    );
  }

  // 데이터 삭제 메소드
  Future<void> deleteData(int id) async {
    final db = await database; // 데이터베이스 인스턴스 가져오기
    await db.delete(
      'bookMarkTbl', // 삭제할 테이블 이름
      where: 'id = ?', // 삭제할 데이터의 조건 설정
      whereArgs: [id], // 삭제할 데이터의 조건 값
    );
  }
}

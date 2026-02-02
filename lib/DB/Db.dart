// DatabaseHelper.dart - Singleton pattern
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;
  bool _isInitialized = false;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'task_app.db');
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    _isInitialized = true;
    print('Database initialized successfully');
    return db;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        phone TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        created_at TEXT DEFAULT (datetime('now','localtime'))
      )
    ''');
    print('Users table created');
  }

  // Ensure database is ready before operations
  Future<void> ensureInitialized() async {
    if (!_isInitialized) {
      await database;
    }
  }

  // Check if user exists (for login)
  Future<bool> checkUserExists(String phone, String password) async {
    await ensureInitialized();
    final db = await database;
    
    try {
      List<Map> result = await db.query(
        'users',
        where: 'phone = ? AND password = ?',
        whereArgs: [phone, password],
      );
      
      print('Login check: Found ${result.length} users with phone: $phone');
      return result.isNotEmpty;
    } catch (e) {
      print('Error checking user: $e');
      return false;
    }
  }

  // Register new user
  Future<bool> registerUser(String phone, String password) async {
    await ensureInitialized();
    final db = await database;
    
    try {
      // Check if user already exists
      List<Map> existingUsers = await db.query(
        'users',
        where: 'phone = ?',
        whereArgs: [phone],
      );
      
      if (existingUsers.isNotEmpty) {
        print('User already exists: $phone');
        return false;
      }

      // Insert new user
      int id = await db.insert(
        'users',
        {
          'phone': phone,
          'password': password,
        },
      );
      
      print('User registered successfully. ID: $id, Phone: $phone');
      
      // Verify the user was inserted
      List<Map> verify = await db.query(
        'users',
        where: 'phone = ?',
        whereArgs: [phone],
      );
      
      return verify.isNotEmpty;
    } catch (e) {
      print('Registration error: $e');
      return false;
    }
  }

  // Get all users (for debugging)
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    await ensureInitialized();
    final db = await database;
    return await db.query('users');
  }
}
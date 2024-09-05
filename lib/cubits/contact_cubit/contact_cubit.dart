import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  static ContactCubit get(context) => BlocProvider.of(context);

  final String _contactTableName = 'contacts';
  final String _contactColumnFirstName = 'firstName';
  final String _contactColumnLastName = 'lastName';
  final String _contactColumnImage = 'image';
  final String _contactColumnCompanyName = 'company';
  final String _contactColumnNumPhone = 'number';
  final String _contactColumnLabelPhone = 'label_phone';
  final String _contactColumnEmail = 'email';
  final String _contactColumnSignificantDate = 'significant_date';
  final String _contactColumnLabelSignificant = 'label_significant';
  final String _contactColumnAddress = 'address';
  final String _contactColumnNotes = 'notes';

  var firstNameTextController = TextEditingController();
  var lastNameTextController = TextEditingController();
  String imagePath='assets/images/male.jpeg' ;
  var companyTextController = TextEditingController();
  var phoneNumberTextController = TextEditingController();
  String labelPhone ='';
  var emailTextController = TextEditingController();
  var significantTextController = TextEditingController();
  var labelSignificantTextController = TextEditingController();
  var addressTextController = TextEditingController();
  var notesTextController = TextEditingController();

  Database? _database;

  // for i can initial database one
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDatabase();
    return _database!;
  }

  // Initialize the database and create the table
  _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'data.db');

    _database ??= await openDatabase(
      path,
      version: 1,
      onCreate: _onCreateDatabase,
    );
    return _database!;
  }

  void _onCreateDatabase(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE $_contactTableName 
             (id INTEGER PRIMARY KEY,
              $_contactColumnFirstName TEXT,
              $_contactColumnLastName TEXT,
              $_contactColumnImage BLOB,
              $_contactColumnCompanyName TEXT,
              $_contactColumnNumPhone TEXT,
              $_contactColumnLabelPhone TEXT,
              $_contactColumnEmail TEXT,
              $_contactColumnSignificantDate TEXT,
              $_contactColumnLabelSignificant TEXT,
              $_contactColumnAddress TEXT,
              $_contactColumnNotes TEXT
               )''',
    );
  }

  List<Map> contactsList = [];

  // Fetch all contacts from the database
  getData() async {
    Database? myDb = await database;
    await myDb.query(_contactTableName).then((value) {
      contactsList = value;
      print('contacts list  $contactsList');
      emit(GetAllNumbersSuccessState());
    }).catchError((onError) {
      emit(GetAllNumbersErrorState());
      print(onError.toString());
    });
  }

  insertData() async {
    Database? myDb = await database;
    await myDb.insert(_contactTableName, {
      _contactColumnImage: imagePath,
      _contactColumnFirstName: firstNameTextController.text ?? '',
      _contactColumnLastName: lastNameTextController.text ?? '',
      _contactColumnCompanyName: companyTextController.text ?? '',
      _contactColumnNumPhone: phoneNumberTextController.text ?? '',
      _contactColumnLabelPhone: labelPhone ?? '',
      _contactColumnEmail: emailTextController.text ?? '',
      _contactColumnSignificantDate: significantTextController.text ?? '',
      _contactColumnLabelSignificant: labelSignificantTextController.text ?? '',
      _contactColumnAddress: addressTextController.text ?? '',
      _contactColumnNotes: notesTextController.text ?? '',
    }).then((value) async{
      await getData(); // للحصول على البيانات الجديدة
      emit(AddContactSuccessState());
    }).catchError((onError) {
      emit(AddContactErrorState());
      print(onError.toString());
    });
  }


// removeData(id) async {
//   var databasesPath = await getDatabasesPath();
//   String path = join(databasesPath, 'goals.db');
//   Database database = await openDatabase(path);
//
//   await database
//       .rawDelete('DELETE FROM Goals WHERE id = ?', ['$id']).then((value) {
//     emit(RemoveDataSuccessState());
//   }).catchError((onError) {
//     emit(RemoveDataErrorState());
//     print(onError.toString());
//   });
// }
//
// updateData({required int id, required String name}) async {
//   var databasesPath = await getDatabasesPath();
//   String path = join(databasesPath, 'goals.db');
//   Database database = await openDatabase(path);
//   await database
//       .update('Goals', {'name': name}, where: 'id == $id')
//       .then((value) {
//     emit(RemoveDataSuccessState());
//   }).catchError((onError) {
//     emit(RemoveDataErrorState());
//     print(onError.toString());
//   });
// }
}

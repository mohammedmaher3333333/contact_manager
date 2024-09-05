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
  final String _contactColumnID = 'id';
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
  String imagePath = 'assets/images/male.jpeg';

  var companyTextController = TextEditingController();
  var phoneNumberTextController = TextEditingController();
  String labelPhone = '';
  var emailTextController = TextEditingController();
  var significantTextController = TextEditingController();
  var labelSignificant = '';
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
             ($_contactColumnID INTEGER PRIMARY KEY,
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
      _contactColumnLabelSignificant: labelSignificant ?? '',
      _contactColumnAddress: addressTextController.text ?? '',
      _contactColumnNotes: notesTextController.text ?? '',
    }).then((value) async {
      getData();
      emit(AddContactSuccessState());
    }).catchError((onError) {
      emit(AddContactErrorState());
      print(onError.toString());
    });
  }

  removeData(id) async {
    var myDb = await database;
    await myDb
        .delete(_contactTableName, where: '$id == $_contactColumnID')
        .then((value) {
      emit(RemoveNumbersState());
    }).catchError((onError) {
      emit(RemoveNumbersErrorState());
      print(onError.toString());
    });
  }

  updateData({required int id, required String name}) async {
    var myDb = await database;
    await myDb
        .update(
            _contactTableName,
            {
              _contactColumnFirstName: name,
            },
            where: 'id == $id')
        .then((value) {
      emit(UpdateNumbersState());
    }).catchError((onError) {
      emit(UpdateNumbersErrorState());
      print(onError.toString());
    });
  }

///////////// label phone
  int? selectedValuePhone = 2;

  // لائحة العناصر
  final List<DropdownMenuItem<int>> dropdownItemsPhone = const [
    DropdownMenuItem(value: 1, child: Text('No Label')),
    DropdownMenuItem(value: 2, child: Text('Mobile')),
    DropdownMenuItem(value: 3, child: Text('Work')),
    DropdownMenuItem(value: 4, child: Text('Home')),
    DropdownMenuItem(value: 5, child: Text('Main')),
    DropdownMenuItem(value: 6, child: Text('Work Fax')),
    DropdownMenuItem(value: 7, child: Text('Home Fax')),
    DropdownMenuItem(value: 8, child: Text('Pager')),
    DropdownMenuItem(value: 9, child: Text('Other')),
    DropdownMenuItem(value: 10, child: Text('Custom')),
  ];

  onChangLabelPhone({required context, required value}) {
    selectedValuePhone = value;

    ContactCubit.get(context).labelPhone = (dropdownItemsPhone
            .firstWhere((item) => item.value == selectedValuePhone)
            .child as Text)
        .data!;
    emit(ChoseLabelPhoneState());
  }

  ///////////// label Significant
  int? selectedValueSignificant = 2;

  // لائحة العناصر
  final List<DropdownMenuItem<int>> dropdownItemsSignificant = const [
    DropdownMenuItem(value: 1, child: Text('No Label')),
    DropdownMenuItem(value: 2, child: Text('Birthday')),
    DropdownMenuItem(value: 3, child: Text('Anniversary')),
    DropdownMenuItem(value: 4, child: Text('Other')),
    DropdownMenuItem(value: 5, child: Text('Custom')),
  ];

  onChangLabelSignificant({required context, required value}) {
    selectedValueSignificant = value;
    ContactCubit.get(context).labelSignificant = (dropdownItemsSignificant
            .firstWhere((item) => item.value == selectedValueSignificant)
            .child as Text)
        .data!;
    emit(ChoseLabelSignificantState());
  }
}

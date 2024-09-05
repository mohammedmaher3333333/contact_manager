class ContactModel {
  String firstName;
  String? lastName;
  String phoneNumber;
  String? email;
  String? company;
  String? labelPhone;
  DateTime? significantDate;
  String? labelSignificant;

  ContactModel({
    required this.firstName,
    this.lastName,
    required this.phoneNumber,
    this.email,
    this.company,
    this.labelPhone,
    this.significantDate,
    this.labelSignificant,
  });

// // Convert a Contact object to a Map (for JSON or Database storage)
// Map<String, dynamic> toMap() {
//   return {
//     'firstName': firstName,
//     'lastName': lastName,
//     'phoneNumber': phoneNumber,
//     'email': email,
//     'company': company,
//     'label': label,
//     'significantDate': significantDate?.toIso8601String(),
//   };
// }
//
// // Create a Contact object from a Map (for JSON or Database retrieval)
// factory ContactModel.fromMap(Map<String, dynamic> map) {
//   return ContactModel(
//     firstName: map['firstName'],
//     lastName: map['lastName'],
//     phoneNumber: map['phoneNumber'],
//     email: map['email'],
//     company: map['company'],
//     label: map['label'],
//     significantDate: map['significantDate'] != null
//         ? DateTime.parse(map['significantDate'])
//         : null,
//   );
// }
//
// @override
// String toString() {
//   return 'Contact(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, email: $email, company: $company, label: $label, significantDate: $significantDate)';
// }
}

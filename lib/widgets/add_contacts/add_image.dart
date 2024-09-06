// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:contact_manager/cubits/contact_cubit/contact_cubit.dart';
//
// class AddImage extends StatelessWidget {
//   const AddImage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ContactCubit, ContactState>(
//       listener: (context, state) {
//         // يمكن إضافة هنا أي إجراءات بناءً على الحالة
//       },
//       builder: (context, state) {
//         var contactCubit = ContactCubit.get(context);
//
//         // تحقق من إذا كان contactCubit.imagePath يحتوي على بيانات مشفرة
//         ImageProvider imageProvider;
//         if (contactCubit.imagePath != null && contactCubit.imagePath!.startsWith('data:image/')) {
//           // إذا كانت الصورة مشفرة، حولها إلى ImageProvider
//           imageProvider = MemoryImage(base64Decode(contactCubit.imagePath!.split(',').last));
//         } else {
//           // استخدم الصورة من المسار إذا لم تكن مشفرة
//           imageProvider = AssetImage('assets/images/male.jpeg');
//         }
//
//         return InkWell(
//           onTap: contactCubit.onPressChoseImage,
//           child: Column(
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: imageProvider,
//               ),
//               // يمكنك إضافة المزيد من العناصر هنا إذا لزم الأمر
//             ],
//           ),
//         );
//       },
//     );
//   }
// }




// bloc
////// add image
// final ImagePicker _picker = ImagePicker();
// File? imageFile; // تخزين الصورة المختارة
//
// // دالة لاختيار الصورة
// void addPhoto() async {
//   XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//   if (image != null && await File(image.path).exists()) {
//     imageFile = File(image.path);
//     final imageBytes = await imageFile!.readAsBytes();
//     imagePath = base64Encode(imageBytes); // تحويل الصورة إلى base64
//     emit(ChoseImageFromPhoneState());
//   } else {
//     imagePath = 'assets/images/male.jpeg'; // تعيين الصورة الافتراضية
//     emit(ChoseImageFromPhoneState());
//   }
// }
//
//
// void onPressChoseImage() {
//   addPhoto();
//   emit(OnPressChoseImageState());
// }

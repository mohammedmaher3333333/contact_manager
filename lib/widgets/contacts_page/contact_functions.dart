import 'package:url_launcher/url_launcher.dart';

final String phoneNumber = '+201000261713'; // ضع هنا رقم الهاتف الذي تريد الاتصال به
final String message = 'مرحبًا! هذا نص الرسالة.'; // ضع هنا نص الرسالة التي تريد إرسالها

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> _sendSms(String phoneNumber, String message) async {
  final Uri smsUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
    queryParameters: <String, String>{
      'body': message,
    },
  );
  await launchUrl(smsUri);
}


// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// ElevatedButton(
// onPressed: () => _makePhoneCall(phoneNumber),
// child: Text('اتصل الآن'),
// ),
// SizedBox(height: 20),
// ElevatedButton(
// onPressed: () => _sendSms(phoneNumber, message),
// child: Text('إرسال رسالة نصية'),
// ),
// ],
// ),
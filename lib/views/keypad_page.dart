import 'package:flutter/material.dart';

class KeypadPage extends StatefulWidget {
  const KeypadPage({super.key});

  @override
  _KeypadPageState createState() => _KeypadPageState();
}

class _KeypadPageState extends State<KeypadPage> {
  final TextEditingController _controller = TextEditingController();

  // دالة لإضافة الرقم إلى خانة الإدخال
  void _onKeyTapped(String value) {
    setState(() {
      _controller.text += value;
    });
  }

  // دالة لإجراء الاتصال (Placeholder)
  void _makeCall() {
    String number = _controller.text;
    if (number.isNotEmpty) {
      print('Calling $number...');
      // هنا يمكنك إضافة وظيفة الاتصال الحقيقية حسب الاحتياج
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Number Input'),
      ),
      body: Stack(
        children: [
          // عنصر Positioned لوضع الشكل في منتصف الشاشة السفلي
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // خانة إدخال الأرقام
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.none,
                    // تعطيل لوحة المفاتيح الافتراضية
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Numbers',
                    ),
                  ),
                  const SizedBox(height: 10),
                  // لوحة مفاتيح مخصصة
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // عدد الأزرار في كل صف
                      childAspectRatio: 2,
                    ),
                    itemCount: 12, // الأرقام من 0 إلى 9 مع أزرار إضافية
                    itemBuilder: (context, index) {
                      String keyLabel;
                      if (index < 9) {
                        keyLabel = '${index + 1}';
                      } else if (index == 9) {
                        keyLabel = 'Clear'; // زر حذف
                      } else if (index == 10) {
                        keyLabel = '0'; // الرقم 0
                      } else {
                        keyLabel = 'Del'; // زر مسح آخر رقم
                      }

                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (keyLabel == 'Clear') {
                              setState(() {
                                _controller.clear();
                              });
                            } else if (keyLabel == 'Del') {
                              setState(() {
                                if (_controller.text.isNotEmpty) {
                                  _controller.text = _controller.text.substring(
                                      0, _controller.text.length - 1);
                                }
                              });
                            } else {
                              _onKeyTapped(keyLabel);
                            }
                          },
                          child: Text(
                            keyLabel,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // زر الاتصال في الأسفل في المنتصف
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      onPressed: _makeCall, // دالة الاتصال
                      icon: const Icon(Icons.phone),
                      label: const Text('Call'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


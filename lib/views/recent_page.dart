import 'package:contact_manager/cubits/contact_cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {},
      builder: (context, state) {
        var contactCubit = ContactCubit.get(context);

        // استدعاء استرجاع البيانات الحديثة إذا لم يتم استرجاعها مسبقًا
        if (contactCubit.contactsListRecent.isEmpty) {
          contactCubit.getDataRecent();
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    var contact = contactCubit.contactsListRecent[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(contact['image'] ?? 'assets/images/male.jpeg'),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${contact['firstName']} ${contact['lastName']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                contact['number'] ?? 'No number',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              // اضف هنا كود الاتصال
                            },
                            icon: const Icon(
                              Icons.phone_forwarded_outlined,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // اضف هنا كود إرسال رسالة
                            },
                            icon: const Icon(
                              Icons.sms_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: contactCubit.contactsListRecent.length, // عدد جهات الاتصال الحديثة
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

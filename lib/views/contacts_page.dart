import 'package:contact_manager/cubits/contact_cubit/contact_cubit.dart';
import 'package:contact_manager/widgets/contacts_page/contact_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var contactCubit = ContactCubit.get(context);
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
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onLongPress: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading:
                                        const Icon(Icons.delete, color: Colors.red),
                                    title: const Text('Delete'),
                                    onTap: () {
                                      contactCubit.removeData(contactCubit
                                          .contactsList[index]['id']);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  // يمكنك إضافة عناصر أخرى هنا إذا لزم الأمر
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(contactCubit.imagePath),
                          ),
                          Column(
                            children: [
                              Text(
                                contactCubit.contactsList[index]['firstName'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(contactCubit.contactsList[index]['number']
                                  .toString()),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              makePhoneCall(
                                  phoneNumber: contactCubit.contactsList[index]
                                      ['number']);
                            },
                            icon: const Icon(
                              Icons.phone_forwarded_outlined,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              sendSms(
                                phoneNumber: contactCubit.contactsList[index]
                                    ['number'],
                              );
                            },
                            icon: const Icon(
                              Icons.sms_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: contactCubit.contactsList.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

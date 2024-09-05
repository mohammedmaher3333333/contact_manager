import 'package:contact_manager/cubits/contact_cubit/contact_cubit.dart';
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
              ////hide user name

              // const ListTile(
              //   leading: CircleAvatar(
              //     radius: 30,
              //     backgroundImage: AssetImage('assets/images/male.jpeg'),
              //   ),
              //   title: Text(
              //     "Mohammed Maher",
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //   ),
              //   subtitle: Text(
              //     '213 contacts',
              //     style: TextStyle(
              //       fontSize: 16,
              //     ),
              //   ),
              //   trailing: Icon(Icons.sms_rounded),
              //   dense: true, // تقليل المسافات بين العناصر الرأسية
              // ),
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
                    child: Row(
                      children: [
                         CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage(contactCubit.imagePath),
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
                            Text(contactCubit.contactsList[index]['number'].toString()),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.phone_forwarded_outlined,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.sms_outlined,
                            color: Colors.blue,
                          ),
                        ),
                      ],
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

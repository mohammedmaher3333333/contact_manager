import 'package:contact_manager/cubits/contact_cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContactPage extends StatelessWidget {
  const AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Text(
                      'Create contact',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        ContactCubit.get(context).insertData();
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              'assets/images/male.jpeg'),
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            'Add Picture',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            hintText: 'First name',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            hintText: 'Last name',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.home_work_outlined),
                            border: OutlineInputBorder(),
                            hintText: 'Company',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                            hintText: 'Phone',
                          ),
                        ),
                        const SizedBox(height: 10),

                        Container(
                          margin: const EdgeInsets.only(left: 40, right: 150),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: DropdownButton<int>(
                            isExpanded: true,
                            value: 1,
                            items: const [
                              DropdownMenuItem(value: 1, child: Text('data1')),
                              DropdownMenuItem(value: 2, child: Text('data2')),
                              DropdownMenuItem(value: 3, child: Text('data3')),
                              DropdownMenuItem(value: 4, child: Text('data4')),
                              DropdownMenuItem(value: 5, child: Text('data5')),
                            ],
                            onChanged: (value) {},
                          ),
                        ),

                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.date_range_outlined),
                            border: OutlineInputBorder(),
                            hintText: 'Significant date',
                          ),
                        ),
                        const SizedBox(height: 10),

                        Container(
                          margin: const EdgeInsets.only(left: 40, right: 150),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: DropdownButton<int>(
                            isExpanded: true,
                            value: 1,
                            items: const [
                              DropdownMenuItem(value: 1, child: Text('data1')),
                              DropdownMenuItem(value: 2, child: Text('data2')),
                              DropdownMenuItem(value: 3, child: Text('data3')),
                              DropdownMenuItem(value: 4, child: Text('data4')),
                              DropdownMenuItem(value: 5, child: Text('data5')),
                            ],
                            onChanged: (value) {},
                          ),
                        ),

                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.location_on_outlined),
                            border: OutlineInputBorder(),
                            hintText: 'Address',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.note_outlined),
                            border: OutlineInputBorder(),
                            hintText: 'Notes',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

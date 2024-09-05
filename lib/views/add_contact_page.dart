import 'package:contact_manager/cubits/contact_cubit/contact_cubit.dart';
import 'package:contact_manager/widgets/add_contacts/text_form_field.dart';
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
        var contactCubit = ContactCubit.get(context);
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        contactCubit.insertData();
                        print("Add new item");
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
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(contactCubit.imagePath),
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
                        buildTextFormField(
                          controller: contactCubit.firstNameTextController,
                          keyboardType: TextInputType.name,
                          icon: Icons.person,
                          hint: 'First name',
                        ),
                        const SizedBox(height: 10),
                        buildTextFormField(
                          controller: contactCubit.lastNameTextController,
                          keyboardType: TextInputType.name,
                          icon: Icons.person,
                          hint: 'Last name',
                        ),
                        const SizedBox(height: 10),
                        buildTextFormField(
                          controller: contactCubit.companyTextController,
                          keyboardType: null,
                          icon: Icons.home_work_outlined,
                          hint: 'Company',
                        ),
                        const SizedBox(height: 10),
                        buildTextFormField(
                          controller: contactCubit.phoneNumberTextController,
                          keyboardType: TextInputType.phone,
                          icon: Icons.phone,
                          hint: 'Phone',
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
                            value: contactCubit.selectedValuePhone,
                            items: contactCubit.dropdownItemsPhone,
                            onChanged: (value) {
                              contactCubit.onChangLabelPhone(
                                context: context,
                                value: value,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        buildTextFormField(
                          controller: contactCubit.emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email_outlined,
                          hint: 'Email',
                        ),
                        const SizedBox(height: 10),
                        buildTextFormField(
                          controller: contactCubit.significantTextController,
                          icon: Icons.date_range_outlined,
                          hint: 'Significant date',
                          keyboardType: TextInputType.datetime,
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
                            value: contactCubit.selectedValueSignificant,
                            items: contactCubit.dropdownItemsSignificant,
                            onChanged: (value) {
                              contactCubit.onChangLabelSignificant(
                                context: context,
                                value: value,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        buildTextFormField(
                          controller: contactCubit.addressTextController,
                          icon: Icons.location_on_outlined,
                          hint: 'Address',
                          keyboardType: null,
                        ),
                        const SizedBox(height: 10),
                        buildTextFormField(
                          controller: contactCubit.notesTextController,
                          icon: Icons.note_outlined,
                          hint: 'Notes',
                          keyboardType: null,
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

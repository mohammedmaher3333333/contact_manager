import 'package:contact_manager/cubits/contact_cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drop_down_state.dart';

class DropDownCubit extends Cubit<DropDownState> {
  DropDownCubit() : super(DropDownInitial());

  static DropDownCubit get(context) => BlocProvider.of(context);

  int? selectedValue = 2;

  // لائحة العناصر
  final List<DropdownMenuItem<int>> dropdownItems = const [
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

  onChangLabel({required context, required value}) {
    selectedValue = value;

    ContactCubit.get(context).labelPhone = (dropdownItems
            .firstWhere((item) => item.value == selectedValue)
            .child as Text)
        .data!;
    emit(ChoseItemState());
  }
}

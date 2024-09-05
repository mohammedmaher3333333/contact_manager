import 'package:contact_manager/cubits/navigation_bar/navigation_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial(0));

  void selectIndex(int index) {
    emit(NavigationUpdated(index));
  }
}

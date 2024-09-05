import 'package:contact_manager/cubits/navigation_bar/navigation_bar_cubit.dart';
import 'package:contact_manager/cubits/navigation_bar/navigation_bar_state.dart';
import 'package:contact_manager/views/add_contact_page.dart';
import 'package:contact_manager/views/contacts_page.dart';
import 'package:contact_manager/views/favorite_page.dart';
import 'package:contact_manager/views/keypad_page.dart';
import 'package:contact_manager/views/recent_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            int selectedIndex =
                (state is NavigationUpdated) ? state.selectedIndex : 1;

            return IndexedStack(
              index: selectedIndex,
              children: const <Widget>[
                RecentPage(),
                ContactsPage(),
                AddContactPage(),
                FavoritePage(),
                KeypadPage(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          int selectedIndex =
              (state is NavigationUpdated) ? state.selectedIndex : 1;

          return BottomNavigationBar(
            backgroundColor: Colors.red,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_outlined),
                label: 'Recent',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add, size: 32),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.keyboard_rounded),
                label: 'Keypad',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            iconSize: 32,

            onTap: (index) {
              context.read<NavigationCubit>().selectIndex(index);
            },
            unselectedItemColor: Colors.grey,
          );
        },
      ),
    );
  }
}

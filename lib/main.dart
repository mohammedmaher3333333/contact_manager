import 'package:contact_manager/cubits/contact_cubit/contact_cubit.dart';
import 'package:contact_manager/cubits/drop_down_cubit/drop_down_cubit.dart';
import 'package:contact_manager/cubits/navigation_bar/navigation_bar_cubit.dart';
import 'package:contact_manager/routes/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(
            create: (context) => NavigationCubit(),
          ),
          BlocProvider<ContactCubit>(
            create: (context) => ContactCubit()..getData(),
          ),
          BlocProvider<DropDownCubit>(
            create: (context) => DropDownCubit(),
          ),
        ],
        child: const MaterialApp(
          home: MainView(),
        ),
      ),
    );
  }
}

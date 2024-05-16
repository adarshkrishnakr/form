

import 'package:flutter/material.dart';
import 'package:project1/model/formModel.dart';
import 'package:project1/provider/formProvider.dart';
import 'package:project1/screens/homeScreen.dart';
import 'package:project1/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:project1/provider/formData.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Hive.registerAdapter(FormModelAdapter());
  await Hive.openBox('formDataBox');
 
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>FormProvider()),
        ChangeNotifierProvider(create: (context)=>FormData())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
    );
  
  }
}
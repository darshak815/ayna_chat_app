import 'package:ayna_chat_app/model/chat_model.dart';
import 'package:ayna_chat_app/route/app_pages.dart';
import 'package:ayna_chat_app/screen/home/bloc/home_cubit.dart';
import 'package:ayna_chat_app/screen/splash/bloc/splash_cubit.dart';
import 'package:ayna_chat_app/utils/app_theme/app_style.dart';
import 'package:ayna_chat_app/utils/hive_manage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:oktoast/oktoast.dart';

import 'firebase_options.dart';
import 'model/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    var documentDirectory = await getApplicationSupportDirectory();
    Hive.init(documentDirectory.path);
  }
  Hive.registerAdapter(ChatModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  await HiveManage.instance.hiveBoxName();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (BuildContext context) => SplashCubit()),
        BlocProvider<HomeCubit>(create: (BuildContext context) => HomeCubit()),
      ],
      child: OKToast(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          initialRoute: AppPages.initial,
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}

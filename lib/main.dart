import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/prefs_handler/prefs_handler.dart';
import 'package:islami_c14_offline_sun/islami_app.dart';
import 'package:islami_c14_offline_sun/provider/islami_view_model.dart';
import 'package:provider/provider.dart';

import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await PrefsHandler.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => IslamiViewModel(),),
  ],

      child: const IslamiApp()));
}



import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screen/ui/base_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.init(allowFontScaling: true);

  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('id', 'ID'), Locale('en', 'US')],
    path: 'resources/langs',
    assetLoader: JsonAssetLoader(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      title: 'Mangabuzz',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins-Regular',
          primaryColor: Color(0xFF906ef8)),
      home: BaseScreen(),
    );
  }
}

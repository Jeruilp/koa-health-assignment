import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:koa_health_assignment/src/presentation/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => ThoughtBloc())
      ],
      child: MaterialApp(
        localizationsDelegates: [ 
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
           const Locale('es', 'ES'),
         ],
        debugShowCheckedModeBanner: false,
        title: 'KoaHealth',
        initialRoute: 'thoughts',
        routes: {
         'thoughts'       : (_) => ThoughtPage(),
         'thoughts_detail': (_) => ThoughtDetailPage()
        },
        theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            color: Colors.pink.withOpacity(0.7)
          )
        ),
      )
    );


  }
}

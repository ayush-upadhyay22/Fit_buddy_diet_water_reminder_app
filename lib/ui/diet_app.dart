import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waterreminder/bloc/diet_bloc.dart';
import 'package:waterreminder/domain/repository/diet_repository.dart';
import 'package:waterreminder/ui/home/diet_home_page.dart';
import 'package:waterreminder/ui/theme/app_theme.dart';

class DietApp extends StatefulWidget {
  @override
  _DietAppState createState() => _DietAppState();
}

class _DietAppState extends State<DietApp> {
  final _repository = DietRepository();

  @override
  void initState() {
    super.initState();
    _repository.subscribeToDataStore();
  }

  @override
  void dispose() {
    _repository.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DietBloc(_repository),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Water Reminder',
        theme: AppTheme.light,
        home: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: DietHomePage(),
        ),
      ),
    );
  }
}

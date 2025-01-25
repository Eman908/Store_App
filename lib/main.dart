import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/bloc/bloc_observer.dart';
import 'package:store_app/core/cash/cash.dart';
import 'package:store_app/run_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  CashToken.init();

  runApp(const MyApp());
}

import 'package:bloc/bloc.dart';
import 'package:expence_tracker/app.dart';
import 'package:expence_tracker/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyABBZE_j0bLv8ca-Va4_wvK8aaT4t1uJ1o",
      authDomain: "expense-tracker-169ae.firebaseapp.com",
      projectId: "expense-tracker-169ae",
      storageBucket: "expense-tracker-169ae.appspot.com",
      messagingSenderId: "709802703456",
      appId: "1:709802703456:web:e53e54e63211415dbea105",
    ),
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

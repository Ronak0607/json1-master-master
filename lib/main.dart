
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:json/screen/View/ViewScreen.dart';
import 'package:json/screen/userProvider/UserProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => screenView()
        },
      ),
    )
  );
}

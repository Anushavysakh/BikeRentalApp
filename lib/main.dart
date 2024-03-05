import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_bike/list_screen.dart';
import 'package:rent_a_bike/services/accessory_service.dart';
import 'package:rent_a_bike/services/bike_service.dart';
import 'package:rent_a_bike/screens/bike_info_screen.dart';
import 'package:rent_a_bike/screens/checkout_page.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BikeService>(
          create: (context) => BikeService(),
        ),
        ChangeNotifierProvider<AccessoryService>(
          create: (context) => AccessoryService(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: GoogleFonts.roboto.toString(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
        routes: {
          '/bikeInfo': (context) =>  BikeInfoScreen(),
          '/checkout': (context) =>  CheckoutPage(),
        },
      ),
    );
  }
}

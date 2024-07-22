import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kampus_haven/models/listing.dart';
import 'package:kampus_haven/services/listing_adapter.dart';
import 'package:kampus_haven/pages/landing_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

late Box<Listing> favoritesBox;

void main() async {
  await Hive.initFlutter();
  await dotenv.load(fileName: ".env");
  Hive.registerAdapter(ListingAdapter());
  favoritesBox = await Hive.openBox<Listing>('favorites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

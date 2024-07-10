import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kampus_haven/models/listing.dart';
import 'package:kampus_haven/pages/home_page.dart';
import 'package:kampus_haven/widgets/hostel_display.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Box<Listing> _favoritesBox;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    // Close the box if already open
    await Hive.close();
    // Open the favorites box
    _favoritesBox = await Hive.openBox<Listing>('favorites');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Listings'),
      ),
      body: _favoritesBox.isOpen
          ? GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 16 / 10,
              ),
              itemCount: _favoritesBox.length,
              itemBuilder: (context, index) {
                final listing = _favoritesBox.getAt(index);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ListingDetailPage(listing: listing),
                      ),
                    );
                  },
                  child: HostelDisplay(listing: listing!),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kampus_haven/models/listing.dart';
import 'package:kampus_haven/pages/listing_detail_page.dart';
import 'package:kampus_haven/widgets/hostel_display.dart';
import 'package:kampus_haven/main.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Listing> favoriteListings = favoritesBox.values.toList().cast<Listing>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF18191B),
        title: const Text(
          'Favorite Listings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),
      body: favoriteListings.isNotEmpty
          ? GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: favoriteListings.length,
              itemBuilder: (context, index) {
                final listing = favoriteListings[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListingDetailPage(listing: listing),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      HostelDisplay(listing: listing),
                      const SizedBox(height: 10),
                      Text(
                        listing.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'No favorites yet.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
    );
  }
}

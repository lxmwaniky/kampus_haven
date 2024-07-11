import 'package:flutter/material.dart';
import 'package:kampus_haven/main.dart';
import 'package:kampus_haven/models/listing.dart';
import 'package:kampus_haven/widgets/hostel_display_full.dart';

class ListingDetailPage extends StatelessWidget {
  final Listing listing;
  const ListingDetailPage({super.key, required this.listing});

  void _addToFavorites() {
    if (!favoritesBox.values.contains(listing)) {
      favoritesBox.put(listing.id, listing);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18191B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF18191B),
        title: Text(
          listing.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: _addToFavorites,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: HostelDisplayFull(listing: listing),
      ),
    );
  }
}

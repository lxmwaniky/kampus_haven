import 'package:flutter/material.dart';
import 'package:kampus_haven/models/listing.dart';

class HostelDisplay extends StatelessWidget {
  final Listing listing;
  const HostelDisplay({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            listing.photos.isNotEmpty
                ? listing.photos.first
                : 'https://via.placeholder.com/150',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

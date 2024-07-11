import 'package:flutter/material.dart';
import 'package:kampus_haven/models/listing.dart';

class HostelDisplay extends StatelessWidget {
  final Listing listing;

  const HostelDisplay({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              listing.photos.first,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 5.0,
          left: 10.0,
          right: 10.0,
          child: Container(
            color: Colors.black54,
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  listing.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

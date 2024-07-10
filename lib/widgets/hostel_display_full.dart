import 'package:flutter/material.dart';
import 'package:kampus_haven/models/listing.dart';

class HostelDisplayFull extends StatelessWidget {
  final Listing listing;
  const HostelDisplayFull({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF222429),
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listing.photos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      listing.photos[index],
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listing.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${listing.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Location: ${listing.location}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  listing.vacant ? 'Available' : 'Occupied',
                  style: TextStyle(
                    fontSize: 16,
                    color: listing.vacant ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Contact: ${listing.contact}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Distance from School: ${listing.distanceFromSchool} km',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Description: ${listing.description}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Amenities:',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8.0,
                  children: listing.amenities
                      .map((amenity) => Chip(
                            label: Text(amenity),
                            backgroundColor: Colors.lightBlue[200],
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Listing {
  final String id;
  final String name;
  final String price;
  final String location;
  final bool vacant;
  final List<String> photos;
  final List<String> amenities;
  final String contact;
  final String type;
  final double distanceFromSchool;
  final String description;

  Listing({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.vacant,
    required this.photos,
    required this.amenities,
    required this.contact,
    required this.type,
    required this.distanceFromSchool,
    required this.description,
  });

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      location: json['location'],
      vacant: json['vacant'],
      photos: List<String>.from(json['photos']),
      amenities: List<String>.from(json['amenities']),
      contact: json['Contact'],
      type: json['type'],
      distanceFromSchool: json['distanceFromSchool'].toDouble(),
      description: json['description'],
    );
  }
}

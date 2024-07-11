import 'package:hive/hive.dart';
import 'package:kampus_haven/models/listing.dart';

class ListingAdapter extends TypeAdapter<Listing> {
  @override
  final typeId = 0;

  @override
  Listing read(BinaryReader reader) {
    return Listing(
      id: reader.readString(),
      name: reader.readString(),
      price: reader.readString(),
      location: reader.readString(),
      vacant: reader.readBool(),
      photos: reader.readList().cast<String>(),
      amenities: reader.readList().cast<String>(),
      contact: reader.readString(),
      type: reader.readString(),
      distanceFromSchool: reader.readDouble(),
      description: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Listing obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.price);
    writer.writeString(obj.location);
    writer.writeBool(obj.vacant);
    writer.writeList(obj.photos);
    writer.writeList(obj.amenities);
    writer.writeString(obj.contact);
    writer.writeString(obj.type);
    writer.writeDouble(obj.distanceFromSchool);
    writer.writeString(obj.description);
  }
}

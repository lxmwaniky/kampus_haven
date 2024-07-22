import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/listing.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static String baseUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';

  static Future<List<Listing>> fetchListings() async {
    final response = await http.get(Uri.parse('$baseUrl/listings'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((listing) => Listing.fromJson(listing)).toList();
    } else {
      throw Exception('Failed to load listings');
    }
  }
}

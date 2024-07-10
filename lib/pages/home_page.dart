  import 'package:flutter/material.dart';
  import 'package:kampus_haven/models/listing.dart';
  import 'package:kampus_haven/services/api_service.dart';
  import 'package:kampus_haven/widgets/hostel_display.dart';

  class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    _HomePageState createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    late Future<List<Listing>> _listingsFuture;

    @override
    void initState() {
      super.initState();
      _listingsFuture = ApiService.fetchListings();
    }

    Future<void> _refreshListings() async {
      setState(() {
        _listingsFuture = ApiService.fetchListings();
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(0xFF18191B),
        appBar: AppBar(
          backgroundColor: const Color(0xFF18191B),
          title: const Text(
            'Kampus Haven',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          titleSpacing: 30,
        ),
        body: RefreshIndicator(
          onRefresh: _refreshListings,
          child: FutureBuilder<List<Listing>>(
            future: _listingsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                List<Listing> listings = snapshot.data!;
                return ListView.builder(
                  itemCount: listings.length,
                  itemBuilder: (context, index) {
                    return HostelDisplay(listing: listings[index]);
                  },
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ),
      );
    }
  }

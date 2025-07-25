import 'package:flutter/material.dart';

class SearchTrips extends StatelessWidget {
  const SearchTrips({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Trips')),
      body: const Center(child: Text('Trip cards appear here')),
    );
  }
}

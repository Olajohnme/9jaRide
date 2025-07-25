import 'package:flutter/material.dart';
import 'post_trip_screen.dart';

class DriverDashboard extends StatelessWidget {
  const DriverDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver Dashboard')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const PostTripScreen())),
        label: const Text('Post Ride'),
        icon: const Icon(Icons.add),
      ),
      body: const Center(child: Text('List of trips goes here')),
    );
  }
}

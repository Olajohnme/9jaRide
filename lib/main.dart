import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'driver/driver_dashboard.dart';
import 'passenger/search_trips.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_ANON_KEY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '9jaRide',
      theme: ThemeData(colorSchemeSeed: const Color(0xFF00A876), useMaterial3: true),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Supabase.instance.client.auth.onAuthStateChange.map((e) => e.session?.user),
      builder: (_, snap) {
        if (!snap.hasData) return const Center(child: Text('Login placeholder'));
        return snap.data!.userMetadata?['role'] == 'driver'
            ? const DriverDashboard()
            : const SearchTrips();
      },
    );
  }
}

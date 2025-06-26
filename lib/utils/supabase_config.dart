import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://rcuzqeuyurxcfabzqasa.supabase.co',
      anonKey: 'eyJhb6c101JIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3Mi01J',
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}

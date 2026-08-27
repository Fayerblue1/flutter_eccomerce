import 'package:flutter_riverpod/legacy.dart';

//Menggantikan [_currentIndex] + setState di main page
final selectedNavIndexProvider = StateProvider<int>((ref) => 0);
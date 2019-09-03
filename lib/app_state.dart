
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  AppState();

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    _isFetching = false;
    notifyListeners();
  }
}
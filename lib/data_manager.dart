import 'package:flutter/material.dart';

class DataManager {
  // Singleton instance
  static final DataManager _instance = DataManager._internal();
  factory DataManager() => _instance;
  DataManager._internal();

  // Shared data
  List<Map<String, dynamic>> modules = [];
  List<String> notifications = []; // 🔹 Added this line

  // Listeners for update
  final List<VoidCallback> _listeners = [];

  void addModule(Map<String, dynamic> module) {
    modules.add(module);
    addNotification("New course added: ${module['title']}"); // 🔹 Add notification
    _notifyListeners();
  }

  // 🔹 Add notification message
  void addNotification(String message) {
    notifications.add(message);
    _notifyListeners();
  }

  void registerListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void unregisterListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }
}

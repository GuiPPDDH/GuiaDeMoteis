import 'package:flutter/material.dart';
import 'package:my_guia_de_moteis/models/motel.dart';
import 'package:my_guia_de_moteis/services/motel_service.dart';

class MotelProvider extends ChangeNotifier {
  final MotelService motelService;
  List<Motel> _moteis = [];
  bool _isLoading = false;
  String? _errorMessage;

  MotelProvider({required this.motelService});

  List<Motel> get moteis => _moteis;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadMoteis() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _moteis = await motelService.fetchMoteis();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

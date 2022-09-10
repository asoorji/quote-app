import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_app/models/quote_model.dart';
import 'package:quote_app/repository/quote_repository.dart';

class QuoteViewModel extends ChangeNotifier {
  QuoteViewModel() {
    getQuotes();
  }
  QuoteRepository quoteRepository = QuoteRepository();
  bool loading = false;
  bool error = false;
  bool success = false;

  late QuoteModel quote;

  Future<void> getQuotes() async {
    loading = true;
    notifyListeners();
    try {
      final res = await quoteRepository.getQuote();
      quote = res[0];
      loading = false;
      notifyListeners();
    } catch (e) {
      error = true;
      loading = false;
      notifyListeners();
    }
  }
}

final quoteProvider = ChangeNotifierProvider<QuoteViewModel>((ref) {
  return QuoteViewModel();
});

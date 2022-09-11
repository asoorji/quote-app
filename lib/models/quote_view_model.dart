import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_app/models/quote_model.dart';
import 'package:quote_app/repository/quote_repository.dart';

var index = 0;
// var len =

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
      quote = res[index];
      loading = false;
      notifyListeners();
      // print('The length is${res.length}');
      if (index != res.length) {
        index++;
      } else {
        index = 0;
      }
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

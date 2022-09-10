import 'package:quote_app/models/quote_model.dart';
import 'package:quote_app/services/quote_apiservice.dart';

class QuoteRepository {
  QuoteService quoteService = QuoteService();

  Future<List<QuoteModel>> getQuote() async {
    final quotes = await quoteService.getQuotes();
    return quotes;
  }
}

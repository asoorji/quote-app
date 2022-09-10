import 'dart:convert';

List<QuoteModel> quoteModelFromJson(List<dynamic> str) =>
    List<QuoteModel>.from(str.map((x) => QuoteModel.fromJson(x)));

String quoteModelToJson(List<QuoteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuoteModel {
  QuoteModel({
    required this.id,
    required this.createdAt,
    required this.quote,
    required this.author,
  });

  int id;
  int createdAt;
  String quote;
  String author;

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["id"],
        createdAt: json["created_at"],
        quote: json["quote"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "quote": quote,
        "author": author,
      };
}

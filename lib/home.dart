import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quote_app/models/quote_view_model.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final quoteViewModel = ref.watch(quoteProvider);
    return Scaffold(
        backgroundColor: Colors.purple,
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(30),
                height: height,
                width: width,
                child: quoteViewModel.loading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.purple[800],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "\"",
                            style: GoogleFonts.aclonica(
                                color: Colors.white, fontSize: 80),
                          ),
                          Text(
                            quoteViewModel.quote.quote,
                            style: GoogleFonts.playfairDisplay(
                                color: Colors.white, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "- ${quoteViewModel.quote.author}",
                            style: GoogleFonts.playfairDisplay(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox.fromSize(
                                size: const Size(
                                    56, 56), // button width and height
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor:
                                          Colors.purple, // splash color
                                      onTap: () {
                                        quoteViewModel.getQuotes();
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.refresh,
                                            color: Color(0xFF004e92),
                                          ), // text
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ))));
  }
}

import 'package:flutter/material.dart';
import 'package:geminiapp/geminiInstance.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble({super.key, required this.input});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();

  final String input;
}

class _ChatBubbleState extends State<ChatBubble> {
  String result = '';

  final gemini = newGemini().gemini;
  @override
  Widget build(BuildContext context) {
    return
//
// GeminiResponseTypeView(
//   builder: (context, child, response, loading) {

//     if (loading) {
//       /// show loading animation or use CircularProgressIndicator();
//       return const CircularProgressIndicator()
//     }

//     /// The runtimeType of response is String?
//     if (response != null) {
//       return Markdown(
//         data: response,
//         selectable: true,
//       );
//     } else {

//       /// idle state
//       return const Center(child: Text('Search something!'));
//     }
//   },
// );

        FutureBuilder(
            future: gemini.generateFromText(widget.input),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                final String response = snapshot.data!.text;
                print(response);
                return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Text(response, style: GoogleFonts.lato()));
              }
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(child: Text('Search something!'));
              } else {
                return const Center(
                    child: Text('You have not searched for something'));
              }
            });
  }
}

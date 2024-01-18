import 'package:flutter/material.dart';
import 'package:geminiapp/bubble.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  String input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("Gemini Codelab"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChatBubble(input: input),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Ask Gemini anything?',
                  hintStyle: GoogleFonts.lato(),
                  border: const OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          input = _controller.text;
                        });
                        _controller.clear();
                      },
                      child: const Icon(
                        Icons.send_rounded,
                      ))),
            ),
          )
        ],
      ),
    );
  }
}

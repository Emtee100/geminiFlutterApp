import 'package:flutter/material.dart';
import 'package:geminiapp/bubble.dart';
import 'package:geminiapp/geminiInstance.dart';

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

// String response ='';
// //   // function that interacts with the gemini API
//   getResponseFromGemini(String input){
//     final gemini = newGemini().gemini;
//     gemini.generateFromText(input).then((value) {
//       print(value.text);
//       response = value.text;
//       _controller.clear();
//     }).catchError((error){
//       print(error);
//     });
//     return response;
//   }
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
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          input = _controller.text;
                        });
                        _controller.clear();
                      },
                      child: Icon(
                        Icons.send_rounded,
                      ))),
            ),
          )
        ],
      ),
    );
  }
}

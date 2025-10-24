import 'package:flutter/material.dart';

class TextStylePage extends StatefulWidget {
  const TextStylePage({super.key});

  @override
  State<TextStylePage> createState() => _TextStyleState();
}

class _TextStyleState extends State<TextStylePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("44. TextStyle")),
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: <Widget>[
              const Text(
                'No, we need bold strokes. We need this plan.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                "Welcome to the present, we're running a real nation.",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 4,
              ),
              RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                    TextSpan(
                      text: "You don't have the votes. \n",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.6)),
                    ),
                    TextSpan(
                      text: "You don't have the votes. \n",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                    TextSpan(
                      text:
                          "You're gonna need congressional approval and you don't have the votes!\n",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Colors.black.withOpacity(1.0)),
                    ),
                  ])),
              SizedBox(
                height: 4,
              ),
              Text(
                "These are wise words, enterprising men quote 'em.",
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 0.5)
                    .copyWith(decoration: TextDecoration.none),
              ),
              const Text(
                'Ladies and gentlemen, you coulda been anywhere in the world tonight, but you’re here with us in New York City.',
                style: TextStyle(height: 5, fontSize: 10),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                  text: const TextSpan(
                      text: "Dont't tax the South",
                      children: <TextSpan>[
                    TextSpan(
                        text: 'cuz',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.wavy,
                        )),
                    TextSpan(
                      text: "We got it made in the shade",
                    )
                  ])),
              SizedBox(
                height: 4,
              ),
              Stack(
                children: <Widget>[
                  Text(
                    "Greetings, planet!",
                    style: TextStyle(
                        fontSize: 50,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.blue[700]!),
                  ),
                  Text("Greetings, planet!",
                      style: TextStyle(fontSize: 50, color: Colors.grey[300])),
                ],
              )
            ],
          )),
    );
  }
}

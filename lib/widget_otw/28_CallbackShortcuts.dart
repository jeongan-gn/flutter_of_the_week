import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CallbackShortcutsPage extends StatefulWidget {
  const CallbackShortcutsPage({super.key});

  @override
  State<CallbackShortcutsPage> createState() => _CallbackShortcutsState();
}

class _CallbackShortcutsState extends State<CallbackShortcutsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("28. CallbackShortcuts")),
      body: const Center(
        child: CallbackShortcutsExample(),
      ),
    );
  }
}

class CallbackShortcutsExample extends StatefulWidget {
  const CallbackShortcutsExample({super.key});

  @override
  State<CallbackShortcutsExample> createState() =>
      _CallbackShortcutExampleState();
}

class _CallbackShortcutExampleState extends State<CallbackShortcutsExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
        bindings: <ShortcutActivator, VoidCallback>{
          const SingleActivator(LogicalKeyboardKey.arrowUp): () {
            setState(() => count = count + 1);
          },
          const SingleActivator(LogicalKeyboardKey.arrowDown): () {
            setState(() => count = count - 1);
          },
        },
        child: Focus(
            autofocus: true,
            child: Column(
              children: <Widget>[
                const Text('Press the up arrow key to add to the counter'),
                const Text(
                    'Press the down arrow key to subtract from the counter'),
                Text('count: $count'),
              ],
            )));
  }
}

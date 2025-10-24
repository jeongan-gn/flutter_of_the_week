import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShortcutsPage extends StatefulWidget {
  const ShortcutsPage({super.key});

  @override
  State<ShortcutsPage> createState() => _ShortcutsState();
}

class _ShortcutsState extends State<ShortcutsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("42. Shortcuts")),
      body: const Center(child: ShortcutsExample()),
    );
  }
}

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class DecrementIntent extends Intent {
  const DecrementIntent();
}

class ShortcutsExample extends StatefulWidget {
  const ShortcutsExample({super.key});

  @override
  State<ShortcutsExample> createState() => _ShortcutsExampleState();
}

class _ShortcutsExampleState extends State<ShortcutsExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.arrowUp): IncrementIntent(),
        SingleActivator(LogicalKeyboardKey.arrowDown): DecrementIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          IncrementIntent: CallbackAction<IncrementIntent>(
            onInvoke: (IncrementIntent intent) => setState(() {
              count = count + 1;
            }),
          ),
          DecrementIntent: CallbackAction<DecrementIntent>(
            onInvoke: (DecrementIntent intent) => setState(() {
              count = count - 1;
            }),
          )
        },
        child: Focus(
          autofocus: true,
          child: Column(
            children: <Widget>[
              const Text('Add to the counter by pressing the up arrow key'),
              const Text('Substract from the counter by arrow key'),
              Text('count: $count')
            ],
          ),
        ),
      ),
    );
  }
}

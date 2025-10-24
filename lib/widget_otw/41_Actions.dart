import 'package:flutter/material.dart';

class ActionsPage extends StatefulWidget {
  const ActionsPage({super.key});

  @override
  State<ActionsPage> createState() => _ActionsState();
}

class _ActionsState extends State<ActionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("41. Actions")),
      body: const Center(child: ActionsExample()),
    );
  }
}

class Model {
  final ValueNotifier<bool> isDirty = ValueNotifier<bool>(false);
  final ValueNotifier<int> data = ValueNotifier<int>(0);

  int save() {
    if (isDirty.value) {
      debugPrint('Saved Data: ${data.value}');
      isDirty.value = false;
    }
    return data.value;
  }

  void setValue(int newValue) {
    isDirty.value = data.value != newValue;
    data.value = newValue;
  }

  void dispose() {
    isDirty.dispose();
    data.dispose();
  }
}

class ModifyIntent extends Intent {
  const ModifyIntent(this.value);
  final int value; // 수정할 값을 전달
}

class ModifyAction extends Action<ModifyIntent> {
  ModifyAction(this.model);
  final Model model;

  @override
  void invoke(covariant ModifyIntent intent) {
    model.setValue(intent.value); // Intent에서 값 추출 -> model에 save
  }
}

class SaveIntent extends Intent {
  const SaveIntent();
}

class SaveAction extends Action<SaveIntent> {
  SaveAction(this.model);
  final Model model;

  @override
  int invoke(covariant SaveIntent intent) => model.save();
}

class SaveButton extends StatefulWidget {
  const SaveButton(this.valueNotifier, {super.key});
  final ValueNotifier<bool> valueNotifier;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  int _savedValue = 0;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget.valueNotifier,
        builder: (BuildContext context, Widget? child) {
          return TextButton.icon(
            icon: const Icon(Icons.save),
            label: Text('$_savedValue'),
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll<Color>(
                widget.valueNotifier.value ? Colors.red : Colors.green,
              ),
            ),
            onPressed: () {
              setState(() {
                _savedValue =
                    Actions.invoke(context, const SaveIntent())! as int;
              });
            },
          );
        });
  }
}

class ActionsExample extends StatefulWidget {
  const ActionsExample({super.key});

  @override
  State<ActionsExample> createState() => _ActionsExampleState();
}

class _ActionsExampleState extends State<ActionsExample> {
  final Model _model = Model();
  int _count = 0;

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        ModifyIntent: ModifyAction(_model),
        SaveIntent: SaveAction(_model),
      },
      child: Builder(builder: (BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.exposure_plus_1),
                  onPressed: () {
                    Actions.invoke(context, ModifyIntent(++_count));
                  },
                ),
                ListenableBuilder(
                    listenable: _model.data,
                    builder: (BuildContext context, Widget? child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Value: ${_model.data.value}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      );
                    }),
                IconButton(
                  icon: const Icon(Icons.exposure_minus_1),
                  onPressed: () {
                    Actions.invoke(context, ModifyIntent(--_count));
                  },
                )
              ],
            ),
            SaveButton(_model.isDirty),
            const Spacer(),
          ],
        );
      }),
    );
  }
}


/*
static T? invoke<T extends Intent>(
  BuildContext context,
  T intent,
)

- context : Actions 위젯을 찾기 위한 BuildContext
- intent : 실행할 Intent 인스턴스
- 반환값: Action의 invoke() 반환한 값 (nullable)
*/
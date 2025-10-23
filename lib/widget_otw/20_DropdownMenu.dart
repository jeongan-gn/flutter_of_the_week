import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

typedef ColorEntry = DropdownMenuEntry<ColorLabel>;
typedef IconEntry = DropdownMenuEntry<IconLabel>;

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  orange('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;

  static final List<ColorEntry> entries = UnmodifiableListView<ColorEntry>(
    values.map<ColorEntry>(
      (ColorLabel color) => ColorEntry(
        value: color,
        label: color.label,
        enabled: color.label != 'Grey',
        style: MenuItemButton.styleFrom(foregroundColor: color.color),
      ),
    ),
  );
}

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud('Cloud', Icons.cloud_outlined),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;

  static final List<IconEntry> entries = UnmodifiableListView<IconEntry>(
      values.map<IconEntry>((IconLabel icon) => IconEntry(
          value: icon, label: icon.label, leadingIcon: Icon(icon.icon))));
}

class DropdownMenuPage extends StatefulWidget {
  const DropdownMenuPage({super.key});

  @override
  State<DropdownMenuPage> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenuPage> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();

  ColorLabel? selectedColor;
  IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("20. DropdownMenu")),
      backgroundColor: selectedColor?.color,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownMenu<ColorLabel>(
                    initialSelection: ColorLabel.green,
                    controller: colorController,
                    requestFocusOnTap: true,
                    label: const Text('Color'),
                    onSelected: (ColorLabel? color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    dropdownMenuEntries: ColorLabel.entries,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  DropdownMenu<IconLabel>(
                    controller: iconController,
                    enableFilter: true,
                    requestFocusOnTap: true,
                    leadingIcon: const Icon(Icons.search),
                    label: const Text('Icon'),
                    inputDecorationTheme: const InputDecorationTheme(
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    ),
                    onSelected: (IconLabel? icon) {
                      setState(() {
                        selectedIcon = icon;
                      });
                    },
                    dropdownMenuEntries: IconLabel.entries,
                  )
                ],
              ),
            ),
          ),
          if (selectedColor != null && selectedIcon != null)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(
                            'You selected a ${selectedColor?.label} ${selectedIcon?.label}'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            selectedIcon?.icon,
                            color: selectedColor?.color,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          else
            const Text('Please select a color and icon.'),
        ],
      )),
    );
  }
}

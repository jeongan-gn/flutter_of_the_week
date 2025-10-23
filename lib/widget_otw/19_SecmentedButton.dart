import 'package:flutter/material.dart';

class SecmentedButtonPage extends StatefulWidget {
  const SecmentedButtonPage({super.key});

  @override
  State<SecmentedButtonPage> createState() => _SecmentedButtonState();
}

class _SecmentedButtonState extends State<SecmentedButtonPage> {
  Calendar calendarView = Calendar.day;
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("19. SegmentedButton")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Text('Single choice'),
            SingleChoice(
              calendarView: calendarView,
              onChanged: (Calendar newValue) {
                setState(() {
                  calendarView = newValue;
                });
              },
            ),
            Text("Single: ${calendarView.name}",
                style: TextStyle(color: Colors.blue)),
            SizedBox(
              height: 20,
            ),
            Text('Multible choice'),
            MultipleChoice(
                selection: selection,
                onChanged: (Set<Sizes> newValue) {
                  setState(() {
                    selection = newValue;
                  });
                }),
            Text("Multiple: ${selection.map((item) => item.name).toList()}",
                style: TextStyle(color: Colors.blue)),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatelessWidget {
  final Calendar calendarView;
  final ValueChanged<Calendar> onChanged;

  const SingleChoice({
    super.key,
    required this.calendarView,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: Text('Day'),
          icon: Icon(Icons.calendar_view_day),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.week,
          label: Text('Week'),
          icon: Icon(Icons.calendar_view_week),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.month,
          label: Text('Month'),
          icon: Icon(Icons.calendar_view_month),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.year,
          label: Text('Year'),
          icon: Icon(Icons.calendar_today),
        ),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newValue) {
        onChanged(newValue.first);
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatelessWidget {
  final Set<Sizes> selection;
  final ValueChanged<Set<Sizes>> onChanged;

  const MultipleChoice({
    super.key,
    required this.selection,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(value: Sizes.large, label: Text('L')),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newValue) {
        onChanged(newValue);
      },
      multiSelectionEnabled: true,
    );
  }
}

import 'package:flutter/material.dart';
import 'widget_otw/1_CupertinoRadio.dart';
import 'widget_otw/2_CupertinoSheetRoute.dart';
import 'widget_otw/3_CupertinoSlidingSegmentControl.dart';
import 'widget_otw/4_CupertinoCheckbox.dart';
import 'widget_otw/5_CupertinoSwitch.dart';
import 'widget_otw/6_CarouselView.dart';
import 'widget_otw/7_SearchBar_SearchAnchor.dart';
import 'widget_otw/8_Video_player.dart';
import 'widget_otw/9_MediaQuery_propertyOf.dart';
import 'widget_otw/10_UnmodifiableListView.dart';
import 'widget_otw/11_Uint8List.dart';
import 'widget_otw/19_SecmentedButton.dart';
import 'widget_otw/20_DropdownMenu.dart';
import 'widget_otw/21_OverlayPortal.dart';
import 'widget_otw/28_CallbackShortcuts.dart';
import 'widget_otw/29_Draggable.dart';
import 'widget_otw/34_RawMagnifier.dart';
import 'widget_otw/38_NavigationBar.dart';
import 'widget_otw/39_FutureBuilder.dart';
import 'widget_otw/41_Actions.dart';
import 'widget_otw/42_Shortcuts.dart';
import 'widget_otw/43_Focus.dart';
import 'widget_otw/44_TextStyle.dart';
import 'widget_otw/46_LinearGradient.dart';
import 'widget_otw/47_Autocomplete.dart';
import 'widget_otw/48_NavigationRail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget of the Week',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WidgetListPage(),
    );
  }
}

// DataSource 모델 클래스
class WidgetItem {
  final int number;
  final String name;
  final Widget Function() pageBuilder;

  WidgetItem({
    required this.number,
    required this.name,
    required this.pageBuilder,
  });

  String get displayTitle => '$number.$name';
}

class WidgetListPage extends StatefulWidget {
  const WidgetListPage({super.key});

  @override
  State<WidgetListPage> createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> {
  // DataSource: 배운 위젯 목록
  final List<WidgetItem> _widgetItems = [
    WidgetItem(
      number: 1,
      name: 'CupertinoRadio',
      pageBuilder: () => const CupertinoRadioPage(),
    ),
    WidgetItem(
      number: 2,
      name: 'CupertinoSheetRoute',
      pageBuilder: () => const CupertinoSheetRoutePage(),
    ),
    WidgetItem(
      number: 3,
      name: 'CupertinoSlidingSegmentControl',
      pageBuilder: () => const CupertinoSlidingSegmentedControlPage(),
    ),
    WidgetItem(
      number: 4,
      name: 'CupertinoCheckboxPage',
      pageBuilder: () => const CupertinoCheckboxPage(),
    ),
    WidgetItem(
      number: 5,
      name: 'CupertinoSwitch',
      pageBuilder: () => const CupertinoSwitchPage(),
    ),
    WidgetItem(
      number: 6,
      name: 'CarouseViewState',
      pageBuilder: () => const CarouselViewPage(),
    ),
    WidgetItem(
      number: 7,
      name: 'SearchBar & SearchAnchor',
      pageBuilder: () => const SearchBarAndAnchorPage(),
    ),
    WidgetItem(
      number: 8,
      name: 'VideoPlayer',
      pageBuilder: () => const VideoPlayerPage(),
    ),
    WidgetItem(
      number: 9,
      name: 'MediaQueryProperty',
      pageBuilder: () => const MediaQueryPropertyOfPage(),
    ),
    WidgetItem(
      number: 10,
      name: 'UnmodifiableListView',
      pageBuilder: () => const UnmodifiableListViewPage(),
    ),
    WidgetItem(
      number: 11,
      name: 'Uint8List',
      pageBuilder: () => const Uint8ListPage(),
    ),
    WidgetItem(
      number: 19,
      name: 'SegmentedButton',
      pageBuilder: () => const SecmentedButtonPage(),
    ),
    WidgetItem(
      number: 20,
      name: 'DropdownMenu',
      pageBuilder: () => const DropdownMenuPage(),
    ),
    WidgetItem(
      number: 21,
      name: 'OverlayPortal',
      pageBuilder: () => const OverlayPortalPage(),
    ),
    WidgetItem(
      number: 28,
      name: 'CallbackShortcuts',
      pageBuilder: () => const CallbackShortcutsPage(),
    ),
    WidgetItem(
      number: 29,
      name: 'Draggable',
      pageBuilder: () => const DraggablePage(),
    ),
    WidgetItem(
      number: 34,
      name: 'RawMagnifier',
      pageBuilder: () => const RawMagnifierPage(),
    ),
    WidgetItem(
      number: 38,
      name: 'NavigationBar',
      pageBuilder: () => const NavigationBarPage(),
    ),
    WidgetItem(
      number: 39,
      name: 'FutureBuilder',
      pageBuilder: () => const FutureBuilderPage(
        title: "39. FutureBuilder",
      ),
    ),
    WidgetItem(
      number: 41,
      name: 'Actions',
      pageBuilder: () => const ActionsPage(),
    ),
    WidgetItem(
      number: 42,
      name: 'Shortcuts',
      pageBuilder: () => const ShortcutsPage(),
    ),
    WidgetItem(
      number: 43,
      name: 'Focus',
      pageBuilder: () => const FocusPage(),
    ),
    WidgetItem(
      number: 44,
      name: 'TextStyle',
      pageBuilder: () => const TextStylePage(),
    ),
    WidgetItem(
      number: 46,
      name: 'LinearGradient',
      pageBuilder: () => const LinearGradientPage(),
    ),
    WidgetItem(
      number: 47,
      name: 'Autocomplete',
      pageBuilder: () => const AutocompletePage(),
    ),
    WidgetItem(
      number: 48,
      name: 'NavigationRail',
      pageBuilder: () => const NavigationRailPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Widget of the Week'),
      ),
      body: ListView.builder(
        itemCount: _widgetItems.length,
        itemBuilder: (context, index) {
          final item = _widgetItems[index];
          return ListTile(
            // 왼쪽에 번호 표시
            leading: CircleAvatar(
              child: Text('${item.number}'),
            ),
            // 위젯 이름
            title: Text(item.name),
            // 오른쪽 화살표 아이콘
            trailing: const Icon(Icons.chevron_right),
            // Cell 클릭 시 해당 페이지로 이동
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => item.pageBuilder(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

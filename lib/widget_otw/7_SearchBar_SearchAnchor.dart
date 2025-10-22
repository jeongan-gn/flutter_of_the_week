import 'package:flutter/material.dart';

class SearchBarAndAnchorPage extends StatefulWidget {
  const SearchBarAndAnchorPage({super.key});

  @override
  State<SearchBarAndAnchorPage> createState() => _SearchBarAndAnchorState();
}

class _SearchBarAndAnchorState extends State<SearchBarAndAnchorPage> {
  String _inputText = "";

  final SearchController controller = SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('7. SearchBar & Anchor'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchAnchor(
              builder: (context, controller) {
                return SearchBar(
                  controller: controller,
                  leading: const Icon(Icons.search),
                  hintText: 'enter the query',
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  shadowColor: WidgetStateProperty.all(Colors.white),
                  elevation: WidgetStateProperty.all(8.0),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onChanged: (query) {
                    setState(() {
                      _inputText = query;
                    });
                  },
                  onSubmitted: (query) {
                    setState(() {
                      _inputText = query;
                    });
                    if (controller.isOpen) {
                      FocusScope.of(context).unfocus();
                      controller.closeView(query);
                    }
                    print('{$query} submitted');
                  },
                  onTap: () {
                    controller.openView();
                  },
                );
              },
              suggestionsBuilder: (context, controller) {
                return [
                  ListTile(
                    title: Text("$_inputText"),
                    onTap: () {
                      setState(() {
                        controller.closeView("$_inputText");
                      });
                    },
                  ),
                ];
              },
            ),
            Text("Query: $_inputText")
          ],
        ));
  }
}

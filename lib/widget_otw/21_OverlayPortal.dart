import 'package:flutter/material.dart';

class OverlayPortalPage extends StatefulWidget {
  const OverlayPortalPage({super.key});
  @override
  State<OverlayPortalPage> createState() => _OverlayPortalState();
}

class _OverlayPortalState extends State<OverlayPortalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("21. OverlayPortal")),
      body: const Center(
        child: ClickableTooltipWidget(),
      ),
    );
  }
}

class ClickableTooltipWidget extends StatefulWidget {
  const ClickableTooltipWidget({super.key});

  @override
  State<ClickableTooltipWidget> createState() => _ClickableTooltipWidgetState();
}

class _ClickableTooltipWidgetState extends State<ClickableTooltipWidget> {
  final OverlayPortalController _tooltipController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _tooltipController.toggle,
      child: DefaultTextStyle(
          style: DefaultTextStyle.of(context).style.copyWith(fontSize: 30),
          child: OverlayPortal(
            controller: _tooltipController,
            overlayChildBuilder: (BuildContext context) {
              return const Positioned(
                right: 50,
                bottom: 50,
                child: ColoredBox(
                    color: Colors.amberAccent, child: Text('tooltip')),
              );
            },
            child: const Text('Press to show/hide tooltip'),
          )),
    );
  }
}

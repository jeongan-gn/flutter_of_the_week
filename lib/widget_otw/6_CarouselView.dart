import 'package:flutter/material.dart';

// PageViewController or CollectionView 와 유사 . 가로 스크롤

class CarouselViewPage extends StatefulWidget {
  const CarouselViewPage({super.key});

  @override
  State<CarouselViewPage> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselViewPage> {
  late final CarouselController _controller;

  LayoutType _selectedLayout = LayoutType.uncontained;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = CarouselController(initialItem: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("6. CarouselView"),
        actions: [
          PopupMenuButton<LayoutType>(
            icon: const Icon(Icons.view_carousel),
            onSelected: (LayoutType type) {
              setState(() {
                _selectedLayout = type;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: LayoutType.uncontained,
                child: Text('Uncontained'),
              ),
              const PopupMenuItem(
                value: LayoutType.hero,
                child: Text('hero'),
              ),
              const PopupMenuItem(
                value: LayoutType.multiBrowse,
                child: Text('multiBrowse'),
              ),
              const PopupMenuItem(
                value: LayoutType.fullScreen,
                child: Text('fullScreen'),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'layoutType: ${_selectedLayout.displayName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 320,
            child: _buildCarousel(),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    const int itemCount = 10;

    switch (_selectedLayout) {
      case LayoutType.uncontained:
        return CarouselView(
          controller: _controller,
          itemExtent: 300,
          onTap: _handleItemTap,
          children: List.generate(itemCount, (index) {
            return _buildCarouselItem(index);
          }),
        );

      case LayoutType.hero:
        return CarouselView(
          controller: _controller,
          itemExtent: 350,
          onTap: _handleItemTap,
          children: List.generate(itemCount, (index) {
            return _buildCarouselItem(index);
          }),
        );

      case LayoutType.multiBrowse:
        return CarouselView(
          controller: _controller,
          itemExtent: 250,
          onTap: _handleItemTap,
          children: List.generate(itemCount, (index) {
            return _buildCarouselItem(index);
          }),
        );

      case LayoutType.fullScreen:
        return CarouselView(
          controller: _controller,
          itemExtent: 300,
          onTap: _handleItemTap,
          children: List.generate(itemCount, (index) {
            return _buildCarouselItem(index, isFullScreen: true);
          }),
        );
    }
  }

  Widget _buildCarouselItem(int index, {bool isFullScreen = false}) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
          color: colors[index % colors.length],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
              offset: const Offset(0, 4),
            )
          ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              size: isFullScreen ? 80 : 40,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              'Iten $index',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isFullScreen ? 24 : 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              _selectedLayout.displayName,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: isFullScreen ? 14 : 12,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Item $index tapped'),
      duration: const Duration(milliseconds: 500),
    ));
  }
}

enum LayoutType {
  uncontained,
  hero,
  multiBrowse,
  fullScreen;

  String get displayName {
    switch (this) {
      case LayoutType.uncontained:
        return 'Uncontained (기본)';
      case LayoutType.hero:
        return 'Hero (큰+작은)';
      case LayoutType.multiBrowse:
        return 'Multi-browse (큰+중+작)';
      case LayoutType.fullScreen:
        return 'Full-screen (전체화면)';
    }
  }
}

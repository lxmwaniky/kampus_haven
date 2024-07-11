import 'package:flutter/material.dart';

class ImageViewerPage extends StatefulWidget {
  final List<String> photos;
  final int initialIndex;

  const ImageViewerPage({super.key, required this.photos, required this.initialIndex});

  @override
  _ImageViewerPageState createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  void _onHorizontalDrag(DragUpdateDetails details) {
    if (details.primaryDelta! < 0 || details.primaryDelta! > 0) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragUpdate: _onHorizontalDrag,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.photos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Center(
                child: Image.network(widget.photos[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

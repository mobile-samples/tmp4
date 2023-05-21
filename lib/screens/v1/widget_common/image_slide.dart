import 'dart:async';

import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.imageUrls});
  final List<String> imageUrls;
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;
  PageController pageController = PageController();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (pageController.page == widget.imageUrls.length - 1) {
        pageController.hasClients ? pageController.jumpToPage(0) : null;
      } else if (pageController.page == pageController.page?.roundToDouble()) {
        pageController.hasClients
            ? pageController.nextPage(
                duration: const Duration(milliseconds: 500), curve: Curves.ease)
            : null;
      }
    });
  }

  stopTimer() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Listener(
          onPointerDown: (_) => stopTimer(),
          onPointerUp: (_) => startTimer(),
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.imageUrls[index]))));
            },
            itemCount: widget.imageUrls.length,
          ),
        ),
        Positioned(
          bottom: 2,
          left: MediaQuery.of(context).size.width / 2.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildDots(),
          ),
        )
      ],
    );
  }

  List<Widget> buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < widget.imageUrls.length; ++i) {
      dots.add(i == currentIndex ? activeDot() : inactiveDot());
    }
    return dots;
  }

  Widget activeDot() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      ),
    );
  }

  Widget inactiveDot() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 6,
        height: 6,
        decoration:
            const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      ),
    );
  }
}

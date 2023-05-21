import 'package:flutter/material.dart';

class HeaderProfileFuncWidget extends StatefulWidget {
  const HeaderProfileFuncWidget({super.key});

  @override
  State<HeaderProfileFuncWidget> createState() =>
      _HeaderProfileFuncWidgetState();
}

class _HeaderProfileFuncWidgetState extends State<HeaderProfileFuncWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
                'https://c8.alamy.com/comp/2HWY77G/galactic-apes-pixel-art-nft-character-16-bit-gorilla-wearing-costume-and-accessories-vibrant-colorful-animal-game-asset-avatar-vector-illustration-2HWY77G.jpg'),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'User',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Spacer(),
          SizedBox(
            width: 36,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.content_copy),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 18,
            ),
          ),
          SizedBox(
            width: 36,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner_outlined),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 18,
            ),
          ),
          SizedBox(
            width: 36,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../asset/my_profile.dart';

class HeaderProfileFuncWidget extends StatefulWidget {
  const HeaderProfileFuncWidget({super.key});

  @override
  State<HeaderProfileFuncWidget> createState() =>
      _HeaderProfileFuncWidgetState();
}

class _HeaderProfileFuncWidgetState extends State<HeaderProfileFuncWidget> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: mediaQuery.size.width / 9,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://c8.alamy.com/comp/2HWY77G/galactic-apes-pixel-art-nft-character-16-bit-gorilla-wearing-costume-and-accessories-vibrant-colorful-animal-game-asset-avatar-vector-illustration-2HWY77G.jpg'))),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfilleScreen()));
                },
                child: Text(
                  'My profile',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 24,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 18,
            ),
          ),
          SizedBox(
            width: 24,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.network_check),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 18,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(
            width: 24,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 18,
              color: Colors.yellowAccent,
            ),
          ),
          SizedBox(
            width: 24,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner_outlined),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 18,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(
            width: 24,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.content_copy),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 18,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}

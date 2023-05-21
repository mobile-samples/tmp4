import 'package:flutter/material.dart';

class MyProfilleScreen extends StatefulWidget {
  const MyProfilleScreen({super.key});

  @override
  State<MyProfilleScreen> createState() => _MyProfilleScreenState();
}

class _MyProfilleScreenState extends State<MyProfilleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).scaffoldBackgroundColor),
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(232, 236, 216, 1),
                  Color.fromRGBO(167, 208, 197, 1),
                  Color.fromRGBO(112, 195, 180, 1),
                  Color.fromRGBO(53, 156, 146, 1),
                  Color.fromRGBO(49, 127, 121, 1)
                ],
                stops: [0.0, 0.28, 0.48, 0.88, 1.0],
                tileMode: TileMode.clamp)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
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
                          'TangmoSW',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          'Shortcut wallet address',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: const [Text('40'), Text('Followers')],
                      ),
                    ),
                    Container(
                      width: 120,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: const [Text('32'), Text('Following')],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Edit Profile')),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.group_add))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

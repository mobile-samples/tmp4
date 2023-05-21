import 'package:flutter/material.dart';

import '../asset/asset_screen.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class MarketTabbar {
  final TabController tabController;
  final String title;

  const MarketTabbar({required this.tabController, required this.title});
}

class _MarketScreenState extends State<MarketScreen>
    with TickerProviderStateMixin {
  late TabController tabCoinController;
  late TabController tabCryotoController;
  late TabController tabLocalTokenController;
  late TabController tabNFTController;
  late TabController tabDeFiController;
  late int currentTab = 0;
  List<MarketTabbar> marketTabbarList = [];
  @override
  void initState() {
    super.initState();
    tabCoinController = TabController(length: 4, vsync: this);
    tabCryotoController = TabController(length: 2, vsync: this);
    tabLocalTokenController = TabController(length: 2, vsync: this);
    tabNFTController = TabController(length: 2, vsync: this);
    tabDeFiController = TabController(length: 2, vsync: this);
    marketTabbarList.addAll([
      MarketTabbar(tabController: tabCryotoController, title: 'Crypto'),
      MarketTabbar(
          tabController: tabLocalTokenController, title: 'Local Token'),
      MarketTabbar(tabController: tabNFTController, title: 'NFT'),
      MarketTabbar(tabController: tabDeFiController, title: 'Defi'),
    ]);
  }

  final List<MyListItem> items = [
    const MyListItem(title: 'BTC', date: '2021-01-01', number: 123),
    const MyListItem(title: 'ETH', date: '2021-02-02', number: 234),
    const MyListItem(title: 'LTC', date: '2021-03-03', number: 123),
    const MyListItem(title: 'BNB', date: '2021-04-04', number: 346),
    const MyListItem(title: 'BTC', date: '2021-01-01', number: 234),
    const MyListItem(title: 'ETH', date: '2021-02-02', number: 456),
    const MyListItem(title: 'LTC', date: '2021-03-03', number: 789),
    const MyListItem(title: 'BNB', date: '2021-04-04', number: 345),
    const MyListItem(title: 'BTC', date: '2021-01-01', number: 123),
    const MyListItem(title: 'ETH', date: '2021-02-02', number: 645),
    const MyListItem(title: 'LTC', date: '2021-03-03', number: 423),
    const MyListItem(title: 'BNB', date: '2021-04-04', number: 756),
    const MyListItem(title: 'BNB', date: '2021-04-04', number: 123),
    const MyListItem(title: 'BTC', date: '2021-01-01', number: 462),
    const MyListItem(title: 'ETH', date: '2021-02-02', number: 354),
    const MyListItem(title: 'LTC', date: '2021-03-03', number: 765),
    const MyListItem(title: 'BNB', date: '2021-04-04', number: 876),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TabBar(
              onTap: (int index) {
                setState(() {
                  currentTab = index;
                });
              },
              controller: tabCoinController,
              labelColor: Colors.blueAccent,
              tabs: marketTabbarList.map((e) => Tab(text: e.title)).toList()),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TabBarView(
                controller: tabCoinController,
                children: marketTabbarList
                    .map((e) => TabBar(
                          controller: e.tabController,
                          labelColor: Colors.blue,
                          tabs: const [
                            Tab(
                              text: 'Favorite',
                            ),
                            Tab(
                              text: 'Markets',
                            ),
                          ],
                        ))
                    .toList()),
          ),
          Expanded(
            child: TabBarView(
                controller: marketTabbarList[currentTab].tabController,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(items[index].title,
                                        style: const TextStyle(fontSize: 16)),
                                    const SizedBox(height: 4),
                                    Text(
                                      items[index].date,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  items[index].number.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: items[index].number > 500
                                          ? Colors.green
                                          : Colors.red),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: items[index].number > 500
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Text(
                                    '+3.08%',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                  const Center(
                    child: Text('2'),
                  ),
                ]),
          )
        ],
      ),
    ));
  }
}

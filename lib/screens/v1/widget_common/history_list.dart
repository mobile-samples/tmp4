import 'package:flutter/material.dart';

class MyListItem {
  final String title;
  final String date;
  final int number;

  const MyListItem(
      {required this.title, required this.date, required this.number});
}

class HistoryListWidget extends StatefulWidget {
  const HistoryListWidget({super.key, this.isScrollable = true});
  final bool? isScrollable;
  @override
  State<HistoryListWidget> createState() => _HistoryListWidgetState();
}

class _HistoryListWidgetState extends State<HistoryListWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  final List<MyListItem> items = [
    const MyListItem(title: 'Item 1', date: '2021-01-01', number: 123),
    const MyListItem(title: 'Item 2', date: '2021-02-02', number: 456),
    const MyListItem(title: 'Item 3', date: '2021-03-03', number: 789),
    const MyListItem(title: 'Item 4', date: '2021-04-04', number: 534),
    const MyListItem(title: 'Item 5', date: '2021-01-01', number: 123),
    const MyListItem(title: 'Item 6', date: '2021-02-02', number: 456),
    const MyListItem(title: 'Item 7', date: '2021-03-03', number: 789),
    const MyListItem(title: 'Item 8', date: '2021-04-04', number: 645),
    const MyListItem(title: 'Item 9', date: '2021-01-01', number: 123),
    const MyListItem(title: 'Item 10', date: '2021-02-02', number: 234),
    const MyListItem(title: 'Item 11', date: '2021-03-03', number: 789),
    const MyListItem(title: 'Item 12', date: '2021-04-04', number: 867),
    const MyListItem(title: 'Item 13', date: '2021-01-01', number: 123),
    const MyListItem(title: 'Item 14', date: '2021-02-02', number: 456),
    const MyListItem(title: 'Item 15', date: '2021-03-03', number: 789),
    const MyListItem(title: 'Item 16', date: '2021-04-04', number: 453),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'History',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.start,
          ),
          TabBar(
            controller: tabController,
            labelColor: Colors.blueAccent,
            tabs: const [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Deposit',
              ),
              Tab(
                text: 'Withdraw',
              ),
              Tab(
                text: 'Freeze',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              ListView.builder(
                  physics: (widget.isScrollable != true)
                      ? const NeverScrollableScrollPhysics()
                      : const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.account_balance_wallet,
                              size: 28,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                            flex: 3,
                            child: Text(
                              items[index].number.toString(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: items[index].number > 500
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              const Center(
                child: Text('1'),
              ),
              const Center(
                child: Text('1'),
              ),
              const Center(
                child: Text('1'),
              )
            ]),
          )
        ],
      ),
    );
  }
}

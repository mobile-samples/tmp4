import 'package:flutter/material.dart';
import '../../../../screens/home_screen.dart';
import '../../../../screens/v2/widget_common/button_widget.dart';

import '../../../../common/common.dart';
import '../../widget_common/item_widget.dart';
import '../asset_screen.dart';

class HistoryListItem {
  final String date;
  final List<WalletListItem> list;

  const HistoryListItem({required this.date, required this.list});
}

class HistoryWithDrawlScreen extends StatefulWidget {
  const HistoryWithDrawlScreen({super.key});

  @override
  State<HistoryWithDrawlScreen> createState() => _HistoryWithDrawlScreenState();
}

class _HistoryWithDrawlScreenState extends State<HistoryWithDrawlScreen> {
  final List<IconItem> icons = [
    IconItem(title: "Withdrawal", icon: Icons.account_balance_wallet),
    IconItem(title: "Deposit", icon: Icons.attach_money),
    IconItem(title: "Copy", icon: Icons.copy),
  ];

  final List<WalletListItem> items = [
    const WalletListItem(
        title: 'Sent', code: 'To: 0x6237846hdjkahsd', number: 8.99),
  ];

  final List<HistoryListItem> histories = [
    const HistoryListItem(date: '26/05/2023', list: [
      WalletListItem(
          title: 'Sent', code: 'To: 0x6237846hdjkahsd', number: 8.99),
    ]),
    const HistoryListItem(date: '25/05/2023', list: [
      WalletListItem(
          title: 'Sent', code: 'To: 0x6237846hdjkahsd', number: 8.99),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ethereum (ETH)'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.currency_bitcoin_rounded,
                  size: 48,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '22.78893 BTC',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: icons
                      .map((e) => Expanded(
                            child: Column(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      e.icon,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    e.title,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: histories
                    .map(
                      (e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.date),
                          SizedBox(
                            height: e.list.length * 60,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: e.list.length,
                                itemBuilder: (context, index) {
                                  return ItemWidget(
                                    item: Item(
                                      title: e.list[index].title,
                                      subTitle: e.list[index].code,
                                      number: e.list[index].number.toString(),
                                      icon: Icons.upload,
                                    ),
                                    elevation: 0,
                                    backGroundColor: Colors.transparent,
                                  );
                                }),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              ButtonWidget(
                title: 'Continue',
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const HomeScreen(),
                    ),
                    (Route route) => false,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

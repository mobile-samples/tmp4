import 'package:flutter/material.dart';
import '../../../screens/v2/asset/deposit/deposit_widget.dart';
import '../../../screens/v2/asset/withdrawal/withdrawal_screen.dart';
import '../../../screens/v2/widget_common/drop_down_widget.dart';
import '../../../screens/v2/widget_common/item_widget.dart';

import '../../../common/common.dart';
import '../widget_common/profile_func_widget.dart';

class WalletListItem {
  final String title;
  final String code;
  final double number;

  const WalletListItem(
      {required this.title, required this.code, required this.number});
}

class AssetScreen extends StatefulWidget {
  const AssetScreen({super.key});

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  String selectedValue = 'All Mainet';
  List<String> itemList = ['All Mainet', 'Item 2', 'Item 3'];
  bool obscure = true;

  toggleObscure() {
    setState(() {
      obscure = !obscure;
    });
  }

  final List<IconItem> icons = [
    IconItem(title: "Withdrawal", icon: Icons.file_upload),
    IconItem(title: "Deposit", icon: Icons.file_download),
    IconItem(title: "Privileges", icon: Icons.redeem),
    IconItem(title: "My Code", icon: Icons.qr_code),
  ];

  final List<WalletListItem> items = [
    const WalletListItem(
        title: 'Wallet 1', code: '0x6237846hdjkahsd', number: 8.99),
    const WalletListItem(
        title: 'Wallet 2', code: '0x6237846hdjkahsd', number: 2590.12),
    const WalletListItem(
        title: 'Wallet 3', code: '0x6237846hdjkahsd', number: 30000.123),
    const WalletListItem(
        title: 'Wallet 4', code: '0x6237846hdjkahsd', number: 46625.32),
    const WalletListItem(
        title: 'Wallet 5', code: '0x6237846hdjkahsd', number: 46625.32),
    const WalletListItem(
        title: 'Wallet 6', code: '0x6237846hdjkahsd', number: 46625.32),
    const WalletListItem(
        title: 'Wallet 7', code: '0x6237846hdjkahsd', number: 46625.32),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderProfileFuncWidget(),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: 180,
                  child: DropdownWidget(
                      listOption: itemList, initialValue: selectedValue),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.currency_bitcoin,
                      size: 26,
                    ),
                    Text(
                      ('1,234,442.20'),
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: icons
                        .map((e) => GestureDetector(
                            onTap: () {
                              if (e.title == 'Deposit') {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const DepositWidget();
                                    });
                              }
                              if (e.title == 'Withdrawal') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WithDrawalScreen()));
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  e.icon,
                                  size: 24,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  e.title,
                                ),
                              ],
                            )))
                        .toList(),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Wallet Address',
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(
                          item: Item(
                            title: items[index].title,
                            subTitle: items[index].code,
                            number: items[index].number.toString(),
                            icon: Icons.account_balance_wallet,
                          ),
                        );
                      }),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

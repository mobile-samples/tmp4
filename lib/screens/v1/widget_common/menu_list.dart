import 'package:flutter/material.dart';

import '../../../common/common.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final List<IconItem> icons = [
    IconItem(title: "Withdrawal", icon: Icons.account_balance_wallet),
    IconItem(title: "Deposit", icon: Icons.attach_money),
    IconItem(title: "Bridge", icon: Icons.add_to_home_screen),
    IconItem(title: "My Wallet", icon: Icons.account_balance),
    IconItem(title: "My Code", icon: Icons.code),
    IconItem(title: "Package", icon: Icons.card_giftcard),
    IconItem(title: "Privileges", icon: Icons.local_offer),
    IconItem(title: "Point", icon: Icons.star),
    IconItem(title: "Coupon", icon: Icons.local_activity),
    IconItem(title: "Invite", icon: Icons.group_add),
    IconItem(title: "Send Gift Envelop", icon: Icons.card_giftcard),
    IconItem(title: "Mission", icon: Icons.assignment),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          icons[index].icon,
                          size: 24,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          icons[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

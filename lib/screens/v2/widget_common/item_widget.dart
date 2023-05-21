import 'package:flutter/material.dart';

class Item {
  final String title;
  final String? subTitle;
  final String? number;
  final IconData? icon;

  const Item({
    required this.title,
    this.subTitle,
    this.number,
    this.icon,
  });
}

class ItemWidget extends StatelessWidget {
  const ItemWidget(
      {super.key, required this.item, this.backGroundColor, this.elevation});
  final Item item;
  final Color? backGroundColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 1.0,
      color: backGroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 240, 240, 240),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item.icon,
                  size: 20,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    item.subTitle.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                ('${item.number}₿'),
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      ),
    );
  }
}

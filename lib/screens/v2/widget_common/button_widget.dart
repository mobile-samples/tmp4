import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, this.title, this.onTap});
  final String? title;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            onTap!();
          },
          child: Text(title ?? 'Button')),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../screens/v1/widget_common/history_list.dart';

import '../widget_common/profile_func_widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              tileMode: TileMode.clamp),
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderProfileFuncWidget(),
              Expanded(child: HistoryListWidget())
            ],
          ),
        )),
      ),
    );
  }
}

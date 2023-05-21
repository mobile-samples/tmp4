import 'package:flutter/material.dart';
import '../../../../screens/v2/asset/withdrawal/confirm_transaction_screen.dart';
import '../../../../screens/v2/widget_common/button_widget.dart';

class WithDrawalScreen extends StatefulWidget {
  const WithDrawalScreen({super.key});

  @override
  State<WithDrawalScreen> createState() => _WithDrawalScreenState();
}

class _WithDrawalScreenState extends State<WithDrawalScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer/Withdraw"),
      ),
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send ETH',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Lorem ipsum dolor sit amet',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 10),
                Text(
                  'Address',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Colors.transparent,
                      hintText: 'Recipient Address',
                      suffixIcon: Icon(Icons.qr_code_scanner)),
                ),
                const SizedBox(height: 10),
                Text(
                  'Network',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      hintText: 'Select Network',
                      suffixIcon: Icon(Icons.chevron_right)),
                ),
                const SizedBox(height: 10),
                Text(
                  'Amount',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Colors.transparent,
                      hintText: 'Minium 0',
                      suffixIcon: Icon(Icons.qr_code_scanner)),
                ),
                const SizedBox(height: 10),
                Text(
                  'Send from',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Colors.transparent,
                      hintText: 'Wallet 1',
                      suffixIcon: Icon(Icons.chevron_right)),
                ),
                const Spacer(),
                ButtonWidget(
                  title: 'Continue',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ConfirmTransactionScreen()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

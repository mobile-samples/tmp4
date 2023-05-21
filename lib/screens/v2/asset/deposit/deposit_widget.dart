
import 'package:flutter/material.dart';

class DepositWidget extends StatefulWidget {
  const DepositWidget({super.key});

  @override
  State<DepositWidget> createState() => _DepositWidgetState();
}

class _DepositWidgetState extends State<DepositWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: MediaQuery.of(context).size.height * 80 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Deposit ETH',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Network',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Ethereum (ERC20)'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.sync_alt))
            ],
          ),
          const Text(
            'Wallet Address',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Wallet 1'),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.chevron_right))
            ],
          ),
          const Text(
            'ETH Deposit Address',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('0x123896283746782347238473293127'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.content_copy))
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Image.network(
                'https://qrcg-free-editor.qr-code-generator.com/main/assets/images/websiteQRCode_noFrame.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Send only ETH to deposit address.',
                maxLines: 1,
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                maxLines: 2,
              ),
            ],
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Save as Image'),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                      ),
                      onPressed: () {},
                      child: const Text('Share Address'))
                ],
              ))
        ],
      ),
    );
  }
}

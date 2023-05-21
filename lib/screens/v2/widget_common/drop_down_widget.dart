import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget(
      {super.key, required this.listOption, required this.initialValue});
  final List<String> listOption;
  final String initialValue;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String selectedValue = '';
  List<String> listOptions = [];
  @override
  void initState() {
    selectedValue = widget.initialValue;
    listOptions = widget.listOption;
    super.initState();
  }

  void onSelected(String newValue) {
    setState(() {
      selectedValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text(
                selectedValue,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: const Icon(Icons.arrow_drop_down),
              onTap: () async {
                final selectedValue = await showModalBottomSheet<String>(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                        child: SingleChildScrollView(
                      child: Column(
                        children: listOptions.map((String value) {
                          return ListTile(
                            title: Text(value),
                            onTap: () {
                              Navigator.pop(context, value);
                            },
                          );
                        }).toList(),
                      ),
                    ));
                  },
                );

                if (selectedValue != null) {
                  onSelected(selectedValue);
                }
              },
            ),
          ],
        ));
  }
}

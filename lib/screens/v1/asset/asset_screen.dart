import 'package:flutter/material.dart';
import '../../../screens/v1/widget_common/history_list.dart';
import '../../../screens/v1/widget_common/image_slide.dart';
import '../../../screens/v1/widget_common/menu_list.dart';
import '../../../screens/v1/widget_common/profile_func_widget.dart';

class MyListItem {
  final String title;
  final String date;
  final int number;

  const MyListItem(
      {required this.title, required this.date, required this.number});
}

class AssetScreen extends StatefulWidget {
  const AssetScreen({super.key});

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen>
    with SingleTickerProviderStateMixin {
  String selectedValue = 'All Mainet';
  List<String> itemList = ['All Mainet', 'Item 2', 'Item 3'];
  final TextEditingController controller = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  bool obscure = true;

  toggleObscure() {
    setState(() {
      obscure = !obscure;
    });
  }

  List<String> imageList = [
    'https://www.kasikornbank.com.vn/SiteCollectionDocuments/VN/assets/uploads/1%20April%20-%2030%20April%202023%20-%20KBank-Vietnam-Cash-Reward-Desktop-2880x1000px-Vn.jpg',
    'https://www.kasikornbank.com.vn/SiteCollectionDocuments/VN/assets/uploads/1%20May%20-%2031%20May%202023%20-KBank%20Referral%20Desktop-2880x1000px-VN%20Ver.png',
    'https://www.kasikornbank.com.vn/SiteCollectionDocuments/VN/assets/uploads/Apr-24-2023-KBank-Vietnam-Free-Water-Bills-Desktop-2880x1000px-Vn-2.jpg'
  ];

  final List<MyListItem> items = [
    const MyListItem(title: 'Item 1', date: '2021-01-01', number: 123),
    const MyListItem(title: 'Item 2', date: '2021-02-02', number: 456),
    const MyListItem(title: 'Item 3', date: '2021-03-03', number: 789),
    const MyListItem(title: 'Item 4', date: '2021-04-04', number: 101112),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
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
                    tileMode: TileMode.clamp)),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderProfileFuncWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.attach_money),
                          DropdownButton(
                            value: selectedValue,
                            iconSize: 28,
                            style: Theme.of(context).textTheme.displayMedium,
                            items: itemList.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value ?? '';
                              });
                            },
                            underline: Container(),
                            alignment: Alignment.bottomCenter,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(
                              ('${obscure ? '********' : '1,234,442'} USD'),
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              icon: Icon(obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: toggleObscure,
                            ),
                          )
                        ],
                      ),
                      const MenuWidget(),
                      SizedBox(
                        height: 160,
                        child: ImageSlider(imageUrls: imageList),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: const HistoryListWidget(
                            isScrollable: false,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

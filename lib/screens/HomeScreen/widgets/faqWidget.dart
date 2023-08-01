import 'package:assure/utils/constants.dart';
import 'package:flutter/material.dart';


class faqWidget extends StatefulWidget {
  const faqWidget({Key? key}) : super(key: key);

  @override
  State<faqWidget> createState() => _faqWidgetState();
}

class _faqWidgetState extends State<faqWidget> {

  final List<Map<String, dynamic>> _items = [
    {
      'id': 0,
      'title': 'Two wheeler loan process',
      'description': "desc1",
      'isExpanded': false
    },
    {
      'id': 1,
      'title': 'Two wheeler loan process',
      'description': "desc2",
      'isExpanded': false
    },
    {
      'id': 2,
      'title': 'Two wheeler loan process',
      'description': "desc2",
      'isExpanded': false
    }
  ];

  List<Map<String, dynamic>> items = List.generate(
      10,
          (index) => {
        'id': index,
        'title': 'Item $index',
        'description':
        'This is the description of the item $index. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        'isExpanded': false
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppConst.customSizedBox(width: 0, height: 50),
        RichText(
          text: TextSpan(
              text: "FAQ's ",
              style: AppConst.customTextStyle(
                  customFontColor: Colors.black,
                  customFontSize: 20,
                  customFontFamily: 'Sans',
                  customFontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '(Frequently Asked Questions)',
                    style: AppConst.customTextStyle(
                        customFontColor: Colors.black,
                        customFontSize: 18,
                        customFontFamily: 'Sans',
                        customFontWeight: FontWeight.normal)),
              ]),
        ),
        AppConst.customSizedBox(width: 0, height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionPanelList(
            elevation: 3,
            // Controlling the expansion behavior
            expansionCallback: (index, isExpanded) {
              setState(() {
                _items[index]['isExpanded'] = !isExpanded;
              });
            },
            animationDuration: const Duration(milliseconds: 600),
            children: _items
                .map(
                  (item) => ExpansionPanel(
                canTapOnHeader: true,
                backgroundColor: Colors.white,
                headerBuilder: (_, isExpanded) => Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Text(
                      item['title'],
                      style: const TextStyle(fontSize: 20),
                    )),
                body: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30),
                  child: Text(item['description']),
                ),
                isExpanded: item['isExpanded'],
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}





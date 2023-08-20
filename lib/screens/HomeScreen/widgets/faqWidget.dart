import 'package:assure/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FaqWidget extends StatefulWidget {
  const FaqWidget({Key? key}) : super(key: key);

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {

  final List<Map<String, dynamic>> _items = [
    {
      'id': 0,
      'title': 'How can I apply for a loan?',
      'description': "You can apply for a loan by visiting our nearest branch office or through our online application process on our website.",
      'isExpanded': false
    },
    {
      'id': 1,
      'title': 'What are the eligibility criteria for obtaining a loan ?',
      'description': "The eligibility criteria may vary depending on the type of loan you are applying for. Generally, factors such as age, income, employment stability, credit history, and documentation are considered during the loan approval process. Please contact our customer service or visit our website for detailed eligibility requirements.",
      'isExpanded': false
    },
    {
      'id': 2,
      'title': 'Can I track the status of my loan application ?',
      'description': "Yes, you can track the status of your loan application by contacting our customer service team or visiting our website. Our representatives will assist you in providing the necessary information.",
      'isExpanded': false
    },
    {
      'id': 3,
      'title': 'What happens if I miss an EMI payment ?',
      'description': "Missing an EMI payment may attract late payment charges and have a negative impact on your credit score. It is important to ensure timely repayment of EMIs to avoid any penalties or adverse consequences. If you anticipate any difficulty in making a payment, we recommend contacting our customer service to explore available options.",
      'isExpanded': false
    },
    {
      'id': 4,
      'title': 'How is the interest rate calculated ?',
      'description': "The interest rate is determined based on several factors, including the loan type, loan amount, loan tenure, your credit history, and prevailing market conditions. Our team will provide you with the applicable interest rate and explain the calculation method during the loan application process.",
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
        NewAppConst.customSizedBox(width: 0, height: 50.h),
        RichText(
          text: TextSpan(
              text: "FAQ's ",
              style: NewAppConst.customTextStyle(
                  customFontColor: Colors.black,
                  customFontSize: 20.sp,
                  customFontFamily: 'Sans',
                  customFontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '(Frequently Asked Questions)',
                    style: NewAppConst.customTextStyle(
                        customFontColor: Colors.black,
                        customFontSize: 18.sp,
                        customFontFamily: 'Sans',
                        customFontWeight: FontWeight.normal)),
              ]),
        ),
        NewAppConst.customSizedBox(width: 0, height: 20.h),
        Padding(
          padding:  EdgeInsets.all(8.0.r),
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
                    padding:  EdgeInsets.symmetric(
                        vertical: 15.h, horizontal: 30.w),
                    child: Text(
                      item['title'],
                      style:  TextStyle(fontSize: 17.sp,fontFamily: 'Sans',
                      fontWeight: FontWeight.bold),
                    )),
                body: Container(
                  padding:  EdgeInsets.symmetric(
                      vertical: 15.h, horizontal: 30.w  ),
                  child: Text(item['description'],
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp,
                    fontFamily: 'Sans'
                  ),),
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





import 'package:assure/apply_for_personal_loan.dart';
import 'package:assure/apply_for_two_wheeler.dart';
import 'package:assure/EmiCalScreen.dart';
import 'package:assure/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, dynamic>> _items = [
    {
      'id' : 0,
      'title' : 'Two wheeler loan process',
      'description': "desc1",
      'isExpanded': false
    },
    {
      'id' : 1,
      'title' : 'Two wheeler loan process',
      'description': "desc2",
      'isExpanded': false
    },
    {
      'id' : 2,
      'title' : 'Two wheeler loan process',
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          body: AppConst.customPadding(left: 0, top: 10, right: 0, bottom: 10,
              child:  SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    userInfo(),
                    titleWidget(),
                    loanType(),
                   // FaqWidget()
                    const EmiCalScreen()
                  ],
                ),
              )),

       /* bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 20,
          selectedIconTheme: IconThemeData(color: AppConst.LightBlue,size: 35),
          //selectedItemColor: Colors.amberAccent,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: AppConst.LightBlue,
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Chats',
            ),
          ],
          onTap: _onItemTapped,
        ),*/
      ),

    );
  }

  Widget titleWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

       /* Row(
          children: [

            AppConst.customSizedBox(width: 20, height: 0),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      //Colors.blue,
                      AppConst.LightGreen,
                      AppConst.LightBlue,
                    ],
                  ),
                  shape: BoxShape.circle),
            ),
            AppConst.customSizedBox(width: 20, height: 0),
            Text(
              'NBSC',
              style: TextStyle(
                  fontFamily: 'Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),*/
        AppConst.customSizedBox(width: 0, height: 10),
        const Divider(
          thickness: 0.8,
        ),
        AppConst.customSizedBox(width: 0, height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 240,
              height: 200,
             // color: Colors.green,
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              //Colors.blue,
                              AppConst.lightOrange,
                              AppConst.lightOrange,
                            ],
                          ),
                          // color: AppConst.LightGreen,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    right: -50,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset('assets/images/girl_bw.png',
                        height: 260,
                        width: 290,),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: AppConst.customPadding(
                right: 15,left: 0,top: 0,bottom: 0,
               // padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Text(
                      'Get instant two wheeler loan',
                      textAlign: TextAlign.center,

                      style:  AppConst.customTextStyle(
                          customFontSize: 20,
                          customFontWeight: FontWeight.bold,
                          customFontFamily: 'Sans',
                          customFontColor: Colors.black),
                    ),
                    AppConst.customSizedBox(width: 0, height: 10),
                    AppConst.customElevatedButton(
                        
                        child: Text('Apply For Another Loan',
                          textAlign: TextAlign.center,
                          style:
                          AppConst.customTextStyle(customFontColor: Colors.white,
                            customFontFamily: 'Sans',
                            customFontSize: 16,
                            customFontWeight: FontWeight.bold,

                        )
                          ,),
                        runCode: (){
                      
                    })

                  ],
                ),
              ),
            )
          ],
        ),
        AppConst.customSizedBox(width: 0, height: 5),
        const Divider(
          thickness: 0.5,
        ),
      ],
    );
  }

  Widget userInfo(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppConst.customPadding(
              right: 10,
              left: 10,
              top: 10,bottom: 10,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,

                    decoration: const BoxDecoration(
                        color: AppConst.DarkOrange,
                      shape: BoxShape.circle
                    ),
                  ),
                  AppConst.customSizedBox(width: 15, height: 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<UserProvider>(
                          builder: (context, userState, child) {
                           // if(userState.currentUser!=null)return const AdminHomeScreen();
                          //  return LoginPage();
                            return Text(userState.currentUser!.name??"",
                                style: AppConst.customTextStyle(

                                    customFontColor: Colors.black,
                                    customFontFamily: 'Sans',
                                    customFontWeight: FontWeight.bold,
                                    customFontSize: 25
                                ));
                          }
                      ),

                      Text("Assure ID:1245467",style: AppConst.customTextStyle(
                          customFontColor: Colors.black.withOpacity(0.7),
                          customFontWeight: FontWeight.normal,
                          customFontFamily: 'Sans',
                          customFontSize: 18
                      ),),
                      Text("Active loans: 2",style: AppConst.customTextStyle(
                          customFontColor:AppConst.DarkOrange,
                          customFontWeight: FontWeight.bold,
                          customFontFamily: 'Sans',
                          customFontSize: 18
                      ),)
                    ],
                  )
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active))

          ],
        ),
        AppConst.customPadding(
          left: 20,right: 0,top: 5,bottom: 5,
          child: Row(
            children: [
              RotatedBox(quarterTurns: -1,
              child: Container(
                  decoration: const BoxDecoration(
                    color: AppConst.lightOrange,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),

                child: AppConst.customPadding(
                    left: 25,right: 25,top: 10,bottom: 10,
                    child: Text('Active loans',
                    style: AppConst.customTextStyle(
                      customFontSize: 18,
                      customFontFamily: 'Sans',
                      customFontColor: Colors.white,
                      customFontWeight: FontWeight.bold
                    ),)),
              ),),
              AppConst.customSizedBox(width: 10, height: 0),
              Container(
                height: 167,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.08),
                        blurRadius: 20,
                        offset: Offset(10, 10),
                      )
                    ],

                    borderRadius: BorderRadius.all(Radius.circular(15),)
                ),
                child: AppConst.customPadding(
                  top: 10,right: 10,bottom: 10,left: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(

                        height: 80,
                        //width: 100,
                        child: CircularPercentIndicator(
                          radius: 40.0,
                          animation: true,
                          animationDuration: 2000,
                          lineWidth: 10.0,
                          percent: 0.9,
                          reverse: true,
                          arcBackgroundColor:  AppConst.DarkOrange,
                          arcType: ArcType.FULL,
                          center: Center(
                            child: Text("30 %",
                              style: AppConst.customTextStyle(
                                  customFontFamily: 'Sans',
                                  customFontSize: 19,
                                  customFontWeight: FontWeight.bold,
                                  customFontColor: AppConst.DarkOrange
                              ),),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.yellow,
                          progressColor: const Color(0xFFeaeaea),
                        ),
                      ),
                      Text("Personal Loan",
                        style: AppConst.customTextStyle(
                          customFontWeight: FontWeight.bold,
                          customFontFamily: 'Sans',
                          customFontSize: 19,
                          customFontColor: Colors.black,
                        ),),
                      Row(
                        children: [
                          Text(' 12/05/23 - 25/08/24',
                            style: AppConst.customTextStyle(
                                customFontSize: 13,
                                customFontFamily: 'Sans',
                                customFontWeight: FontWeight.normal,
                                customFontColor: Colors.black.withOpacity(0.7)
                            ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              AppConst.customSizedBox(width: 5, height: 0),
              Container(
                height: 167,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.08),
                        blurRadius: 20,
                        offset: Offset(10, 10),
                      )
                    ],

                    borderRadius: BorderRadius.all(Radius.circular(15),)
                ),
                child: AppConst.customPadding(
                  top: 6,right: 10,bottom: 6,left: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(

                        height: 80,
                        //width: 100,
                        child: CircularPercentIndicator(
                          radius: 40.0,
                          animation: true,
                          animationDuration: 2000,
                          lineWidth: 10.0,
                          percent: 0.9,
                          reverse: true,
                          arcBackgroundColor:  AppConst.DarkOrange,
                          arcType: ArcType.FULL,
                          center: Center(
                            child: Text("30 %",
                              style: AppConst.customTextStyle(
                                  customFontFamily: 'Sans',
                                  customFontSize: 19,
                                  customFontWeight: FontWeight.bold,
                                  customFontColor: AppConst.DarkOrange
                              ),),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.yellow,
                          progressColor: const Color(0xFFeaeaea),
                        ),
                      ),
                      Text("Two wheeler\nloan",
                        textAlign: TextAlign.center,
                        style: AppConst.customTextStyle(
                          customFontWeight: FontWeight.bold,
                          customFontFamily: 'Sans',
                          customFontSize: 19,
                          customFontColor: Colors.black,
                        ),),
                      Row(
                        children: [
                          Text(' 12/05/23 - 25/08/24',
                            style: AppConst.customTextStyle(
                                customFontSize: 13,
                                customFontFamily: 'Sans',
                                customFontWeight: FontWeight.normal,
                                customFontColor: Colors.black.withOpacity(0.7)
                            ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget loanType() {
    return Column(
      children: [
        AppConst.customSizedBox(width: 0, height: 10),
        Text(
          'Choose your loan type',
          style: AppConst.customTextStyle(
              customFontFamily: 'Sans',
              customFontWeight: FontWeight.bold,
              customFontSize: 20,
          customFontColor: Colors.black),
        ),
        AppConst.customSizedBox(width: 0, height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ApplyForVehicleScreen()),
                );
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      AppConst.customSizedBox(width: 0, height: 50),
                      Container(
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      //Colors.blue,
                                      AppConst.lightOrange,
                                      AppConst.lightOrange,
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Two wheeler loan',
                                  style: AppConst.customTextStyle(
                                      customFontFamily: 'Sans',
                                      customFontSize: 16,
                                      customFontColor: Colors.black,
                                      customFontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: Image.asset('assets/images/bike_bw.png', height: 190))
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ApplyForPersonalScreen()),
                );
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                    AppConst.customSizedBox(width: 0, height: 50),
                      Container(
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      //Colors.blue,
                                      AppConst.lightOrange,
                                      AppConst.lightOrange,
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Personal loan',
                                  style: AppConst.customTextStyle(
                                      customFontFamily: 'Sans',
                                      customFontSize: 16,
                                      customFontColor: Colors.black,
                                      customFontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 0,
                      left: -50,
                      child: Image.asset('assets/images/boy.png', height: 200))
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ApplyForVehicleScreen()),
                );
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      AppConst.customSizedBox(width: 0, height: 50),
                      Container(
                        width: 170,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      //Colors.blue,
                                      AppConst.lightOrange,
                                      AppConst.lightOrange,
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Three wheeler loan',
                                  style: AppConst.customTextStyle(
                                      customFontFamily: 'Sans',
                                      customFontSize: 16,
                                      customFontColor: Colors.black,
                                      customFontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: Image.asset('assets/images/bike_bw.png', height: 190))
                ],
              ),
            ),

          ],
        ),
        AppConst.customSizedBox(width: 0, height: 30),

        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      blurRadius: 20,
                      offset: Offset(10, 10),
                    )
                  ]
                  // borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
              width: MediaQuery.of(context).size.width - 20,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: 50,
                        height: 100,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              //Colors.blue,
                              AppConst.lightOrange,
                              AppConst.lightOrange,
                            ],
                          ),
                        ),
                        child: AppConst.customPadding(
                          top: 10,
                          bottom: 10,
                          left: 5,right: 5,
                          child: Image.asset(
                            "assets/images/meter.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Get your cibil score',
                          style: AppConst.customTextStyle(
                              customFontFamily: 'Sans',
                              customFontSize: 20,
                              customFontColor: Colors.black,
                              customFontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }

  Widget faqWidget() {
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
                    backgroundColor:
                         Colors.white,
                    headerBuilder: (_, isExpanded) => Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Text(
                          item['title'],
                          style: const TextStyle(fontSize: 20),
                        )),
                    body: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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

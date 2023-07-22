import 'package:flutter/material.dart';

import 'constants.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back,
                  color: Colors.black,size: 30,)),
              ],
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/thankYou.png',height: 180,),
                  ],
                ),
                 Text('THANK YOU',textAlign:TextAlign.center,
                  style: AppConst.customTextStyle(
                      customFontFamily: 'Sans',
                    customFontColor: Colors.black,
                    customFontWeight: FontWeight.bold,
                    customFontSize: 20),),

                const SizedBox(height: 20,),

                 Text(
                  'Thank you for reaching us\nshortly our agent will\ncontact you.',
                  textAlign:TextAlign.center,
                  style: AppConst.customTextStyle(
                      customFontFamily: 'Sans',
                    customFontColor: Colors.black,
                    customFontWeight: FontWeight.normal,
                    customFontSize: 18),),

                const SizedBox(height: 20,),
              ],
            )
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25,bottom: 30),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [
                      AppConst.DarkOrange,
                      AppConst.DarkOrange,
                      //add more colors
                    ]),
                borderRadius: BorderRadius.circular(5),),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  //make color or elevated button transparent
                ),
                onPressed: () {

                },
                child: Text(
                  'Go back to homescreen',
                  style: AppConst.customTextStyle(
                      customFontFamily: 'Sans',
                      customFontSize: 20,
                      customFontColor: Colors.white,
                      customFontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

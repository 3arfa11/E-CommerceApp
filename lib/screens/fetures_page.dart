import 'package:ecommerceapp/const.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FeaturesPage extends StatefulWidget {
  const FeaturesPage({super.key});

  @override
  State<FeaturesPage> createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text("Highly Detaild Audio",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),),
              const SizedBox(height: 15,),
              const Text("The speaker unit contains a diaphragm that is\n"
                  " precision-grown from NAC Audio bio-cellulose,\n"
                  " making it stiffer, lighter and stronger than\n"
                  " regular PET speaker units, and allowing the\n"
                  " sound-producing diaphragm to vibrate without\n"
                  " the levels of distortion found in other speakers.",style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 20,),
              const Text("The speaker unit contains a diaphragm that is\n"
                  " precision-grown from NAC Audio bio-cellulose,\n"
                  " making it stiffer, lighter and stronger than\n"
                  " regular PET speaker units, and allowing the\n"
                  " sound-producing diaphragm to vibrate without\n"
                  " the levels of distortion found in other speakers.",style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 30,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Image.asset(feature1),
                  const SizedBox(width: 15,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("APTX HD WIRELESS\nAUDIO",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                      SizedBox(height: 13,),
                      Text("The Aptx® HD codec transmits\n"
                          " 24-bit hi-res audio, equal to or \n"
                          "better than CD quality.")
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Image.asset(feature2),
                  const SizedBox(width: 15,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ULTRA SOFT WITH \nALCANTARA",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                      SizedBox(height: 13,),
                      Text("Alcantara® is a highly\n"
                          "innovative material offering an\n"
                          "unrivalled combination of")
                    ],
                  )
                ],
              ),
              const SizedBox(height: 50,),
              Center(
                child: InkWell(
                  onTap: (){
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.success(
                        message:
                        "Item Added To Cart Successfully",
                        backgroundColor: Color(mainColor),
                      ),
                    );
                  },
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(mainColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child:Text("Add To Cart",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          decoration: TextDecoration.none
                      ),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,)
            ],

          ),
        ),
      ),
    );
  }
}


import 'package:book_app/core/widgets/bedoni_container.dart';
import 'package:book_app/core/widgets/bedoni_text_field.dart';
import 'package:book_app/modules/details/details_page.dart';
import 'package:book_app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.getVolumes(volume:'batman');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Bedoni's Book",style: TextStyle(color: Colors.black,fontFamily: 'Sacramento',fontSize: 30),),

      ),

      body:Container(
        padding: EdgeInsets.all(20),
        child:  Column(
          children: [
            BedoniTextField(label: 'What book are you looking for?',onChanged: homeController.setSearchVolume,),
            GetBuilder<HomeController>(
              builder: (_) => homeController.loading == true
                  ?  CircularProgressIndicator()
                  : Expanded(
                  child:GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(homeController.listVolume.length, (index) {
                     return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  DetailsPage(volume:homeController.listVolume[index] ,)),
                          );
                        },
                       child:BedoniContainer(volume:homeController.listVolume[index] ,) ,
                      );
                    }),
                  ) )

        ),
        ]
      )));
  }
}

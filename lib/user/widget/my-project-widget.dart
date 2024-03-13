import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/user/constant/app-constant.dart';
import 'package:portfolio/user/model/myproject-model.dart';
import 'package:portfolio/user/model/qualification-model.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjectScreen extends StatelessWidget {
  const MyProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _launchURL({required MyProjectModel myProjectModel}) async {
      final Uri url = Uri.parse(myProjectModel.url);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: AppConstant.appTextColor),
          backgroundColor: AppConstant.appSecondaryColor,
          title: Text('My Project',style:TextStyle(color:AppConstant.appTextColor,fontFamily: AppConstant.appFontFamily))

      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('myproject').snapshots(),
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
              //agr koi error hai hmare snapshot me to yh condition chale
              if(snapshot.hasError){
                return Center(
                  child: Text('Error'),
                );
              }
              //agr waiting me h to kya return kro
              if(snapshot.connectionState==ConnectionState.waiting){
                return Container(
                  height: Get.height/4,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              }
              // yani ki jo hum document ko fetch karna chah rhe h kya vh empty to nhi hai agr empty hai to yha par hum simple return karvayenge
              if(snapshot.data!.docs.isEmpty){
                return Center(
                  child: Text('No qualification found!!'),
                );
              }
              //
              if(snapshot.data!=null){
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      //yha par ek var par product ke data kka snapshot nikal lenge jisse hum id ke through data ko product model me gate kar sakte hai
                      final productsData=snapshot.data!.docs[index];
                      MyProjectModel myProjectModel=MyProjectModel(
                        id: snapshot.data!.docs[index]['id'],
                        name: snapshot.data!.docs[index]['name'],
                        url: snapshot.data!.docs[index]['url'],
                        img: snapshot.data!.docs[index]['img'],
                        descriptions: snapshot.data!.docs[index]['descriptions'],
                      );

                      //calculate cart price
                      //priceController.fetchProductPrice();
                      return Column(
                        children: [

                          GestureDetector(
                            onTap: (){
                              // Get.to(()=>ProductDetailsScreen(productModel:productModel));
                            },
                            child: Padding(padding: EdgeInsets.all(15.0),

                              child: Container(
                                height: Get.height/1,
                                width:Get.width/1,

                                child: Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Card(
                                    //color: Colors.greenAccent,
                                    elevation: 10,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        CarouselSlider(
                                          items: myProjectModel.img.map(
                                                (imageUrl) => ClipRRect(
                                              borderRadius:BorderRadius.circular(10.0),

                                              child: CachedNetworkImage(
                                                height: 100,
                                                imageUrl: imageUrl,
                                                fit: BoxFit.fill,
                                                width: Get.width-10,
                                                placeholder: (context,url)=>ColoredBox(
                                                  color: Colors.white,
                                                  child:Center(
                                                    child: CupertinoActivityIndicator(),
                                                  ),
                                                ),
                                                errorWidget: (context,url,error)=>Icon(Icons.error),
                                              ),
                                            ),
                                          ).toList(),
                                          options: CarouselOptions(
                                            height: Get.height/1.5,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            aspectRatio: 3,
                                            viewportFraction: 1,
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Center(child: Text(" ${myProjectModel.name}",style: TextStyle(fontFamily: AppConstant.appFontFamily,fontWeight: FontWeight.bold,fontSize: 18),)),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(" ${myProjectModel.descriptions}",style: TextStyle(fontFamily: AppConstant.appFontFamily,fontSize: 14),maxLines: 5,),

                                        ),
                                        Center(
                                          child: Material(
                                            child: Container(
                                                width: Get.width/3.0,
                                                height: Get.height/20,
                                                decoration: BoxDecoration(
                                                  color: Colors.greenAccent,
                                                  borderRadius: BorderRadius.circular(20),

                                                ),
                                                child: TextButton(
                                                    child: Text('Github',style: TextStyle(color: AppConstant.appTextColor,fontSize: 16),),
                                                    onPressed: () {
                                                      _launchURL(myProjectModel:myProjectModel);
                                                    }
                                                )
                                            ),
                                          ),
                                        ),

                                        //Text(qualificatioModel.quniversity)


                                      ],
                                    ),
                                  ),
                                ),



                              ),
                            ),
                          ),



                        ],
                      );
                    }
                );
              }

              return Container();
            }
        ),
      ),
    );
  }
}

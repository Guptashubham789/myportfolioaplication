import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/user/constant/app-constant.dart';
import 'package:portfolio/user/model/qualification-model.dart';

class QualificationWidget extends StatelessWidget {
  const QualificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appSecondaryColor,
        title: Text('Qualification',style:TextStyle(color:AppConstant.appTextColor,fontFamily: AppConstant.appFontFamily))

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset('assets/img/study.json',height: 100),
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection('qualifications').snapshots(),
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
                          QualificatioModel qualificatioModel=QualificatioModel(
                              qid: snapshot.data!.docs[index]['qid'],
                              qdegree: snapshot.data!.docs[index]['qdegree'],
                              branch: snapshot.data!.docs[index]['branch'],
                              qdate: snapshot.data!.docs[index]['qdate'],
                              quniversity: snapshot.data!.docs[index]['quniversity'],
                              createdAt: DateTime.now(),
                              clgname: snapshot.data!.docs[index]['clgname'],
                              marks: snapshot.data!.docs[index]['marks']
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
                                    height: Get.height/3.5,
                                    width:325.0,

                                    child: Padding(
                                      padding:  EdgeInsets.all(8.0),
                                      child: Card(

                                        elevation: 10,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                CircleAvatar(

                                                  radius: 40.0,
                                                  backgroundColor: Colors.white,
                                                  child: Icon(Icons.school),
                                                ),
                                                Text(" ${qualificatioModel.qdegree}",style: TextStyle(fontFamily: AppConstant.appFontFamily,fontWeight: FontWeight.bold),),
                                                Text(" ${qualificatioModel.branch}",style: TextStyle(),)
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [

                                                  Text(" ${qualificatioModel.quniversity}",style: TextStyle(fontFamily: AppConstant.appFontFamily,fontWeight: FontWeight.bold),),
                                                  Text(" ${qualificatioModel.qdate}",style: TextStyle(),)
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [

                                                  Text(" ${qualificatioModel.clgname}",style: TextStyle(fontFamily: AppConstant.appFontFamily,fontWeight: FontWeight.bold),),
                                                  //Text(" ${qualificatioModel.marks}",style: TextStyle(),)
                                                ],
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
          ],
        ),
      ),
    );
  }
}

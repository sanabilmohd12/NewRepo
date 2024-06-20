import 'dart:collection';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Modelclssss.dart';

class MainProvider extends ChangeNotifier {
  FirebaseFirestore db=FirebaseFirestore.instance;


  TextEditingController playersNameController =TextEditingController();
  TextEditingController playerAgeController=TextEditingController();
  TextEditingController playerCountryController=TextEditingController();

  Future addPlayers(String from,String oldid) async {
    String id =DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic > map = HashMap();

    map["Players_name"]=playersNameController.text;
    map["Players_Age"]=playerAgeController.text;
    map["Players_Country"]=playerCountryController.text;
     if(from=="NEW"){
       map["Players_ID"]=id;
     }

     if(from=="EDIT"){
       db.collection("Details").doc(oldid).update(map).then((value) {
         Fluttertoast.showToast(
             msg: "SuccessFully Edited",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Color(0xda4b4b4b),
             textColor: Colors.white,
             fontSize:16.0);
       });
     }else{
       db.collection("Details").doc(id).set(map).then((value){
         Fluttertoast.showToast(
             msg: "SuccessFully Added",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Color(0xda4b4b4b),
             textColor: Colors.white,
             fontSize:16.0);
       }
       );

     }



    getPlayers();
    notifyListeners();
  }
  // void clearControllers(){
  //   playersNameController.clear();
  //   playerAgeController.clear();
  //   playerCountryController.clear();
  // }

  List<playermdlclss> playerDetails =[];

  void getPlayers(){
    db.collection("Details").get().then((value){
      if(value.docs.isNotEmpty){
        playerDetails.clear();
        for(var element in value.docs){
          playerDetails.add(
              playermdlclss(
                element.id,
                element.get("Players_name").toString(),
                element.get("Players_Age").toString(),
                element.get("Players_Country").toString(),
              ),
          );
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }



  void deletePlayers(id,BuildContext context){
    db.collection("Details").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Deleted Successfully"),
    backgroundColor: Colors.redAccent,
    ));
    notifyListeners();
    getPlayers();
  }



  void editPlayers(String id ){
    db.collection("Details").doc(id).get().then((value){
      if(value.exists){
        Map<dynamic,dynamic> map=value.data() as Map;
        playersNameController.text=map["Players_name"].toString();
        playerAgeController.text=map["Players_Age"].toString();
        playerCountryController.text=map["Players_Country"].toString();
        getPlayers();
        notifyListeners();

      }

    });
    notifyListeners();
  }




  notifyListeners();
}
import 'package:crud/mypro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class addPage extends StatelessWidget {
  String from;
      String oldid;
   addPage({super.key,required this.from,required this.oldid});

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
            _formKey.currentState!.reset();

          }, icon: Icon(CupertinoIcons.back)),
          title: Text("Add",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff0064ff),
              )),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)))),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 320,
                  height: 60,
                  child: TextFormField(
                      validator: (value) {
                        if(value!.trim().isEmpty){
                          return "Required";
                        }else{
                          return null;
                        }
                      },
                      // inputFormatters: [LengthLimitingTextInputFormatter()],
                      controller: value.playersNameController,
                      keyboardType: TextInputType.name,
                      // autofocus: true,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      decoration: InputDecoration(
                          hintText: "Type Here",
                          hintStyle: TextStyle(
                            color: Color(0xBC6B526B),
                            fontSize: 15,
                          ),
                          labelText: "Name",
                          floatingLabelStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xBC6B526B),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 320,
                  height: 60,
                  child: TextFormField(
                    validator: (value) {
                      if(value!.trim().isEmpty){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      controller: value.playerAgeController,
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      // autofocus: true,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      decoration: InputDecoration(
                          hintText: "Type Here",
                          hintStyle: TextStyle(
                            color: Color(0xBC6B526B),
                            fontSize: 15,
                          ),
                          labelText: "Age",
                          floatingLabelStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xBC6B526B),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 320,
                  height: 60,
                  child: TextFormField(
                      validator: (value) {
                        if(value!.trim().isEmpty){
                          return "Required";
                        }else{
                          return null;
                        }
                      },
                      controller: value.playerCountryController,
                      keyboardType: TextInputType.name,
                      // autofocus: true,
                      onEditingComplete: () => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                          hintText: "Type Here",
                          hintStyle: TextStyle(
                            color: Color(0xBC6B526B),
                            fontSize: 15,
                          ),
                          labelText: "Place",
                          floatingLabelStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xBC6B526B),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ))),
                ),
              ),
              Consumer<MainProvider>(builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {

                    final FormState? form = _formKey.currentState;
                    if (form!.validate()) {
                      if(from=="NEW"){
                        value.addPlayers(from, "");
                        _formKey.currentState!.reset();
                      }else{
                        value.addPlayers(from,oldid);
                        _formKey.currentState!.reset();
                      }
                      _formKey.currentState!.reset();
                      Navigator.pop(context);
                      value.getPlayers();
                    }

                  },
                  child: Text("Done", style: TextStyle(color: Colors.black)),
                );
              })
            ],
          ),
        );
      }),
    );
  }
}

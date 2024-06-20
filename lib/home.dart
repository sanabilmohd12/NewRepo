import 'package:crud/mypro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addPage.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    // MainProvider provider = Provider.of<MainProvider>(context, listen: true);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   provider.getPlayers();
    // });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          title: Text("CRUD Operations",
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
        return ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: value.playerDetails.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 160,
                width: 250,
                decoration: ShapeDecoration(
                    color: Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 102,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                        color: Color(0xbd563c56),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                  color: Color(0xbd563c56),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              value.playerDetails[index].playername.toString(),
                              style: TextStyle(
                                  color: Color(0xbd563c56),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 102,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Age",
                                    style: TextStyle(
                                        color: Color(0xbd563c56),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                  color: Color(0xbd563c56),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              value.playerDetails[index].age.toString(),
                              style: TextStyle(
                                  color: Color(0xbd563c56),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 102,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Country",
                                    style: TextStyle(
                                        color: Color(0xbd563c56),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                  color: Color(0xbd563c56),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              value.playerDetails[index].Country.toString(),
                              style: TextStyle(
                                  color: Color(0xbd563c56),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text("Do you Want to Edit?",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    actions: [
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("No"),
                                          ),
                                          Spacer(),
                                          TextButton(
                                            onPressed: () {
                                              value.editPlayers(value
                                                  .playerDetails[index].id);
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        addPage(
                                                            from: "EDIT",
                                                            oldid: value
                                                                .playerDetails[
                                                                    index]
                                                                .id),
                                                  ));
                                            },
                                            child: Text("Edit"),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text("Are You Sure?",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    actions: [
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("No"),
                                          ),
                                          Spacer(),
                                          TextButton(
                                            onPressed: () {
                                              value.deletePlayers(
                                                  value.playerDetails[index].id,
                                                  context);
                                              Navigator.pop(context);
                                            },
                                            child: Text("Delete"),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        )
                      ]),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => addPage(
                  from: "NEW",
                  oldid: '',
                ),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

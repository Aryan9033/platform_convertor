import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/Global.dart';
import 'package:share_plus/share_plus.dart';

class chats_page extends StatefulWidget {
  const chats_page({Key? key}) : super(key: key);

  @override
  State<chats_page> createState() => _chats_pageState();
}

class _chats_pageState extends State<chats_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: Global.allContacts.length,
        itemBuilder: (context, i) => ListTile(
          leading: Image.asset("${Global.allContacts[i]["image"]}"),
          title: Text("${Global.allContacts[i]["name"]}"),
          subtitle: Text("${Global.allContacts[i]["description"]}"),
          trailing: Text("${Global.allContacts[i]["time"]}"),
          onTap: () {
            (Global.isIOS == false)
                ? showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 400,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("${Global.allContacts[i]["image"]}"),
                            maxRadius: 50,
                          ),
                          Text("${Global.allContacts[i]["name"]}"),
                          Text("${Global.allContacts[i]["Contect"]}"),
                          ElevatedButton(
                            onPressed: () async {
                              await Share.share(
                                  "${Global.allContacts[i]["Contect"]}",
                                  subject: "Contect");
                            },
                            child: const Text("Send Message"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancel"),
                          ),
                        ],
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                  )
                : CupertinoActionSheet(
                    title: Text("${Global.allContacts[i]["name"]}"),
                    message: Text("${Global.allContacts[i]["description"]}"),
                    actions: [
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("${Global.allContacts[i]["image"]}"),
                      ),
                      Text("${Global.allContacts[i]["Contect"]}"),
                    ],
                    cancelButton: Text("Cancel"),
                  );
          },
        ),
      ),
    );
  }
}

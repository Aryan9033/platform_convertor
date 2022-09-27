import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Global.dart';

class calls_page extends StatefulWidget {
  const calls_page({Key? key}) : super(key: key);

  @override
  State<calls_page> createState() => _calls_pageState();
}

class _calls_pageState extends State<calls_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: Global.allContacts.length,
        itemBuilder: (context, i) => ListTile(
          leading: Image.asset("${Global.allContacts[i]["image"]}"),
          title: Text("${Global.allContacts[i]["name"]}"),
          subtitle: Text(
              "${Global.allContacts[i]["description"]},${Global.allContacts[i]["time"]}"),
          trailing: IconButton(
            icon: const Icon(Icons.call, color: Colors.green),
            onPressed: () async {
              Uri url = Uri.parse("tel:${Global.allContacts[i]["Contect"]}");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Can't be launched..."),
                    backgroundColor: Colors.redAccent,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

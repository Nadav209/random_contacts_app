import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_contacts_app/model/contacts_model.dart';
import 'package:random_contacts_app/presentation/pages/home_detail_page.dart';
import 'package:random_contacts_app/presentation/pages/state_managment/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            appBar: AppBar(
              title: Text("RandomContactsApp",  style: TextStyle(fontSize: 20),),
              centerTitle: true,
              leading: IconButton(icon: Icon(Icons.arrow_back_outlined),onPressed: ()=>_onBackPressed()),

            ),
            body:GetBody()
        ),
      );

  }

  Future<bool> _onBackPressed() async => await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("RandomContactsApp"),
        content: Text(" ?האם ברצונך לצאת מהאפליקציה"),
        actions: [
          TextButton(
              child: Text("כן"),
              onPressed: () => exit(0)),
          TextButton(
            child: Text("לא"),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
        elevation: 24.0,
      ));
}
class GetBody extends StatelessWidget {
  const GetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
        future: Provider.of<HomePageProvider>(context, listen: false)
            .fetchContacts(100),
        builder: (BuildContext context,
            AsyncSnapshot<List<ContactsModel>> snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var currentPerson = snapshot.data![index];

                          return InkWell(
                            onTap: () =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeDetailPage(
                                            name: currentPerson.name.toString(),
                                            picture:
                                            currentPerson.picture!.large,
                                            phone: currentPerson.phone.toString(),
                                            email: currentPerson.email
                                                .toString(),
                                          )),
                                ),
                            child: ListTile(
                              title: Text(currentPerson.name.toString(),  style: TextStyle(  fontSize: 20),),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    currentPerson.picture!.thumbnail),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );
          }

          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(" נא להמתין מתבצעת טעינה",  style: TextStyle( fontSize: 20),)
                ],
              ));
        },
      );

  }
}

import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final String name, picture, phone, email;

  const HomeDetailPage(
      {Key? key, required this.name, required this.picture, required this.phone, required this.email})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            name,  style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          leading: IconButton(icon: const Icon(Icons.arrow_back_outlined,),
            onPressed: () => Navigator.pop(context),),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      picture.toString()),
                ),
              ),
               SizedBox(height: 20),
              Text("Name: " + name,style: TextStyle(fontSize: 20),),
               SizedBox(height: 20,),
              Text("Phone: " + phone,style: TextStyle(fontSize: 20),),
               SizedBox(height: 20,),
              Text("Email: " + email,style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      );
    }
  }


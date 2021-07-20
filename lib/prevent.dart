import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Constants.dart';

class Prevent extends StatefulWidget {
  const Prevent({Key key}) : super(key: key);

  @override
  _PreventState createState() => _PreventState();
}

class _PreventState extends State<Prevent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.blue[100],
              Colors.blue[300],
              Colors.blue[600],
              Colors.blue[900],
            ],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            title: Center(
              child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.network(''
                      'https://media.istockphoto.com/vectors/coronavirus-inscription'
                      '-typography-design-logo-concept-vector-vector-id1213559740?k='
                      '6&m=1213559740&s=170667a&w=0&h=Gr9pBD7LrYYFjw1bac-ghl7M7TSFtb8'
                      'mDGP0V2NfaOM=')
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.call),
                color: Colors.black,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Calling For Help..')));
                  calling();
                },
              ),
            ],
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded,color: Colors.black,size: 30,),
                onPressed: () => Scaffold.of(context).openDrawer(),

              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.only(bottom: 10),
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.blue[600],
                        Colors.blue[700],
                        Colors.blue[800],
                        Colors.blue[900],
                      ],
                    ),
                  ),
                  child: Center(child: Text('Menu',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                ),
                ListTile(
                  title: Text('Vacination',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                  onTap: () {
                    launch('https://www.cowin.gov.in/');
                  },
                ),
                ListTile(
                  title: Text('Donate',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                  onTap: () {
                    launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate');
                  },
                ),
                ListTile(
                  title: Text("WHO",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                  onTap: () {
                    launch('https://www.who.int/');
                  },
                ),
                ListTile(
                  title: Text("FAQ's",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                  onTap: () {
                    launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/coronavirus-disease-covid-19');
                  },
                ),
              ],
            ),
          ),

          backgroundColor: Colors.black54,
          body:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Corona Prevention",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),

                  ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 60),
                     child: Image.asset("assets/images/prevent.png"),
                   ),
                ],
              ),
            ),
          )
        )
    );
  }
}

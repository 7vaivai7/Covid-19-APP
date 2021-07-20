import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'chart.dart';
import 'Constants.dart';
import 'package:url_launcher/url_launcher.dart';


class World extends StatefulWidget {

  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {

  Map WorldData;
  getDataWorld() async {
    http.Response response = await http.get(
        'https://disease.sh/v3/covid-19/all');
    setState(() {
      WorldData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    getDataWorld();
    super.initState();
  }


  @override

  Widget build(BuildContext context) {
    return Container(
      child: WorldData==null?CircularProgressIndicator():worr(WorldData: WorldData),

    );
  }
}

class worr extends StatelessWidget {
  final Map WorldData;

  const worr({Key key, this.WorldData}) : super(key: key);

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
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Row(
                      children: [
                        StatusPanel(
                          title: 'CASES',
                          boxcolor: Colors.black54,
                          textcolor: Colors.white,
                          count: WorldData['cases'].toString(),
                        ),
                        StatusPanel(
                          title: 'ACTIVE',
                          boxcolor: Colors.black54,
                          textcolor: Colors.white,
                          count: WorldData['active'].toString(),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      StatusPanel(
                        title: 'RECOVERED',
                        boxcolor: Colors.black54,
                        textcolor: Colors.white,
                        count: WorldData['recovered'].toString(),
                      ),
                      StatusPanel(
                        title: 'DEATHS',
                        boxcolor: Colors.black54,
                        textcolor: Colors.white,
                        count: WorldData['deaths'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Chart(WorldData:WorldData),
                      SizedBox(height: 50,),
                    ],
                  ),
                ],
              ),

            ),
          ),
        )
    );


  }
}

class StatusPanel extends StatelessWidget {
  final Color boxcolor;
  final Color textcolor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.boxcolor, this.textcolor, this.title, this.count}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        child: Container(
          decoration: BoxDecoration(
              color: boxcolor,
              borderRadius: BorderRadius.circular(25)
          ),

          margin: EdgeInsets.all(5),
          height: 100,
          width: width/2.5,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: textcolor)),
              Text(count,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: textcolor))
            ],
          ),
        ),
      ),

    );

  }
}


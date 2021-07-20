import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Constants.dart';
import 'world.dart';
import 'country.dart';
import 'symtons.dart';
import 'prevent.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int CurrentIndex=2;
  final tabs = [
    Center(child: World()),
    Center(child: Country(),),
    Center(child: HomePage(),),
    Center(child: Symtoms(),),
    Center(child: Prevent()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[CurrentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        height: 50,
        backgroundColor: Colors.blueGrey.shade600,
        //backgroundColor: Colors.black,
        items: <Widget>[
          Icon(Icons.language,size: 25,color: Colors.blue,),
          Icon(Icons.my_location,size: 25,color: Colors.blue),
          Icon(Icons.home_outlined,size: 25,color: Colors.blue),
          Icon(Icons.report_problem_outlined,size: 25,color: Colors.blue),
          Icon(Icons.masks,size: 25,color: Colors.blue),

        ],

        onTap: (index){
          setState(() {
            CurrentIndex=index;
          });
        },
      )
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
          body:Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset("assets/images/homePage.png"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text("The World wont change itself, BE THE CHANGE ",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
                )

              ],
            )
            
          )
          )
      );

  }
}

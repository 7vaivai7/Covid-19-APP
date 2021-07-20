import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'search.dart';

class Country extends StatefulWidget {

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  List CountryData;
  getDataCountry() async {
    http.Response response = await http.get(
        'https://disease.sh/v3/covid-19/countries');
    setState(() {
      CountryData = json.decode(response.body);
    });
  }
  @override
  void initState() {
    getDataCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      CountryData==null?CircularProgressIndicator():country(CountryData: CountryData),

    );
  }
}

class country extends StatelessWidget {

  final List CountryData;

  const country({Key key, this.CountryData}) : super(key: key);

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
                icon: const Icon(Icons.search),
                color: Colors.black,
                onPressed: () {
                  showSearch(context: context, delegate: Search(CountryData));
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
          body: ListView.builder(
            itemCount: CountryData.length,
            itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(right: 60,left: 60,top: 25,bottom: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Image.network(CountryData[index]['countryInfo']['flag'],height: 30,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(CountryData[index]['country'],
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Cases: '+ CountryData[index]['cases'].toString(),
                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Active: '+ CountryData[index]['active'].toString(),
                          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Recover: '+ CountryData[index]['recovered'].toString(),
                          style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Deaths: '+ CountryData[index]['deaths'].toString(),
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  )

                ],
              ) ,
            );
          },
          ),
        )
    );

  }
}

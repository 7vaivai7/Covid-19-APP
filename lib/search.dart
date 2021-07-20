import 'package:flutter/material.dart';

class Search extends SearchDelegate{
  final List CountryData;

  Search(this.CountryData);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear),onPressed: (){
        query='';
      }
      ,)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList
    =
    query.isEmpty?
    CountryData:
    CountryData.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();


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
      child: ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index){
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Container(
          height: 130,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                      child: Image.network(suggestionList[index]['countryInfo']['flag'],height: 70,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(suggestionList[index]['country'],
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                    ),
                  ],
                ),

                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Cases: '+ suggestionList[index]['cases'].toString(),
                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Active: '+ suggestionList[index]['active'].toString(),
                          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Recover: '+ suggestionList[index]['recovered'].toString(),
                          style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Deaths: '+ suggestionList[index]['deaths'].toString(),
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                )

              ],
            ) ,
        ),
    );
    },
    )
    );
  }

}
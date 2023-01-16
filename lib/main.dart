import 'package:cars_with_provider/provider/provider_class.dart';
import 'package:cars_with_provider/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => MyProvider()),
    child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        home: const English(),
        debugShowCheckedModeBanner: false,
      ),
    ), );
}



class English extends StatelessWidget {
  const English({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> c1 = [
      "Baleno",
      "Kushaq",
      "Scorpio",
      "Swift",
      "Urban Cruiser",
      "Venue",
    ];
    List<String> c2 = [
      "images/baleno.jpeg",
      "images/kushaq.jpeg",
      "images/scorpio.jpeg",
      "images/swift.jpeg",
      "images/urban-cruiser.jpeg",
      "images/venue.jpeg",
    ];


    final prov = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Cars",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: c1.length,
        itemBuilder: (context, index) {
          return ListTile(leading: CircleAvatar(
            backgroundImage: AssetImage('${c2[index]}'),
            radius: 30,
          ),
              title: Text(
                "${c1[index]}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {
                    prov.favour(c1[index],c2[index]);
                  },
                  icon: (prov.icn(c1[index]))
                  ? Icon(
                          Icons.favorite,
                          size: 25,
                          color: Colors.red,
                        )
                      : Icon(Icons.favorite_border, size: 25)));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => secnd()),
          );
        },
        label: Text(
          "Favorites",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}

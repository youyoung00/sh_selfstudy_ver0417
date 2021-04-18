import 'package:flutter/material.dart';

void main(){
  runApp(new App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("LOGO"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              return;
            },
          ),
        ],
      ),
      body: GridView(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        children: [
          this._items(context: context),
          this._items(context: context),
          this._items(context: context),
          Container(color: Colors.blueAccent,),
          Container(color: Colors.yellowAccent,),
        ],
      ),
    );
  }
  Widget _items({@required BuildContext context}){
   return Container(
     color: Colors.redAccent,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Container(
           color: Colors.blue,
           child: Icon(Icons.more_horiz),
           width: (MediaQuery.of(context).size.width/2)-15.0,
           alignment: Alignment.centerRight,
           padding: EdgeInsets.only(right: 10.0),
         ),
         Container(
           width: 60.0,
           height: 60.0,
           decoration: new  BoxDecoration(
             color: Colors.blue,
             borderRadius: BorderRadius.circular(60.0),
             image: DecorationImage(
               fit: BoxFit.cover,
               image: NetworkImage("https://images.unsplash.com/photo-1557296387-5358ad7997bb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),

             ),
           ),
         ),
         Container(
           child: Text(
             "이름",
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 20.0,
             ),
           ),
         ),
         Container(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Icon(Icons.person),
               Icon(Icons.mail),
             ],
           ),
         ),
       ],
     ),
   );
  }
}


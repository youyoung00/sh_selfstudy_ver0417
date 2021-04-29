import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  // int i;
  // PageTwo(this.i);
  String title;
  List datas;
  PageTwo({@required this.title, @required this.datas});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title.toString()),
        centerTitle: true,
      ),
      // body: ListView(
      //   children: [
      //     this._items(context),
      //     this._items(context),
      //     this._items(context),
      //     ListTile(
      //       leading: Icon(Icons.playlist_add_check),
      //       title: Text("타이틀"),
      //       subtitle: Text("내용"),
      //       trailing: Icon(Icons.play_arrow_sharp),
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: this.datas.length,
          itemBuilder: (BuildContext context, int index){
          // return this._items(context);
        return ListTile(
                  leading: Icon(Icons.playlist_add_check),
                  title: Text(this.datas[index]['title'].toString()),
                  subtitle: Text(this.datas[index]['name'].toString()),
                  trailing: Icon(Icons.play_arrow_sharp),
                );
        }
      ),
    );
  }
  Widget _items(BuildContext context){
    return new Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      //color: Colors.amberAccent,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/10,
            //color: Colors.red,
            child: Icon(Icons.access_alarm),
          ),
          Container(
            width: ((MediaQuery.of(context).size.width/10)*8)-40.0,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10.0),
            //color: Colors.indigo,
            child:Column(
              children: [
                Text(
                  "타이틀",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5.0,),
                Text("내용"),
              ],
            ) ,
          ),
          Container(
              width: MediaQuery.of(context).size.width/10,
              //color: Colors.green,
              child: Icon(Icons.mail)
          ),
        ],
      ),
    );
  }
}

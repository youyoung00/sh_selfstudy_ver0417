import 'package:flutter/material.dart';
import 'package:sh_selfstudy_ver0417/PageTwo.dart';
import 'package:sh_selfstudy_ver0417/models/mainDataModel.dart';


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



class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String,dynamic>> sData = [
    // 장르1 - 장르이름, 장르의 노래'들'
    // -- 노래제목, 가수이름, 가사, 앨범자켓
    // 장르2 - 장르이름, 장르의 노래'들'
    {
      "title": "댄스",
      "datas": [
        {"title": "댄스노래1", "name": "댄스가수1", "des": "..."},
        {"title": "댄스노래2", "name": "댄스가수2", "des": "..."}
      ]
    },
    {
      "title": "발라드",
      "datas": [
        {"title": "발라노래1", "name": "발라가수1", "des": "..."},
        {"title": "발라드노래2", "name": "발라가수2", "des": "..."}
      ]
    }

  ];

  List<MainDataModel> vData;

  @override
  void initState() {
    setState(() {
      // * 가장 쉬운 모델링. --> 금요일
      vData = this.sData.map<MainDataModel>((Map<String,dynamic> e){
        return new MainDataModel(
            title: e["title"].toString(),
            datas: List.from(e["datas"])
        );
      }).toList();
    });

    // [new MainDataMOdel()]
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("My Music"),
        centerTitle: true,
        actions: [
          IconButton(
          icon: Icon(Icons.settings),
            onPressed:(){
            return;
            },
          )
        ],
      ),
      body: this.vData == null
          ? Center(child: Text("로딩 중...."),)
          : new GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        // children: [
        //   this._items(context: context),
        //   this._items(context: context),
        //   this._items(context: context),
        //   Container(color: Colors.indigo,),
        //   Container(color: Colors.green,),
        // ],
        // 리스트의 요소와 map함수 활용 예시: children: [1,2,3,4,5].map<Widget>((int e) => this._items(e),).toList(),
        // itemCount: this.sData.length,
        itemCount: this.vData.length,
        itemBuilder: (BuildContext context, int i){ // 0,1,2,3,4 -> List요소의 특징과 같
          //return Container();
          return this._items(i, context);
        },
      ),
    );
  }

  List<int> data = [1,2,3,4,5,6];

  Widget _items(int i, BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (BuildContext context){
            // return Scaffold(
            //   appBar: AppBar(),
            //);
                return new PageTwo(
                    // title: this.sData[i]['title'].toString(),
                    // datas: List.from(this.sData[i]['datas'])
                  title: this.vData[i].title,
                  datas: this.vData[i].datas,
                );
            }
          )
        );
        return;
      },
      child: new Container(
          color: Colors.black26,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.amberAccent,
                child: Icon(Icons.more_horiz),
                //width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 10.0),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://images.unsplash.com/photo-1604426633861-11b2faead63c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(60.0)
                ),
              ),
              Container(
                child: Text(
                 // this.sData[i]["title"].toString(),
                  this.vData[i].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.play_arrow_sharp),
                    Icon(Icons.playlist_add_check)
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}

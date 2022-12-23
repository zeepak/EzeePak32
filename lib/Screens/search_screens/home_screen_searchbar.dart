import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/search_screens/search_detail_screen.dart';

class HomeScreenSearchBar extends StatefulWidget {
  const HomeScreenSearchBar({Key? key}) : super(key: key);

  @override
  State<HomeScreenSearchBar> createState() => _HomeScreenSearchBarState();
}

class _HomeScreenSearchBarState extends State<HomeScreenSearchBar> {
  var postsRef = FirebaseFirestore.instance.collection('Posts');
  var searResult = [];
  String _searchText='';
  String phone='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Container(
          height: 50,
          width: 250,

          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search item',
              border: InputBorder.none
            ),
            autofocus: true,
            style: TextStyle(color: Colors.black),
            onChanged: (value) {
              setState(() {
                _searchText = value.toLowerCase();
              });
            },
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: postsRef.orderBy('searchText').startAt([_searchText]).endAt(['$_searchText\uf8ff']).get(GetOptions(source: Source.cache)),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return ListTile(visualDensity: VisualDensity(vertical: -4),

                contentPadding: EdgeInsets.all(15),
                leading: Text(snapshot.data!.docs[index]['title'],style: TextStyle(fontWeight: FontWeight.bold),),
                trailing: Icon(Icons.keyboard_arrow_right),
                dense: true,
                onTap: (){
              print(snapshot.data!.docs[index]['title']);
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchDetailScreen(phone: snapshot.data!.docs[index]['title'])));
              });

                },
              );
            },
            separatorBuilder:( context,  index) => const Divider(),
          );
        },
      ),
    );
  }
}

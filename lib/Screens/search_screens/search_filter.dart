import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/search_screens/list_of_cities.dart';

class SearchScreen extends StatefulWidget {
 const SearchScreen({Key? key}) : super(key: key);

  @override
   State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String>? searchedCities = [];
  final FocusNode _textFocusNode = FocusNode();
  var textEditingController = TextEditingController();
  // void dispose() {
  //   _textFocusNode.dispose();
  //   _textEditingController!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                focusNode: _textFocusNode,
                controller: textEditingController,
                onChanged: (value) {
                  setState(() {
                    searchedCities = listOfCites
                        .where((element) =>
                            element.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search_outlined),
                ),
              ),
            ),
            Expanded(
              child: textEditingController.text.isNotEmpty &&
                      searchedCities!.isEmpty
                  ? Center(
                      child: Text('No Record Found'),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.all(20),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            String city =textEditingController.text.isNotEmpty?searchedCities![index]:listOfCites[index];
                            debugPrint(city);
                            Navigator.pop(context,city);


                          },
                          leading: Icon(Icons.location_city_outlined),
                          title: Text(textEditingController.text.isNotEmpty?searchedCities![index]:listOfCites[index]),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.grey,
                          ),
                      itemCount: textEditingController.text.isNotEmpty?searchedCities!.length:listOfCites.length,),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: const Color(0xFFFFDC3D),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
            
          ),
        ),
        elevation: 1,
  title: const Text('Sell Your Mobile',style: TextStyle(fontFamily: 'Lato',fontSize: 17),),
      ),
      backgroundColor: Colors.white,
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          
          children:  [
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: (){},
               child: Column(
                 children: const [
                   Center(
                    child: Icon(Icons.add_a_photo,semanticLabel: 'Add Image',),
                    
                   ),
                 ],
               )
               ),
           
          ],
        ),
      ),
    ),
    );
  }
}
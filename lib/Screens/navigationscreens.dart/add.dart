import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mobihub_2/Models/post_model.dart';
class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles = [];
  final _auth = FirebaseAuth.instance;
  var titleController =TextEditingController();
  var descriptionController =TextEditingController();
  var priceController =TextEditingController();
  // string for displaying the error Message
  String? errorMessage;

  bool loading = false;

  List<XFile>? camerafiles;
  cameraImages(ImageSource source) async {
    try {
      var camfiles = await imgpicker.pickImage(source: ImageSource.camera);

      if (camfiles != null && imagefiles!.length<=11 ) {


        setState(() {
          imagefiles!.add(camfiles);
        });
      } else{
        Fluttertoast.showToast(msg: 'pictures should be 6 & less than 12s');
      }
      // ignore: empty_catches
    } catch (e) {
    }
  }

  openImages(ImageSource imageSource) async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      // ignore: unnecessary_null_comparison
      if (pickedfiles != null &&
          pickedfiles.isNotEmpty &&
          imagefiles!.length <= 11) {
        setState(() {
          imagefiles!.addAll(pickedfiles);
        });
      }else {
        Fluttertoast.showToast(msg: 'pictures should be 6 & less than 12s');
      }
      // ignore: empty_catches
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  // ignore: non_constant_identifier_names
  Widget BottomSheet() {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              cameraImages(ImageSource.camera);
            },
            leading: Icon(Icons.camera_alt_outlined),
            title: Text('Camera'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              openImages(ImageSource.gallery);
            },
            leading: Icon(Icons.image),
            title: Text('Gallery'),
          ),
        ],
      ),
    );
  }

  final List<String> cities = [
    'Peshawar',
    'Islamabad',
    'Lahore',
    'Karachi',
    'Sind',
    'Kohat',
    'Hangu',
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  final List<String> brand = [
    "Samsung",
    "Apple",
    "Google",
    "Oneplus"
        "Honor"
        "Vivo",
    "Infinix",
    "Tecno",
    "Oppo",
    "Xiaomi",
    "Huawei",
    "Itel"
        "Lg",
    "Motorola",
    "Nokia",
    "HTC",
    "Qmobile",
    "Haier",
    "Realme",
    "Sony",
    "ZTE",
    "Asus",
    "Microsoft",
    "Xmobile",
    "TCL",
    "Venus",
    "Blackberry",
    "Calme",
    "Digit",
    "Gfive",
    "Alcatel",
    "Dcode",
    "Gresso",
    "Jazz-digit",
    "Maxfone",
    "Me-mobile",
    "Meizu",
    "Oukitel",
    "Remaxx",
    "Vgo-tel",

  ];

  String? selectedValue3;
  final TextEditingController textEditingController3 = TextEditingController();

  void dispose3() {
    textEditingController.dispose();
    super.dispose();
  }

  final List<String> pta = [
    'PTA Approved',
    'Non Pta Approved',
  ];

  String? selectedValue4;
  final TextEditingController textEditingController4 = TextEditingController();

  void dispose4() {
    textEditingController.dispose();
    super.dispose();
  }

  final List<String> condition = [
    'Brand New',
    'As New',
    'Excellent',
    'Good',
    'Fair',
  ];

  String? selectedValue5;
  final TextEditingController textEditingController5 = TextEditingController();

  void dispose5() {
    textEditingController.dispose();
    super.dispose();
  }

  final List<String> warranty = [
    'Not Available',
    '1 Year',
    '11 Months',
    '10 Months',
    '9 Months',
    '8 Months',
    '7 Months',
    '6 Months',
    '5 Months',
    '4 Months',
    '3 Months',
    '2 Months',
    '1 Months',
  ];

  String? selectedValue6;
  final TextEditingController textEditingController6 = TextEditingController();

  void dispose6() {
    textEditingController.dispose();
    super.dispose();
  }
  final List<String> ramList = [
    'Below 1 GB',
    '1 GB',
    '2 GB',
    '3 GB',
    '4 GB',
    '5 GB',
    '6 GB',
    '7 GB',
    '8 GB',
    '9 GB',
    'Above 8 GB',

  ];
  String? ramSelection;
  final TextEditingController ramSelectionController = TextEditingController();

  void ramSelect() {
    ramSelectionController.dispose();
    super.dispose();
  }
  final List<String> colorList = [
    'Black',
    'White',
    'Blue',
    'Red',
    'Peach',
    'Purple',
    'Gold',
    'Gray',
    'Silver'
    ,

  ];
  String? colorSelection;
  final TextEditingController colorSelectionController = TextEditingController();

  void colorSelect() {
    colorSelectionController.dispose();
    super.dispose();
  }



  final List<String> memoryList = [
    '4 GB',
    '8 GB',
    '16 GB',
    '32 GB',
    '64 GB',
    '128 GB',
    '256 GB',
    '512 GB',


  ];
  String? memorySelection;
  final TextEditingController memorySelectionController = TextEditingController();

  void memorySelect() {
    memorySelectionController.dispose();
    super.dispose();
  }
  final List<String> batteryList = [
   '2800 mAh',
   '3200 mAh',
   '3800 mAh',
   '4200 mAh',
   '5000 mAh',

  ];
  String? batterySelection;
  final TextEditingController batterySelectionController = TextEditingController();

  void batterSelect() {
    batterySelectionController.dispose();
    super.dispose();
  }
  final List<String> cameraList = [
    '4 MP',
    '8 MP',
    '13 MP',
    '50 MP',
    '108 MP',


  ];
  String? cameraSelection;
  final TextEditingController cameraSelectionController = TextEditingController();

  void cameraSelect() {
    cameraSelectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading:  IconButton(
            onPressed:(){
              Navigator.pop(context);
            },icon:Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),),
          title: const Text(
            'Sell Your Mobile',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.amber[300],
        ),
        body: Padding(
          padding: const EdgeInsets.only( bottom: 10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Container(
                      alignment: Alignment.center,
                      //padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          //Container(),
                          imagefiles != null
                              ?

                              Container(
                                padding: EdgeInsets.all(20),
                                  height: 230,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    //color: Color(0xC5C5C0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.07),
                                        spreadRadius: 5,
                                        blurRadius: 2,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GridView.builder(
                                    itemCount: imagefiles!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(

                                          crossAxisCount: 3,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 10

                                          ),
                                      itemBuilder: (context, index) {
                                        return Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10)
                                              ,bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.only(right: 10,top: 10),
                                                width: 140,
                                                height: 140,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10)
                                                      ,bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)
                                                  ),
                                                ),
                                                child: Image.file(File(imagefiles![index].path),fit: BoxFit.cover,),
                                              ),
                                            ),
                                            Positioned(
                                                left: 53,
                                                bottom: 53,
                                                child: IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  imagefiles!.removeAt(index);
                                                });
                                              },icon: Icon(Icons.cancel_rounded,color: Colors.red,),
                                            )),

                                          ],
                                        );
                                      }),
                                )
                              : Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.red
                            ),
                            child: Center(child: Text(imagefiles!.length.toString(),style: TextStyle(color: Colors.white),)),
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(

                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                builder: ((builder) => BottomSheet()),
                              );

                            },
                            child: DottedBorder(
                              color: const Color(0xFFFFDC3D),
                              strokeWidth: 2,
                              dashPattern: const [6, 6],
                              child: Container(
                                height: 28,
                                width: double.infinity,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/add-photo.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Add Photos',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF000000),
                                          fontFamily: 'Lato1'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      controller: titleController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      maxLength: 40,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle:TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.bold),

                        icon: Image.asset('assets/icons/Title.png',height: 22,),


                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text is empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle:TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.bold),

                        icon: Image.asset('assets/icons/description.png',height: 22,),


                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text is empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: priceController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Price(PKR)',
                        hintStyle:TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.bold),

                        icon: Image.asset('assets/icons/price-tag.png',height: 22,),


                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text is empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10,),

                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10),
                    child:
                    DropdownButton2(

                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/location.png',height: 22,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Location',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      items: cities
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,fontWeight: FontWeight.w500
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 300,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: textEditingController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController.clear();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only( bottom: 10),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/Brand.png',height: 22,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Brand',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      items: brand
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue3,
                      onChanged: (value) {
                        setState(() {
                          selectedValue3 = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 300,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: textEditingController3,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: textEditingController3,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (value) => value == null
                                ? 'Please fill in your gender' : null,
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController3.clear();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/approved.png',height: 22,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'PTA',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      items: pta
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue4,
                      onChanged: (value) {
                        setState(() {
                          selectedValue4 = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 300,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: textEditingController4,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: textEditingController4,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController4.clear();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/condition.png',height: 22,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Condition',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      items: condition
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue5,
                      onChanged: (value) {
                        setState(() {
                          selectedValue5 = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 300,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: textEditingController5,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: textEditingController5,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController5.clear();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only( bottom: 10),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/warranty.png',height: 22,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Warranty',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      items: warranty
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue6,
                      onChanged: (value) {
                        setState(() {
                          selectedValue6 = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 300,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: textEditingController6,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: textEditingController6,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController6.clear();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 10),
                    child:
                    DropdownButton2(

                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/ram.png',height: 22,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Ram',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      items: ramList
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 14,fontWeight: FontWeight.w500
                          ),
                        ),
                      ))
                          .toList(),
                      value: ramSelection,
                      onChanged: (value) {
                        setState(() {
                          ramSelection = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 300,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: ramSelectionController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: ramSelectionController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          ramSelectionController.clear();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 10),
                    child:
                    DropdownButton2(

                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/memory-card.png',height: 22,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Memory',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      items: memoryList
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 14,fontWeight: FontWeight.w500
                          ),
                        ),
                      ))
                          .toList(),
                      value: memorySelection,
                      onChanged: (value) {
                        setState(() {
                          memorySelection = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 300,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: memorySelectionController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: memorySelectionController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          memorySelectionController.clear();
                        }
                      },
                    ),
                  ),


                  Padding(
                    padding:
                    const EdgeInsets.only( bottom: 10),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/Camera.png',height: 22,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Camera',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      items: cameraList
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ))
                          .toList(),
                      value: cameraSelection,
                      onChanged: (value) {
                        setState(() {
                          cameraSelection = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 300,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: cameraSelectionController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: cameraSelectionController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          cameraSelectionController.clear();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 10),
                    child:
                    DropdownButton2(

                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/battery.png',height: 22,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Battery',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      items: batteryList
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 14,fontWeight: FontWeight.w500
                          ),
                        ),
                      ))
                          .toList(),
                      value: batterySelection,
                      onChanged: (value) {
                        setState(() {
                          batterySelection = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 300,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: batterySelectionController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: batterySelectionController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          batterySelectionController.clear();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 10),
                    child:
                    DropdownButton2(

                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/color.png',height: 22,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              'Color',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      items: colorList
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 14,fontWeight: FontWeight.w500
                          ),
                        ),
                      ))
                          .toList(),
                      value: colorSelection,
                      onChanged: (value) {
                        setState(() {
                          colorSelection = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 300,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: colorSelectionController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(

                            controller: colorSelectionController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an item...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (String? value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter a valid type of business';
                              }},

                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          colorSelectionController.clear();
                        }
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFEFEF),
                    ),
                    child: Text('Contact Information',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      controller: titleController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      maxLength: 40,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle:TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.bold),

                        icon: Image.asset('assets/icons/name.png',height: 22,),


                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text is empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        hintStyle:TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.bold),

                        icon: Image.asset('assets/icons/number.png',height: 22,),


                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Text is empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 70,top: 10),
                    child: Row(
                      children: [
                        Image.asset('assets/icons/whatsapp.png',width: 35,height: 35,),
                        Text(' Allow WhatsApp Contact',style: TextStyle(fontSize: 15,color: Colors.grey),),

                      ],
                    ),
                  ),


                  SizedBox(height: 20,),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {

                            if(imagefiles!.length<6){
                              Fluttertoast.showToast(msg: 'Select minimum 6 images');
                              return ;
                            }else if(imagefiles!.length==null && imagefiles!.isEmpty){
                              Fluttertoast.showToast(msg: 'First Select images');
                              return ;
                            }
                            try{
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Proccessing !')));
                              await postDetailsToFirestore();

                            }on FirebaseException catch(e){
                              Fluttertoast.showToast(msg: e.toString());

                            }



                        }


                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.amber[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Center(
                            child:loading?Center(
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width*0.1,
                                  height: MediaQuery.of(context).size.width*0.1,
                                  child: CircularProgressIndicator(color: Colors.black,)),
                            ): Text(
                          'Add Item',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  List<String> imageUrls=[];
  postDetailsToFirestore() async {
    var uid =FirebaseAuth.instance.currentUser!.uid;
    setState(() {
      loading=true;
    });
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


    PostModel postModel=PostModel();
    postModel.title=titleController.text;
    postModel.desc=descriptionController.text;
    postModel.price=priceController.text;
    postModel.location=selectedValue;
    postModel.brand=selectedValue3;
    postModel.pta=selectedValue4;
    postModel.condtion=selectedValue5;
    postModel.warranty=selectedValue6;
    postModel.ram=ramSelection;
    postModel.memory=memorySelection;
    postModel.camera=cameraSelection;
    postModel.battery=batterySelection;
    postModel.color=colorSelection;
    postModel.images=imageUrls;
    postModel.uid=uid;
    await uploadImages();

    await firebaseFirestore
        .collection("Posts")
        .doc(uid.toString())
        .set(postModel.toMap());
    setState(() {
      loading=false;
    });
    Fluttertoast.showToast(msg: 'Post successfully added');
    Navigator.pop(context);

  }
 Future postImages(XFile? imageFile) async{
    String urls;
    Reference ref=FirebaseStorage.instance.ref().child('posts').child(imageFile!.name);
    await ref.putData(await imageFile.readAsBytes());
     urls=await ref.getDownloadURL();
     return urls;
 }
 uploadImages()async{
    for(var image in imagefiles!){
      await postImages(image).then((value) => imageUrls.add(value));
    }
 }
}

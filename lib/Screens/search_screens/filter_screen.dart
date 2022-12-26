import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mobihub_2/Screens/search_screens/filter_detail_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
bool loading=false;


  double _currentSliderValue = 0;
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
        backgroundColor: Color(0xFFFFDC3D),
        title: Text('Refine Your Product'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 10,),
                Image.asset('assets/icons/price-tag.png',width: 25,height: 25,),
                SizedBox(width: 15,),
                Text('Price Range(PKR)',style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child: Text(_currentSliderValue.toInt().toString())),
                ),
                Text('to'),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child: Text('Any')),
                ),
              ],
            ), SizedBox(height: 10,),
            //Price Range
            Slider.adaptive(
              value: _currentSliderValue,
              max: 300000,
              divisions: 20,
              activeColor: Colors.white,
              inactiveColor: Colors.black54,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            //Location
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
            //Brand
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
            //PTA
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
            //WARRANTY
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
            //RAM
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
            //Memory
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

            //Camera
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


          ],
        ),
      ),
        floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width*0.70,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFFFDC3D),
          borderRadius: BorderRadius.circular(15)
        ),
        child: TextButton(
          onPressed: ()async{
            setState((){
              loading=true;
            });
           await Navigator.push(context, MaterialPageRoute(builder: (_)=>FilterDetailScreen(price:_currentSliderValue.toInt() , location: selectedValue, pta: selectedValue4, brand: selectedValue3, warranty: selectedValue6, ram: ramSelection, memory: memorySelection, camera: cameraSelection)));
            setState((){
              loading=false;
            });
          },child: loading==true?
        Center(
            child: SizedBox(width: 20,height: 20,
              child: CircularProgressIndicator(),))
            :Text('Apply Filter',style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}

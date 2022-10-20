import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController ram = TextEditingController();
  TextEditingController rom = TextEditingController();
  TextEditingController battery = TextEditingController();
  TextEditingController price1 = TextEditingController();
  TextEditingController price2 = TextEditingController();

  final List<String> items = [
    'All Cities',
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

  final List<String> items3 = [
    'All Compeny',
    'Apple',
    'Huawei',
    'Samsung',
    'Appo',
    'Infinix',
    'Vivo',
    'Nokai',
  ];

  String? selectedValue3;
  final TextEditingController textEditingController3 = TextEditingController();

  @override
  // ignore: override_on_non_overriding_member
  void dispose3() {
    textEditingController.dispose();
    super.dispose();
  }

  final List<String> items4 = [
    'All Details',
    'PTA Approved',
    'Non Pta Approved',
    'For One Month',
    'Sim Working',
  ];

  String? selectedValue4;
  final TextEditingController textEditingController4 = TextEditingController();

  @override
  // ignore: override_on_non_overriding_member
  void dispose4() {
    textEditingController.dispose();
    super.dispose();
  }

  final List<String> items5 = [
    'All Condition',
    'New',
    'Used',
    'Used Like New',
  ];

  String? selectedValue5;
  final TextEditingController textEditingController5 = TextEditingController();

  // ignore: override_on_non_overriding_member
  void dispose5() {
    textEditingController.dispose();
    super.dispose();
  }

  final List<String> items6 = [
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
  

  fillInitialData() {
    items.addAll(items);
  }

  fillInitialData2() {
    items.addAll(items3);
  }

  fillInitialData3() {
    items.addAll(items4);
  }

  fillInitialData4() {
    items.addAll(items5);
  }

  fillInitialData5() {
    items.addAll(items6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color(0xFFFFDC3D),
        title: const Text(
          'Refine Your Search',
          style: TextStyle(fontFamily: 'Lato', fontSize: 17),
        ),
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
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButtonHideUnderline(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 5, bottom: 10),
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).hintColor,
                              fontWeight: FontWeight.bold),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 250.0),
                    child: Text(
                      'Price',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                        child:  TextField(
                          keyboardType: TextInputType.number,
                          controller: price1,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              hintText: '0'),
                        ),
                      ),
                      const Text(
                        'To',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                        child:  TextField(
                          keyboardType: TextInputType.number,
                          controller: price2,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              hintText: 'Any'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonHideUnderline(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 5, bottom: 10),
                      child: DropdownButton2(
                        // underline: SizedBox.square(),
                        isExpanded: true,
                        hint: Text(
                          'Brand',
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).hintColor,
                              fontWeight: FontWeight.bold),
                        ),
                        items: items3
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
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
                  ),
                  DropdownButtonHideUnderline(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 5, bottom: 10),
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          'PTA',
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).hintColor,
                              fontWeight: FontWeight.bold),
                        ),
                        items: items4
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
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
                  ),
                  DropdownButtonHideUnderline(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 5, bottom: 10),
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          'Condition',
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).hintColor,
                              fontWeight: FontWeight.bold),
                        ),
                        items: items5
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
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
                  ),
                  DropdownButtonHideUnderline(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 5, bottom: 10),
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          'Warranty',
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).hintColor,
                              fontWeight: FontWeight.bold),
                        ),
                        items: items6
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: ram,
                        keyboardType: TextInputType.number,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Plase fill the text';
                          }
                          return null;
                        }),
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                            hintText: 'RAM',
                            hintStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            // prefixIcon: Icon(
                            //   Icons.location_on_outlined,
                            //   size: 20,
                            // ),
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                    child: Form(
                      key: _formKey2,
                      child: TextFormField(
                        controller: rom,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Plase fill the text ';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                                
                            hintText: 'ROM',
                            hintStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            // prefixIcon: Icon(
                            //   Icons.ramen_dining,
                            //   size: 20,
                            // ),
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                    child: Form(
                      key: _formKey3,
                      child: TextFormField(
                        controller: battery,
                        keyboardType: TextInputType.number,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Plase fill the text';
                          }
                          return null;
                        }),
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                            hintText: 'Battery',
                            hintStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            // prefixIcon: Icon(
                            //   Icons.ac_unit_outlined,
                            //   size: 20,
                            // )
                            ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                  //   child: Form(
                  //     key: _formKey,
                  //     child: TextFormField(
                  //       validator: ((value) {
                  //         if (value == null || value.isEmpty) {
                  //           return 'Plase fill the text';
                  //         }
                  //         return null;
                  //       }),
                  //       decoration: const InputDecoration(
                  //           contentPadding:
                  //               EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                  //           hintText: 'Back Camera',
                  //           hintStyle: TextStyle(
                  //               fontSize: 15, fontWeight: FontWeight.bold),
                  //           prefixIcon: Icon(
                  //             Icons.location_on_outlined,
                  //             size: 20,
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                  //   child: Form(
                  //     key: _formKey,
                  //     child: TextFormField(
                  //       validator: ((value) {
                  //         if (value == null || value.isEmpty) {
                  //           return 'Plase fill the text';
                  //         }
                  //         return null;
                  //       }),
                  //       decoration: const InputDecoration(
                  //           contentPadding:
                  //               EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                  //           hintText: 'Front Camera',
                  //           hintStyle: TextStyle(
                  //               fontSize: 15, fontWeight: FontWeight.bold),
                  //           prefixIcon: Icon(
                  //             Icons.location_on_outlined,
                  //             size: 20,
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            items.clear();
                            fillInitialData();
                            items3.clear();
                            fillInitialData2();
                            items4.clear();
                            fillInitialData3();
                            items5.clear();
                            fillInitialData4();
                            items6.clear();
                            fillInitialData5();
                            ram.clear();
                            rom.clear();
                            battery.clear();
                            price1.clear();
                            price2.clear();
                          

                          });
                        },
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.amber[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text(
                            'Reset All',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing !')));
                          }
                          if (_formKey2.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing !')));
                          }
                          if (_formKey3.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing !')));
                          }
                          
                        },
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.amber[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text(
                            'Apply Now',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

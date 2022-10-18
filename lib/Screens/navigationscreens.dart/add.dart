
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      // ignore: unnecessary_null_comparison
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        //print("No image is selected.");
      }
    } catch (e) {
      //print("error while picking file.");
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color(0xFFFFDC3D),
        title: const Text(
          'Sell Your Mobile',
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
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: GestureDetector(
                    onTap: () {
                      openImages();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text("Add Images"),
                          const Divider(),
                          //const Text("Picked Files:"),
                          const Divider(),

                          imagefiles != null
                              ? Wrap(
                                  children: imagefiles!.map((imageone) {
                                    return Card(
                                      child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.file(File(imageone.path)),
                                      ),
                                    );
                                  }).toList(),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                DropdownButtonHideUnderline(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 5, bottom: 10),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).hintColor,
                        ),
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
                DropdownButtonHideUnderline(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 5, bottom: 10),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Brand',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).hintColor,
                        ),
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
                          fontSize: 18,
                          color: Theme.of(context).hintColor,
                        ),
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
                          fontSize: 18,
                          color: Theme.of(context).hintColor,
                        ),
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
                          fontSize: 18,
                          color: Theme.of(context).hintColor,
                        ),
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
                  child: TextFormField(
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                        hintText: 'RAM',
                        prefixIcon: Icon(Icons.location_on_outlined)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                        hintText: 'ROM',
                        prefixIcon: Icon(Icons.ramen_dining)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                        hintText: 'Battery',
                        prefixIcon: Icon(Icons.ac_unit_outlined)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (ctx) => DetialScreen(),
                      //   ),
                      // );
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFDC3D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text(
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
        ));
  }
}


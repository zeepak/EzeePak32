import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


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
  List<XFile>? imagefiles;

  openImages(ImageSource source) async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      // ignore: unnecessary_null_comparison
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
      }
    // ignore: empty_catches
    } catch (e) {
    }
  }

  // ignore: non_constant_identifier_names
  Widget BottomSheet() {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              openImages(ImageSource.camera);
            },
            child: const ListTile(
              leading: Icon(Icons.camera_alt_outlined),
              title: Text('Camera'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              openImages(ImageSource.gallery);
            },
            child: const ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
            ),
          ),
        ],
      ),
    );
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
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          title: const Text(
            'Sell Your Mobile',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.amber[300],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.amberAccent)),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((builder) => BottomSheet()),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Add Image',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(),
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
                            : Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                      ],
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
                DropdownButtonHideUnderline(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 5, bottom: 10),
                    child: DropdownButton2(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Plase Fill The Text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                          hintText: 'RAM',
                          hintStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.location_on_outlined)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                  child: Form(
                    key: _formKey2,
                    child: TextFormField(
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Plase fill the Text';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                          hintText: 'ROM',
                          hintStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.ramen_dining)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                  child: Form(
                    key: _formKey3,
                    child: TextFormField(
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Plase fill the text';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                          hintText: 'Battery',
                          hintStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.ac_unit_outlined)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Proccessing !')));
                      }
                      if (_formKey2.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Proccessing !')));
                      }
                      if (_formKey3.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Proccessing !')));
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







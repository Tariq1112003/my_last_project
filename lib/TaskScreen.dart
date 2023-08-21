import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_last_project/task_screen.dart';
import 'd.dart';
import 'dd.dart';
import 'main.dart';
class RoutesPage extends StatefulWidget {
  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

final List<Widget> pages = [
  HomePage(),
  FinishPage(
    selectedHospitals: [],
  ),
  ChatGPT(),
];

class _RoutesPageState extends State<RoutesPage> {
  Widget currentPage = pages[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: Colors.white,
          color: Color(0xff003B73),
          animationDuration: Duration(milliseconds: 300),
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.green,
            ),
            Icon(
              Icons.work,
              size: 30,
              color: Color(0xFFBFD7ED),
            ),
            Icon(
              Icons.help_outline_outlined,
              size: 30,
              color: Color(0xFFBFD7ED),
            ),
          ],
          onTap: (indexOfCurrentPage) {
            setState(() {
              currentPage = pages[indexOfCurrentPage];
            });
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          elevation: 0.0,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String value) {
                switch (value) {

                  case 'exit':
                    Navigator.pop(context);
                }
              },
              itemBuilder: (BuildContext context) {
                return { 'exit'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
              DrawerHeader(
                child: Container(
                  child: Image.asset("assets/images/tar.jpg"),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                title: Text('Main page', style: TextStyle(fontSize: 20),
    ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>MyApp(),
                    ),
                  );
                  // Handle home navigation
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.insert_page_break_sharp,
                  color: Colors.blue,
                ),
                title: Text(' Version 1.0',  style: TextStyle(fontSize: 20),
    ),
                onTap: () {

                  // Handle settings navigation
                },
              ),
              ListTile(
                leading: Icon(Icons.people,color: Colors.black,),
                title: const Text(
                  'About us',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => about()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings,color: Colors.grey,),
                title: const Text(
                  'Settings',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.temple_hindu_sharp,color: Colors.yellow,),
                title: const Text(
                  'about institution',  style: TextStyle(fontSize: 20),

                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => about_clinic()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app,color: Colors.red,),
                title: const Text(
                  'Exit',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ])),
        backgroundColor: Colors.deepOrange,

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 30.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/hhh.jpg"),
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                      SizedBox(width: 55),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          child: Text(
                            'Jami High School Library',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: currentPage,
              ),
            )
          ],
        ));
  }

  CurvedNavigationBar({required int height, required Color backgroundColor, required Color color, required Duration animationDuration, required List<Widget> items, required Null Function(dynamic indexOfCurrentPage) onTap}) {}
}


//111111111

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Hospital> hospitals = [];

  DateTime selectedTime = DateTime.now();
  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in doctors_name) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  List<String> doctors_name = ["", ""];
  List<Hospital> selectedHospitals = [];

  @override
  Widget build(BuildContext context) {
    getDropdownItems();
    return Scaffold(

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.add),
          onPressed: () async{
            var result = await showModalBottomSheet(context: context, builder: (context)=> AddScreen());
            print(result);
            hospitals.addAll(result);
            setState(() {

            });
          },

        ),
        appBar: AppBar(actions: [
          ElevatedButton(
              onPressed:() {
        Navigator.push(
         context,
         MaterialPageRoute(
       builder: (context) =>TaskScreen(),
      ),
       );
    // Handle home navigation
        },

            child:Text("To Do"))],
          title: Text("Enter The Applicants information",style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // leading: CircleAvatar(
                      //   backgroundImage: AssetImage(hospitals[index].imagePath),
                      // ),
                      title: Row(
                        children: [
                          Icon(Icons.person,color: Colors.deepOrange),
                          Text("  ${hospitals[index].name}  "),
                          Icon(Icons.numbers,color: Colors.deepOrange),
                          Text("  ${hospitals[index].Price} Number "),

                        ],
                      ),
                      // Text(
                      //   'Name = ${hospitals[index].name} _ Price = ${hospitals[index].Price} AFG _ Doctor = ${hospitals[index].doctorName}',
                      // ),
                      subtitle: Row(
                        children: [
                          // Text(
                          //   DateFormat('yyyy-MM-dd – kk:mm').format(hospitals[index].time),
                          // ),
                          SizedBox(width: 5,),
                          Icon(Icons.note,color: Colors.orange,),
                          Text(" ${hospitals[index].doctorName} "),

                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          IconButton(
                            icon: Icon(Icons.info,color: Colors.deepOrangeAccent),

                            onPressed: () {

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Student information'),
                                    content: Text("${hospitals[index].info} "),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {

                                          Navigator.pop(context);
                                        },
                                        child: Text('Exit'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete,color: Colors.deepOrangeAccent),
                            onPressed: () {
                              setState(() {
                                hospitals.removeAt(index);
                              });
                            },
                          ),
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.deepOrange,
                            side: BorderSide(color: Colors.deepOrange),
                            value: hospitals[index].isChecked,
                            onChanged: (value) {
                              setState(() {
                                hospitals[index].isChecked = value!;
                                if (value!) {
                                  selectedHospitals.add(hospitals[index]);
                                } else {
                                  selectedHospitals.remove(hospitals[index]);
                                }
                                if (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FinishPage(
                                        selectedHospitals: selectedHospitals,
                                      ),
                                    ),
                                  );
                                }
                              });
                            },
                          ),

                        ],
                      ),
                      // Rest of your ListTile properties...
                    );
                  },
                ),
              ),


            ],
          ),
        )
    );
  }
}


//2222222222222222222

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final controller = TextEditingController();
  final controllerprice = TextEditingController();
  final controllerinfo = TextEditingController();


  final List<Hospital> hospitals = [];

  DateTime selectedTime = DateTime.now();
  File? _image;

  get isChecked => null;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  String selectedCurrency = "";

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in doctors_name) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  List<String> doctors_name = ["", ""];
  List<Hospital> selectedHospitals = [];
  String userNotes = '';

  @override
  Widget build(BuildContext context) {
    getDropdownItems();
    return Scaffold(
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 30,left: 30,bottom: 5,top: 15),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 3,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.deepOrange,
                    width: 3,
                  ),
                ),
                labelText: 'Enter name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30,left: 30,bottom: 5,top: 15),
            child: TextField(
              controller: controllerprice,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 3,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.deepOrange,
                    width: 3,
                  ),
                ),
                labelText: 'Enter id',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30,left: 30,bottom: 14,top: 20),
            child: TextField(
              controller: controllerinfo,
              onChanged: (value) {
                userNotes = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 3,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.deepOrange,
                    width: 3,
                  ),
                ),
                labelText: 'Enter the book name',
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
              MaterialButton(
                color: Colors.deepOrange,
                height: 55,
                minWidth: 90,
                child: Text(
                  'Select the Time',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedTime,
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedTime)
                    setState(() {
                      selectedTime = picked;
                    });
                },
              ),
              SizedBox(
                width: 70,
              ),
              SizedBox(width: 30,),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            height: 50,
            minWidth: 50,
            color: Colors.deepOrange,
            child: Text(
              'Add The Student Information',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                hospitals.add(Hospital(
                  name: controller.text,
                  time: selectedTime,
                  imagePath: '',
                  doctorName: selectedCurrency,
                  Price: controllerprice.text,
                  info: controllerinfo.text,
                ));
                controller.clear();
                Navigator.pop(context,hospitals);
              }
              );
            },
          ),

        ]));
  }
}
//1111111111111
class Hospital {
  final String name;
  final DateTime time;
  final String imagePath;
  bool isChecked;
  final String doctorName;
  final String Price;
  final String info;

  Hospital(
      {required this.Price,
        required this.doctorName,
        required this.name,
        required this.info,
        required this.time,
        required this.imagePath,
        this.isChecked = false});
}
//222222222
class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  State<ChatGPT> createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,),
    );
  }
}
//1111111
class FinishPage extends StatelessWidget {
  final List<Hospital> selectedHospitals;

  const FinishPage({required this.selectedHospitals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('End Page',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: selectedHospitals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Student Name is : ${selectedHospitals[index].name}'),
          );
        },
      ),
    );
  }
}
//33333




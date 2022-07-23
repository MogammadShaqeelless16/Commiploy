import 'package:commiploy/pages/user%20screens/profile_page.dart';
import 'package:commiploy/pages/user%20screens/user_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commiploy/responsive/desktop_body.dart';
import 'package:commiploy/responsive/mobile_body.dart';
import 'package:commiploy/responsive/responsive_layout.dart';
import 'package:commiploy/responsive/tablet_body.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../pages/user screens/add_job_page.dart';
import '../pages/user screens/jobs_page.dart';
import '../pages/user screens/message_page.dart';
import '../pages/user screens/settings_page.dart';
import 'job_card.dart';


class Menubar extends StatefulWidget {
  const Menubar({Key? key}) : super(key: key);

  @override
  State<Menubar> createState() => _MenubarState();
}

class _MenubarState extends State<Menubar> {
  int _selectIndex = 0;

  //Create a list of document Id

/*  List<String> docIDs = [];

  Future getDocIDs() async{
    //Pulls the list database
    await FirebaseFirestore.instance.collection('users').get().then((snapshot) => snapshot.docs.forEach((document) {
      docIDs.add(document.reference.id);
    }));
  }*/

  final List<Widget> _pages =[
    UserHomePage(),
    JobsPage(),
    AddJobPage(),
    MessagePage(),
    SettingsPage(),
  ];

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /*AppBar: AppBar(
        backgroundColor: Colors.white,
        title:Text("Commiploy",
          style: TextStyle(fontSize: 16, color: Colors.black,),
        ),
        actions:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {

            },
              icon: Icon(Icons.notifications_none,color: Colors.black,),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
                icon: Icon(Icons.person,color: Colors.black,),),
          ),
        ],
        /*title:Text(user.email!,
        style: TextStyle(fontSize: 16),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Icon(Icons.logout),
          )
        ],*/
      ),*/
      body: ResponsiveLayout(
        mobileBody: const MobileScaffold(),
        tabletBody: const TabletScaffold(),
        desktopBody: const DesktopScaffold(),
      ),



      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical:20 ),
          child: GNav(
            onTabChange: (index){
              setState(() {
                _selectIndex = index;
              });
            },
            selectedIndex: _selectIndex,
            gap: 8,
            backgroundColor: Colors.white,
            color: Colors.black,
            tabBackgroundColor: Colors.grey,
            padding: EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.cases_outlined,
                text: 'Jobs',
              ),
              GButton(
                icon: Icons.add,
                text: 'Add Job',
              ),
              GButton(
                icon: Icons.chat_outlined,
                text: 'Chat',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
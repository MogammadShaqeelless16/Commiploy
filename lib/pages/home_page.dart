import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commiploy/pages/user%20screens/add_job_page.dart';
import 'package:commiploy/pages/user%20screens/jobs_page.dart';
import 'package:commiploy/pages/user%20screens/message_page.dart';
import 'package:commiploy/pages/user%20screens/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;

  //Create a list of document Id

/*  List<String> docIDs = [];

  Future getDocIDs() async{
    //Pulls the list database
    await FirebaseFirestore.instance.collection('users').get().then((snapshot) => snapshot.docs.forEach((document) {
      docIDs.add(document.reference.id);
    }));
  }

  final List<Widget> _pages =[
    HomePage(),
    JobsPage(),
    AddJobPage(),
    MessagePage(),
    SettingsPage(),

  ]; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {

            },
              icon: Icon(Icons.notifications_none),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {

            },
                icon: Icon(Icons.person),),
          ),
        ],
        title:Text("Commiploy",
        style: TextStyle(fontSize: 16),),
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
        //test pull request
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical:20 ),
          child: GNav(
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

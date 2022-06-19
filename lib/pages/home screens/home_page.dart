import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'job_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;

  final List jobsForYou = [
    ['Facebook', 'Ui Designer','assets/icon/jobs/fb_Job.png','45'],
    ['Whatsapp', 'Product Dev','assets/icon/jobs/Whatsapp_Job.png','80'],
    ['Linkedin', 'Senior Dev','assets/icon/jobs/Linkedin_Job.png','30'],
  ];

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
        backgroundColor: Colors.white,
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

            },
                icon: Icon(Icons.person,color: Colors.black,),),
          ),
        ],
        title:Text("Commiploy",
        style: TextStyle(fontSize: 16, color: Colors.black,),
        ),
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
      ),


        body: Column(
          children: [
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Discover a New Path",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                ),
              ),
            ),
          SizedBox(height: 10,),
          //Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 30,
                            child: Icon(Icons.search_rounded),
                            color: Colors.grey[200],
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search for a Job',
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  height: 50,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.filter_list , color: Colors.white,),
                ),
              ],
            ),
          ),

            //For page
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("For You",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Container(
              height: 160,
              child: ListView.builder(
                  itemCount: jobsForYou.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return JobCard(
                      CompanyName: jobsForYou[index][0],
                      jobTitle: jobsForYou[index][1],
                      logoImagePath: jobsForYou[index][2],
                      hourlyRate: jobsForYou[index][3],
                    );
              }),

            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Recently Added",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                ),
              ),
            ),

        ],
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
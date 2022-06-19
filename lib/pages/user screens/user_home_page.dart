import 'package:flutter/material.dart';

import '../../Widgets/job_card.dart';



class UserHomePage extends StatelessWidget {
  final List jobsForYou = [
    ['Facebook', 'Ui Designer','assets/icon/jobs/fb_Job.png','45'],
    ['Whatsapp', 'Product Dev','assets/icon/jobs/Whatsapp_Job.png','80'],
    ['Linkedin', 'Senior Dev','assets/icon/jobs/Linkedin_Job.png','30'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
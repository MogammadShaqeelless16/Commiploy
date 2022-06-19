import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String CompanyName;
  final String jobTitle;
  final String logoImagePath;
  final String hourlyRate;

  JobCard({
    required this.CompanyName,
    required this.jobTitle,
    required this.logoImagePath,
    required this.hourlyRate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 200,
          color: Colors.grey[200],
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                      child:Image.asset(logoImagePath),

                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Text('Part Time',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.grey[500],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(
                    jobTitle,
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Text(
                 '\R' + hourlyRate.toString() + '/hr'
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../app_colors.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        title: Text('Our Services', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.background1,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: AppColors.background1,
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[ 
            ServiceCard(
              title: 'Web Development',
              description: 'Building responsive and modern websites.',
              icon: Icons.web,
            ),
            ServiceCard(
              title: 'Mobile App Development',
              description: 'Creating amazing mobile applications.',
              icon: Icons.mobile_friendly,
            ),
            ServiceCard(
              title: 'UI/UX Design',
              description: 'Crafting user-friendly interfaces.',
              icon: Icons.design_services,
            ),
            // Add more services as needed
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background2,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(icon, color: AppColors.green, size: 40),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

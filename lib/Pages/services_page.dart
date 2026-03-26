import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Services'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Color(0xFF121212), // Dark theme background
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
      color: Colors.grey[850],
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.white, size: 40),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 22),
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
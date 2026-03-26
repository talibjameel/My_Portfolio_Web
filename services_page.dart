import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Services'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildServiceCard(
                context,
                'Mobile App Development',
                'Build high-quality mobile applications for both Android and iOS platforms, ensuring a seamless user experience.',
              ),
              _buildServiceCard(
                context,
                'Web Development',
                'Create modern and responsive websites that meet today’s standards, focusing on user-friendly interfaces.',
              ),
              _buildServiceCard(
                context,
                'Backend API Development',
                'Develop robust and scalable backend systems that power your applications and services.',
              ),
              _buildServiceCard(
                context,
                'Cloud Solutions',
                'Implement cloud-based solutions that enhance efficiency and scalability for your business.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, String description) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
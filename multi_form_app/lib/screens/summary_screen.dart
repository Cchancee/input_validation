import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String dob;
  final String gender;

  const SummaryScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.dob,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Summary")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Name: $name",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Email: $email",
                style: const TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Phone: $phone",
                style: const TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Address: $address",
                style: const TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "DOB: $dob",
                style: const TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Gender: $gender",
                style: const TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
              style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 195, 216, 225),
                    textStyle: const TextStyle(fontSize: 16),
                    padding: const EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
              child: const Text("Done"),
            ),
          ],
        ),
      ),
    );
  }
}

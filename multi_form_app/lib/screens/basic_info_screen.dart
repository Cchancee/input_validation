import 'package:flutter/material.dart';
import 'additional_info_screen.dart';

/// This screen collects the user's basic information such as name, email, and phone number.
/// It validates each input before allowing the user to proceed to the next screen.
class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  _BasicInfoScreenState createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  /// GlobalKey to track the form state and validate inputs.
  final _formKey = GlobalKey<FormState>();

  /// Controllers for handling text input values.
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  /// Validates the name input.
  /// - Ensures the name is not empty and has at least 3 characters.
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return "Name is required";
    if (value.length < 3) return "Name must be at least 3 characters";
    return null;
  }

  /// Validates the email input.
  /// - Ensures the email follows a valid format.
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return "Email is required";
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  /// Validates the phone number input.
  /// - Ensures it is a 10-digit number.
  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) return "Phone is required";
    if (!RegExp(r"^\d{10}$").hasMatch(value)) return "Enter a valid 10-digit phone number";
    return null;
  }

  /// Navigates to the next screen if all validations pass.
  void goToNextScreen() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdditionalInfoScreen(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Basic Info")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// Input field for Name
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: validateName,
              ),
              const SizedBox(height: 10),

              /// Input field for Email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
              ),
              const SizedBox(height: 10),

              /// Input field for Phone Number
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Phone"),
                keyboardType: TextInputType.phone,
                validator: validatePhone,
              ),
              const SizedBox(height: 40),

              /// Next button to navigate to the Additional Info Screen
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: goToNextScreen,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromARGB(255, 195, 216, 225),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

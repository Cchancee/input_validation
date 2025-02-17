import 'package:flutter/material.dart';
import 'summary_screen.dart';

/// This screen collects additional user information such as address, date of birth, gender, and password.
/// It ensures all inputs are validated before proceeding to the summary screen.
class AdditionalInfoScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;

  const AdditionalInfoScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  _AdditionalInfoScreenState createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  /// GlobalKey to track the form state and validate inputs.
  final _formKey = GlobalKey<FormState>();

  /// Controllers for handling text input values.
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  /// Stores the selected gender value.
  String? selectedGender;

  /// Validates the address input.
  String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) return "Address is required";
    return null;
  }

  /// Validates the date of birth input.
  String? validateDOB(String? value) {
    if (value == null || value.trim().isEmpty) return "Date of birth is required";
    return null;
  }

  /// Validates the password input.
  /// - Ensures it has at least 6 characters.
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  /// Opens a date picker for selecting the date of birth.
  void selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  /// Validates the form and navigates to the summary screen.
  void submitForm() {
    if (_formKey.currentState!.validate() && selectedGender != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SummaryScreen(
            name: widget.name,
            email: widget.email,
            phone: widget.phone,
            address: addressController.text,
            dob: dobController.text,
            gender: selectedGender!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Additional Info")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// Input field for Address
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: "Address"),
                validator: validateAddress,
              ),
              const SizedBox(height: 10),

              /// Input field for Date of Birth
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: selectDate,
                  ),
                ),
                readOnly: true,
                validator: validateDOB,
              ),
              const SizedBox(height: 10),

              /// Dropdown field for Gender selection
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Gender"),
                value: selectedGender,
                items: ["Male", "Female", "Other"]
                    .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                validator: (value) => value == null ? "Select a gender" : null,
              ),
              const SizedBox(height: 10),

              /// Input field for Password
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: validatePassword,
              ),
              const SizedBox(height: 20),

              /// Submit button to proceed to Summary Screen
              ElevatedButton(
                onPressed: submitForm,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromARGB(255, 195, 216, 225),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../style_file.dart';

class AddNewReview extends StatefulWidget {
  const AddNewReview({super.key});

  @override
  State<AddNewReview> createState() => _AddNewReviewState();
}

class _AddNewReviewState extends State<AddNewReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AppBar(
                  title: const Text(
                    'Create Review',
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                  leading: const BackButton(
                    color: Colors.black54,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  style: const TextStyle(fontSize: 22),
                  decoration: appInputStyle('First Name'),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  style: const TextStyle(fontSize: 22),
                  decoration: appInputStyle('Last Name'),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  maxLines: 7,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 22),
                  decoration: const InputDecoration(
                    hintText: 'Write Review',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: buttonStyle(),
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

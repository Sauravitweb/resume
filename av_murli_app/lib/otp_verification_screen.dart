import 'package:flutter/material.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPVerificationScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isVerifying = false;

  Future<void> _verifyOTP() async {
    setState(() {
      _isVerifying = true;
    });

    try {
      // Simulate OTP verification process
      // You can integrate your OTP verification logic here
      await Future.delayed(Duration(seconds: 2));

      // After successful verification, navigate to the next screen
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification failed: $e')),
      );
    } finally {
      setState(() {
        _isVerifying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Enter the OTP sent to ${widget.phoneNumber}'),
            const SizedBox(height: 10),
            TextField(
              controller: _otpController,
              decoration: InputDecoration(labelText: 'OTP'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            _isVerifying
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _verifyOTP,
                    child: Text('Verify'),
                  ),
          ],
        ),
      ),
    );
  }
}

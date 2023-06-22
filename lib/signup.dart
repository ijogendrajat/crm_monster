// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isOtpVerified = false;
  final List<String> items = [
    'Technology',
    'Healthcare',
    'Financial',
    'Energy',
    'Retail',
  ];
  String? selectedValue;
  TextEditingController _companyId = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _otp = TextEditingController();
  TextEditingController _password = TextEditingController();
  void _verifyOtp() {
    setState(() {
      _isOtpVerified = true;
    });
  }

  void _signupBtn() {}
  void _loginBtn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Create company account",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: _companyId,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Company ID",
                    hintText: "211318",
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 75,
                child: IntlPhoneField(
                  dropdownIconPosition: IconPosition.trailing,
                  controller: _mobileNumber,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Mobile",
                    hintText: "Enter you mobile",
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    //print(phone.completeNumber);
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              _isOtpVerified
                  ? Text(
                      '@ Phone number is verified',
                      style: TextStyle(fontSize: 16.0, color: Colors.green),
                    )
                  : SizedBox(
                      height: 128,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // otp send
                          Text("OTP sent to your number"),
                          SizedBox(
                            height: 14,
                          ),
                          // otp row
                          SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: TextField(
                                    controller: _otp,
                                    keyboardType: TextInputType.number,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      labelText: "OTP",
                                      hintText: "Enter you otp here",
                                      hintStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                      labelStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: _verifyOtp,
                                  child: Text("Verify"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),

                          // this text using api response
                          Text("You can resend OTP in 00:29"),
                        ],
                      ),
                    ),
              SizedBox(
                height: 14,
              ),
              SizedBox(
                height: 60,
                child: DropdownButtonFormField2(
                    alignment: AlignmentDirectional.bottomEnd,
                    isExpanded: true,
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      //offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "Industry",
                      hintText: "Technology",
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {}),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: _password,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.visibility)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Password",
                    hintText: "Enter you password",
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  obscureText: true,
                  controller: _password,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.visibility)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Confirm Password",
                    hintText: "Enter you password",
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: _signupBtn,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Signup",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Already have an account."),
                  TextButton(onPressed: _loginBtn, child: Text("Login"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

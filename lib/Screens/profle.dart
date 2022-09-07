import 'package:flutter/material.dart';

class ProfileUidetails extends StatefulWidget {
  String name_;
  String email_;
  String mobile_;
  String gender_;

  ProfileUidetails(
      {required this.name_,
      required this.email_,
      required this.mobile_,
      required this.gender_});

  @override
  State<ProfileUidetails> createState() => _ProfileUidetailsState();
}

class _ProfileUidetailsState extends State<ProfileUidetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage(
                      "https://i.postimg.cc/YCtkhvV9/13ac3e10a4ed96bbdbdad1e1743cf132-1.png"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "User Name : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.name_.toString(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "User Name : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.email_.toString(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Phone Number : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.mobile_.toString(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Gender : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.gender_.toString(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

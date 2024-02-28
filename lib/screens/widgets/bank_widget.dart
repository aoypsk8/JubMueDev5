import 'package:flutter/material.dart';

class BankWidget extends StatelessWidget {
  Function() onTap;

  Widget company;

  BankWidget({
    Key? key,
    required this.onTap,
    required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.grey, offset: Offset(0, 0.5))
            ],
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: company,
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';


class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyButton(onClicked: () {},child: const Text('Sample'),),
      ),
    );
  }
}

class MyButton extends FloatingActionButton {
  const MyButton({super.key, required this.onClicked, required this.child})
      : super(onPressed: onClicked, elevation: 0.0, child: child);

  final VoidCallback onClicked;
  @override
  // ignore: overridden_fields
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // buttonColor: Theme.of(context).accentColor,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.white,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
      ),
      child: Builder(builder: super.build),
    );
  }
}

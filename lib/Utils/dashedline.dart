import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                height: 5,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(2),
                ),
              )),
          SizedBox(width: 4),
          Expanded(
            child: Container(
              height: 5,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

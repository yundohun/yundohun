import 'package:flutter/material.dart';
import 'package:lookup/ui/shared/color.dart';

class TabItem extends StatelessWidget {
  final String? caption;
  final Object value;
  final Object? groupValue;
  final ValueChanged<Object> onChanged;

  const TabItem({
    Key? key,
    this.caption,
    required this.value,
    this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onChanged(value),
      child: Text(caption ?? ''),
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
        primary: value == groupValue ? darkGrey : lightGrey,
        textStyle: TextStyle(fontSize: 20),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListToggleSwitch extends StatefulWidget {
  final Function(bool isDaily) onToggle;

  const ListToggleSwitch({Key? key, required this.onToggle}) : super(key: key);

  @override
  _ListToggleSwitchState createState() => _ListToggleSwitchState();
}

class _ListToggleSwitchState extends State<ListToggleSwitch> {
  bool isDaily = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        isSelected: [isDaily, !isDaily],
        onPressed: (index) {
          setState(() {
            isDaily = index == 0;
          });
          widget.onToggle(isDaily);
        },
        borderRadius: BorderRadius.circular(8.0),
        selectedColor: Colors.white,
        fillColor: Colors.blue,
        color: Colors.blueGrey,
        constraints: const BoxConstraints(
          minWidth: 80, // Мінімальна ширина кожної кнопки
          minHeight: 32, // Мінімальна висота кожної кнопки
        ),
        children: const [
          Text('day'),
          Text('week'),
        ],
      ),
    );
  }
}

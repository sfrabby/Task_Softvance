import 'package:flutter/material.dart';

class AlarmCard extends StatelessWidget {
  final String time;
  final String date;
  final bool isActive;
  final ValueChanged<bool> onToggle;

  const AlarmCard({
    super.key,
    required this.time,
    required this.date,
    required this.isActive,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(date, style: const TextStyle(color: Colors.white54, fontSize: 13)),
            ],
          ),
          Switch(
            value: isActive,
            onChanged: onToggle,
            activeTrackColor: const Color(0xFF5E17EB),
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
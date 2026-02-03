import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../Controller/Home Controller.dart';
import '../../common widget/Alarm Card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(0xFF05051A),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text("Selected Location",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // কাস্টম সার্চ বার
              _buildLocationInput(controller),

              const SizedBox(height: 30),
              const Text("Alarms",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // অ্যালার্ম লিস্ট (Obx দিয়ে রিয়েল-টাইম আপডেট)
              Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: controller.alarms.length,
                  itemBuilder: (context, index) {
                    final alarm = controller.alarms[index];
                    return AlarmCard(
                      time: alarm['time'],
                      date: alarm['date'],
                      isActive: alarm['isActive'].value,
                      onToggle: (val) => controller.toggleAlarm(index),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.pickTime(context),
        backgroundColor: const Color(0xFF5E17EB),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
    );
  }

  Widget _buildLocationInput(HomeController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Dhaka, Bangladesh", // আপনি চাইলে কন্ট্রোলার থেকে লোকেশন নাম এখানে দিতে পারেন
          hintStyle: TextStyle(color: Colors.white70),
          icon: Icon(Icons.location_on_outlined, color: Colors.white70),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
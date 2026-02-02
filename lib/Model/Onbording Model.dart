import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../constants/App Assets.dart';

List<PageViewModel> getPagesViewModel() {
  return [
    PageViewModel(
      title: "Discover the world, one\njourney at a time.",
      body: "From hidden gems to iconic destinations, we make travel simple, inspiring, and unforgettable.",
      image: _buildImage(AppAssets.onboarding1),
      decoration: _getPageDecoration(),
    ),
    PageViewModel(
      title: "Explore new horizons,\none step at a time.",
      body: "Every trip holds a story waiting to be lived. Let us guide you to experiences that inspire.",
      image: _buildImage(AppAssets.onboarding2),
      decoration: _getPageDecoration(),
    ),
    PageViewModel(
      title: "See the beauty, one\njourney at a time.",
      body: "Travel made simple and exciting—discover places you’ll love and moments you’ll never forget.",
      image: _buildImage(AppAssets.onboarding3),
      decoration: _getPageDecoration(),
    ),
  ];
}


Widget _buildImage(String assetName) {
  return Padding(
    padding: const EdgeInsets.only(top: 0.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        assetName,
        height: 600,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
  );
}


PageDecoration _getPageDecoration() {
  return const PageDecoration(
    imageFlex: 3,
    bodyFlex: 2,
    titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodyTextStyle: TextStyle(fontSize: 14.0, color: Colors.white70),
    imagePadding: EdgeInsets.symmetric(horizontal: 5),
    pageColor: Colors.transparent,
  );
}
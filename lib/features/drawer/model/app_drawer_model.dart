import 'package:flutter/material.dart';

class AppDrawerModel {
  final IconData icon;
  final String title;
  final AppDrawerType type;

  AppDrawerModel({
    required this.icon,
    required this.title,
    required this.type,
  });
}

enum AppDrawerType {
  home,
  equalizer,
  sleepTimer,
  settings,
  share,
  rateUs,
  feedback,
  privacyPolicy,
  about,
  exit,
  notification,
}

final List<AppDrawerModel> appDrawerLists = [
  AppDrawerModel(
    icon: Icons.home,
    title: "Home",
    type: AppDrawerType.home,
  ),
  AppDrawerModel(
    icon: Icons.settings,
    title: "Settings",
    type: AppDrawerType.settings,
  ),
  AppDrawerModel(
    icon: Icons.star,
    title: "Rate Us",
    type: AppDrawerType.rateUs,
  ),
  AppDrawerModel(
    icon: Icons.feedback,
    title: "Feedback",
    type: AppDrawerType.feedback,
  ),
  AppDrawerModel(
    icon: Icons.privacy_tip,
    title: "Privacy Policy",
    type: AppDrawerType.privacyPolicy,
  ),
  AppDrawerModel(
    icon: Icons.info,
    title: "About",
    type: AppDrawerType.about,
  ),
  AppDrawerModel(
    icon: Icons.exit_to_app,
    title: "Exit",
    type: AppDrawerType.exit,
  ),
];

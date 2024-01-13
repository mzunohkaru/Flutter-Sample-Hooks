import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/pages/home_page.dart';
import 'package:flutter_hooks_sample/pages/settings_page.dart';
import 'package:flutter_hooks_sample/pages/timeline_page.dart';

enum TabItem {
  home(
    title: 'ホーム',
    icon: Icons.home,
    page: HomePage(),
  ),

  timeline(
    title: 'タイムライン',
    icon: Icons.timeline,
    page: TimelinePage(),
  ),

  settings(
    title: '設定',
    icon: Icons.settings,
    page: SettingsPage(),
  );

  const TabItem({
    required this.title,
    required this.icon,
    required this.page,
  });

  /// タイトル
  final String title;

  /// アイコン
  final IconData icon;

  /// 画面
  final Widget page;
}
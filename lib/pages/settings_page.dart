import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/enums/tab_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageTitle = TabItem.settings.title;

    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pageTitle),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const DetailsSettingsPage(),
                  ),
                );
              },
              child: const Text('詳細ページへ'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsSettingsPage extends StatelessWidget {
  const DetailsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageTitle = TabItem.settings.title;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(pageTitle),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('詳細ページ'),
      ),
    );
  }
}

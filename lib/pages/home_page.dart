import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample/enums/tab_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageTitle = TabItem.home.title;
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
                    builder: (BuildContext context) => DetailHomePage(),
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

class DetailHomePage extends HookWidget {
  DetailHomePage({super.key});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pageTitle = TabItem.home.title;
    final count = useState(0);
    final controller = useTextEditingController();

    // データのフェッチ、タイマーの設定、コンソールへのログ出力などを扱うためのフック
    useEffect(() {
      //画面が表示された
      print('Effect has been run');
      return () {
        //画面が非表示された
        print('Effect has been cleaned up');
      };
    }, [count.value]);

    final increment = useCallback(() {
      count.value++;
    },
        // 依存配列が変更されない限り、同じ関数が再利用されます
        /// count.valueが変更されるたびに新しいincrement関数が作成されます
        /// これにより、count.valueの最新の値を常に参照することが保証されます
        [
          count.value, // count.valueに依存
        ]);

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(pageTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              count.value.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

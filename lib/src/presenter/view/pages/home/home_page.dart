import 'package:bemol_test/l10n/l10n.dart';
import 'package:bemol_test/src/presenter/view/pages/home/home.dart';
import 'package:bemol_test/src/presenter/view/widgets/searcher_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(context.l10n.productAppBar),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearcherField(onChangedText: controller.onChangedText),
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Product $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

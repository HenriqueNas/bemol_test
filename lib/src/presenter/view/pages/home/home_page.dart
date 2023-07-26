import 'package:bemol_test/app/app.dart';
import 'package:bemol_test/l10n/l10n.dart';
import 'package:bemol_test/src/presenter/view/pages/home/home.dart';
import 'package:bemol_test/src/presenter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.init(() => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final size = MediaQuery.sizeOf(context);

    Widget body = const SizedBox.shrink();

    switch (controller.pageState) {
      case HomeState.idle when controller.products.isEmpty:
        body = Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPaths.emptyImage,
              width: size.width * 0.5,
              height: size.width * 0.5,
            ),
            Text(context.l10n.errorListIsEmpty),
          ],
        );
      case HomeState.idle:
        body = ListView.separated(
          shrinkWrap: true,
          itemCount: controller.products.length,
          separatorBuilder: (_, __) => const Divider(
            height: 32,
            color: Color(0xFFF0F0F0),
          ),
          itemBuilder: (_, index) {
            final product = controller.products[index];

            return ProductTile(product: product);
          },
        );
      case HomeState.loading:
        body = const Center(child: CircularProgressIndicator());

      case HomeState.error:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigator.pushNamed(AppRoutes.error);
        });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.productAppBar),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_outlined),
            onPressed: () => navigator.pushNamed(AppRoutes.favorites),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
        child: Column(
          children: [
            SearcherField(onChangedSearchText: controller.onChangedSearch),
            const SizedBox(height: 16),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}

import 'package:bemol_test/app/app.dart';
import 'package:bemol_test/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToHome() {
      Navigator.of(context).pushNamed(AppRoutes.home);
    }

    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AssetsPaths.errorImage,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              Text(context.l10n.errorUnknown),
            ],
          ),
          TextButton(
            onPressed: navigateToHome,
            child: Text(context.l10n.errorGoHome),
          ),
        ],
      ),
    );
  }
}

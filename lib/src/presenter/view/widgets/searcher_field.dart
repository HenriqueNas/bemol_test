import 'dart:async';

import 'package:bemol_test/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SearcherField extends StatelessWidget {
  const SearcherField({
    required this.onChangedText,
    super.key,
  });

  final void Function(String) onChangedText;

  Function _debounce(void Function() function, Duration duration) {
    Timer? timer;

    return () {
      if (timer != null) timer!.cancel();

      timer = Timer(
        duration,
        () => function(),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: context.l10n.productSearchHint,
        prefixIcon: const Icon(Icons.search),
      ),
      onChanged: (value) {
        _debounce(
          () => onChangedText(value),
          const Duration(milliseconds: 300),
        );
      },
    );
  }
}

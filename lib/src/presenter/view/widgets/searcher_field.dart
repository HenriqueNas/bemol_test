import 'package:bemol_test/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SearcherField extends StatelessWidget {
  const SearcherField({
    required this.onChangedSearchText,
    super.key,
  });

  final void Function(String) onChangedSearchText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: context.l10n.productSearchHint,
        prefixIcon: const Icon(Icons.search),
      ),
      onChanged: onChangedSearchText,
    );
  }
}

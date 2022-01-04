import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SearchTextField extends StatefulWidget {

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;


  const SearchTextField({Key? key, this.controller, this.onChanged}) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.text,
      decoration:  InputDecoration(
          hintText: AppLocalizations.of(context)!.search,
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}

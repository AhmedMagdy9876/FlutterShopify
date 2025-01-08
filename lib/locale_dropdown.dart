import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// dropdown menu to set locale
class LocaleDropdown extends StatelessWidget {
  final Function(String?)? callback;
  const LocaleDropdown({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    var menuItems = <DropdownMenuItem>[];
    for (var locale in AppLocalizations.supportedLocales) {
      menuItems.add(
        DropdownMenuItem(
            value: locale.languageCode,
            child: CountryFlag.fromLanguageCode(locale.languageCode)),
      );
    }
    return DropdownButton(
      items: menuItems,
      onChanged: (value) {
        callback?.call(value);
      },
      icon: Icon(Icons.language),
    );
  }
}

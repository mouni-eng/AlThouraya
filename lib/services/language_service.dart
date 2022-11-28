import 'package:althouraya/services/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String FARSI = 'fa';
const String ARABIC = 'ar';
const String HINDI = 'hi';

Future<Locale> setLocale(String languageCode) async {
  await CacheHelper.saveData(key: LAGUAGE_CODE, value: languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  String languageCode = CacheHelper.getData(key: LAGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}

bool isRtl(context) {
  Locale locale = Localizations.localeOf(context);
  if (locale.languageCode == "ar") {
    return true;
  } else {
    return false;
  }
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');

    case ARABIC:
      return const Locale(ARABIC, "");

    default:
      return const Locale(ENGLISH, '');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}

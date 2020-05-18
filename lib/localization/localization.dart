import 'package:flutter/material.dart';

import 'package:inject/inject.dart';

import 'package:intl/intl.dart';

import 'package:tmdb_client_flutter/localization/l10n/messages_all.dart';

class AppLocalizations {
  static const LOCALE_EN = "en";

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(locale.toString()).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get nowPlaying => Intl.message(
        "Now playing",
        name: "nowPlaying",
        args: [],
      );

  String get topRated => Intl.message(
        "Top rated",
        name: "topRated",
        args: [],
      );

  String get popular => Intl.message(
        "Popular",
        name: "popular",
        args: [],
      );

  String get upcoming => Intl.message(
        "Upcoming",
        name: "upcoming",
        args: [],
      );

  String get trending => Intl.message(
        "Trending",
        name: "trending",
        args: [],
      );
}

@provide
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  static List<Locale> supportedLocalizations() => [
        Locale(AppLocalizations.LOCALE_EN),
      ];

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains(AppLocalizations.LOCALE_EN);
}

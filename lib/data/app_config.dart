class AppConfig {
  static const String teacherName = "El3bd In English";
  static const String teacherNumber = "201068097511";
  static const String facebookUrl =
      "https://www.facebook.com/share/17K7oCyjZk/";
  static const String suuportNumber = "201044690582";

  static const String apiBaseUrl = "https://me.genuisweb.com/app";
  static const String appVersion = "1.0.3";

  static const bool preventScreenShoot = true;
  static const bool notification = true;

  // Company code - if set, will be used automatically in registration
  // If empty, user will be prompted to enter it
  static const String companyCode = "191560";

  // Available companies - if not empty, user will select from this list
  // If empty, user will enter company code manually (if companyCode is also empty)
  static const List<Map<String, String>> availableCompanies = [
    // {"name": "Company Name", "code": "company_code"},
    // {"name": "Company Name2", "code": "company_code2"},
    // {"name": "Company Name3", "code": "company_code3"}
  ];
}

/// [PrefsKey] contains key names which have been used to store data
/// with [SharedPreferences]

abstract class PrefsKey {
  static const String user = '@lmg_user';
  static const String userLogin = 'user_login';
  static const String rememberMe = 'remember_me';
  static const String emailPassword = 'email_password';
  static const String userHistoryId = 'user_history_id';
  static const String recentCartItemId = 'recent_cart_item_id';
  static const String recentCartItemProductId = 'recent_cart_item_product_id';
  static const String recentCartItemShopId = 'recent_cart_item_shop_id';
  static const String recentCartItemPickupDate = 'recent_cart_item_pickup_date';
  static const String recentCartItemPickupTime = 'recent_cart_item_pickup_time';
  static const String addressId = 'address_id';
  static const String recentOrderId = 'recent_order_id';
  static const String recentSearch = 'recent_search';
  static const String recentDashboardSearch = 'recent_dashboard_search';
  static const String recentDashboardSearchId = 'recent_dashboard_search_id';
  static const String checkedPinCode = 'checked_pin_code';
  static const String setLanguage = 'set_language';
  static const String setLanguageCountryCode = 'set_language_country_code';
  static const String themeStatus = 'theme_status';
  static const String lastVisitedDate = 'last_visited_date';
  static const String walletLoginPin = '@wallet_login_pin';
}

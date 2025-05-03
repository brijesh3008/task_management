// import 'package:task_management/core/utils/common_functions.dart';
//
// /// [ValidationHelpers] is an abstract class for manage validation
// ///
// /// of the whole application
// abstract class ValidationHelpers {
//   /// Reg exp Patterns
//   static const String _patternEmail =
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
//
//   static const String _patternUpi =
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]";
//
//   static const String patternPhone =
//       r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
//
//   static RegExp emojiPattern = RegExp(
//     '(\u00a9|\u00ae|[\u2000-\u3300'
//     ']|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
//   );
//
//   /// Check value is Empty OR Not
//   static String? emptyCheck(String? value, String errorMessage) {
//     if (value!.trim().isEmpty) {
//       return errorMessage;
//     }
//     return null;
//   }
//
//   ///
//
//   /// Check email is valid or not
//   static String? emailCheck(String? value) {
//     RegExp regEmail = RegExp(_patternEmail);
//     if (value!.trim().isEmpty) {
//       return getText('enter_email');
//     }
//
//     return null;
//   }
//
//   /// Check name field
//   static String? nameField(String? value) {
//     if (value!.trim().isEmpty) {
//       return getText('enter_name');
//     }
//     if (value.trim().length < 3) {
//       return getText('enter_more_char');
//     }
//     return null;
//   }
//
//   /// Check value is More than 10 Characters
//   static String? tenCharacterValidate(String? value) {
//     if (value!.trim().isEmpty) {
//       return getText('enter_mobile_number');
//     }
//
//     if (!isNumeric(value)) {
//       return getText('enter_valid_number');
//     }
//
//     if (value.trim().length < 10) {
//       return getText('mobile_10_char');
//     }
//     return null;
//   }
//
//   /// Check value is More than 8 Characters
//   static String? passwordCheckValidate(String? value) {
//     RegExp regex = RegExp(
//         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$');
//     if (value!.trim().isEmpty) {
//       return getText('p_enter_pass');
//     } else if (!regex.hasMatch(value)) {
//       return getText('p_valid_8');
//     } else if (value.trim().length < 8) {
//       return getText('pass_8');
//     }
//     return null;
//   }
//
//   /// Check dropdown not empty
//   static String? dropdownValidate(value, {errorMessage = 'select_subject'}) {
//     if (value == null) {
//       return getText(errorMessage);
//     }
//
//     return null;
//   }
//
//   static String? dropdownTextFieldValidate(String? value) {
//     if (value!.trim().isEmpty) {
//       return getText('p_type_message');
//     }
//
//     return null;
//   }
//
//   static String? confirmPasswordValidate(String? value) {
//     return getText('p_not_match');
//   }
//
//   static bool isNumeric(String? value) {
//     if (value == null) {
//       return false;
//     }
//     return double.tryParse(value) != null;
//   }
//
//   /// email or phone validate
//   static String? emailOrPhoneNoValidate(String? value) {
//     RegExp regEmail = RegExp(_patternEmail);
//     RegExp regPhone = RegExp(patternPhone);
//
//     if (value!.trim().isNotEmpty) {
//       if (isNumeric(value)) {
//         if (!regPhone.hasMatch(value)) {
//           return getText('enter_valid_number');
//         }
//         return null;
//       } else {
//         if (!regEmail.hasMatch(value)) {
//           return getText('enter_valid_emil');
//         }
//         return null;
//       }
//     }
//     return getText('enter_email_phone');
//   }
//
//   /// Credit / Debit card validations
//   ///  Card number validation
//   static String? creditCardNumberValidation(String? value) {
//     if (value != null) {
//       if (!isNumeric(value.replaceAll(' ', ''))) {
//         return getText('enter_only_number');
//       }
//       if (isNumeric(value.replaceAll(' ', '')) && value.length != 19) {
//         return getText('enter_valid_card');
//       }
//     } else if (value == null || value.isEmpty) {
//       return getText('enter_card_no');
//     }
//     return null;
//   }
//
//   ///  Card CVV validation
//   static String? creditCardCVVValidation(String? value) {
//     if (value != null) {
//       if (!isNumeric(value)) {
//         return getText('enter_valid_cvv');
//       }
//       if (isNumeric(value) && value.length != 3) {
//         return getText('enter_valid_cvv');
//       }
//     } else if (value == null || value.isEmpty) {
//       return getText('enter_cvv');
//     }
//     return null;
//   }
//
//   ///  Card Expiry validation
//   static String? creditCardExpiryValidation(String? value) {
//     if (value != null) {
//       if (value.length != 7) {
//         return getText('enter_valid_exDate');
//       }
//     } else if (value == null || value.isEmpty) {
//       return getText('enter_exDate');
//     }
//     return null;
//   }
//
//   ///  UPI ID validation
//   static String? upiIdValidation(String? value) {
//     RegExp regUpi = RegExp(_patternUpi);
//
//     if (value != null) {
//       if (!regUpi.hasMatch(value)) {
//         return getText('enter_valid_UPI');
//       }
//     } else if (value == null || value.isEmpty) {
//       return getText('enter_upi');
//     }
//     return null;
//   }
//
//   static String? bankAccountNoValidation({
//     String? value,
//   }) {
//     if (value!.trim().isEmpty) {
//       return 'Enter ${getText('Account Number')}';
//     }
//
//     if (value.length < 6) {
//       return 'Account number should be 6 character long';
//     }
//
//     if (isNumeric(value) && int.parse(value) <= 0) {
//       return 'Enter correct account number';
//     }
//
//     int numericCount = 0;
//     int charCount = 0;
//
//     for (int i = 0; i < value.length; i++) {
//       if (isNumeric(value[i])) {
//         numericCount++;
//       } else {
//         charCount++;
//       }
//     }
//
//     if (charCount != 0 && numericCount == 0) {
//       return 'Enter correct account number';
//     }
//
//     return null;
//   }
// }

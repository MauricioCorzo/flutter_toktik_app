import 'package:intl/intl.dart';

class HumanNumbersFormats {
  static String humanReadbleNumber(double number) {
    final formattedNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: "")
            .format(number);

    return formattedNumber;
  }
}

import 'package:intl/intl.dart';

class ConversionUtils {
  // Konversi waktu antar zona
  static String convertToTimeZone(DateTime dateTime, String timeZone) {
    final timeZones = {
      'WIB': Duration(hours: 7),
      'WITA': Duration(hours: 8),
      'WIT': Duration(hours: 9),
      'London': Duration(hours: 0),
    };

    final offset = timeZones[timeZone] ?? Duration.zero;
    final convertedTime = dateTime.toUtc().add(offset);
    return DateFormat('HH:mm:ss').format(convertedTime);
  }

  // Konversi nilai mata uang
  static double convertCurrency(
      double amount, String fromCurrency, String toCurrency, Map<String, double> rates) {
    if (rates.containsKey(fromCurrency) && rates.containsKey(toCurrency)) {
      final baseRate = rates[fromCurrency]!;
      final targetRate = rates[toCurrency]!;
      return (amount / baseRate) * targetRate;
    } else {
      throw Exception('Currency not found in rates map.');
    }
  }

  // Simulasi data nilai tukar mata uang (jika tanpa API)
  static Map<String, double> mockExchangeRates() {
    return {
      'USD': 1.0,
      'IDR': 15000.0,
      'EUR': 0.85,
      'GBP': 0.75,
      'JPY': 110.0,
    };
  }
}

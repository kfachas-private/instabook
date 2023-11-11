extension StringCapitalizeExtension on String {
  String capitalize() {
    switch (length) {
      case 0:
        return this;
      case 1:
        return toUpperCase();
      default:
        return substring(0, 1).toUpperCase() + substring(1);
    }
  }

  String formatCity({required String postalCode}) {
    late String cityFormatted;
    if (this == 'Paris') {
      final String postalCodeFormatted = postalCode.substring(3, postalCode.length);
      cityFormatted = '$this $postalCodeFormatted';
    } else {
      cityFormatted = length < 20 ? this : '${substring(0, 19)}...';
    }
    return cityFormatted;
  }
}

extension DateTimeExtension on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);
}

extension DoubleExtension on double {
  String calculMetersToKm() {
    final double distanceInKiloMeters = this / 1000;
    final double roundDistanceInKM = double.parse(distanceInKiloMeters.toStringAsFixed(1));
    return roundDistanceInKM.toString();
  }
}

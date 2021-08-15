class Utils {
  static double converterParaDouble(valorTemp) {
    if (valorTemp != null) {
      if (valorTemp is int) {
        return (valorTemp as int).toDouble();
      } else {
        return valorTemp as double;
      }
    }
    return 0;
  }
}

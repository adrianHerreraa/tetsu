class DateTimeUtils {
  int getDayOfWeekNumber() {
    final date = DateTime.now();
    return date.weekday;
  }
}

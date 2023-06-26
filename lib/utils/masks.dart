String ptBRDate(String value) {
  DateTime today = DateTime.now();
  String formatToday =
      "${today.day.toString().padLeft(2, '0')}/${today.month.toString().padLeft(2, '0')}/${today.year.toString()}";

  DateTime date = DateTime.parse(value);
  String format =
      "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()}";

  if (format == formatToday) return 'today';

  return format;
}

String icons(String category) {
  if (category == 'netflix') return 'assets/netflix.png';
  if (category == 'hbo') return 'assets/hbo.png';
  if (category == 'disney+') return 'assets/disney-plus.png';
  if (category == 'star+') return 'assets/star-plus.png';
  if (category == 'coffee') return 'assets/coffee.png';
  if (category == 'food') return 'assets/food.png';
  if (category == 'starbucks') return 'assets/starbucks.png';
  if (category == 'energy') return 'assets/energy.png';
  if (category == 'internet') return 'assets/wifi.png';
  if (category == 'movie') return 'assets/movie.png';
  if (category == 'travel') return 'assets/passport.png';
  if (category == 'payment') return 'assets/payment.png';

  return 'assets/credit-cards.png';
}

String currency(String type, num value) {
  if (type == 'output') return '\$ -$value';

  return '\$ $value';
}

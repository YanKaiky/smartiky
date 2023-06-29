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
  if (category.toLowerCase() == 'netflix') return 'assets/netflix.png';
  if (category.toLowerCase() == 'hbo') return 'assets/hbo.png';
  if (category.toLowerCase() == 'disney+') return 'assets/disney-plus.png';
  if (category.toLowerCase() == 'star+') return 'assets/star-plus.png';
  if (category.toLowerCase() == 'coffee') return 'assets/coffee.png';
  if (category.toLowerCase() == 'food') return 'assets/food.png';
  if (category.toLowerCase() == 'starbucks') return 'assets/starbucks.png';
  if (category.toLowerCase() == 'energy') return 'assets/energy.png';
  if (category.toLowerCase() == 'internet') return 'assets/wifi.png';
  if (category.toLowerCase() == 'movie') return 'assets/movie.png';
  if (category.toLowerCase() == 'travel') return 'assets/passport.png';
  if (category.toLowerCase() == 'payment') return 'assets/payment.png';
  if (category.toLowerCase() == 'transfer') return 'assets/credit-cards.png';

  return 'assets/others.png';
}

String currency(String type, num value) {
  if (type == 'output') return '\$ -$value';

  return '\$ $value';
}

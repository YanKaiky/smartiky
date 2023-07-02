String ptBRDate(String value) {
  DateTime today = DateTime.now();
  String formatToday =
      "${today.day.toString().padLeft(2, '0')}/${today.month.toString().padLeft(2, '0')}/${today.year.toString()}";

  if (value == formatToday) return 'today - $value';

  final day = weekDay(usaDate(value).weekday);

  return "$day - $value";
}

String weekDay(int value) {
  switch (value) {
    case 0:
      return "sunday";
    case 1:
      return "monday";
    case 2:
      return "tuesday";
    case 3:
      return "wednesday";
    case 4:
      return "thursday";
    case 5:
      return "friday";
    default:
      return "saturday";
  }
}

DateTime usaDate(String value) {
  final format = value.split('/').reversed.join('-');

  DateTime date = DateTime.parse(format);

  return date;
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
  if (type == 'Expand') return '\$ -$value';

  return 'R\$ $value';
}

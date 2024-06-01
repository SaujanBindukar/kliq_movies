enum NewsCategory {
  business(label: 'Business', value: 'business'),
  crime(label: 'Crime', value: 'crime'),
  domestic(label: 'Domestic', value: 'domestic'),
  entertainment(label: 'Entertainment', value: 'entertainment'),
  food(label: 'Food', value: 'food'),
  health(label: 'Health', value: 'health');

  const NewsCategory({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;
}

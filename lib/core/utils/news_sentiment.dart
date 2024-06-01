enum NewsSentiment {
  positive(label: 'Positive', value: 'positive'),
  negative(label: 'Negative', value: 'negative'),
  neutral(label: 'Neutral', value: 'neutral');

  const NewsSentiment({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;
}

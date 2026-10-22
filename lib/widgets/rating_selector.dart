import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/l10n.dart';
import '../theme/app_theme.dart';

class RatingSelector extends StatelessWidget {
  const RatingSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final int? value;
  final ValueChanged<int> onChanged;

  String _label(BuildContext context) {
    if (value == null) return context.l10n.chooseNumber;
    if (value! <= 3) return context.l10n.difficultDay;
    if (value! <= 6) return context.l10n.averageDay;
    if (value! <= 8) return context.l10n.goodDay;
    return context.l10n.greatDay;
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.2,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          final rating = index + 1;
          final formattedRating = NumberFormat.decimalPattern(
            context.localeName,
          ).format(rating);
          final formattedMaximum = NumberFormat.decimalPattern(
            context.localeName,
          ).format(10);
          final selected = rating == value;
          return Semantics(
            button: true,
            selected: selected,
            label: context.l10n.ratingOutOfTen(
              formattedRating,
              formattedMaximum,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => onChanged(rating),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                decoration: BoxDecoration(
                  color: selected
                      ? AppTheme.ratingColor(context, rating)
                      : Theme.of(context).colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Text(
                  formattedRating,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: selected ? Colors.white : null,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      const SizedBox(height: 12),
      Text(_label(context), style: Theme.of(context).textTheme.bodyMedium),
    ],
  );
}

import 'package:flutter/material.dart';
import '../Utils/hepers.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  final EventSort selectedSort;
  final PriceFilter selectedPriceFilter;
  final Function(dynamic) onSelectedFilter;

  const PopupMenuButtonWidget({
    required this.selectedSort,
    required this.selectedPriceFilter,
    required this.onSelectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<dynamic>(
      icon: const Icon(Icons.filter_list),
      offset: const Offset(0, 50),
      onSelected: onSelectedFilter,
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<EventSort>(
          value: EventSort.defaultSort,
          child: Text('Par défaut'),
        ),
        const PopupMenuItem<EventSort>(
          value: EventSort.title,
          child: Text('Par titre'),
        ),
        const PopupMenuItem<EventSort>(
          value: EventSort.startDate,
          child: Text('Par date de début'),
        ),
        const PopupMenuItem<EventSort>(
          value: EventSort.endDate,
          child: Text('Par date de fin'),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<PriceFilter>(
          value: PriceFilter.all,
          child: Text('Tous les prix'),
        ),
        const PopupMenuItem<PriceFilter>(
          value: PriceFilter.free,
          child: Text('Gratuit'),
        ),
        const PopupMenuItem<PriceFilter>(
          value: PriceFilter.paid,
          child: Text('Payant'),
        ),
      ],
    );
  }
}

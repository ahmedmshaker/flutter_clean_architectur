import 'package:flutter/material.dart';

class ListGridSwitcherWidget extends StatelessWidget {
  final ValueChanged<ListGridSwitcherType>? onWidgetSwitcherClick;

  const ListGridSwitcherWidget({Key? key, this.onWidgetSwitcherClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            key: Key(ListGridSwitcherType.listView.toString()),
            onTap: () {
              onWidgetSwitcherClick?.call(ListGridSwitcherType.listView);
            },
            child: const Icon(Icons.list_rounded)),
        const SizedBox(width: 16),
        InkWell(
          key:  Key(ListGridSwitcherType.gridView.toString()),
            onTap: () {
              onWidgetSwitcherClick?.call(ListGridSwitcherType.gridView);
            },
            child: const Icon(Icons.grid_view))
      ],
    );
  }
}

enum ListGridSwitcherType { listView, gridView }

import 'package:flutter/material.dart';
import 'package:rent_ready_task/features/accounts/data/models/search_filter_request.dart';
import 'package:rent_ready_task/features/accounts/presentation/cubit/accounts_cubit.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/filter_widget.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/list_grid_switcher.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/search_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionsBarWidget extends StatefulWidget {
  const ActionsBarWidget({Key? key}) : super(key: key);

  @override
  _ActionsBarWidgetState createState() => _ActionsBarWidgetState();
}

class _ActionsBarWidgetState extends State<ActionsBarWidget> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController filterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _getSearchFilterWidget()),
          const SizedBox(
            width: 32,
          ),
          ListGridSwitcherWidget(onWidgetSwitcherClick: (listGridSwitchType) {
            context
                .read<AccountsCubit>()
                .switchListGridView(listGridSwitchType);
          })
        ],
      ),
    );
  }

  Widget _getSearchFilterWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: SearchTextField(
          controller: searchController,
          onChanged: (value) {
            searchOrFilter();
          },
        )),
        const SizedBox(
          width: 16,
        ),
        FilterWidget(
          controller: filterController,
          onSelected: (value) {
            searchOrFilter();
          },
        )
      ],
    );
  }

  void searchOrFilter() {
        context.read<AccountsCubit>().searchOrFilter(SearchFilterCriteriaRequest(
        searchQuery: searchController.text,
        stateOrProvince: filterController.text));
  }
}

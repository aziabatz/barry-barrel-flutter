import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BackdropContainer extends StatefulWidget {
  const BackdropContainer({super.key});

  @override
  State<BackdropContainer> createState() => _BackdropContainerState();
}

class _BackdropContainerState extends State<BackdropContainer> {
  bool _filterBookmarks = false;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    String selected;

    /* DateTime selectedDate = !entity.acquisitionDate.isEmpty
        ? DateTime.parse(entity.acquisitionDate)
        : DateTime.now(); */

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      // Update the entity and the _dateController with the selected date
      selected = picked.toString();
      _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      height: 20,
      thickness: 1,
      indent: 0,
      endIndent: 0,
      color: Theme.of(context).colorScheme.onTertiaryContainer,
    );

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Center(
              child: Container(
            margin: EdgeInsets.all(10),
            child: Icon(Icons.close,
                color: Theme.of(context).colorScheme.onTertiaryContainer),
          )),
          TextField(decoration: InputDecoration(labelText: 'Search...')),
          TextField(
              controller: _dateController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: const InputDecoration(
                labelText: 'Date of adquisition',
                suffixIcon: Icon(Icons.calendar_today),
              )),
          divider,
          Row(
            children: [
              FilterChip(
                  label: Text("Bookmarks"),
                  selected: _filterBookmarks,
                  onSelected: (value) {
                    setState(() {
                      _filterBookmarks = value;
                    });
                  }),
            ],
          ),
          divider,
          Text("Order by: "),
          ToggleButtons(
            isSelected: [true, false],
            children: [
               Text("Name"), Text("Date")
          ]),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BookmarkCheckbox extends StatefulWidget {
  late bool isBookmark;

  BookmarkCheckbox({super.key, required this.isBookmark});

  @override
  State<BookmarkCheckbox> createState() => _createBookmarkCheckboxState();
}

class _createBookmarkCheckboxState extends State<BookmarkCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text('Favourite'),
      subtitle: const Text('Add item to bookmarks'),
      activeColor: Colors.pink,
      value: widget.isBookmark,
      selected: widget.isBookmark,
      onChanged: (value) {
        setState(() {
          widget.isBookmark = value!;
        });
      },
    );
  }
}

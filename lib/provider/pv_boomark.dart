import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jvak/models/bookmark.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkProvider with ChangeNotifier {
  List<BookMark> _bookmarks = [];

  List<BookMark> get bookmarks => _bookmarks;

  BookMarkProvider() {
    loadBookmarks();
  }

  void saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodeData = json.encode(
        _bookmarks.map((e) => {'id': e.id, 'checked': e.checked}).toList());
    prefs.setString('bookmarks', encodeData);
  }

  void loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? bookmarksString = prefs.getString('bookmarks');
    if (bookmarksString != null) {
      final List<dynamic> bookmarkJson = json.decode(bookmarksString);
      _bookmarks = bookmarkJson
          .map((e) => BookMark(
                id: e['id'],
                brand: e['brand'],
                checked: e['checked'],
              ))
          .toList();
      notifyListeners();
    }
  }

  void addBookmark(BookMark bookMark) {
    _bookmarks.add(bookMark);
    saveBookmarks();
    notifyListeners();
  }

  void changeBookmarkChecked(
      {required String id,
      required String brand,
      required bool checked,
      required context}) {
    print('북마킹 시스템 기동');
    final bookmarkIndex = _bookmarks.indexWhere((element) => element.id == id);
    print(
        '북마킹 데이터 일치 코드: ${_bookmarks.indexWhere((element) => element.id == id)}');
    if (bookmarkIndex != -1) {
      _bookmarks[bookmarkIndex] =
          BookMark(id: id, brand: brand, checked: !checked);
      saveBookmarks();
      notifyListeners();
    } else {
      print('일치하는 데이터 없음 데이터 추가 시작[ $id | $brand | $checked ]');
      Provider.of<BookMarkProvider>(context, listen: false)
          .addBookmark(BookMark(id: id, brand: brand, checked: !checked));
      saveBookmarks();
      notifyListeners();
    }
  }

  void removeBookmark(String id) {
    _bookmarks.removeWhere((element) => element.id == id);
    saveBookmarks();
    notifyListeners();
  }
}

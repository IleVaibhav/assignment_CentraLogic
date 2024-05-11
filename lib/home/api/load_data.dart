import 'dart:convert';
import 'package:assignment_2/home/models/books_model.dart';
import 'package:flutter/services.dart';

readBookData() async {
  try{
    final String response = await rootBundle.loadString('asset/data/books.json');
    final data = await json.decode(response);

    List<BookModel> bookList = [];

    for(int i = 0; i < data['books'].length; i++) {
      final BookModel bookModel = BookModel.fromJson(data['books'][i]);
      bookList.add(bookModel);
    }

    return bookList;
  } catch(e) {
    return [];
  }
}

readAuthorData() async {
  try{
    final String response = await rootBundle.loadString('asset/data/books.json');
    final data = await json.decode(response);
    List<AuthorModel> authorList = [];

    for(int i = 0; i < data['authors'].length; i++) {
      final AuthorModel authorModel = AuthorModel.fromJson(data['authors'][i]);
      authorList.add(authorModel);
    }
    
    return authorList;
  } catch(e) {
    return [];
  }
}

readVendorData() async {
  try{
    final String response = await rootBundle.loadString('asset/data/books.json');
    final data = await json.decode(response);
    List<VendorModel> vendorList = [];

    for(int i = 0; i < data['vendors'].length; i++) {
      final VendorModel vendorModel = VendorModel(data['vendors'][i]);
      vendorList.add(vendorModel);
    }
    
    return vendorList;
  } catch(e) {
    return [];
  }
}
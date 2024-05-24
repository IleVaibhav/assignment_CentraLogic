import 'package:assignment_3_provider/home/api/load_data.dart';
import 'package:flutter/material.dart';
import '../models/books_model.dart';

class BookDataProvider extends ChangeNotifier {

  int _totalCartCount = 0;
  int get totalCartCount => _totalCartCount;

  double _cartPrize = 0;
  double get cartPrize => _cartPrize;

  int _statusCode = 200;
  int get statusCode => _statusCode;
  setStatusCode(int value) {
    _statusCode = value;
    notifyListeners();
  }

  String _errorText = "Success";
  String get errorText => _errorText;
  setErrorText(String error) {
    _errorText = error;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<BookModel> _bookList = [];
  List<BookModel> get bookList => _bookList;
  setBookList(List<BookModel> bookList) {
    _bookList = bookList;
    notifyListeners();
  }

  List<VendorModel> _vendorList = [];
  List<VendorModel> get vendorList => _vendorList;
  setVendorList(List<VendorModel> vendorList) {
    _vendorList = vendorList;
    notifyListeners();
  }

  List<AuthorModel> _authorList = [];
  List<AuthorModel> get authorList => _authorList;
  setAuthorList(List<AuthorModel> authorList) {
    _authorList = authorList;
    notifyListeners();
  }


  void loadBookData() async {
    setLoading(true);
    try{
      var data = await readBookData();
      for(int i = 0; i < data.length; i++) {
        int j = 0;
        for(j = 0; j < _bookList.length; j++) {
          if(data[i].id == _bookList[j].id) {
            break;
          }
        }
        if(j == _bookList.length) {
          _bookList.add(data[i]);
        }
      }
      setStatusCode(200);
    } catch(e) {
      setErrorText(e.toString());
      setStatusCode(400);
    }
    setLoading(false);
    notifyListeners();
  }

  void loadVendorData() async {
    setLoading(true);
    try {      
      var data = await readVendorData();
      setVendorList(data);
    } catch(e) {
      setErrorText(e.toString());
      setStatusCode(400);
    }
    setLoading(false);
  }

  void loadAuthorData() async {
    setLoading(true);
    try {
      var data = await readAuthorData();
      setAuthorList(data);
    } catch(e) {
      setErrorText(e.toString());
      setStatusCode(400);
    }
    setLoading(false);
  }

  void addToCart(String bookId) {
    setLoading(true);
    for(int i = 0; i < bookList.length; i++) {
      if(bookList[i].id == bookId) {
        bookList[i].isInBag = true;
        _totalCartCount++;
        _cartPrize += double.parse(bookList[i].price);
        break;
      }
    }
    setLoading(false);
    notifyListeners();
  }

  void removeFromCart(String bookId) {
    setLoading(true);
    for(int i = 0; i < bookList.length; i++) {
      if(bookList[i].id == bookId) {
        bookList[i].isInBag = false;
        _totalCartCount--;
        _cartPrize -= double.parse(bookList[i].price);
        break;
      }
    }
    setLoading(false);
    notifyListeners();
  }

  void emptyCart() {
    setLoading(true);
    for(int i = 0; i < bookList.length; i++) {
      bookList[i].isInBag = false;
      _totalCartCount = 0;
      _cartPrize = 0;
    }
    setLoading(false);
  }
}
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'rating_bar.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';


class Book {
   String title ; 
   String description;
   String review;
   String rating_count;
   String publition_date;
   String image_url;
   String author;
  Book(this.title,this.description, this.review,this.rating_count,this.publition_date,this.image_url,this.author);
}
Future <String> gettitle(){
}
//extract data from godread api : 
Future <Book> get_review(String imagePath) async {
    var info = new List<String>();
    String isbn = await decode(imagePath);
    //print(isbn);
    String url = "https://www.goodreads.com/book/isbn?FORMAT=json&key=[your goodreads API here]&isbn=" + isbn;
    final response = await http.get(url);
    var book = new Book(" "," "," "," "," "," "," ");
    if (response.statusCode == 200) {
      var document = xml.parse(response.body);
      book.review = document.findAllElements('average_rating').toList()[0].text;
      book.rating_count = document.findAllElements('ratings_count').toList()[0].text;
      var book_info = document.findAllElements('book').toList()[0];
      book.author = document.findAllElements('authors').toList()[0].findAllElements('author').toList()[0].findElements('name').toList()[0].text;  
      book.title = book_info.findElements('title').toList()[0].text;
      book.image_url = book_info.findElements('image_url').toList()[0].text;
      book.description = book_info.findElements('description').toList()[0].text; 
      var year = document.findAllElements('publication_year').toList()[0].text;
      var month = document.findAllElements('publication_month').toList()[0].text;
      var day = document.findAllElements('publication_day').toList()[0].text;
      book.publition_date = day + '/' + month + '/' + year ; 
      //print(book.description);
      return book;
    } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }

  //use firebase MLKIT to read text from image :
  }
  Future readText(String imagePath) async {
    String text = "";
    var image = File(imagePath);
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(image);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(ourImage);

    for (TextBlock block in readText.blocks) {
        print ("new text block  : ");
      for (TextLine line in block.lines) {
          print ("new line : ");
        for (TextElement word in line.elements) {
          //print(word.text);
          text = text + "  " + word.text;
        }
      }
    }
    //print(text);
    return text;
  }

 // read barcode in the image : 
  Future <String> decode(String imagePath) async {
    String val;
    var image = File(imagePath);
    print(imagePath);
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(image);
    BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
    List barCodes = await barcodeDetector.detectInImage(ourImage);

    for (Barcode readableCode in barCodes) {
      //print(readableCode.displayValue);
      val = readableCode.displayValue;
      print("detected isbn : " + val);
      return val;
    }
  }
  Future<String> isbn(String imagePath) async {
    String isbn = await decode(imagePath);
    return isbn;
  }

import 'package:camera_app/rating_bar.dart';
import 'package:flutter/material.dart';
import 'footer.dart';
import 'utils.dart';

class Detail extends StatelessWidget {
  //final Book book;
  //Future <Book> book;
  var review;
  var title;
  var image_url ;
  var author;
  var rating_count;
  var publition_year;
  var description;
  var rating ;
  final String  imagePath;

  //Detail(this.book);
  Detail({Key key,this.imagePath}) : super(key: key);
  
  Future<String> getisbn(imagePath) async {
    var isbn = await decode(imagePath);
    return isbn;
  } 

  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: .5,
      title: Text('Your Book info '),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    ///detail of book image and it's pages
    final topLeft = Column(
          children: <Widget>[
            Center(
              child: Material(
              elevation: 10.0,
              shadowColor: Colors.yellow.shade900,
              child: FutureBuilder<Book>(
                future : get_review(imagePath),
                builder: (context, snapshot){
                if (snapshot.hasData){
                  //title = snapshot.data.title;
                  image_url =snapshot.data.image_url;
                  title = snapshot.data.title;
                  author = snapshot.data.author;
                  print(image_url);
                  return Image.network(image_url,);
                  
                  
                  
                  //return Text(review);
                 }
                return Text("Please try again");
               },
               ),
              
            ),

            ),
            
            Center(
          child : FutureBuilder<Book>(
                future : get_review(imagePath),
                builder: (context, snapshot){
                if (snapshot.hasData){
                  rating_count = snapshot.data.rating_count;
                  review = snapshot.data.review;
                  return text("Total reviews: "+rating_count,isBold: true,size: 12,padding: EdgeInsets.only(top: 12),);
                  
                 }
                return Text("Please try again");
               },
               ),
          ),
              //padding: EdgeInsets.all(16.0),  
        //review!=null?
       // text('${review} pages', color: Colors.black38, size: 12):text("Not working"),
      ],
    );
    //print("review : " + review);
    ///detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
                child : FutureBuilder<Book>(
                future : get_review(imagePath),
                builder: (context, snapshot){
                if (snapshot.hasData){
                  title = snapshot.data.title;
                  return Text(
                     ""+title,
                     style: new TextStyle(
                     fontFamily: "OpenSans",
                     color: Colors.black,
                     fontSize: 16.0,
                     
                     fontWeight: FontWeight.w300),
                    );
                  //return Text(review);
                 }
                return Text("Please try again");
               },
               ),
        ),
        Center(
          child : FutureBuilder<Book>(
                future : get_review(imagePath),
                builder: (context, snapshot){
                if (snapshot.hasData){
                  author = snapshot.data.author;
                  review = snapshot.data.review;
                  return text(
                  "by "+ author,
                  color: Colors.black54,
                  size: 12,
                  padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                  );
                 }
                return Text("Please try again");
               },
               ),
        ),
        //RatingBar(rating: review),
         Center(
          child : FutureBuilder<Book>(
                future : get_review(imagePath),
                builder: (context, snapshot){
                if (snapshot.hasData){
                  rating_count = snapshot.data.rating_count;
                  description = snapshot.data.description;
                  review = snapshot.data.review;
                  return text("Reviews:"+review +"/5",isBold: true,);
                 }
                return Text("Please try again");
               },
               ),
          ),
          //new Text("hello"),
          
         
          Center(
          child : FutureBuilder<Book>(
                future : get_review(imagePath),
                builder: (context, snapshot){
                if (snapshot.hasData){
                  publition_year = snapshot.data.publition_date;
                  return text(
                  "Publition date:"+publition_year,
                  isBold: true,
                 padding: EdgeInsets.only(right: 8.0),
                 );
                 }
                return Text("Please try again");
               },
               ),
              
          ),
          
        SizedBox(height: 32.0),
        
      ],
    );
  
    final topContent = Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    ///scrolling text description
    final bottomContent = Container(
      height: 350.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<Book>(
                future : get_review(imagePath),
                builder: (context, snapshot){
                if (snapshot.hasData){
                  description = snapshot.data.description;
                  description = description.replaceAll(RegExp('<br />'),'').replaceAll(RegExp('&amp'),' ').replaceAll(RegExp('<i>'),' ').replaceAll(RegExp('</i>'),' ');
                  return Text(
          description,
          style: new TextStyle(
              fontFamily: "OpenSans",
              color: Colors.black,
              fontSize: 13.0,
              fontWeight: FontWeight.w300),
        );
                 }
                return Text("Please try again");
               },
               ),
      ),
    );


    return Scaffold(
      appBar: appBar,
      body: 
      Column(
        children: <Widget>[
          topContent,
          bottomContent,
          ],
      ), 
    );
  }

  ///create text widget
  ///
  
  text(String data,
          {Color color = Colors.black87,
          num size = 14,
          EdgeInsetsGeometry padding = EdgeInsets.zero,
          bool isBold = false}) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );
}


  /*

class DisplayPicture extends StatelessWidget {
  final String imagePath;
  final Future<Book> book;
  //const DisplayPicture({Key key, this.imagePath}) : super(key: key);
  DisplayPicture({Key key, this.book,this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Picture')),
      body: Column(
        children: <Widget>[
        SizedBox(height: 100.0),
         Center(
                child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                        image: FileImage(File(imagePath)), fit: BoxFit.cover))),
              ),
        SizedBox(height: 10.0),
        Center(
          child : FutureBuilder<Book>(
            future : get_review(),
            builder: (context, snapshot){
              if (snapshot.hasData){
                //print(get_review());
                return Text( "review : " + snapshot.data.review);
                //return FileImage(snapshot.data.image_url);
              }
              return Text("Please try again");
            }
          ),
        ),
       SizedBox(height: 10.0),
        Center(
          child : FutureBuilder<Book>(
            future : get_review(),
            builder: (context, snapshot){
              if (snapshot.hasData){
                //print(get_review());
                return Text( "rating_counts : " + snapshot.data.rating_count);
              }
              return Text("Please try again");
            },
          ),
        ),
        SizedBox(height: 10.0),
        Center(
          child : FutureBuilder<Book>(
            future : get_review(),
            builder: (context, snapshot){
              if (snapshot.hasData){
                //print(get_review());
                return Text( "title : " + snapshot.data.title);
              }
              return Text("Please try again");
            },
          ),
        ),
      ],
    )
    );
  }
}
*/
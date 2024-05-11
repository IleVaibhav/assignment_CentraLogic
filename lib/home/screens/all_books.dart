import 'package:assignment_2/customs/common_data.dart';
import 'package:assignment_2/home/models/books_model.dart';
import 'package:assignment_2/home/screens/book_details.dart';
import 'package:flutter/material.dart';

class AllBooks extends StatelessWidget {
  final List<BookModel> allBooks;
  const AllBooks(this.allBooks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(
          'All Books',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: CommonData.textBlack
          )
        ),
      ),
      body: ListView.builder(
        itemCount: allBooks.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => BookDetails(
                        bookModel: allBooks[index]
                      )
                    )
                  );
                },

                leading: Image.asset(
                  allBooks[index].coverImg,
                  height: 120
                ),

                title: Text(
                  allBooks[index].title,
                  style: TextStyle(
                    fontSize: 16,
                    color: CommonData.textBlack,
                    fontWeight: FontWeight.w700
                  ),
                  softWrap: true,
                ),

                subtitle: Text(
                  allBooks[index].author,
                  style: TextStyle(
                    fontSize: 14,
                    color: CommonData.textGrey,
                    fontWeight: FontWeight.w500
                  ),
                  softWrap: true
                ),

                trailing: Text(
                  "\$${allBooks[index].price}",
                  style: TextStyle(
                    fontSize: 17,
                    color: CommonData.bgColor,
                    fontWeight: FontWeight.w700
                  )
                )
              ),

              Divider(
                height: 10,
                thickness: 0.5,
                color: CommonData.textGrey
              )
            ],
          ),
        ),
      )
    );
  }
}
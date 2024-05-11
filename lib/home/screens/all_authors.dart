import 'package:assignment_2/customs/common_data.dart';
import 'package:assignment_2/home/models/books_model.dart';
import 'package:flutter/material.dart';

class AllAuthors extends StatelessWidget {
  final List<AuthorModel> allAuthors;
  const AllAuthors(this.allAuthors, {super.key});

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

      body: GridView.builder(
        itemCount: allAuthors.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2
        ), 
        itemBuilder: (context, index) => Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                allAuthors[index].image,
                height: 100,
                width: 100,
                fit: BoxFit.cover
              )
            ),
            const SizedBox(
              height: 10,
              width: 0
            ),
            Text(
              allAuthors[index].name,
              style: TextStyle(
                fontSize: 17,
                color: CommonData.customBlue,
                fontWeight: FontWeight.w700
              )
            ),
            Text(
              allAuthors[index].profession,
              style: TextStyle(
                fontSize: 14,
                color: CommonData.textBlack,
                fontWeight: FontWeight.w400
              )
            )
          ],
        )
      )
    );
  }
}
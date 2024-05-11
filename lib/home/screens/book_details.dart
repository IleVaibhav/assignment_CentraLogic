import 'package:assignment_2/customs/common_data.dart';
import 'package:assignment_2/customs/custom_widgets/button.dart';
import 'package:assignment_2/home/models/books_model.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final BookModel bookModel;
  const BookDetails({super.key, required this.bookModel});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {

  int bookCount = 1;
  bool addToBag = false;

  @override
  void initState() {
    setState(() {
      addToBag = widget.bookModel.isInBag;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextButton(
              onTap: () {
                setState(() {
                  addToBag = !addToBag;
                });
              }, 
              text: addToBag ? 'Remove from Wishlist' : 'Add to Wishlist',
              bgColor: CommonData.customBlue, 
              textColor: CommonData.customLightBlue, 
              buttonRadius: 48,
              buttonHeight: 48,
              buttonWidth: 220
            ),
            CustomTextButton(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Buy Now'))
                );
              }, 
              text: 'Buy Now', 
              bgColor: CommonData.customLightBlue,
              textColor: CommonData.customBlue, 
              buttonRadius: 48,
              buttonHeight: 48,
              buttonWidth: 125
            ),
          ],
        )
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                widget.bookModel.coverImg,
                height: 313,
                width: 237,
                fit: BoxFit.cover
              ),
            ),
            const SizedBox(
              height: 20,
              width: 0
            ),
      
            Text(
              widget.bookModel.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: CommonData.textBlack
              )
            ),
      
            Image.asset(
              widget.bookModel.vendor,
              height: 80,
              width: 80
            ),
      
            Text(
              widget.bookModel.description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CommonData.textGrey
              )
            ),
            const SizedBox(
              height: 20,
              width: 0
            ),
      
            Text(
              'Review',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: CommonData.textBlack
              )
            ),
            const SizedBox(
              height: 10,
              width: 0
            ),
      
            Row(
              children: [
                Row(
                  children: List.generate(
                    5, 
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Icon(
                        Icons.star_rounded,
                        color: index < int.parse(widget.bookModel.review) ? Colors.yellow.shade700 : Colors.black,
                        size: 24
                      ),
                    )
                  )
                ),
                Text(
                  '(${widget.bookModel.review})',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: CommonData.textBlack
                  )
                )
              ],
            ),
            const SizedBox(
              height: 15,
              width: 0
            ),
      
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CommonData.textFieldBG
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if(bookCount > 1) {
                            setState(() {
                              bookCount--;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          size: 25,
                          color: CommonData.textGrey
                        ),
                      ),
                      const SizedBox(
                        height: 0,
                        width: 15
                      ),
                      Text(
                        bookCount.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: CommonData.textBlack
                        )
                      ),
                      const SizedBox(
                        height: 0,
                        width: 15
                      ),
                      IconButton(
                        onPressed: () {
                          if(bookCount < widget.bookModel.availability) {
                            setState(() {
                              bookCount++;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: 25,
                          color: CommonData.customBlue
                        ),
                      ),
                    ]
                  )
                ),
                const SizedBox(
                  height: 0,
                  width: 25
                ),
                Text(
                  '\$${(bookCount * double.parse(widget.bookModel.price)).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CommonData.customBlue
                  )
                ),
              ],
            ),
            const Expanded(child: SizedBox(height: 0, width: 0))
          ],
        ),
      ),
    );
  }
}
import 'package:assignment_2/customs/common_data.dart';
import 'package:assignment_2/customs/custom_widgets/button.dart';
import 'package:assignment_2/home/api/load_data.dart';
import 'package:assignment_2/home/models/books_model.dart';
import 'package:assignment_2/home/screens/all_authors.dart';
import 'package:assignment_2/home/screens/all_books.dart';
import 'package:assignment_2/home/screens/book_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<BookModel> bookList = [];
  List<VendorModel> vendorList = [];
  List<AuthorModel> authorList = [];
  bool showLoading = false;

  void loadData() async {
    setState(() {
      showLoading = true;
    });
    bookList = await readBookData();
    vendorList = await readVendorData();
    authorList = await readAuthorData();
    showLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        leading: Icon(
          Icons.search,
          color: CommonData.textBlack,
        ),
        leadingWidth: 70,
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: CommonData.textBlack
          )
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications),
          SizedBox(
            height: 0,
            width: 25.0
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: showLoading ? Center(
          child: CircularProgressIndicator(
            color: CommonData.bgColor
          )
        ) : ListView(
          children: [
            const SizedBox(
              height: 10,
              width: 0
            ),
        
            Container(
              height: 146,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 249, 253, 1),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Special Offer',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: CommonData.textBlack
                          )
                        ),
                        const SizedBox(
                          height: 2,
                          width: 0
                        ),
                        Text(
                          'Discount 25%',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: CommonData.textBlack
                          )
                        ),
                        const SizedBox(
                          height: 12,
                          width: 0
                        ),
                        CustomTextButton(
                          onTap: () {}, 
                          text: 'Order Now', 
                          bgColor: CommonData.customBlue, 
                          textColor: CommonData.customLightBlue, 
                          buttonRadius: 40,
                          buttonHeight: 40,
                          buttonWidth: 125
                        )
                      ]
                    )
                  ),
                  Image.asset('asset/images/books/book1.png')
                ],
              ),
            ),
        
            const SizedBox(
              height: 10,
              width: 0
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, 
                (index) => Container(
                  height: 5,
                  width: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CommonData.textGrey,
                  )
                )
              )
            ),
        
            const SizedBox(
              height: 20,
              width: 0
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top of Week',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: CommonData.textBlack
                  )
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AllBooks(bookList))
                    );
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: CommonData.customBlue
                    )
                  ),
                )
              ]
            ),
        
            const SizedBox(
              height: 10,
              width: 0
            ),
        
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  bookList.length > 5 ? 5 : bookList.length, 
                  (index) => Container(
                    width: 137,
                    padding: const EdgeInsets.only(right: 12.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => BookDetails(bookModel: bookList[index])
                          )
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            bookList[index].coverImg,
                            height: 160,
                            width: 127,
                            fit: BoxFit.fill
                          ),
                          Text(
                            bookList[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: CommonData.textBlack
                            )
                          ),
                          Text(
                            '\$${bookList[index].price}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: CommonData.customBlue
                            )
                          )
                        ]
                      ),
                    ),
                  )
                )
              ),
            ),
        
            const SizedBox(
              height: 25,
              width: 0
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Vendors',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: CommonData.textBlack
                  )
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: CommonData.customBlue
                    )
                  ),
                )
              ]
            ),
        
            const SizedBox(
              height: 10,
              width: 0
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                vendorList.length, 
                (index) => Padding(
                  padding: const EdgeInsets.all(0),
                  child: Image.asset(vendorList[index].vendorImg),
                )
              )
            ),
        
            const SizedBox(
              height: 25,
              width: 0
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Authors',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: CommonData.textBlack
                  )
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AllAuthors(authorList))
                    );
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: CommonData.customBlue
                    )
                  ),
                )
              ]
            ),
        
            const SizedBox(
              height: 10,
              width: 0
            ),
        
            SizedBox(
              height: 195,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  authorList.length > 5 ? 5 : authorList.length, 
                  (index) => Container(
                    width: 125,
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(105),
                          child: Image.asset(
                            authorList[index].image,
                            height: 105,
                            width: 105,
                            fit: BoxFit.cover
                          ),
                        ),
                        Text(
                          authorList[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: CommonData.textBlack
                          )
                        ),
                        Text(
                          authorList[index].profession,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: CommonData.textGrey
                          )
                        )
                      ],
                    ),
                  )
                )
              ),
            ),
        
            const SizedBox(
              height: 15.0,
              width: 0
            )
          ],
        )
      )
    );
  }
}
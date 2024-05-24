import 'package:assignment_3_provider/home/models/books_model.dart';
import 'package:assignment_3_provider/home/provider/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../customs/common_data.dart';
import '../customs/custom_widgets/button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BookDataProvider>(context, listen: false).loadBookData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        title: Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: CommonData.textBlack
          )
        )
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Consumer<BookDataProvider>(
          builder: (context, value, child) {
            List<BookModel> cartBookList = [];
            for(int i = 0; i < value.bookList.length; i++) {
              if(value.bookList[i].isInBag) {
                cartBookList.add(value.bookList[i]);
              }
            }
        
            if(value.loading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue.shade900
                )
              );
            }
            else if(value.statusCode == 400) {
              return const Center(
                child: Text(
                  'Unable to load data',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                )
              );
            }
            else {
              return value.totalCartCount == 0 ? const Center(
                child: Text(
                  'No data found',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                )
              ) : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.totalCartCount,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  cartBookList[index].coverImg.toString(),
                                  height: 70,
                                  width: 50,
                                  fit: BoxFit.fill
                                ),
                        
                                const SizedBox(
                                  height: 0,
                                  width: 15
                                ),
                        
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 40 - 15 - 50 - 24,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        cartBookList[index].title,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                        ),
                                        softWrap: true,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        cartBookList[index].author,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: CommonData.textGrey
                                        )
                                      ),
                                  
                                      Text(
                                        "\$${cartBookList[index].price}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue.shade900
                                        )
                                      )
                                    ]
                                  ),
                                ),
                                                                
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () {
                                      Provider.of<BookDataProvider>(context, listen: false).removeFromCart(cartBookList[index].id);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.blue.shade900,
                                      size: 24,
                                    )
                                  ),
                                ),
                              ]
                            ),
                            const SizedBox(
                              height: 5,
                              width: 0
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 0.5
                            ),
                            const SizedBox(
                              height: 5,
                              width: 0
                            )
                          ]
                        );
                      },
                    ),
                  ),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "  Total Prize : ",
                        style: TextStyle(
                          fontSize: 15,
                          color: CommonData.textBlack,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      Text(
                        "\$${value.cartPrize.toStringAsFixed(2)}  ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.w600
                        )
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 5
                  ),

                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                    height: 1
                  ),

                  const SizedBox(
                    height: 5
                  ),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "  Total Product Count : ",
                        style: TextStyle(
                          fontSize: 15,
                          color: CommonData.textBlack,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      Text(
                        "${value.totalCartCount}  ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.w600
                        )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10
                  ),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextButton(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Place Order'))
                          );
                        }, 
                        text: 'Place order',
                        bgColor: CommonData.customBlue, 
                        textColor: CommonData.customLightBlue, 
                        buttonRadius: 48,
                        buttonHeight: 48,
                        buttonWidth: MediaQuery.of(context).size.width / 2.3
                      ),

                      CustomTextButton(
                        onTap: () {
                          value.emptyCart();
                        }, 
                        text: 'Empty cart',
                        bgColor: Colors.blue.shade50, 
                        textColor: CommonData.customBlue, 
                        buttonRadius: 48,
                        buttonHeight: 48,
                        buttonWidth: MediaQuery.of(context).size.width / 2.3
                      ),
                    ],
                  ),
        
                  const SizedBox(
                    height: 5
                  )
                ],
              );
            }
            
          }
        ),
      )
    );
  }
}
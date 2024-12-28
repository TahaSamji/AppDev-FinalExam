import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myexam/bloc/ProductBloc.dart';

class Productview extends StatefulWidget {
  const Productview({Key? key}) : super(key: key);

  @override
  State<Productview> createState() => _ProductViewState();
}

class _ProductViewState extends State<Productview> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProducts());
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 127, 228, 1.0),
      body: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        child: FractionallySizedBox(
          alignment: Alignment.center,
          heightFactor: 0.99,
          widthFactor: 0.99,
          child: Container(
            color: Colors.pink[50],
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  final product = state.products.first;

                  if (state.products.isEmpty) {
                    return const Center(child: Text('No products available'));
                  }

                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.arrow_back),
                            Text("Details"),
                            Icon(Icons.share),
                          ],
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.asset(
                              'assets/pic.PNG',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          color: Colors.pink[50],
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${product.name}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.pink[50],
                                      border: Border.all(
                                          color: Colors.pink, width: 2),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (quantity > 1) quantity--;
                                            });
                                          },
                                          icon: Icon(Icons.remove),
                                          color: Colors.pink,
                                        ),
                                        Text(
                                          '$quantity',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                          color: Colors.pink,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${product.amount}',
                                style:
                                TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${product.description}',
                                style:
                                TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      color: Colors.pink,
                                      child: SizedBox(
                                        height: 35,
                                        width: 40,
                                        child: Icon(
                                          Icons.replay_5,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("Delivery Time"),
                                      Text(
                                        "40-45 min",
                                        style: TextStyle(fontSize: 13),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("Total Price"),
                                      Text(
                                        '\$${(product.price * quantity).toDouble()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                     backgroundColor : Colors.pink, // Background color
                                    ),
                                    onPressed: () {},
                                    child: Text("Add to Cart",style: TextStyle(color: Colors.white),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is ProductError) {
                  return Center(
                    child: Text('Error: ${state.error}'),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}

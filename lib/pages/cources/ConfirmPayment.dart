import 'package:flutter/material.dart';
import 'Payment.dart';
import 'DonePayment.dart';

class Confirm_Payment extends StatelessWidget {
  // var CNCotroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: MaterialButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Payment()),
            );
          },
          child: const Icon(
            Icons.chevron_left,
            size: 60,
          ),
        ),
        title: const Text(
          'Conform Payment',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Container(
                height: 160,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 17),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),

                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "Ahmed",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'OLIVIA RHYE',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    '06/24 ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '1234 1234 1234 1234 ',
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/wi.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white.withOpacity(0.3)
                          ),
                          child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/master_c.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),

                        )

                      ],
                    ),
                  ],
                ),

              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Please fill the form',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        // hintText: 'Email Address',
                        labelText: 'Card Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    // hintText: 'Email Address',
                                    labelText: 'Expiration date ',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    // hintText: 'Email Address',
                                    labelText: 'CCV',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                              ),

                            ],
                          ),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        // hintText: 'Email Address',
                        labelText: 'Card Holder Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'TOTAL',
                                style: TextStyle(
                                  fontSize: 22,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                '\$120.00',
                                style: TextStyle(
                                  fontSize: 22,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    SizedBox(height: 40,),
                    Center(
                      child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.red
                            ),
                            child: MaterialButton(onPressed: (){
                                Navigator.push(
                                  context,

                                  MaterialPageRoute(builder: (context) => Don_Payment()),
                                );
                            },
                              child: Text(
                                'Confirm Payment',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}

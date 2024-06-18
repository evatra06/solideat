import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool applePayChecked = false;
  bool cardPaymentChecked = false;
  bool alipayChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paiement'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fond2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Comment souhaitez-vous payer ?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              // Option Apple Pay
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: applePayChecked,
                      onChanged: (value) {
                        setState(() {
                          applePayChecked = value!;
                        });
                      },
                    ),
                    SizedBox(width: 10.0),
                    Text('Payer par Apple Pay'),
                    SizedBox(width: 20.0),
                    if (applePayChecked)
                      Text(
                        'V',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    SizedBox(width: 10.0),
                    Image.asset(
                      'assets/applepay.jpeg',
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              // Option Payer par carte
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: cardPaymentChecked,
                      onChanged: (value) {
                        setState(() {
                          cardPaymentChecked = value!;
                        });
                      },
                    ),
                    SizedBox(width: 10.0),
                    Text('Payer par carte'),
                    SizedBox(width: 20.0),
                    if (cardPaymentChecked)
                      Text(
                        'V',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    SizedBox(width: 10.0),
                    Image.asset(
                      'assets/visa_icon.jpg',
                      width: 40.0,
                      height: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    Image.asset(
                      'assets/mastercard.jpg',
                      width: 40.0,
                      height: 30.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              // Option Alipay
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: alipayChecked,
                      onChanged: (value) {
                        setState(() {
                          alipayChecked = value!;
                        });
                      },
                    ),
                    SizedBox(width: 10.0),
                    Text('Payer par Alipay'),
                    SizedBox(width: 20.0),
                    if (alipayChecked)
                      Text(
                        'V',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    SizedBox(width: 10.0),
                    Image.asset(
                      'assets/alipaylogo.jpg',
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Logique pour finaliser le paiement
                },
                child: Text('Finaliser le paiement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
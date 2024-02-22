import 'package:flutter/material.dart';
import '../DeliveryWidget.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  'Send Parcel',
                  style: TextStyle(
                    fontSize: 45.0, // Adjust the font size as needed
                    fontWeight: FontWeight.bold, // Make the text bold
                    color: Colors.blue, // Set the text color to your preference
                    letterSpacing: 1.2, // Adjust letter spacing for better visual appeal
                    // You can add more style properties as needed
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                'Delivery Method',
                style: TextStyle(
                  fontSize: 25.0, // Adjust the font size as needed
                  fontWeight: FontWeight.w500, // You can adjust the font weight
                  color: Colors.grey[700], // Set the text color to your preference
                  letterSpacing: 0.8, // Adjust letter spacing for better visual appeal
                  // You can add more style properties as needed
                ),
              ),

              const SizedBox(
                height: 11,
              ),
              // const DeliveryWidget(
              //   parcelDeliveryMethod: 'From door to parcel center',
              //   parcelDeliveryDuration: '1 - 2 days',
              //   parcelDeliveryImage: 'assets/img_door_to_parcel.png',
              // ),
              const DeliveryWidget(
                parcelDeliveryMethod: 'My location to destination',
                parcelDeliveryDuration: '2 - 3 days',
                parcelDeliveryImage: 'assets/img_door_to_door.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
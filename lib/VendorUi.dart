import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_yt/pages/CustomerUI.dart';
import 'package:google_maps_yt/pages/TrackingPage.dart';

import 'DeliveryWidget.dart';
import 'consts.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({super.key});

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  int _currentIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: ListView(
          children: [
            const Center(
              child: Text(
                'Receive Parcel',
                style: TextStyle(
                  fontSize: 45.0, // Adjust the font size as needed
                  fontWeight: FontWeight.bold, // Make the text bold
                  color: Colors.blue, // Set the text color to your preference
                  letterSpacing:
                      1.2, // Adjust letter spacing for better visual appeal
                  // You can add more style properties as needed
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Text(
              'All Parcel Requests',
              style: TextStyle(
                fontSize: 25.0,
                // Adjust the font size as needed
                fontWeight: FontWeight.w500,
                // You can adjust the font weight
                color: Colors.grey[700],
                // Set the text color to your preference
                letterSpacing:
                    0.8, // Adjust letter spacing for better visual appeal
                // You can add more style properties as needed
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Container(
              height: 600,
              child: ListView.builder(
                itemCount: OrderManagement.allOrdersList.length,
                itemBuilder: (BuildContext context, int index) {
                  OrderDetails order = OrderManagement.allOrdersList[index];
                  return ListTile(
                    title: Text(
                      'Name: ${order.name}\nEmail: ${order.email}\nPhone: ${order.phoneNumber}\nAddress: ${order.address}',
                      // Customize the text style as needed
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Enter 6-digit code:'),
                              content: TextField(
                                keyboardType: TextInputType.number,
                                maxLength: 6,
                                onChanged: (value) {
                                  // You can access the entered value here if needed
                                },
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                    // Add your logic for accepting the request here
                                    print('Request accepted for order at index $index');
                                  },
                                  child: Text('Submit'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Accept Request'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const customerUi()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VendorPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TrackOrder()),
              );
              break;
          }},



        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: 'Customer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Vendor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Tracker',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_yt/pages/map_page.dart';

import '../DeliveryWidget.dart';
import '../VendorUi.dart';
import '../consts.dart';
import 'CustomerUI.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  int _currentIndex=2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Text('Order Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Details Section
            const Text(
              'Product Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Add your product details widgets here

            // Live Location Button
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapPage()));
              },
              child: const Text('View Live Location'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: OrderManagement.allOrdersList.length,
                itemBuilder: (BuildContext context, int index) {
                  OrderDetails order = OrderManagement.allOrdersList[index];
                  return ListTile(
                    title: Text(
                      'Name: ${order.name}\nEmail: ${order.email}\nPhone: ${order.phoneNumber}\nAddress: ${order.address}',
                      // Customize the text style as needed
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

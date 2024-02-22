import 'package:flutter/material.dart';
import 'package:google_maps_yt/VendorUi.dart';
import 'package:google_maps_yt/couriersize.dart';
import 'package:google_maps_yt/pages/PurchasePage.dart';
import 'package:google_maps_yt/pages/TrackingPage.dart';

class customerUi extends StatefulWidget {
  const customerUi({super.key});

  @override
  State<customerUi> createState() => _customerUiState();
}

class _customerUiState extends State<customerUi> {
  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              'Parcel Size',
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
            InkWell(
              child: const courierSize(
                parcelSize: 'Small',
                parcelSizeDimension: 'Max. 25 kg, 8 x 38 x 64 cm',
                parcelSizeDescription: 'Fits in an envelope',
                parcelSizeImage: 'assets/img_parcel_size_small.png',
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PurchasePage()),
                );
              },
            ),
            InkWell(
              child: const courierSize(
                parcelSize: 'Medium',
                parcelSizeDimension: 'Max. 25 kg, 19 x 38 x 64 cm',
                parcelSizeDescription: 'Fits in a shoe box',
                parcelSizeImage: 'assets/img_parcel_size_medium.png',
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PurchasePage()),
                );
              },
            ),
            InkWell(
              child: const courierSize(
                parcelSize: 'Large',
                parcelSizeDimension: 'Max. 25 kg, 41 x 38 x 64 cm',
                parcelSizeDescription: 'Fits in a cardboard box',
                parcelSizeImage: 'assets/img_parcel_size_large.png',
              ),onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PurchasePage()),
              );
            },
            ),
            InkWell(
              child: const courierSize(
                parcelSize: 'Custom',
                parcelSizeDimension: 'Max: 30kg or 300cm',
                parcelSizeDescription: 'Fits on a skid',
                parcelSizeImage: 'assets/img_parcel_size_custom.png',
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PurchasePage()),
                );
              },
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

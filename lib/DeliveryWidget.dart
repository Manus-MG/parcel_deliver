import 'package:flutter/material.dart';
import 'package:google_maps_yt/VendorUi.dart';
import 'package:google_maps_yt/pages/CustomerUI.dart';
import 'package:google_maps_yt/pages/TrackingPage.dart';

import 'Maps/map_location_picker.dart';
import 'consts.dart';

class DeliveryWidget extends StatefulWidget {
  const DeliveryWidget(
      {Key? key,
      required this.parcelDeliveryMethod,
      required this.parcelDeliveryDuration,
      required this.parcelDeliveryImage})
      : super(key: key);

  final String parcelDeliveryMethod,
      parcelDeliveryDuration,
      parcelDeliveryImage;

  @override
  _DeliveryWidgetState createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  List<OrderDetails> ordersList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(0),
        trailing: const SizedBox.shrink(),
        title: Container(
          padding: const EdgeInsets.all(
            16,
          ),
          height: 102,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.parcelDeliveryImage),
                  ),
                ),
              ),
              const SizedBox(
                width: 34,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.parcelDeliveryMethod,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    widget.parcelDeliveryDuration,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              )
            ],
          ),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 1,
            color: const Color(0xFFd5d5d5),
          ),
          _buildExpansionChildren(context),
        ],
      ),
    );
  }

  Widget _buildExpansionChildren(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16).copyWith(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            'Recipient Info',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MapLocationPicker(
                              apiKey: 'AIzaSyCWWt2iN04AAlJtD9t3nbUPCzagcNDGTBE',
                            )));
              },
              child: const Text('Select Location'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Name',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          TextField(
            controller: nameController,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Email',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          TextField(
            controller: emailController,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Phone number',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          TextField(
            controller: phoneNumberController,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Address',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          TextField(
            controller: addressController,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                OrderDetails order = OrderDetails(
                  name: nameController.text,
                  email: emailController.text,
                  phoneNumber: phoneNumberController.text,
                  address: addressController.text,
                );

                ordersList.add(order);

                OrderManagement.allOrdersList.add(order);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrackOrder()));
              },
              child: const Text('Place your order'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class OrderDetails {
  String name;
  String email;
  String phoneNumber;
  String address;

  OrderDetails(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.address});
}

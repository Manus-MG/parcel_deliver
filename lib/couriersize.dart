import 'package:flutter/material.dart';

class courierSize extends StatelessWidget {
  const courierSize(
      {Key? key,
      required this.parcelSize,
      required this.parcelSizeDimension,
      required this.parcelSizeDescription,
      required this.parcelSizeImage})
      : super(key: key);

  final String parcelSize,
      parcelSizeDimension,
      parcelSizeDescription,
      parcelSizeImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 99,
            width: 69,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(parcelSizeImage),
              ),
            ),
          ),
          const SizedBox(
            width: 38,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                parcelSize,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                parcelSizeDimension,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                parcelSizeDescription,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}

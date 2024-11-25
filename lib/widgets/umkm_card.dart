import 'package:flutter/material.dart';

class UMKMCard extends StatelessWidget {
  final String name;
  final String address;
  final int rating;
  final String image;
  final VoidCallback onTap;
  final VoidCallback onOrder;

  const UMKMCard({
    Key? key,
    required this.name,
    required this.address,
    required this.rating,
    required this.image,
    required this.onTap,
    required this.onOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(address),
              const SizedBox(height: 5),
              Row(
                children: List.generate(
                  rating,
                  (index) => const Icon(Icons.star, size: 16, color: Colors.orange),
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.message, color: Colors.teal),
            onPressed: onOrder,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

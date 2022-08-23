import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RestaurantsPageContent extends StatelessWidget {
  const RestaurantsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('restaurants')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  onDismissed: (_) {
                    FirebaseFirestore.instance
                        .collection('restaurants')
                        .doc(document.id)
                        .delete();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(document['name']),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(document['danie']),
                          ],
                        ),
                        Text(document['rating'].toString()),
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white.withOpacity(0.1),
                                padding: EdgeInsets.zero),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('restaurants')
                                  .doc(document.id)
                                  .delete();
                            },
                            icon: const Icon(Icons.delete_rounded),
                            label: const Text('')),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          );
        });
  }
}

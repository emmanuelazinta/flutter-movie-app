import 'package:flutter/material.dart';

class ListviewDetails extends StatelessWidget {
  final List<Map<String, Object>> movielist;
  const ListviewDetails({super.key, required this.movielist});

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
        itemCount: movielist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final rated = movielist[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 100,
              child: Column(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(rated['movieUrl'] as String),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  rated['name'] as String,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                )
              ]),
            ),
          );
        });
  }
}

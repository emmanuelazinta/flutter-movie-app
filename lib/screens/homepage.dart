import 'package:flutter/material.dart';
import '../components/listviewdetails.dart';
import '../constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    print('hello world');
    pageController = PageController(
      viewportFraction: 0.7,
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: RichText(
          text: TextSpan(
              text: 'M',
              style: TextStyle(
                  color: Colors.orange.shade200,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              children: const <TextSpan>[
                TextSpan(text: 'ovies', style: TextStyle(color: Colors.white))
              ]),
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Trending',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: trendingList.length,
                  itemBuilder: (context, index) {
                    final trend = trendingList[index];
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(trend['movieUrl'] as String),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Upcoming',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.orange.shade200),
                      ))
                ],
              ),
            ),
            SizedBox(
                height: 200.0,
                child: ListviewDetails(
                  movielist: upcomingmovies,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Top Rated',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(color: Colors.orange.shade200),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200.0,
              child: ListviewDetails(
                movielist: toRated,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

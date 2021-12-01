////////////////////////////////////////////
///follor For more ig: @Countrol4offical
///@countrolfour@gmail.com
////////////////////////////////////////////
import 'package:flutter/material.dart';

class NewCollection extends StatefulWidget {
  const NewCollection({Key? key}) : super(key: key);

  @override
  _NewCollectionState createState() => _NewCollectionState();
}

class _NewCollectionState extends State<NewCollection> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Collection",
                        style: TextStyle(
                            fontSize: 25, color: Colors.grey.shade500),
                      ),
                      Text(
                        "Summer 2022",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: _buildIndicator(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MaterialButton(
                        height: 50,
                        minWidth: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          _pageController!.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
                controller: _pageController,
                children: <Widget>[
                  Image.network(
                    'https://www.pakicouture.com/wp-content/gallery/kayseria-summer-2018/kayseria-summer-2018-40.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://i.pinimg.com/originals/17/df/38/17df3818ea846f4b54239484890f7cf9.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://nextluxury.com/wp-content/uploads/mens-chic-summer-outfits-style-designs.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://i.pinimg.com/originals/66/05/46/660546b4338cdddf78226d019dfe9b23.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://images.bewakoof.com/utter/content/4051/content_Off-Shoulder-Tops.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ])),
    );
  }

  _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 50 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.grey.shade500,
          borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 5; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

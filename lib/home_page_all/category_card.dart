import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final VoidCallback press;
  final double width;
  final String svgScr;

  final double height;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.press,
    required this.svgScr,

    this.width = 300,
    this.height = 30, // Set a small height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: Container(
        width: width,
        height: height,
        child: Card(
          color: Colors.white,
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Reduce padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(height: 10), // Reduce spacing
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: 16, // Reduce font size
                        fontFamily: 'Changa-VariableFont_wght',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategorySwipeCards extends StatefulWidget {
  final List<CategoryCard> categoryCards;

  CategorySwipeCards({required this.categoryCards});

  @override
  _CategorySwipeCardsState createState() => _CategorySwipeCardsState();
}

class _CategorySwipeCardsState extends State<CategorySwipeCards> {
  SwipableStackController _controller = SwipableStackController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Height of the swipe stack container
      child: SwipableStack(
        controller: _controller,
        itemCount: widget.categoryCards.length,
        builder: (context, properties) {
          final index = properties.index % widget.categoryCards.length;
          return widget.categoryCards[index];
        },
        onSwipeCompleted: (index, direction) {
          // Handle swipe completion (optional)
        },
      ),
    );
  }
}

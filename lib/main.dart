import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.view_headline, size: 40),
                      CircleAvatar(
                        backgroundColor: Colors.black38,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Hi Krrish',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'welcome to your smart home',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 160,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.flash_on,
                                color: Colors.white,
                              ),
                              Text(
                                'Power Consumption',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Supply',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '500 W',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Savings',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '19%',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        RoomsScroll(
                          name: 'Living room',
                          isSelected: true,
                        ),
                        RoomsScroll(
                          name: 'Kitchen',
                          isSelected: false,
                        ),
                        RoomsScroll(
                          name: 'Bedroom',
                          isSelected: false,
                        ),
                        RoomsScroll(
                          name: 'Bathroom',
                          isSelected: false,
                        ),
                        RoomsScroll(
                          name: 'Garage',
                          isSelected: false,
                        ),
                      ],
                    ),
                  ),

                  //here we calling the GridB   Method/function we made at  bottom to implement
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: GridB(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoomsScroll extends StatelessWidget {
  final String name;
  final bool isSelected;
  const RoomsScroll({super.key, required this.name, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Container(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.black87,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({super.key});

  @override
  State<GridB> createState() => _GridBState();
}

// first we make stateful widget for GridView and name it .
class _GridBState extends State<GridB> {
  // bottom line is to store the content in the gridview,
  final List<Map<String, dynamic>> gridMap = [
    {
      //gridview 0 content
    },
    {
      //gridview 1 content
    },
    {
      //gridview 2 content
    },
    {
      //gridview 3 content
    },
    {
      //gridview 4 content
    },
    {
      //gridview 5 content
    },
  ];
  @override
  Widget build(BuildContext context) {
    //Rename the container with Gridview.builder
    return GridView.builder(
        //here are some properties we need to apply
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //for telling how much cross gridview we want
            crossAxisSpacing: 12.0, //horizontal spacing b/w two gridview
            mainAxisSpacing: 12.0, //vertical spacing b/w two gridview
            mainAxisExtent: 190),

        //here some more important properties we need to apply
        itemCount: gridMap.length,
        itemBuilder: (_, index) {
          //here finally make a container for gridview to give it a style and all
          return Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Smart Light',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('67%'),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.toggle_off))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

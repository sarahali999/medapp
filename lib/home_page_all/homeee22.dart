import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'NewsDetailPage.dart';
import 'news_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;
  final List<Widget> _pages = [
    ChatPage(),
    SearchPage(),
    HomePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: _pages[_selectedIndex],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 45, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'أهلا، يوسف',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontFamily: 'Changa-VariableFont_wght',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF5CBBE3),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Color(0xFFE1E1F6FF),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _buildPatientInfo(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 45, left: 15),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Material(
                    color: Color(0xFF5CBBE3),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.notifications,
                          color: Color(0xFFE1E1F6FF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: ClipRect(
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF5CBBE3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.chat_bubble_outline),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.notifications_none),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline),
                        label: '',
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Color(0xFFE1E1F6FF),
                    onTap: _onItemTapped,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientInfo() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 350,
            minHeight: 200,
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF5CBBE3),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'معلومات المريض',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFFE1E1F6FF),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.person,
                    color: Color(0xFFE1E1F6FF),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildInfoRow('الاسم', 'يوسف علي'),
              _buildInfoRow('العمر', '34'),
              _buildInfoRow('فصيلة الدم', 'A+'),
              _buildInfoRow('رقم الهاتف', '123456789'),
              _buildInfoRow('العنوان', '123 شارع الأمل'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          info,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFFE1E1F6FF),
          ),
        ),
        SizedBox(width: 10),
        Text(
          '$title: ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE1E1F6FF),
          ),
        ),
      ],
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('صفحة المحادثة'),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('صفحة البحث'),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> cardData = [
    {
      'title': 'الفحوصات والادوية التي تلقاها الزائر',
      'subtitle': 'العلاج المستمر',
      'color': Color(0xffdff19e).value.toString(),
    },
    {
      'title': 'تقريره الطبي',
      'subtitle': 'الحالة المرضية الكاملة',
      'color': Color(0xfff5d8b7).value.toString(),
    },
    {
      'title': 'الخريطة',
      'subtitle': 'دليلك الى المفارز الطبية',
      'color': Color(0xFFa3d0c6).value.toString(),
    },
  ];

  Widget _buildCard(Map<String, String> cardInfo) {
    Color cardColor = Color(int.parse(cardInfo['color']!));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Container(
        width: 250,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: InkWell(
          onTap: () {
            print('Card tapped: ${cardInfo['title']}');
          },
          child: Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 5),
                  Text(
                    cardInfo['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Changa-VariableFont_wght',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    cardInfo['subtitle']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Changa-VariableFont_wght',
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClinicNews() {
    return FutureBuilder<List<Article>>(
      future: NewsService().fetchArticles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load articles'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No articles available'));
        } else {
          return CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: snapshot.data!.map((article) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailPage(article: article),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              article.imageUrl,
                              height: 80,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                article.title,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 200),
              Container(
                height: 180,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.8),
                  itemCount: cardData.length,
                  itemBuilder: (context, index) {
                    return _buildCard(cardData[index]);
                  },
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  _buildClinicNews(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('صفحة الإشعارات'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('صفحة الملف الشخصي'),
    );
  }
}

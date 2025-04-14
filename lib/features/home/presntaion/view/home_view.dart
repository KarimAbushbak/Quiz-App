import 'package:flutter/material.dart';
import 'package:quizie/core/resources/manager_assets.dart';
import 'package:quizie/core/resources/manager_font_sizes.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<Map<String, String>> categories = [
    {'image': ManagerAssets.home1, 'label': 'C++'},
    {'image': ManagerAssets.home2, 'label': 'HTML'},
    {'image': ManagerAssets.home3, 'label': 'JavaScript'},
    {'image': ManagerAssets.home4, 'label': 'React'},
    {'image': ManagerAssets.home5, 'label': 'CSS'},
    {'image': ManagerAssets.home6, 'label': 'Python'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  width: 400,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      labelText: 'Enter something',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: ManagerFontSizes.s20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 17),
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return Column(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8E8E8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['label']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Recent Activties",
                  style: TextStyle(fontSize: ManagerFontSizes.s20),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 52,
                      height: 34,
                      decoration: BoxDecoration(
                          color: Color(0xFFE8E8E8),
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: AssetImage(ManagerAssets.home1))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Text("C++"),
                          Text(
                            "30 Questions",
                            style: TextStyle(fontSize: ManagerFontSizes.s10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 26 / 30,
                            strokeWidth: 4,
                            color: Colors.red,
                            backgroundColor: Colors.red.shade100,
                          ),
                          Text(
                            '26/30',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 52,
                      height: 34,
                      decoration: BoxDecoration(
                          color: Color(0xFFE8E8E8),
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: AssetImage(ManagerAssets.home2))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Text("HTML"),
                          Text(
                            "30 Questions",
                            style: TextStyle(fontSize: ManagerFontSizes.s10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 20 / 30,
                            strokeWidth: 4,
                            color: Colors.yellow,
                            backgroundColor: Colors.yellow.shade100,
                          ),
                          Text(
                            '20/30',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 52,
                      height: 34,
                      decoration: BoxDecoration(
                          color: Color(0xFFE8E8E8),
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: AssetImage(ManagerAssets.home3))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Text("JavaScript"),
                          Text(
                            "30 Questions",
                            style: TextStyle(fontSize: ManagerFontSizes.s10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 24 / 30,
                            strokeWidth: 4,
                            color: Colors.blueAccent,
                            backgroundColor: Colors.blueAccent.shade100,
                          ),
                          Text(
                            '24/30',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 52,
                      height: 34,
                      decoration: BoxDecoration(
                          color: Color(0xFFE8E8E8),
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: AssetImage(ManagerAssets.home4))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Text("React"),
                          Text(
                            "30 Questions",
                            style: TextStyle(fontSize: ManagerFontSizes.s10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 4 / 30,
                            strokeWidth: 4,
                            color: Colors.blue,
                            backgroundColor: Colors.blue.shade100,
                          ),
                          Text(
                            '4/30',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 52,
                      height: 34,
                      decoration: BoxDecoration(
                          color: Color(0xFFE8E8E8),
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: AssetImage(ManagerAssets.home5))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Text("CSS"),
                          Text(
                            "30 Questions",
                            style: TextStyle(fontSize: ManagerFontSizes.s10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 12 / 30,
                            strokeWidth: 4,
                            color: Colors.green,
                            backgroundColor: Colors.green.shade100,
                          ),
                          Text(
                            '12/30',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: double.infinity,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: 52,
                      height: 34,
                      decoration: BoxDecoration(
                          color: Color(0xFFE8E8E8),
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: AssetImage(ManagerAssets.home6))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Text("Python"),
                          Text(
                            "30 Questions",
                            style: TextStyle(fontSize: ManagerFontSizes.s10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 28 / 30,
                            strokeWidth: 4,
                            color: Colors.purple,
                            backgroundColor: Colors.purple.shade100,
                          ),
                          Text(
                            '28/30',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

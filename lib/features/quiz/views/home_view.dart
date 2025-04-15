import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizie/core/resources/manager_assets.dart';
import 'package:quizie/core/resources/manager_font_sizes.dart';

import '../../../core/routes.dart';
import '../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../bloc/progress_bloc.dart';

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
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.questionPage,
                    arguments: 'C++', //
                  );
                },
                child: Container(
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
                      BlocBuilder<ProgressBloc, ProgressState>(
                        builder: (context, state) {
                          final answered = state.answeredByCategory['C++'] ?? 0;
                          final total = 30;
                          final progress = answered / total;

                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: progress,
                                strokeWidth: 4,
                                color: Colors.red,
                                backgroundColor: Colors.red.shade100,
                              ),
                              Text(
                                '$answered/$total',
                                style: const TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.questionPage,
                    arguments: 'HTML',
                  );
                },
                child: Container(
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
                      BlocBuilder<ProgressBloc, ProgressState>(
                        builder: (context, state) {
                          final answered = state.answeredByCategory['HTML'] ?? 0;
                          final total = 30;
                          final progress = answered / total;

                          return SizedBox(
                            width: 40,
                            height: 40,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularProgressIndicator(
                                  value: progress,
                                  strokeWidth: 4,
                                  color: Colors.yellow,
                                  backgroundColor: Colors.yellow.shade100,
                                ),
                                Text(
                                  '$answered/$total',
                                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.questionPage,
                    arguments: 'JavaScript',
                  );
                },
                child: Container(
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
                      BlocBuilder<ProgressBloc, ProgressState>(
                        builder: (context, state) {
                          final answered = state.answeredByCategory['JavaScript'] ?? 0;
                          final total = 30;
                          final progress = answered / total;

                          return SizedBox(
                            width: 40,
                            height: 40,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularProgressIndicator(
                                  value: progress,
                                  strokeWidth: 4,
                                  color: Colors.blueAccent,
                                  backgroundColor: Colors.blueAccent.shade100,
                                ),
                                Text(
                                  '$answered/$total',
                                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.questionPage,
                    arguments: 'React',
                  );
                },
                child: Container(
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
                      BlocBuilder<ProgressBloc, ProgressState>(
                        builder: (context, state) {
                          final answered = state.answeredByCategory['React'] ?? 0;
                          final total = 30;
                          final progress = answered / total;

                          return SizedBox(
                            width: 40,
                            height: 40,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularProgressIndicator(
                                  value: progress,
                                  strokeWidth: 4,
                                  color: Colors.blue,
                                  backgroundColor: Colors.blue.shade100,
                                ),
                                Text(
                                  '$answered/$total',
                                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.questionPage,
                      arguments: 'CSS');
                },
                child: Container(
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
                      BlocBuilder<ProgressBloc, ProgressState>(
                        builder: (context, state) {
                          final answered = state.answeredByCategory['CSS'] ?? 0;
                          final total = 30;
                          final progress = answered / total;

                          return SizedBox(
                            width: 40,
                            height: 40,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularProgressIndicator(
                                  value: progress,
                                  strokeWidth: 4,
                                  color: Colors.green,
                                  backgroundColor: Colors.green.shade100,
                                ),
                                Text(
                                  '$answered/$total',
                                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.questionPage,
                    arguments: 'Python',
                  );
                },
                child: Container(
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
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async {
                  final prefs = AppSettingsSharedPreferences();
                  final categories = ['C++', 'HTML', 'JavaScript', 'React', 'CSS', 'Python'];

                  for (final cat in categories) {
                    await prefs.resetAll(categories); // custom method to reset to 0
                    context.read<ProgressBloc>().add(ProgressEvent(cat, 0));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child:  Text(
                  'Reset Progress',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

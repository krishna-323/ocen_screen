import 'package:flutter/material.dart';
import 'package:ocen_screen/screen/approve.dart';
import 'package:ocen_screen/screen/award_status.dart';
import 'package:ocen_screen/screen/compare.dart';
import 'package:ocen_screen/screen/duplicate_revision.dart';
import 'package:ocen_screen/screen/margin_sheet.dart';
import 'package:ocen_screen/screen/over_heads.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Named Routes',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/second': (context) => const ProjectMarginSheet(title: 'Project Margin Sheet',),
        '/third': (context) => const OverHeads(title: 'Overheads',),
        // '/third':(context)=>MyApp2(),
        '/awardStatus':(context)=>  const AwardStatus(title:"Award Status"),
        '/duplicateRevision':(context)=> const DuplicateRevision(title:"Duplicate Revision"),
        '/approve':(context)=> const Approve(title:"Approve"),
        '/compare':(context)=> const Compare(title:"Compare"),
      },
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Project Margin Sheet"),
                const SizedBox(height:10 ,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                  child: const Text('Go To'),
                ),
                const SizedBox(height:10 ,),
                const Text("Over Heads"),
                const SizedBox(height:10 ,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/third');
                  },
                  child: const Text('Go To'),
                ),
                const SizedBox(height:10 ,),
                const Text("Awarded Status POPUP"),
                const SizedBox(height:10 ,),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/awardStatus');
                  },
                  child: const Text('Go To'),
                ),
                const SizedBox(height:10 ,),
                const Text("Duplicate Revision"),
                const SizedBox(height:10 ,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/duplicateRevision');
                  },
                  child: const Text('Go To'),
                ),

                const SizedBox(height:10 ,),
                const Text("Approve"),
                const SizedBox(height:10 ,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/approve');
                  },
                  child: const Text('Go To'),
                ),

                const SizedBox(height:10 ,),
                const Text("Compare"),
                const SizedBox(height:10 ,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/compare');
                  },
                  child: const Text('Go To'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
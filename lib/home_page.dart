import 'package:flutter/material.dart';
import 'package:flutter_provider/constrained_center.dart';
import 'package:flutter_provider/home_page_post.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<HomePagePost>>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 612,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedCenter(
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                  radius: 72,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              ConstrainedCenter(
                child: SelectableText(
                  '코드프리테이션',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SelectableText(
                '#클론 #공부 #연습 #기록 #정리 #일상',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 40,
              ),
              SelectableText(
                'Title',
                style: Theme.of(context).textTheme.headline2,
              ),
              for (var post in posts)
                HomeListTile(
                  post: post,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeListTile extends StatelessWidget {
  final HomePagePost post;

  const HomeListTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        InkWell(
          child: Text(
            post.title,
            style: TextStyle(
              color: Colors.blueAccent.shade700,
            ),
          ),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        SelectableText(
          DateFormat('d MMMM y').format(post.date),
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}

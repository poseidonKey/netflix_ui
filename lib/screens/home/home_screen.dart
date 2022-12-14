import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_ui/screens/deatil/detail_screen.dart';
import '../components/label_icon.dart';
import '../components/play_button.dart';
import '../components/small_sub_text.dart';
import 'components/poster.dart';
import 'components/rank_poster.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;
    List<String> posters = [
      "assets/images/big_buck_bunny_poster.jpg",
      "assets/images/les_miserables_poster.jpg",
      "assets/images/minari_poster.jpg",
      "assets/images/the_book_of_fish_poster.jpg",
    ];
    ScrollController _backController = ScrollController();
    ScrollController _frontController = ScrollController();

    return Stack(
      children: [
        SingleChildScrollView(
          controller: _backController,
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage(posters[0]),
                    height: appSize.height * 0.6 +
                        (const SliverAppBar().toolbarHeight * 2),
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    height: appSize.height * 0.6 +
                        (const SliverAppBar().toolbarHeight * 2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.0),
                          Colors.black,
                        ],
                        stops: const [0.0, 0.5, 0.9],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: appSize.height,
              )
            ],
          ),
        ),
        SafeArea(
          child: NotificationListener(
            onNotification: (ScrollNotification scrollInfo) {
              if (_frontController.offset <= appSize.height) {
                _backController.jumpTo(_frontController.offset);
                return true;
              } else {
                return false;
              }
            },
            child: CustomScrollView(
              controller: _frontController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  leading: const Center(
                    child: Text(
                      "M",
                      style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  actions: [
                    const Icon(FontAwesomeIcons.chromecast),
                    const SizedBox(width: 25.0),
                    const Icon(FontAwesomeIcons.searchengin),
                    const SizedBox(width: 25.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: const Image(
                          image: AssetImage("assets/images/dog.jpg"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                  ],
                ),
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  pinned: true,
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("TV ????????????"),
                      Text("??????"),
                      Text("?????? ?????? ?????????"),
                    ],
                  ),
                  toolbarTextStyle:
                      const TextTheme(headline6: TextStyle(fontSize: 18.0))
                          .bodyText2,
                  titleTextStyle:
                      const TextTheme(headline6: TextStyle(fontSize: 18.0))
                          .headline6,
                ),
                SliverToBoxAdapter(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: _buildInfoBottomSheet,
                      );
                    },
                    child: SizedBox(
                      height: appSize.height * .6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "?????? ???????????? ????????? ?????? 1???",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              LabelIcon(
                                icon: FontAwesomeIcons.plus,
                                label: "?????? ?????? ?????????",
                              ),
                              PlayButton(width: 80.0),
                              LabelIcon(
                                icon: Icons.info_outline,
                                label: "??????",
                              )
                            ],
                          ),
                          const SizedBox(height: 30.0)
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 40.0, left: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                                text: "?????? ????????? ",
                                children: [
                                  TextSpan(
                                    text: "TOP 10",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: " ?????????"),
                                ],
                                style: TextStyle(fontSize: 18.0)),
                          ),
                          const SizedBox(height: 10.0),
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                posters.length,
                                (index) => RankPoster(
                                  rank: (index + 1).toString(),
                                  posterUrl: posters[index],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 40.0, left: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                text: "TV ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: "???????????????????????"),
                            ], style: TextStyle(fontSize: 18.0)),
                          ),
                          const SizedBox(height: 10.0),
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                posters.length,
                                (index) => Poster(
                                  posterUrl: posters[index],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBottomSheet(BuildContext context) => Wrap(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFF2B2B2B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: const Image(
                              image: AssetImage(
                                  "assets/images/big_buck_bunny_poster.jpg"),
                              width: 100.0,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "??? ??? ??????",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Row(
                                  children: const [
                                    SmallSubText(text: "2008"),
                                    SizedBox(width: 10.0),
                                    SmallSubText(text: "15+"),
                                    SizedBox(width: 10.0),
                                    SmallSubText(text: "?????? 1???"),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                const Text("????????? ???????????? ????????? ??? 2????????? ?????? "
                                    "?????? ???????????? ????????? ?????? "
                                    "????????? ????????? ????????? ?????? ?????? "
                                    "2????????? ????????? ?????? ????????? ???????????? ????????? ?????????.")
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          PlayButton(width: 160.0),
                          LabelIcon(
                            icon: FontAwesomeIcons.download,
                            label: "??????",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                          LabelIcon(
                            icon: FontAwesomeIcons.circlePlay,
                            label: "????????????",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.pushNamed(context, DetailScreen.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.info_outline),
                                SizedBox(width: 10.0),
                                Text("?????? ??? ????????????"),
                              ],
                            ),
                            const Icon(
                              FontAwesomeIcons.chevronRight,
                              size: 16.0,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10.0,
                top: 10.0,
                child: GestureDetector(
                  onTap: () {
                    // 2
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color(0xFF525252),
                    ),
                    child: const Icon(FontAwesomeIcons.timeline),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}

import 'package:eko_projects/data/bloc/dashboard-bloc/dorama-bloc/dashboard_dorama_bloc.dart';
import 'package:eko_projects/data/bloc/dashboard-bloc/menu-bloc/dashboard_menu_bloc.dart';
import 'package:eko_projects/data/bloc/dashboard-bloc/movie-bloc/dashboard_movie_bloc.dart';
import 'package:eko_projects/data/bloc/dashboard-bloc/serial-bloc/dashboard_serial_bloc.dart';
import 'package:eko_projects/data/bloc/dashboard-bloc/streaming-bloc/dashboard_streaming_bloc.dart';
import 'package:eko_projects/presentation/pages/play/play_page.dart';
import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:eko_projects/presentation/resources/routes_manager.dart';
import 'package:eko_projects/presentation/widget/at_dashboard/dashboard_dorama_menu_widget.dart';
import 'package:eko_projects/presentation/widget/at_dashboard/dashboard_menu_bar_widget.dart';
import 'package:eko_projects/presentation/widget/at_dashboard/dashboard_movie_menu_widget.dart';
import 'package:eko_projects/presentation/widget/at_dashboard/dashboard_serial_menu_widget.dart';
import 'package:eko_projects/presentation/widget/at_dashboard/dashboard_stream_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool press = false;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: ColorManager.primaryColor,
        // body: SafeArea(
        // child: NestedScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        // headerSliverBuilder: (BuildContext context, innerBoxIsScrolled) {
        // return <Widget>[
        // SliverAppBar(
        //   toolbarHeight: screenHeight * 0.20,
        //   expandedHeight: screenHeight * 0.5,
        //   automaticallyImplyLeading: false,
        //   backgroundColor: ColorManager.primaryColor,
        //   pinned: true,
        //   floating: true,
        //   snap: true,
        //   titleSpacing: 20,
        //   title: PreferredSize(
        //     preferredSize: const Size.fromRadius(0),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Container(
        //           margin: const EdgeInsets.only(top: 10),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Container(
        //                 width: screenWidth * 0.3,
        //                 height: screenHeight * 0.06,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(2),
        //                   image: const DecorationImage(
        //                       image:
        //                           AssetImage("assets/icons/logo.png"),
        //                       fit: BoxFit.cover),
        //                 ),
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.end,
        //                 children: [
        //                   Icon(
        //                     Icons.search,
        //                     size: 30,
        //                     color: ColorManager.whitePrimary,
        //                   ),
        //                   GestureDetector(
        //                     onTap: () {
        //                       Navigator.pushNamed(
        //                           context, Routes.user);
        //                     },
        //                     child: Container(
        //                       width: screenWidth * 0.1,
        //                       height: screenHeight * 0.042,
        //                       decoration: BoxDecoration(
        //                           image: const DecorationImage(
        //                             image: AssetImage(
        //                                 "assets/icons/user_profile.jpg"),
        //                             fit: BoxFit.cover,
        //                           ),
        //                           color: ColorManager.greyButton,
        //                           shape: BoxShape.circle),
        //                     ),
        //                   )
        //                 ],
        //               )
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(bottom: 20),
        //           child: SizedBox(
        //             height: screenHeight * 0.1,
        //             child: BlocBuilder<DashboardMenuBloc,
        //                 DashboardMenuState>(
        //               builder: (context, state) {
        //                 if (state is DashboardMenuSuccess) {
        //                   return ListView.builder(
        //                       physics: const BouncingScrollPhysics(),
        //                       scrollDirection: Axis.horizontal,
        //                       itemCount:
        //                           state.okContentMenu!.menu!.length,
        //                       itemBuilder: ((context, index) {
        //                         var items = state.okContentMenu!.menu;
        //                         return DashboardMenuBarWidget(
        //                           imageUrl: items![index]
        //                               .imageUrl
        //                               .toString(),
        //                           title:
        //                               items[index].title.toString(),
        //                           press: () {
        //                             setState(() {
        //                               press = !press;
        //                             });
        //                             print(press);
        //                           },
        //                           pressed: press,
        //                         );
        //                       }));
        //                 }
        //                 return const Center(
        //                   child: CircularProgressIndicator(),
        //                 );
        //               },
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   flexibleSpace: Container(

        //     margin: EdgeInsets.only(
        //       top: screenHeight * 0.16,
        //     ),
        //     child:
        //
        // FlexibleSpaceBar(
        //         collapseMode: CollapseMode.pin,
        //         background:
        //
        // Container(
        //           margin: EdgeInsets.only(
        //             bottom: screenHeight * 0.19,
        //           ),
        //           width: double.infinity,
        //           decoration: const BoxDecoration(
        //             image: DecorationImage(
        //                 image:
        //                     AssetImage("assets/images/dashboard.png"),
        //                 fit: BoxFit.fill),
        //           ),
        //           child: Container(
        //             // color: Colors.red,
        //             margin: const EdgeInsets.symmetric(
        //               horizontal: 20,
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 const SizedBox(
        //                   height: 40,
        //                 ),
        //                 Text(
        //                   "Tenki No Ko",
        //                   style: GoogleFonts.robotoCondensed(
        //                       color: ColorManager.whitePrimary,
        //                       fontSize: FontSize.s20,
        //                       fontWeight: FontWeightManager.regular),
        //                 ),
        //                 const SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text(
        //                   "Drama, Fantasy, Romance, Slice of Life • 2019 • 1h 52m",
        //                   style: GoogleFonts.robotoCondensed(
        //                       color: ColorManager.whitePrimary,
        //                       fontSize: FontSize.s14,
        //                       fontWeight: FontWeightManager.regular),
        //                 ),
        //                 const SizedBox(
        //                   height: 10,
        //                 ),
        //                 SizedBox(
        //                   height: screenHeight * 0.07,
        //                   width: double.infinity,
        //                   child: TextButton(
        //                       style: ButtonStyle(
        //                           shape: MaterialStateProperty.all(
        //                               RoundedRectangleBorder(
        //                                   borderRadius:
        //                                       BorderRadius.circular(
        //                                           3))),
        //                           backgroundColor:
        //                               MaterialStateProperty.all(
        //                                   ColorManager.whitePrimary
        //                                       .withOpacity(0.3))),
        //                       onPressed: () {},
        //                       child: Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.center,
        //                         children: [
        //                           Container(
        //                             height: screenHeight * 0.1,
        //                             width: screenWidth * 0.1,
        //                             decoration: BoxDecoration(
        //                                 color: ColorManager
        //                                     .primaryButton,
        //                                 shape: BoxShape.circle),
        //                             child: Icon(Icons.play_arrow,
        //                                 color: ColorManager
        //                                     .whitePrimary),
        //                           ),
        //                           SizedBox(
        //                             width: screenWidth * 0.05,
        //                           ),
        //                           Text(
        //                             "Play Now",
        //                             style:
        //                                 GoogleFonts.robotoCondensed(
        //                                     color: ColorManager
        //                                         .whitePrimary,
        //                                     fontSize: FontSize.s14,
        //                                     fontWeight:
        //                                         FontWeightManager
        //                                             .regular),
        //                           ),
        //                         ],
        //                       )),
        //                 ),
        //                 const SizedBox(
        //                   height: 10,
        //                 ),
        //                 SizedBox(
        //                   height: screenHeight * 0.07,
        //                   width: double.infinity,
        //                   child: TextButton(
        //                       style: ButtonStyle(
        //                           side: MaterialStateProperty.all(
        //                               BorderSide(
        //                                   color: ColorManager
        //                                       .whitePrimary)),
        //                           shape: MaterialStateProperty.all(
        //                               RoundedRectangleBorder(
        //                                   borderRadius:
        //                                       BorderRadius.circular(
        //                                           3))),
        //                           backgroundColor:
        //                               MaterialStateProperty.all(
        //                                   Colors.transparent)),
        //                       onPressed: () {},
        //                       child: Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.center,
        //                         children: [
        //                           Container(
        //                             margin: EdgeInsets.only(
        //                                 left: screenWidth * 0.02),
        //                             child: SizedBox(
        //                               height: screenHeight * 0.08,
        //                               width: screenWidth * 0.08,
        //                               child: SvgPicture.asset(
        //                                   'assets/icons/icon_watchlist.svg'),
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: screenWidth * 0.05,
        //                           ),
        //                           Center(
        //                             child: Padding(
        //                               padding: const EdgeInsets.only(
        //                                   top: 1),
        //                               child: Text(
        //                                 "Watchlist",
        //                                 style: GoogleFonts
        //                                     .robotoCondensed(
        //                                         color: ColorManager
        //                                             .whitePrimary,
        //                                         fontSize:
        //                                             FontSize.s14,
        //                                         fontWeight:
        //                                             FontWeightManager
        //                                                 .regular),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       )),
        //                 )
        //               ],
        //             ),
        //           ),
        //         )),
        //   ),
        // ),
        //   ];
        // },
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.20,
          backgroundColor: ColorManager.primaryColor,
          title: PreferredSize(
            preferredSize: const Size.fromRadius(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          image: const DecorationImage(
                              image: AssetImage("assets/icons/logo.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.search,
                            size: 30,
                            color: ColorManager.whitePrimary,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.user);
                            },
                            child: Container(
                              width: screenWidth * 0.1,
                              height: screenHeight * 0.042,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/icons/user_profile.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  color: ColorManager.greyButton,
                                  shape: BoxShape.circle),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                  child: BlocBuilder<DashboardMenuBloc, DashboardMenuState>(
                    builder: (context, state) {
                      if (state is DashboardMenuSuccess) {
                        return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.okContentMenu!.menu!.length,
                            itemBuilder: ((context, index) {
                              var items = state.okContentMenu!.menu;
                              return DashboardMenuBarWidget(
                                imageUrl: items![index].imageUrl.toString(),
                                title: items[index].title.toString(),
                                press: () {
                                  setState(() {
                                    press = !press;
                                  });
                                  print(press);
                                },
                                pressed: press,
                              );
                            }));
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: screenHeight * 0.03,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/dashboard.png"),
                      fit: BoxFit.fill),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Tenki No Ko",
                        style: GoogleFonts.robotoCondensed(
                            color: ColorManager.whitePrimary,
                            fontSize: FontSize.s20,
                            fontWeight: FontWeightManager.regular),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Drama, Fantasy, Romance, Slice of Life • 2019 • 1h 52m",
                        style: GoogleFonts.robotoCondensed(
                            color: ColorManager.whitePrimary,
                            fontSize: FontSize.s14,
                            fontWeight: FontWeightManager.regular),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: screenHeight * 0.07,
                        width: double.infinity,
                        child: TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3))),
                                backgroundColor: MaterialStateProperty.all(
                                    ColorManager.whitePrimary
                                        .withOpacity(0.3))),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: screenHeight * 0.1,
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                      color: ColorManager.primaryButton,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.play_arrow,
                                      color: ColorManager.whitePrimary),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.05,
                                ),
                                Text(
                                  "Play Now",
                                  style: GoogleFonts.robotoCondensed(
                                      color: ColorManager.whitePrimary,
                                      fontSize: FontSize.s14,
                                      fontWeight: FontWeightManager.regular),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: screenHeight * 0.07,
                        width: double.infinity,
                        child: TextButton(
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(BorderSide(
                                    color: ColorManager.whitePrimary)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3))),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(left: screenWidth * 0.02),
                                  child: SizedBox(
                                    height: screenHeight * 0.08,
                                    width: screenWidth * 0.08,
                                    child: SvgPicture.asset(
                                        'assets/icons/icon_watchlist.svg'),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.05,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 1),
                                    child: Text(
                                      "Watchlist",
                                      style: GoogleFonts.robotoCondensed(
                                          color: ColorManager.whitePrimary,
                                          fontSize: FontSize.s14,
                                          fontWeight:
                                              FontWeightManager.regular),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            "Live Streaming",
                            style: GoogleFonts.robotoCondensed(
                                fontSize: FontSize.s20,
                                color: ColorManager.whitePrimary,
                                fontWeight: FontWeightManager.regular),
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/undefined');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "See All",
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: FontSize.s14,
                                  color: ColorManager.whitePrimary,
                                  fontWeight: FontWeightManager.regular),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/icon_right.svg',
                              height: 15,
                              width: 15,
                              color: ColorManager.primaryButton,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  SizedBox(
                    height: screenHeight * 0.3,
                    child: BlocBuilder<DashboardStreamingBloc,
                        DashboardStreamingState>(
                      builder: (context, state) {
                        if (state is DashboardStreamingLoaded) {
                          var items = state.okContentStream!.items;
                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.okContentStream!.items!.length,
                              itemBuilder: ((context, index) {
                                return Row(
                                  children: [
                                    DashboardStreamingMenuWidget(
                                      imageUrl:
                                          items![index].imageUrl.toString(),
                                      title: items[index].title.toString(),
                                      duration:
                                          items[index].duration.toString(),
                                      press: () {
                                        Navigator.pushNamed(
                                            context, '/undefined');
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                );
                              }));
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            "Anime For You",
                            style: GoogleFonts.robotoCondensed(
                                fontSize: FontSize.s20,
                                color: ColorManager.whitePrimary,
                                fontWeight: FontWeightManager.regular),
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.animeFY);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "See All",
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: FontSize.s14,
                                  color: ColorManager.whitePrimary,
                                  fontWeight: FontWeightManager.regular),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/icon_right.svg',
                              height: 15,
                              width: 15,
                              color: ColorManager.primaryButton,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.001,
                  ),
                  SizedBox(
                    height: screenHeight * 0.27,
                    child:
                        BlocBuilder<DashboardSerialBloc, DashboardSerialState>(
                      builder: (context, state) {
                        if (state is DashboardSerialSuccess) {
                          var items = state.okContentSerial!.serials;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.okContentSerial!.serials!.length,
                              itemBuilder: ((context, index) {
                                return Row(
                                  children: [
                                    DashboardSerialMenuWidget(
                                      imageUrl:
                                          items![index].imageUrl.toString(),
                                      title: items[index].title.toString(),
                                      press: () {
                                        // Navigator.pushNamed(
                                        //     context, Routes.play);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) => PlayPage(
                                                      title: items[index]
                                                          .title
                                                          .toString(),
                                                      subImageUrl: items[index]
                                                          .subImageUrl
                                                          .toString(),
                                                      session: items[index]
                                                          .session
                                                          .toString(),
                                                      rating: items[index]
                                                          .rating
                                                          .toString(),
                                                      genre: items[index]
                                                          .genre
                                                          .toString(),
                                                      description: items[index]
                                                          .description
                                                          .toString(),
                                                    ))));
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                );
                              }));
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            "Dorama Serial",
                            style: GoogleFonts.robotoCondensed(
                                fontSize: FontSize.s20,
                                color: ColorManager.whitePrimary,
                                fontWeight: FontWeightManager.regular),
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/undefined');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "See All",
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: FontSize.s14,
                                  color: ColorManager.whitePrimary,
                                  fontWeight: FontWeightManager.regular),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/icon_right.svg',
                              height: 15,
                              width: 15,
                              color: ColorManager.primaryButton,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.001,
                  ),
                  SizedBox(
                    height: screenHeight * 0.27,
                    child:
                        BlocBuilder<DashboardDoramaBloc, DashboardDoramaState>(
                      builder: (context, state) {
                        if (state is DashboardDoramaLoaded) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.okContentDorama!.dorama!.length,
                              itemBuilder: ((context, index) {
                                var items = state.okContentDorama!.dorama;
                                return Row(
                                  children: [
                                    DashboardDoramaMenuWidget(
                                      imageUrl:
                                          items![index].imageUrl.toString(),
                                      title: items[index].title.toString(),
                                      press: () {
                                        Navigator.pushNamed(
                                            context, '/undefined');
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                );
                              }));
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            "Anime Movie",
                            style: GoogleFonts.robotoCondensed(
                                fontSize: FontSize.s20,
                                color: ColorManager.whitePrimary,
                                fontWeight: FontWeightManager.regular),
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/undefined');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "See All",
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: FontSize.s14,
                                  color: ColorManager.whitePrimary,
                                  fontWeight: FontWeightManager.regular),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/icon_right.svg',
                              height: 15,
                              width: 15,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.001,
                  ),
                  SizedBox(
                    height: screenHeight * 0.27,
                    child: BlocBuilder<DashboardMovieBloc, DashboardMovieState>(
                      builder: (context, state) {
                        if (state is DashboardMovieLoaded) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.okContentMovie!.movie!.length,
                              itemBuilder: ((context, index) {
                                var items = state.okContentMovie!.movie;
                                return Row(
                                  children: [
                                    DashboardMovieMenuWidget(
                                      imageUrl:
                                          items![index].imageUrl.toString(),
                                      title: items[index].title.toString(),
                                      press: () {
                                        Navigator.pushNamed(
                                            context, '/undefined');
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                );
                              }));
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.1),
                child: Column(
                  children: [
                    Container(
                      height: screenHeight * 0.007,
                      width: double.infinity,
                      color: ColorManager.dividerColor,
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Center(
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                            height: screenHeight * 0.022,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                              width: screenWidth * 0.005,
                              color: ColorManager.dividerColor,
                            ))),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/undefined');
                              },
                              child: Center(
                                child: Text("Feedback",
                                    style: GoogleFonts.robotoCondensed(
                                      fontSize: FontSize.s14,
                                      color: ColorManager.whitePrimary,
                                      fontWeight: FontWeightManager.regular,
                                    )),
                              ),
                            ),
                          )),
                          Flexible(
                              child: Container(
                            height: screenHeight * 0.022,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                              width: screenWidth * 0.005,
                              color: ColorManager.dividerColor,
                            ))),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/undefined');
                              },
                              child: Center(
                                child: Text("Help",
                                    style: GoogleFonts.robotoCondensed(
                                      fontSize: FontSize.s14,
                                      color: ColorManager.whitePrimary,
                                      fontWeight: FontWeightManager.regular,
                                    )),
                              ),
                            ),
                          )),
                          Flexible(
                              child: Container(
                            height: screenHeight * 0.022,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                              width: screenWidth * 0.005,
                              color: ColorManager.dividerColor,
                            ))),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/undefined');
                              },
                              child: Center(
                                child: Text("FAQ",
                                    style: GoogleFonts.robotoCondensed(
                                      fontSize: FontSize.s14,
                                      color: ColorManager.whitePrimary,
                                      fontWeight: FontWeightManager.regular,
                                    )),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.06,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/undefined');
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "FOLLOW ON",
                                  style: GoogleFonts.robotoCondensed(
                                    fontSize: FontSize.s14,
                                    color: ColorManager.transparentButton,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/undefined');
                                },
                                child: Container(
                                  height: screenHeight * 0.019,
                                  width: screenWidth * 0.3,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                    width: screenWidth * 0.005,
                                    color: ColorManager.dividerColor,
                                  ))),
                                  child: Center(
                                      child: SvgPicture.asset(
                                          'assets/icons/icon_facebook.svg',
                                          height: 24,
                                          width: 24)),
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/undefined');
                                },
                                child: SizedBox(
                                  height: screenHeight * 0.019,
                                  width: screenWidth * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: SvgPicture.asset(
                                          'assets/icons/icon_instagram.svg',
                                          height: 24,
                                          width: 24,
                                        )),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.07,
                    ),
                    Center(
                        child: Text("©2021 All rights reserved",
                            style: GoogleFonts.robotoCondensed(
                              fontSize: FontSize.s14,
                              color: ColorManager.whitePrimary,
                              fontWeight: FontWeightManager.regular,
                            ))),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
        // ),
        // )
        );
  }
}

import 'package:eko_projects/data/bloc/dashboard-bloc/animefy-bloc/animefy_bloc.dart';
import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:eko_projects/presentation/resources/routes_manager.dart';
import 'package:eko_projects/presentation/widget/at_anime_fy/anime_fy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardAnimeFY extends StatefulWidget {
  const DashboardAnimeFY({Key? key}) : super(key: key);

  @override
  State<DashboardAnimeFY> createState() => _DashboardAnimeFYState();
}

class _DashboardAnimeFYState extends State<DashboardAnimeFY> {
  TextEditingController searchController = TextEditingController();
  bool onClicked = true;

  _onClickedFunction() {
    onClicked = !onClicked;
    print(onClicked);
    setState(() {});
  }

  @override
  void initState() {
    _onClickedFunction();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Widget searchTextField() => AnimatedContainer(
          height: screenHeight * 0.04,
          width: screenWidth * 0.45,
          duration: const Duration(seconds: 2),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              // ignore: avoid_single_cascade_in_expression_statements
              BlocProvider.of<AnimefyBloc>(context)
                ..add(searchAnimeFy(searchController.text.toString()));
            },
            decoration: InputDecoration(
              isCollapsed: true,
              isDense: true,
              fillColor: ColorManager.primaryTextField,
              filled: true,
              suffixIcon: GestureDetector(
                onTap: _onClickedFunction,
                child: Icon(
                  Icons.search,
                  color: ColorManager.primaryColor,
                ),
              ),
              hintText: "search",
              hintStyle: GoogleFonts.robotoCondensed(
                  fontSize: 13,
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.w500),
              contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight * 0.1,
        backgroundColor: ColorManager.primaryColor,
        title: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5),
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
                  onClicked
                      ? Container()
                      : Icon(
                          Icons.tune,
                          size: 30,
                          color: ColorManager.whitePrimary,
                        ),
                  GestureDetector(
                    onTap: () {
                      _onClickedFunction();
                    },
                    child: onClicked
                        ? searchTextField()
                        : Icon(
                            Icons.search,
                            size: 30,
                            color: ColorManager.whitePrimary,
                          ),
                  ),
                  const SizedBox(
                    width: 10,
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
                            image: AssetImage("assets/icons/user_profile.jpg"),
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
      ),
      body: BlocBuilder<AnimefyBloc, AnimefyState>(
        builder: (context, state) {
          if (state is AnimefySuccess) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.25 / 2,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3),
                itemCount: state.okContentSerial.serials!.length,
                itemBuilder: (BuildContext context, index) {
                  var items = state.okContentSerial.serials;
                  return AnimeFyWidget(
                      imageUrl: items![index].imageUrl.toString(),
                      title: items[index].title.toString(),
                      press: () {});
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

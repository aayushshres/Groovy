import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groovy/common/helpers/is_dark_mode.dart';
import 'package:groovy/common/widgets/appbar/app_bar.dart';
import 'package:groovy/core/configs/assets/app_images.dart';
import 'package:groovy/core/configs/assets/app_vectors.dart';
import 'package:groovy/core/configs/theme/app_colors.dart';
import 'package:groovy/presentation/mode/bloc/theme_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.appBarLogo,
        ),
        leading: IconButton(
          onPressed: () {
            // search songs and playlist
            // dark mode testing
            context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
          },
          icon: Icon(
            Icons.search,
            size: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // open settings menu
              // light mode testing
              context.read<ThemeCubit>().updateTheme(ThemeMode.light);
            },
            icon: Icon(
              Icons.menu,
              size: 28,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _homeArtistCard(context),
              SizedBox(
                height: 40,
              ),
              _tabs(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeArtistCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // redirect to the album
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Album",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Hit Me Hard and Soft",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "Billie Eilish",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              AppImages.homeArtist,
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorColor: AppColors.primary,
      dividerColor: Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      labelColor: context.isDarkMode
          ? AppColors.lightBackground
          : AppColors.darkBackground,
      tabs: [
        Text(
          "News",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          "Video",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          "Artist",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          "Podcast",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

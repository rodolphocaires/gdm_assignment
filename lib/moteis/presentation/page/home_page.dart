import 'package:flutter/material.dart';
import 'package:gdm_assignment/moteis/presentation/state/home_provider.dart';
import 'package:gdm_assignment/moteis/presentation/widget/motel_card.dart';
import 'package:gdm_assignment/moteis/presentation/widget/motel_filters.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

enum ScheduleTime {
  now,
  later,
}

class HomePageState extends State<HomePage> {
  ScheduleTime toggle = ScheduleTime.now;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<HomeProvider>().getMotelList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        surfaceTintColor: Colors.red,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        leading: Icon(Icons.menu),
        title: SegmentedButton<ScheduleTime>(
          showSelectedIcon: false,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.fromMap({
              WidgetState.selected: Colors.white,
              WidgetState.any: Colors.red,
            }),
            iconColor: WidgetStateProperty.fromMap({
              WidgetState.selected: Colors.red,
              WidgetState.any: Colors.white,
            }),
            foregroundColor: WidgetStateProperty.fromMap({
              WidgetState.selected: Colors.red,
              WidgetState.any: Colors.white,
            }),
            elevation: WidgetStatePropertyAll(0),
            side: WidgetStatePropertyAll(BorderSide.none),
          ),
          segments: [
            ButtonSegment<ScheduleTime>(
              value: ScheduleTime.now,
              label: Row(
                spacing: 4,
                children: [
                  Icon(Icons.bolt),
                  Text('ir agora'),
                ],
              ),
            ),
            ButtonSegment<ScheduleTime>(
              value: ScheduleTime.later,
              label: Row(
                spacing: 4,
                children: [
                  Icon(Icons.calendar_month),
                  Text('ir outro dia'),
                ],
              ),
            )
          ],
          selected: <ScheduleTime>{toggle},
          onSelectionChanged: (value) {
            setState(() {
              toggle = value.first;
            });
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'minha localização',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.grey[100],
              ),
              child: RefreshIndicator(
                onRefresh: () =>
                    context.read<HomeProvider>().getMoteisUseCase(),
                color: Colors.red,
                backgroundColor: Colors.white,
                child: ListView.builder(
                  itemCount: context.watch<HomeProvider>().motelList.length,
                  itemBuilder: (context, index) {
                    final item = context.watch<HomeProvider>().motelList[index];
                    return Column(
                      children: [
                        MotelFilters(),
                        Divider(height: 1),
                        MotelCard(motel: item),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

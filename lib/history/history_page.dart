import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:bac_calculator/history/event_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with TickerProviderStateMixin {

  String _currentMonth = DateFormat.yMMM().format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
  DateTime _currentDate = DateTime.now();
  DateTime _targetDateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  List<String> _eventsList = [];

  EventList<Event> _markedDateMap;

  @override
  void initState() {
    super.initState();

    _markedDateMap = new EventList<Event>(
      events: {}
    );

    _markedDateMap.add(
        new DateTime(2021, 4, 25),
        new Event(
          date: new DateTime(2021, 6, 25),
          title: '1',
          icon: _icon(),
      ));

      _markedDateMap.add(
        new DateTime(2021, 6, 25),
        new Event(
          date: new DateTime(2021, 6, 25),
          title: '1',
          icon: _icon(),
      ));

      _markedDateMap.add(
        new DateTime(2021, 6, 25),
        new Event(
          date: new DateTime(2021, 6, 25),
          title: '2',
          icon: _icon(),
      ));

      _markedDateMap.add(
        new DateTime(2021, 6, 25),
        new Event(
          date: new DateTime(2021, 6, 25),
          title: '3',
          icon: _icon(),
      ));

      _markedDateMap.add(
        new DateTime(2021, 6, 25),
        new Event(
          date: new DateTime(2021, 6, 25),
          title: '4',
          icon: _icon(),
      ));
  }

  @override
  Widget build(BuildContext context) {

    final _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (date, events) {
        _eventsList.clear();
        setState(() => _currentDate = date);
        events.forEach((event) => _eventsList.add(event.title));
      },
      weekendTextStyle: TextStyle(
        color: Colors.red,
        fontSize: 12
      ),
      thisMonthDayBorderColor: Colors.grey,
      headerText: _currentMonth,
      markedDatesMap: _markedDateMap,
      weekFormat: false,
      height: 450,
      selectedDateTime: _currentDate,
      showIconBehindDayText: true,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      selectedDayButtonColor: CustomColors.primary,
      headerTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black
      ),
      iconColor: CustomColors.deepGray,
      todayTextStyle: TextStyle(
        color: Colors.blue,
        fontSize: 12
      ),
      selectedDayTextStyle: TextStyle(
        color: Colors.white
      ),
      weekdayTextStyle: TextStyle(
        color: CustomColors.primary
      ),
      markedDateIconBuilder: (event) {
        return event.icon ?? Icon(Icons.help_outline);
      },
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
         _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      todayButtonColor: Colors.transparent,
      todayBorderColor: CustomColors.primary,
      markedDateMoreShowTotal: true,
    );

    return Container(
      child: Column(
        children: [
          Container(
              child: _calendarCarousel,
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Divider(
              color: Colors.black,
              height: 4,
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => Divider(),
                itemCount: _eventsList.length,
                itemBuilder: (context, index) {
                  return EventTile(eventTitle: _eventsList[index],);
                }
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget _icon() => Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: CustomColors.secondary,
        width: 2
      )
    ),
  );

}


import 'package:auto_route/auto_route.dart';
import 'package:courtside/features/matches/view/matches_screen.dart';
import 'package:courtside/shared/cs_close_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateTimeBottomSheet extends ConsumerStatefulWidget {
  const DateTimeBottomSheet({
    super.key,
  });

  @override
  ConsumerState<DateTimeBottomSheet> createState() => _NewWidgetState();
}

class _NewWidgetState extends ConsumerState<DateTimeBottomSheet> {
  late DateTime dateTime = DateTime.parse(ref.watch(dateProvider));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(17, 17, 17, 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Save',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        final newDate = DateFormat('yyyyMMdd').format(dateTime);
                        final oldDate = DateFormat('yyyyMMdd')
                            .format(DateTime.parse(ref.watch(dateProvider)));
                        if (newDate != oldDate) {
                          ref.read(dateProvider.notifier).state = newDate;
                        }
                        context.router.popForced();
                      },
                    ),
                    Text(DateFormat('dd.MM.yyyy').format(dateTime)),
                    const CSCloseButton(invert: true),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: dateTime,
              onDateTimeChanged: (newDateTime) =>
                  setState(() => dateTime = newDateTime),
            ),
          ),
        ],
      ),
    );
  }
}

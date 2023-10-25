import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTexts extends StatelessWidget {

  final String name, email, password;

  const MyTexts({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 20,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical:  10.h),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              child: Card(
                elevation: 20,
                color: Colors.grey[300],
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 9.h),
                  child: Row(
                    children: [
                      const Expanded(flex: 1, child: Icon(Icons.account_circle)),
                      Expanded(
                        flex: 3,
                        child: Text(name, style: TextStyle(fontSize: 16.sp)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
              child: Card(
                elevation: 20,
                color: Colors.grey[300],
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      const Expanded(flex: 1, child: Icon(Icons.alternate_email)),
                      Expanded(
                        flex: 3,
                        child: Text(email, style: TextStyle(fontSize: 16.sp)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
              child: Card(
                elevation: 20,
                color: Colors.grey[300],
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      const Expanded(flex: 1, child: Icon(Icons.lock_outline)),
                      Expanded(
                        flex: 3,
                        child: Text(password, style: TextStyle(fontSize: 16.sp)),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

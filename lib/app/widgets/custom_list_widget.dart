import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:khata_app/app/constants/colors.dart';

class CustomTileListWidget extends StatelessWidget {
  const CustomTileListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: AppColors.green, borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "petrol",
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: true, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              alignment: Alignment.center,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              title: const Text('Account Options'),
                              content: SingleChildScrollView(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(Icons.edit),
                                          Text("Rename")
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.delete_forever_sharp),
                                          Text("Delete")
                                        ],
                                      ),
                                    ]),
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.more_vert_outlined,
                        color: AppColors.white,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Credit",
                          style: TextStyle(color: AppColors.white),
                        ),
                        Text(
                          r"$1200",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Debit",
                          style: TextStyle(color: AppColors.white),
                        ),
                        Text(
                          r"$100",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Balance",
                          style: TextStyle(color: AppColors.white),
                        ),
                        Text(
                          r"$12000",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ],
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

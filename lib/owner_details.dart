import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:intl/intl.dart';
import 'package:my_pinterest/home_screen.dart';
import 'package:my_pinterest/widgets/rectangular_button.dart';

class OwnerDetails extends StatefulWidget {
  String img;
  String userImg;
  String name;
  DateTime date;
  String docId;
  String userId;
  int downloads;
  OwnerDetails({
    Key? key,
    required this.img,
    required this.userImg,
    required this.name,
    required this.date,
    required this.docId,
    required this.userId,
    required this.downloads,
  }) : super(key: key);

  @override
  _OwnerDetailsState createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  int? total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const HomeScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                              ),
                              iconSize: 22,
                              tooltip: 'Back to Home',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Image.network(
                          widget.img,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Owner Information',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(widget.userImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Uploaded by: ' + widget.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  DateFormat('dd MMMM, yyyy - hh:mm a')
                      .format(widget.date)
                      .toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.download_outlined,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    Text(
                      ' ' + widget.downloads.toString(),
                      style: const TextStyle(
                        fontSize: 28.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: RectangularButton(
                    text: 'Download',
                    color1: Colors.green,
                    color2: Colors.lightGreen,
                    press: () async {
                      try {
                        var imageId =
                            await ImageDownloader.downloadImage(widget.img);
                        if (imageId == null) {
                          return;
                        }
                        Fluttertoast.showToast(msg: 'Image Saced to Gallery');
                        total = widget.downloads + 1;
                        FirebaseFirestore.instance
                            .collection('wallpaper')
                            .doc(widget.docId)
                            .update({
                          'downloads': total,
                        }).then((value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        });
                      } on PlatformException catch (error) {
                        print(error);
                      }
                    },
                  ),
                ),
                FirebaseAuth.instance.currentUser!.uid == widget.userId
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: RectangularButton(
                          text: 'Delete',
                          color1: Colors.green,
                          color2: Colors.lightGreen,
                          press: () {},
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jvak/models/jvak.dart';
import 'package:jvak/widgets/custom_checkbox.dart';

class musicListItem extends StatefulWidget {
  const musicListItem({
    super.key,
    required this.musicList,
  });

  final JvakModel musicList;

  @override
  State<musicListItem> createState() => _musicListItemState();
}

class _musicListItemState extends State<musicListItem> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 120,
                    height: 40,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 15,
                          child: Text(
                            widget.musicList.title,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 80,
                          height: 15,
                          child: Text(
                            widget.musicList.singer,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 120,
                    height: 40,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 15,
                          child: Text(
                            widget.musicList.aniTitle,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 80,
                          height: 15,
                          child: Text(
                            widget.musicList.aniStage,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: SizedBox(
              height: 55,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/song_number_box.jpg'),
                  ),
                ),
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.transparent,
                  body: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Center(
                          child: Text(
                            widget.musicList.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFFFF7B7B),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: CustomCheckbox(
                          value: state,
                          onChanged: (value) {
                            setState(() {
                              state = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

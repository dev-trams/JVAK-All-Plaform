import 'package:flutter/material.dart';
import 'package:jvak/models/new_jvak.dart';
import 'package:jvak/widgets/custom_checkbox.dart';

class musicListItem extends StatefulWidget {
  const musicListItem(
      {super.key,
      required this.musicList,
      required this.checked,
      required this.onChanged});

  final NewJvakModule musicList;
  final bool checked;
  final Function(bool checked) onChanged;
  @override
  State<musicListItem> createState() => _musicListItemState();
}

class _musicListItemState extends State<musicListItem> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
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
                    height: 45,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 20,
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
                          width: 85,
                          height: 15,
                          child: Text(
                            widget.musicList.composer,
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
                    height: 45,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 20,
                          child: Text(
                            widget.musicList.singer,
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
                            widget.musicList.lyricist,
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
                            widget.musicList.no,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFFFF7B7B),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        //! 북마크 기능 완성 시 상위 위젯 제거
                        visible: false,
                        child: Flexible(
                          flex: 1,
                          child: CustomCheckbox(
                              value: widget.checked,
                              onChanged: (checked) =>
                                  widget.onChanged(checked)),
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

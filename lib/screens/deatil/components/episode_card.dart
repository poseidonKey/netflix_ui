import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_ui/models/episode.dart';

class EpisodeCard extends StatelessWidget {
  final Episode episode;
  const EpisodeCard({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image(
                image: AssetImage(episode.previewImageUrl),
                width: 130.0,
                height: 70.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: episode.episode,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        const TextSpan(text: ". "),
                        TextSpan(text: episode.title)
                      ]),
                ),
                Text(
                  episode.playTime,
                  style: const TextStyle(
                    color: Color(0xFF6c6c6c),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(episode.description),
          ],
        ),
        const Positioned(
          right: 0.0,
          top: 20.0,
          child: Icon(FontAwesomeIcons.download),
        )
      ])
    ]);
  }
}

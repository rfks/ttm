import 'package:flutter/material.dart';
import 'package:ttm/services/cloud/cloud_note.dart';
import 'package:ttm/utilities/dialogs/delete_dialog.dart';
import 'package:audioplayers/audioplayers.dart';

typedef NoteCallback = void Function(CloudNote note);
final player = AudioPlayer();

class NotesListView extends StatelessWidget {
  final Iterable<CloudNote> notes;
  final NoteCallback onDeleteNote;
  // final NoteCallback onPlayNote;
  final NoteCallback onTap;

  const NotesListView({
    Key? key,
    required this.notes,
    required this.onDeleteNote,
    // required this.onPlayNote,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes.elementAt(index);
        return ListTile(
          onTap: () {
            onTap(note);
          },
          title: Text(
            note.text,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          leading: IconButton(
              onPressed: () async {
                String url =
                    "https://upload.wikimedia.org/wikipedia/commons/0/02/United_States_Navy_Band_-_Sweden.ogg";
                await player.setSourceUrl(url);
                await player.resume();
              },
              icon: const Icon(Icons.play_arrow)),
          trailing: IconButton(
              onPressed: () async {
                final shouldDelete = await showDeleteDialog(context);
                if (shouldDelete) {
                  onDeleteNote(note);
                  await player.stop();
                }
              },
              icon: const Icon(Icons.delete)),
        );
      },
    );
  }
}

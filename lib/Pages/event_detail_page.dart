import 'package:flutter/material.dart';
import 'package:app_project_flutter/models/events.dart';

//------------------------------------------------------------------------------
//------------------ Widget represenant l'ecran Detail -------------------------
//------------------------------------------------------------------------------
class EventDetailPage extends StatelessWidget {
  EventDetailPage({required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black12,
        height: double.infinity,
        child: EventDetail(event),
      ),
    );
  }
}

//------------------------------------------------------------------------------
//------------------ Widget affichant la liste d'elements -----------------------
//------------------------------------------------------------------------------

class EventDetail extends StatelessWidget {
  final Event event;
   EventDetail(this.event);

   @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [

        //  faire appel à l'image de couverture//

        SizedBox(height: 20),

        Padding(padding: const EdgeInsets.all(16.0),
          child: EventUtils(),
        ),

        Padding(padding: const EdgeInsets.all(16.0),
            child: EventDescription(),
        ),
        SizedBox(height: 50),

        Padding(padding: const EdgeInsets.all(16.0),
          child: EventTag(),
        ),

      ],
    );
  }
}

//------------------------------------------------------------------------------
//------------------ Widget affichant l'image de couvertue ----------------------
//------------------------------------------------------------------------------

class EventCoverImage extends StatelessWidget {
  final coverImagee;
  EventCoverImage({this.coverImagee});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Image.network(
          coverImagee,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}


//------------------------------------------------------------------------------
//------------------ Widget affichant la description de  ------------------------
//------------------------------------------------------------------------------
class EventDescription extends StatelessWidget {
  const EventDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//------------------------------------------------------------------------------
//------------------ Widget affichant les infos utiles --------------------------
//------------------------------------------------------------------------------

class EventUtils extends StatelessWidget {
  const EventUtils({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


//------------------------------------------------------------------------------
//------------------ Widget affichant les infos tags ----------------------------
//------------------------------------------------------------------------------

class EventTag extends StatelessWidget {
  const EventTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



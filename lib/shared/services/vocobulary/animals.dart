import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/vocabulary_card.dart';
class AnimalData{
  static Future<List<VocabularyCard>?> accessListSubCollection() async {
    List<VocabularyCard>? vocabularyCardList = [];
    final dataRef = FirebaseFirestore.instance.collection('data');

    try {
      QuerySnapshot<Map<String, dynamic>> listCollection = await dataRef.doc('qKlkRPKy37E6BXr3xpWx').collection('list').get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> document in listCollection.docs) {
        // Access document data
        Map<String, dynamic> data = document.data();
        // print('Document ID: ${document.id}, Data: $data');
        String imgUrl = data['img_url'];
        String name = data['name'];

        VocabularyCard vocabularyCard = VocabularyCard(imgUrl: imgUrl, name: name);
        vocabularyCardList.add(vocabularyCard);
      }
    } catch (e) {
      print('Error accessing list subcollection: $e');
    }

    return vocabularyCardList;
  }
}



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myexam/models/Products.dart';

class FirestoreService {
  final CollectionReference _productCollection =
  FirebaseFirestore.instance.collection('products');

  Future<List<Products>> getProducts() async {
    final querySnapshot = await _productCollection.get();
    return querySnapshot.docs.map((doc) {
      return Products.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      });
    }).toList();
  }
}



// Future<void> addTodo(Todo todo) {
//   return _todosCollection.add({
//     'title': todo.title,
//     'completed': todo.completed,
//   });
// }

// Future<void> updateTodo(Todo todo) {
//   return _todosCollection.doc(todo.id).update({
//     'title': todo.title,
//     'completed': todo.completed,
//   });
// }
//
// Future<void> deleteTodo(String todoId) {
//   return _todosCollection.doc(todoId).delete();
// }
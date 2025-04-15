import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/question_model.dart';

class QuizRepository {
  final SupabaseClient client = Supabase.instance.client;

  Future<List<Question>> fetchQuestionsByCategory(String category) async {
    final response = await client
        .from('question')
        .select()
        .eq('category', category)
        .limit(30);

    // ✅ Convert response into List<Question>
    final questions = (response as List<dynamic>)
        .map((e) => Question.fromMap(e as Map<String, dynamic>))
        .toList();

    return questions;
  }
}

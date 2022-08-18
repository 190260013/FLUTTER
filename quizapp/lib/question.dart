class question{
  List<String> ques=["1 + 1 = 2","2 + 2 * 2 = 8","6 * 6 / 3 + 3 = 6","An octopus has three hearts",
  "Thomas Edison discovered gravity",
  "Walt Disney holds the record for the most Oscars",
  "Spaghetto is the singular word for a piece of spaghetti",
  "Venus is the hottest planet in the solar system",
  ];
  String question_i(int index){
    return ques[index];
  }
  int num_ques(){
    return ques.length;
  }
}

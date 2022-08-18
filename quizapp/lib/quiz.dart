
class quiz{
    Map ans={"1 + 1 = 2": true ,"2 + 2 * 2 = 8" : false,"6 * 6 / 3 + 3 = 6":false ,"An octopus has three hearts":true,
    "Thomas Edison discovered gravity":false,
    "Walt Disney holds the record for the most Oscars":true,
    "Spaghetto is the singular word for a piece of spaghetti":true,
    "Venus is the hottest planet in the solar system":true,
    };
    bool ans_i(String question_i){
        return ans[question_i];
    }
}
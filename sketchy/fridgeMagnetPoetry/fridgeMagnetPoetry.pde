
String[] ARTS = {"a", "an", "the", "a(n)"};

void setup() {

  Table words = loadTable("words.csv", "header");

  println(words.getRowCount() + " total rows in table");

  for (TableRow row : words.rows()) {

    int id = row.getInt("id");
    String word = row.getString("word");
    String pos = row.getString("pos");

    println(word + " (" + pos + ") has an ID of " + id);
  }

  ArrayList poem = genPoem(words);

  print(poem.toString());

  drawPoem(poem);
}

private void drawPoem(ArrayList poem) {
}


private ArrayList genPoem(Table words) {
  int numWord = (int)(Math.random()*25)+2;
  int lastIndex = -1;
  ArrayList poem = new ArrayList();
  // String poem = "";
  String lastPos = "";
  for (int i = 0; i < numWord; i++) {
    int index = -1;
    String curWord;
    String curPos;
    do {
      index = (int)(Math.random()*words.getRowCount());
      curWord = words.getRow(index).getString("word");
      curPos = words.getRow(index).getString("pos");
    } while (index == lastIndex || reject(curWord, poem, curPos, lastPos));
    lastIndex = index;
    lastPos = curPos;
    //poem += (words.getRow(index).getString("word")+" ");
    if (curPos.equals("noun") && Math.random()>=0.85) {

      poem.add(ARTS[(int)(Math.random()*ARTS.length)]);
    }
    poem.add(curWord);
    /*  if(Math.random() >= 0.9)
     {
     //poem+="\n";
     poem.add("\n");
     }*/
  }
  return poem;
}

private boolean reject(String curWord, ArrayList poem, String pos, String lPos) {
  //adj only before adj or noun
  if (lPos.equals("adjective") && !((pos.equals("adjective") || (pos.equals("noun"))))) { //check condition
    println(lPos+" "+pos);
    return true;
  }

  //adverb only before adverb or verb 
  if ((pos.equals("adverb")) && !((lPos.equals("adverb") || (lPos.equals("verb"))))){ //check condition
    println(lPos+" "+pos);
    return true;
  }

  if (pos.equals("article") || pos.equals("pronoun") || pos.equals("preposition") ) {
    return false;
  }
  if (contains(curWord, poem)) {
    double factor = (double)curWord.length()/(double)poem.size();
    double roll = Math.random();
    println(factor+" "+roll+" => " + (factor >= roll));
    if (factor >= roll || curWord.length()>=(Math.random()*15)+15) {
      return true;
    }
  }
  return false;
}

private boolean contains(String s, ArrayList poem) {
  for (int i = 0; i < poem.size(); i++) {
    if (poem.get(i).equals(s)) {
      return true;
    }
  }
  return false;
}

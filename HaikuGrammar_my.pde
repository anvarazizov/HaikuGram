import rita.*;

String haikuGrammar = 
  "{\"<start>\": \"<s1> % <middle> % <end> | <s2> % <middle> % <end> | <s3> % <middle> % <end> \","
  + "\"<middle>\": \"<m1> | <m2> <m3> | <m2> \","
  + "\"<end>\": \" <e1> | <e2> | <e3> \","

  /* starts */
  + "\"<s1>\": \"опалий лист | о, зозуле | о, ця дорога \","
  + "\"<s2>\": \"тайфун пройшов | блиснула блискавка\","
  + "\"<s3>\": \"і те і се\","
  /* midles */
  + "\"<m1>\": \"про сніг забуває | а там шелест крапель\","
  + "\"<m2>\": \"сусід мій\","
  + "\"<m3>\": \" не розгинаючи спини\","
  /* ends */
  + "\"<e1>\": \"мітла | це місто | \","
  + "\"<e2>\": \"сакури цвіт | осінній вітер\","
  + "\"<e3>\": \"на ногах сандалі | в бамбуковім гаю\"}";

RiGrammar grammar;
RiText[] rts = new RiText[3];

void setup()
{
  size(612, 612);
  
  RiText.defaultFont("Tahoma", 26);
  RiText.defaults.alignment = CENTER;
  

  rts[0] = new RiText(this, "клікніть, ", width / 2, height / 2.25);
  rts[1] = new RiText(this, "щоб згенерувати", width / 2, height / 2);
  rts[2] = new RiText(this, "хайку", width / 2, height / 1.8);

  grammar = new RiGrammar(haikuGrammar);
  
}

void draw()
{
  //background(238, 154, 0);
  background(255, 255, 255);
  for (int k = 0; k < rts.length; k++)
    rts[k].draw();
  
  color c = color(0, 126, 255, 0);
  stroke(210, 202, 200);
  strokeWeight(30);
  //rectMode(CENTER);
  fill(c);
  rect(0, 0, 612, 612);
}

void mouseClicked()
{
  String result = grammar.expand();
  String[] lines = result.split("%");
  for (int i = 0; i < rts.length; i++) 
    rts[i].text(lines[i]);
    //println(rts);
    saveStrings("nouns.txt", lines);
}

void keyReleased()
{
if ( key == 's' ) 
{
  saveFrame("frames/haiku####" + ".png"); // зберігає малюнок
  println("Хайку збережено.");
}
}

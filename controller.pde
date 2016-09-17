import processing.serial.*;
import controlP5.*;
import static javax.swing.JOptionPane.*;

PrintWriter op;
public Serial port;
String data;

ControlP5 cp5;
String textValue = "";
DropdownList dList;
String[] portNames;

ListBox lBox, cBox;
ArrayList<String> lData;
long lSize;
int h=-45,w=-5;
void setup(){
    
   PFont font = createFont("arial",20);
  size(840,680);
  
  cp5 = new ControlP5(this);
  
  addButtons();
  addListBox();
  
  cp5.addTextfield("tfInput")
    .setPosition(50+w,115+h)
    .setColor(color(255,255,255))
    .setFont(font)
    .setSize(400,25)
    .setFocus(true)
    .setColorBackground(color(255,255,255))
    ;  
}


void draw(){
  
  
  background(28,19,30);
  fill(255);
  
  PFont Font = createFont("arial",15);
  text("SERIAL CONTROLLER",width/3,40);
  textFont(Font,32);
  fill(255, 255, 255);
  rect(45,145,400,450);
  rect(470,275,360,310);
  
 if(port!=null && port.available()>0){
   
    data = port.readStringUntil('\n');
    if(data!=null){
      lData.add(data);
      lBox.addItem(data,lSize);
      lSize++;
      delay(1);
    }
  } 
}

public void controlEvent(ControlEvent event){
  
}

public void lBox(float choice){
   
}


public void list(float choice){
 
  //println(choice);
  //println(cp5.get(DropdownList.class,"list").getValue());
  try {
    println("initiaitng port " + portNames[(int) choice]);
    port = new Serial(this,portNames[(int) choice], 9600);
    println("Success : port intialised");
  } catch (Exception e){
    println(e.toString());
  }
}



public void tfInput(String txt){
 
  try{
  
    if(txt !=null){
      port.write(txt);
      
    }
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",1);
      
    }

}

public void clear(){

  cp5.get(Textfield.class,"tfInput").clear();
  //cp5.get(Textfield.class,"tfInput").Postion(15,44);
}

public void addListBox(){

     dList = cp5.addDropdownList("list")
                .setPosition(590+w,115+h)
                .setSize(200,200)
                .setItemHeight(20)
                .setBarHeight(25)
                .setColorBackground(color(255,255,255))           
                .setColorLabel(0);
     
   lBox = cp5.addListBox("lBox")
             .setPosition(50+w, 190+h)
             .setSize(400,460)
             .setItemHeight(15)
             .setBarHeight(15);
             
    cBox = cp5.addListBox("cBox")
             .setPosition(480+w, 325+h)
             .setSize(350,300)
             .setItemHeight(15)
             .setBarHeight(15)
             .setColorLabel(255)     
             ;

}

public void addButtons(){

  cp5.addButton("btnSend")
    .setPosition(470+w,115+h)
    .setSize(100,25)
    .setColorBackground(color(100,100,100))
    .setCaptionLabel("SEND");
    
  cp5.addButton("btnExport")
     .setPosition(355+w,650+h)
     .setSize(100,20)
     .setColorBackground(color(100,100,100))
     .setCaptionLabel("EXPORT");
     
  cp5.addButton("btnStart")
     .setPosition(470+w,185+h)
     .setSize(100,30)
     .setColorBackground(color(100,100,100))
     .setCaptionLabel("START");
   
   cp5.addButton("btnStop")
     .setPosition(470+w,210+h)
     .setSize(100,30)
     .setColorBackground(color(100,100,100))
     .setCaptionLabel("STOP");
     
     
  cp5.addButton("btnForward")
     .setPosition(670+w,185+h)
     .setSize(40,40)
     .setColorBackground(color(100,100,100))
     .setCaptionLabel("FORWARD");
  
  cp5.addButton("btnLeft")
     .setPosition(625+w,230+h)
     .setSize(40,40)
     .setColorBackground(color(100,100,100))
     .setCaptionLabel("LEFT");
     
  cp5.addButton("btnBack")
     .setPosition(670+w,230+h)
     .setSize(40,40)
     .setColorBackground(color(100,100,100))
     .setCaptionLabel("BACK");
  
  cp5.addButton("btnRight")
     .setPosition(715+w,230+h)
     .setSize(40,40)
     .setColorBackground(color(100,100,100))
     .setCaptionLabel("RIGHT");
  
  cp5.addButton("btnSCAN")
     .setPosition(800+w,115+h)
     .setSize(30,20)
     .setColorBackground(color(100,100,100))
     .setCaptionLabel("SCAN");
  
  
  cp5.addButton("btnRESET")
     .setPosition(320+w,650+h)
     .setSize(30,20)
     .setColorBackground(color(100,100,100))
     .setCaptionLabel("RESET")
     ;
  
  cp5.addButton("btnABOUTUS")
     .setPosition(800+w,50+h)
     .setSize(40,20)
     .setColorBackground(color(100,100,100))
     .setCaptionLabel("ABOUT US")
     ;

}
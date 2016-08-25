import processing.serial.*;
import controlP5.*;


PFont font;

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

void setup(){
   
  size(840,580);
  
  cp5 = new ControlP5(this);
  
  addButtons();
  addListBox();
  
  cp5.addTextfield("tfInput")
    .setPosition(50,25)
    .setSize(400,25)
    .setFocus(true);
  
   lData = new ArrayList();
   lSize = 0;
  
  
  portNames = Serial.list();
  dList.addItems(portNames); 
  
}


void draw(){
  
  background(210);
  fill(255);
  
  rect(45,95,410,450);
  rect(475,230,360,310);
  
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
  
  //println(event.getController().getName());
  
  if (event.isGroup()) {
    //println("event from group : "+event.getGroup().getValue()+" from "+event.getGroup());
  } 
  else if (event.isController()) {
    //println("event from controller : "+event.getController().getValue()+" from "+event.getController());
    //sCom = (int) event.getController().getValue();
    //println(sCom);
    //println(cp5.get(DropdownList.class,"list"));
  }
  
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
  
}

public void addListBox(){

     dList = cp5.addDropdownList("list")
                .setPosition(580,25)
                .setSize(200,200)
                .setItemHeight(20)
                .setBarHeight(25);
                
   
     
   lBox = cp5.addListBox("lBox")
             .setPosition(50, 100)
             .setSize(400,460)
             .setItemHeight(15)
             .setBarHeight(15);
             
    cBox = cp5.addListBox("cBox")
             .setPosition(480, 235)
             .setSize(350,300)
             .setItemHeight(15)
             .setBarHeight(15);

}

public void addButtons(){

  cp5.addButton("btnSend")
    .setPosition(470,25)
    .setSize(100,25);
    
  cp5.addButton("btnExport")
     .setPosition(355,550)
     .setSize(100,20);
     
  cp5.addButton("btnStart")
     .setPosition(470,95)
     .setSize(100,30);
   
   cp5.addButton("btnStop")
     .setPosition(470,130)
     .setSize(100,30);
     
     
  cp5.addButton("btnForward")
     .setPosition(670,95)
     .setSize(40,40);
  
  cp5.addButton("btnLeft")
     .setPosition(625,140)
     .setSize(40,40);
     
  cp5.addButton("btnBack")
     .setPosition(670,140)
     .setSize(40,40);
  
  cp5.addButton("btnRight")
     .setPosition(715,140)
     .setSize(40,40);

}
public void btnForward(){

    try{
  
      port.write(C_FORWARD);
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",1);
      
    }

}

public void btnLeft(){

    try{
  
      port.write(C_LEFT);
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",1);
      
    }

}

public void btnBack(){

    try{
  
      port.write(C_BACKWARD);
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",1);
      
    }

}

public void btnRight(){

    try{
  
      port.write(C_RIGHT);
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",1);
      
    }

}


public void btnExport(){
  
  try{
    println("Exporting list data to export.csv");
    
    op = createWriter("export.csv");
    for(int i=0; i<lData.size(); i++){
      op.print(lData.get(i));
      
    }
    op.flush();
    op.close();
    
    println("Success : Exported list data");
    
  
  } catch (Exception e){
    println(e.toString());
  }
  
}

void btnStart(){

  try{
  
      port.write(S_START);
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",2);
      
    }
}

void btnStop(){

  try{
  
      port.write(S_STOP);
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",3);
      
    }

}

public void btnSend(){
 
  tfInput(cp5.get(Textfield.class,"tfInput").getText());
  clear();
  
}
public void btnSCAN(){
 cp5.get(Button.class,"btnSCAN").getName();
  dList.clear(); 
 portNames = Serial.list();
  dList.addItems(portNames);

}

public void btnRESET(){
    
  cp5.get(Button.class,"bt2nRESET").getName();
  if(lSize>0){
    lData = new ArrayList();
  lSize = 0;
  lBox.clear();
  }
  

}

public void btnABOUTUS(){
  showMessageDialog(null, "Created by SYMBOTICS", 
    "Alert", INFORMATION_MESSAGE);


}
public void btnForward(){

    try{
  
      port.write('w');
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",1);
      
    }

}

public void btnLeft(){

    try{
  
      port.write('a');
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",1);
      
    }

}

public void btnBack(){

    try{
  
      port.write('s');
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",1);
      
    }

}

public void btnRight(){

    try{
  
      port.write('d');
      
    }catch (Exception e){
      
      cBox.addItem("Port not found.",1);
      
    }

}
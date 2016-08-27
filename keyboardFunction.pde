void keyPressed(){


    
    if(key == CODED){
      
      if(keyCode == UP){btnForward();}
      else if (keyCode == DOWN){btnBack();}
      else if (keyCode == LEFT){btnLeft();}
      else if (keyCode == RIGHT){btnRight();}
    
    } else {
    
      if(key== 's'){port.write('s');}
      if(key=='t'){port.write('t');}
    
    }
    
}
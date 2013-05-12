#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

int xc;
int yc;
int PxColor;
int pencilColor;

int CursorPhase;
unsigned long LastTime;
#define DelayTime_ms 40

void setup()
{
  
  MeggyJrSimpleSetup(); // Required code, line 2 of 2.
  
  ClearSlate();
  xc=0;
  yc=0;
  PxColor=0;
  pencilColor=1;
  
  EditColor(1, 255, 0, 0);
  EditColor(2, 14, 1, 0);
  EditColor(3, 16, 3, 0);
  EditColor(4, 0, 255, 0);
  EditColor(5, 0, 191, 255);
  EditColor(6, 148, 0, 211);
  DisplaySlate();
  
  
  CursorPhase=0;
  //SetAuxLEDs(1 << pencilColor);
  LastTime = millis();
 
}

void loop()

  {
 int CursorColor;
 
 CheckButtonsPress();
 
 if (Button_A)     
    {    
      pencilColor++;     
      if (pencilColor > (6 + 1))
      CursorColor = Dark;  
      Tone_Start(ToneE3, 50);
    }
    
   if (Button_B)   
  {

    if (pencilColor <= 6)     

      if (PxColor != pencilColor) 
      {
        PxColor = pencilColor;  
      }
      else
      {
        PxColor = Dark;  
      } 
      Tone_Start(ToneE3, 50);
  }
     
     if(Button_Up)
     {
       DrawPx(xc,yc,PxColor);  
    yc=yc+1;
    if(yc==8)
    yc=0;
    
    Tone_Start(ToneE3, 50);
    PxColor = ReadPx(xc,yc);
    
     }
    
  if(Button_Down)
  {
    DrawPx(xc,yc,PxColor);
    
    if(yc==0)
      yc=7;
    else
      yc=yc-1;
    
    Tone_Start(ToneE3, 50);
    PxColor = ReadPx(xc,yc);
  } 
    
  if(Button_Left)
    {
     DrawPx(xc,yc,PxColor);
     
    if(xc==0)
      xc=7;
     else
      xc=xc-1;
      
     Tone_Start(ToneE3, 50);
     PxColor = ReadPx(xc,yc); 
    }
  
  if(Button_Right)
  {
    DrawPx(xc,yc,PxColor);
    
    xc=xc+1;
    if(xc==8)
    xc=0;
    
  Tone_Start(ToneE3, 50);
  PxColor = ReadPx(xc,yc);
  }
 
 
 
  if (PxColor == pencilColor)
    CursorColor = Dark;
  else   
    CursorColor = pencilColor;

  if (pencilColor > 6)     
    CursorColor = PxColor;h

  if (pencilColor == Dark)      
    CursorColor = FullOn;
    
  if ((millis() - LastTime) > DelayTime_ms)    
  {

    CursorPhase++;
    if (CursorPhase > 2)
    {
      DrawPx(xc,yc,CursorColor);
      CursorPhase = 0;
    }
    else
      DrawPx(xc,yc,PxColor);
      
    LastTime = millis();
  }
 
 
 
 DisplaySlate();
 
  }

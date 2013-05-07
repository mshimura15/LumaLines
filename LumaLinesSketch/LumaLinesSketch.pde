#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

int xc;
int yc;
int PxColor;
int PenColor;

//int CursorPhrase;
//unsigned long LastTime;
//#define DelayTime_ms 40

void setup()
{
  
  MeggyJrSimpleSetup();
  
  ClearSlate();
  xc=7;
  yc=7;
  PxColor=0;
  PenColor=15;
  
  //Cursor Phase=0;
  //LastTime = millis();
 
}

void loop()

  {
 int CursorColor;
 
 CheckButtonsPress();
 
 if(Button_A)
   {
   }
    
     
     if(Button_Up)
     {
       DrawPx(xy,yc,PxColor);  
    yc=yc+1;
    if(yc==8)
    yc=0;
     }
    
  if(Button_Down)
  {
    DrawPx(xc,yc,PxColor);
    if(yc==0)
      yc=7;
    else
      yc=yc-1;
  } 
    
  if(Button_Left)
    {
     DrawPx(xc,yc,PxColor);
    if(xc==0)
      xc=7;
     else
      xc=xc-1;
    }
  
  if(Button_Right)
  {
    DrawPx(xc,yc,PxColor);
    xc=xc+1;
    if(xc==8)
    xc=0;
  }
 

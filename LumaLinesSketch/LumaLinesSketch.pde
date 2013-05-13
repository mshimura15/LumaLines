#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

//struct Point

int xc;
int yc;
int PxColor;
int pencilColor;

int CursorPhase;
unsigned long LastTime;
#define DelayTime_ms 40

//Point t1 = {1,1,1}; //red
//Point t2 = {6,1,1};

//Point t3 = {0,4,2}; //orange
//Point t4 = {2,5,2};

//Point t5 = {4,0,3}; //yellow
//Point t6 = {4,3,3};

//Point t7 = {3,7,4}; //green
//Point t8 = {5,3,4};

//Point t9 = {4,7,}; //light blue
//Point t10 = {6,3};

//Point t11 = {7,2}; //dark blue
//Point t12 = {5,7};

//Point t13 = {2,1}; //Purple
//Point t14 = {7,0};

//Point t15 = {1,6};//Pink
//Point t16 = {4,4};

void setup()
{
  
  MeggyJrSimpleSetup(); // Required code, line 2 of 2.
  
  ClearSlate();
  xc=0;
  yc=0;
  PxColor=0;
  pencilColor=8;
  
  EditColor(1, 255, 0, 0); //red
  EditColor(2, 14, 1, 0); //orange
  EditColor(3, 16, 3, 0); //yellow
  EditColor(4, 0, 255, 0); //green
  EditColor(5, 0, 191, 255); //light blue
  EditColor(6, 0, 0, 255); //dark blue
  EditColor(7, 148, 0, 150);//pink
  EditColor(8, 100, 10, 3);//brown
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
      if (pencilColor > (8 + 1))
      CursorColor = Dark;  
      Tone_Start(ToneE3, 50);
    }
    
   if (Button_B)   
  {

    if (pencilColor <= 8)     

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

  if (pencilColor > 8)     
    CursorColor = PxColor;

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

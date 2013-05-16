#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

struct Point
{
int xc;
int yc;
int color;
};

Point t1 = {1,1,1}; //red
Point t2 = {6,1,1};
Point t3 = {0,4,2}; //orange
Point t4 = {2,5,2};
Point t5 = {4,0,3}; //yellow
Point t6 = {4,3,3};
Point t7 = {3,7,4}; //green
Point t8 = {5,3,4};
Point t9 = {4,7,5}; //light blue
Point t10 = {6,3,5};
Point t11 = {7,2,6}; //dark blue
Point t12 = {5,7,6};
Point t13 = {2,1,7}; //Purple
Point t14 = {7,0,7};
Point t15 = {1,6,8};//pink
Point t16 = {4,4,8};

Point tarray[20] = {t1,t2,t3,t4,t5,t6,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16};

int xcursor;
int ycursor;
int i;
int PxColor;
int pencilColor;
int CursorPhase;
unsigned long LastTime; 
#define DelayTime_ms 40

void setup()
{
  
  MeggyJrSimpleSetup(); // Required code, line 2 of 2.
  
  ClearSlate();
  xcursor=0;
  ycursor=0;
  PxColor=0;
  pencilColor=1;
 
  for (int i = 0; i < 17; i++)
  {
    DrawPx(tarray[i].xc,tarray[i].yc, tarray[i].color);
  }
  
  EditColor(1, 255, 0, 0); //red
  EditColor(2, 14, 1, 0); //orange
  EditColor(3, 16, 3, 0); //yellow
  EditColor(4, 0, 255, 0); //green
  EditColor(5, 0, 191, 255); //light blue
  EditColor(6, 0, 0, 255); //dark blue
  EditColor(7, 148, 0, 150);//purple
  EditColor(8, 19, 3, 5);//pink
  DisplaySlate();

 
  CursorPhase=0;
  LastTime = millis();
 
}

void loop()

  {
 byte CursorColor;
 
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
       {
       DrawPx(xcursor,ycursor,PxColor);  
    ycursor=ycursor+1;
    if(ycursor==8)
    ycursor=0;
    
    Tone_Start(ToneE3, 50);
    PxColor = ReadPx(xcursor,ycursor);
     }
    for(int i=0;i<17;i++)
      {
        if(xcursor==tarray[i].xc && ycursor==tarray[i].yc)
        ycursor--;
      }
     }
    
  if(Button_Down)
  {
    {
    DrawPx(xcursor,ycursor,PxColor);
    
    if(ycursor==0)
      ycursor=7;
    else
      ycursor=ycursor-1;
    
    Tone_Start(ToneE3, 50);
    PxColor = ReadPx(xcursor,ycursor);
    } 
      for(int i=0;i<17;i++)
      {
        if(xcursor==tarray[i].xc && ycursor==tarray[i].yc)
        ycursor++;
      }
  }
      
    if(Button_Left)
    {
     DrawPx(xcursor,ycursor,PxColor);
     
    if(xcursor==0)
      xcursor=7;
     else
      xcursor=xcursor-1;
      
     Tone_Start(ToneE3, 50);
     PxColor = ReadPx(xcursor,ycursor); 
    }
  
  if(Button_Right)
  {
    DrawPx(xcursor,ycursor,PxColor);
    
    xcursor=xcursor+1;
    if(xcursor==8)
    xcursor=0;
    
  Tone_Start(ToneE3, 50);
  PxColor = ReadPx(xcursor,ycursor);
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
      DrawPx(xcursor,ycursor,CursorColor);
      CursorPhase = 0;
    }
    else
      DrawPx(xcursor,ycursor,PxColor);
      
    LastTime = millis();
  }
 
 
 
 DisplaySlate();
 
  }

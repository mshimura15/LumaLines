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
Point t14 = {7,1,7};
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

 
  CursorPhase=0;  //cursor is dark
  LastTime = millis();  // setup of timing of blinking
 
}

void loop()

  {
 byte CursorColor;  //color of the cursor
 
 CheckButtonsPress();
 
 if (Button_A)     
    {    
    pencilColor++;      //increasing pencil color to +1 whatever it is now
    if (pencilColor > (8 + 1))  //if pencil is > (8+1) have pencil go dark
      pencilColor = Dark;       
      
   Tone_Start(ToneD3, 50);     
  }
    
   if (Button_B)   
   {    
    if (pencilColor <= 8)     //if pencil color less than or equal to 8 

      if(PxColor != pencilColor)  //if PxColor doesn't equal pencil color
      {
        PxColor = pencilColor;   //have Px color = the pencil color
      }
      else
      {
       PxColor = Dark;   //otherwise have the pixel go dark
      }      

  Tone_Start(ToneC3, 50);


  }
     
     if(Button_Up)
     {
       {
       DrawPx(xcursor,ycursor,PxColor);  //Drawing the cursor
    ycursor=ycursor+1;  //increasing y value by 1 from curret position
    if(ycursor==8) //looping
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
    {
     DrawPx(xcursor,ycursor,PxColor);
     
    if(xcursor==0)
      xcursor=7;
     else
      xcursor=xcursor-1;
      
     Tone_Start(ToneE3, 50);
     PxColor = ReadPx(xcursor,ycursor); 
     }
       for(int i=0;i<17;i++)
      {
        if(xcursor==tarray[i].xc && ycursor==tarray[i].yc)
        xcursor--;
      }
     }
  
  if(Button_Right)
  {
    {
    DrawPx(xcursor,ycursor,PxColor);
    
    xcursor=xcursor+1;
    if(xcursor==8)
    xcursor=0;
    
  Tone_Start(ToneE3, 50);
  PxColor = ReadPx(xcursor,ycursor);
    }
  for(int i=0;i<17;i++)
      {
        if(xcursor==tarray[i].xc && ycursor==tarray[i].yc)
        ycursor++;
      }
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
 
 boolean Winner = false;
     {
   if( ReadPx(0,0)==3)
   if( ReadPx(0,1)==3)
   if( ReadPx(0,2)==3)
   if( ReadPx(0,3)==3)
   if( ReadPx(0,4)==3)
   if( ReadPx(0,5)==7)
   if( ReadPx(0,6)==7)
   if( ReadPx(0,7)==7)
   if( ReadPx(1,0)==3)
   if( ReadPx(1,1)==1)
   if( ReadPx(1,2)==7)
   if( ReadPx(1,3)==7)
   if( ReadPx(1,4)==7)
   if( ReadPx(1,5)==7)
   if( ReadPx(1,6)==1)
   if( ReadPx(1,7)==7)
   if( ReadPx(2,0)==3)
   if( ReadPx(2,1)==1)
   if( ReadPx(2,2)==1)
   if( ReadPx(2,3)==1)
   if( ReadPx(2,4)==1)
   if( ReadPx(2,5)==1)
   if( ReadPx(2,6)==1)
   if( ReadPx(2,7)==6)
   if( ReadPx(3,0)==3)
   if( ReadPx(3,1)==3)
   if( ReadPx(3,2)==3)
   if( ReadPx(3,3)==3)
   if( ReadPx(3,4)==3)
   if( ReadPx(3,5)==4)
   if( ReadPx(3,6)==5)
   if( ReadPx(3,7)==6)
   if( ReadPx(4,0)==2)
   if( ReadPx(4,1)==8)
   if( ReadPx(4,2)==8)
   if( ReadPx(4,3)==8)
   if( ReadPx(4,4)==8)
   if( ReadPx(4,5)==4)
   if( ReadPx(4,6)==5)
   if( ReadPx(4,7)==6)
   if( ReadPx(5,0)==2)
   if( ReadPx(5,1)==8)
   if( ReadPx(5,2)==2)
   if( ReadPx(5,3)==4)
   if( ReadPx(5,4)==4)
   if( ReadPx(5,5)==4)
   if( ReadPx(5,6)==5)
   if( ReadPx(5,7)==6)
   if( ReadPx(6,0)==2)
   if( ReadPx(6,1)==8)
   if( ReadPx(6,2)==2)
   if( ReadPx(6,3)==4)
   if( ReadPx(6,4)==5)
   if( ReadPx(6,5)==5)
   if( ReadPx(6,6)==5)
   if( ReadPx(6,7)==6)
   if( ReadPx(7,0)==2)
   if( ReadPx(7,1)==2)
   if( ReadPx(7,2)==2)
   if( ReadPx(7,3)==4)
   if( ReadPx(7,4)==5)
   if( ReadPx(7,5)==6)
   if( ReadPx(7,6)==6)
   if( ReadPx(7,7)==6)
   
   Winner = true;
     }
 
 if(Winner==true)
   DrawPx(0,0,1);
   
 
 DisplaySlate();
 
  }

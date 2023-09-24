.MODEL LARGE
.STACK 1000H
.DATA

M1 DB 10,13,10,13,'                 Welcome to Our Restaurants$',10,13
M2 DB 10,13,10,13,'Enter your Choise $'

M3 DB 10,13,'  *                 1. DINE IN              *$' 
M4 DB 10,13,'  *                 2. DELIVERY             *$' 
;MENU

M5 DB 10,13,10,13,'Enter address: $'
M6 DB 10,13,10,13,'Enter Name: $' 
M7 DB 10,13,10,13,'Table number: $'  
M8 DB 10,13,10,13,'1. Proceed to cold drink?$'
M9 DB 10,13,'2. Add more items? $' 
M10 DB 10,13,'3. EXIT$'  

M90 DB 10,13,10,13,'Table Finished$'  

M18 DB 10,13,'  *  1.Chicken Burger          60/-                               *$'
M19 DB 10,13,'  *  2.Beef Burger             80/-                               *$'
M20 DB 10,13,'  *  3.Cheese fries            80/-                               *$' 
M21 DB 10,13,'  *  4.Garlic fries            40/-                               *$'
M22 DB 10,13,'  *  5.Chicken salad           40/-                               *$'
M23 DB 10,13,'  *  6.Chicken sandwich        80/-                               *$'
M34 DB 10,13,'  *  7.Cheese sandwich         60/-                               *$'
M35 DB 10,13,'  *  8.Morrocon steak          60/-                               *$'
M36 DB 10,13,'  *  9.Ceaser salad            60/-                               *$'



M49 DB 10,13,'  *  1.Soft Drinks        8/-                *$'
M50 DB 10,13,'  *  2.Mineral water      6/-                *$'
M51 DB 10,13,'  *  3.Cappuchino         9/-                *$'
M52 DB 10,13,'  *  4.Green Tea          9/-                *$'
M53 DB 10,13,'  *  5.Coffee             7/-                *$'
M54 DB 10,13,'  *  6.Tea                5/-                *$'



;INVALID
M55 DB 10,13,10,13,'&&INVALID ENTRY&&$'
M56 DB 10,13,'      &&Try Again&&$'



M57 DB 10,13,10,13,'Enter your order: $'
M58 DB 10,13,'Quantity: $'
M59 DB 10,13,'Total Price: $'


DRINK DB ?
QUANTITY DB ?


M60 DB 10,13,10,13,'1.Go Back to Main Menu$'
M61 DB 10,13,'2.EXIT$'
                          
;STAR RESIZE


MR1 DB 10,13,'  *                                           *$'
MR2 DB 10,13,'  *******$'

MR3 DB 10,13,'  *                                           *$'


MR4 DB 10,13,'  *                                                               *$'
MR5 DB 10,13,'  *********$'



MR6 DB 10,13,'  *                                          *$'
MR7 DB 10,13,'  ******$'


SEJ DB 10,13,10,13,' $'
                      
STR1 DB 255 DUP('$')  
bufferSize  db 21  ; 20 char + RETURN
inputLength db 0   ; number of read characters
buffer      db 21 DUP(0) ; actual buffer                                 
    myVar db 48 
    bill DB  0
    bill2 DB 0  
    DIGIT DB 0 
    ADDNEWITEM DW 0 
     ADDNEWITEM2 DW 0
           
 .CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX   

  TOP:
  
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H
    
   
  
    LEA DX,M3
    MOV AH,9
    INT 21H
    
    LEA DX,M4
    MOV AH,9
    INT 21H  
    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H
;taking input    
     MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48 
    
CMP BH,1
JE DINEIN 
    
CMP BH,2
 JE DELIVERY  
  
    

JMP INVALID
    
DELIVERY:

 ;name
   LEA DX,M6    
    MOV AH,9
    INT 21H 
             

   mov dx, offset bufferSize ; load our pointer to the beginning of the structure
    mov ah, 0Ah ; GetLine function
    int 21h

    xor dx, dx
 
              
              
  ;address  
    LEA DX,M5  
    MOV AH,9
    INT 21H              
               

   mov dx, offset bufferSize ; load our pointer to the beginning of the structure
    mov ah, 0Ah ; GetLine function
    int 21h

   xor dx, dx 
    
    JMP  MENU
    
    
    
DINEIN: 

mov dl,48
add dl,4
CMP myVar,dl
JE tablefinished 
;tablenumber
LEA DX,M7
MOV AH,9
INT 21H

mov dl,48 
mov ah,2 
MOV dl,myVar    
inc dl 

mov myVar,dl     
INT 21H
jmp MENU


  
tablefinished:
LEA DX,M90  
MOV AH,9
INT 21H
         
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48    
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT


 
       
MENU: 
   LEA DX,M18         
    MOV AH,9
    INT 21H 
    
    LEA DX,M19
    MOV AH,9              
    INT 21H
    
    
    LEA DX,M20          
    MOV AH,9
    INT 21H
    
    LEA DX,M21
    MOV AH,9                
    INT 21H  
    
    
    LEA DX,M22              
    MOV AH,9
    INT 21H 
    
    
    LEA DX,M23               
    MOV AH,9
    INT 21H
    
     
    LEA DX,M34               
    MOV AH,9
    INT 21H
    
    
    LEA DX,M35               
    MOV AH,9
    INT 21H 
    
    LEA DX,M36               
    MOV AH,9
    INT 21H
    
    
    
    LEA DX,MR4
    MOV AH,9
    INT 21H
    
    LEA DX,MR5   ;BORDER
    MOV AH,9
    INT 21H
    
    
    LEA DX,MR5
    MOV AH,9
    INT 21H   
    
    
    
    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE SIXTY
    
    CMP BL,2
    JE EIGHTY
    
    CMP BL,3
    JE EIGHTY 
    
    CMP BL,4
    JE FOURTY
    
    CMP BL,5
    JE FOURTY
    
    CMP BL,6
    JE EIGHTY
    
    CMP BL,7
    JE SIXTY
    
    CMP BL,8
    JE SIXTY 
    
    CMP BL,9
    JE SIXTY
    
   FOURTY:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM     
    MOV [bill2],AL 
    
     
   
    MOV CX,AX 
    
    ADD [ADDNEWITEM],CX     ;add more items
    ADD CX,[ADDNEWITEM2]
      
    CMP CL,9
    JG ADD1
    ADD CH,48 
    ADD CL,48
    JMP CONT
    
 CONT:   
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2 
    
    MOV DL,CH 
    MOV [DIGIT],CH        ;moving first digit to digit
    INT 21H
    
    MOV DL,CL 
    INT 21H
    
     
    MOV DL,'0'
    INT 21H 
       
    MOV DL,36
    INT 21H
   
    
    JMP SHORTMENU 
   ADD1:
   ADD CH,48
   ADD CH,1
  
   ADD CL,38
   JMP CONT 
 
   SIXTY: 
   
    MOV BL,6
   
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
    MOV [bill2],AL 
 
    MOV CX,AX 
    ADD [ADDNEWITEM],CX
    ADD CX,[ADDNEWITEM2]
    CMP CL,9
    JG ADD2
    ADD CH,48 
    ADD CL,48
    JMP CONT2
    
CONT2:    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH 
    MOV [DIGIT],CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
     MOV DL,36
    INT 21H
   
    JMP SHORTMENU
ADD2:
   ADD CH,48
   ADD CH,1
  
   ADD CL,38
   JMP CONT2 
    

         
   EIGHTY:
    MOV BL,8
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM
   mov [bill2],AL 
 
    MOV CX,AX 
     MOV [ADDNEWITEM],CX                        ;addmoreitems
     ADD CX,[ADDNEWITEM2]
    CMP CL,9
    JG ADD4
    ADD CH,48 
    ADD CL,48
    JMP CONT4
CONT4:    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH 
    MOV [DIGIT],CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
             
             
    MOV DL,36
    INT 21H
    
    JMP SHORTMENU  
    ADD4:
   ADD CH,48
   ADD CH,1
  
   ADD CL,38
   JMP CONT4   
 
            
SHORTMENU:
 
            
LEA DX,M8
MOV AH,9
INT 21H 


LEA DX,M9
MOV AH,9
INT 21H


LEA DX,M10
MOV AH,9
INT 21H
  
LEA DX,SEJ ;NEWLINE
MOV AH,9
INT 21H
    
MOV AH,1
INT 21H
MOV BL,AL
SUB BL,48  

CMP BL,1
JE COLDDRINK 


CMP BL,2
MOV [ADDNEWITEM2],0
MOV AX,48
MOV AX,[ADDNEWITEM]


MOV  [ADDNEWITEM2],AX
JE MENU


CMP BL,3
JE MAINMENUS

CMP BL,4
JGE INVALID

JMP EXIT
          
   
           
COLDDRINK:


    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H
    
    LEA DX,MR7
    MOV AH,9
    INT 21H
    
    
    LEA DX,MR7
    MOV AH,9
    INT 21H     ;BORDER
    
    LEA DX,MR6
    MOV AH,9
    INT 21H
   
   
    LEA DX,M49               ;1th
    MOV AH,9
    INT 21H 
    
    LEA DX,M50               ;2th
    MOV AH,9
    INT 21H                         
    
    LEA DX,M51               ;3th
    MOV AH,9
    INT 21H
    
    LEA DX,M52               ;4th
    MOV AH,9
    INT 21H 
    
    LEA DX,M53               ;5th
    MOV AH,9
    INT 21H
    
    LEA DX,M54               ;6th
    MOV AH,9
    INT 21H
    
    LEA DX,MR6
    MOV AH,9
    INT 21H
     
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    
    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H
    
    
    CMP BL,1
    JE SOFTDRINK
    
    CMP BL,2
    JE MINERALWATER
    
    CMP BL,3
    JE CAPPUCHINO
    
    CMP BL,4
    JE GREENTEA
    
    CMP BL,5
    JE COFFEE 
    
    CMP BL,6
    JE TEA 
    
    JMP INVALID
    
   SOFTDRINK:
    MOV BL,8
    JMP COMMON
    
   MINERALWATER:
    MOV BL,6
    JMP COMMON
   
    
   CAPPUCHINO:
    MOV BL,9
    JMP COMMON
    
   GREENTEA:
    MOV BL,9
    JMP COMMON
    
    
   COFFEE:
    MOV BL,7
    JMP COMMON
    
 
   TEA:
    MOV BL,5
    JMP COMMON
   
   
    
    
   COMMON: 
    mov AL,[bill2]                         ;taking bill of menu to add to colddrink
   
    
    mov [bill],AL    
  
    
    LEA DX,M58              
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    SUB AL,48 
   
             
                 
    MUL BL 
    AAM 
     
   
    MOV CX,AX
    ADD CL,48  
    ADD CH,48
    ADD CH,[BILL] 
    cmp ch,57                            ;if tens is greater than 99 then jmp to third digit for increment
    jg thirddigit  
    JNG SMALL
    SMALL:
    LEA DX,M59              
    MOV AH,9
    INT 21H  
    
     MOV AH,2        
     MOV DL,48                         ;printing first digit
     MOV DL,[DIGIT] 
     INT 21H  
     
    MOV AH,2  
    MOV DL,CH 
    INT 21H
    
   
    MOV DL,CL
    INT 21H 

    MOV DL,36
    INT 21H
     
    mov [bill2],48  
    MOV [DIGIT],48
    JMP MAINMENUS
    
  thirddigit:
 MOV CH,48 
 INC [DIGIT]
 JMP SMALL

    
    ;GO BACK TO MAIN MENU
   MAINMENUS: 
   MOV [ADDNEWITEM],0                           ;clearing add more items
   MOV [ADDNEWITEM2],0
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H             ;MAIN MENU
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT
 
   
    

    
   INVALID:
   
    LEA DX,M55
    MOV AH,9
    INT 21H 
    
    
    LEA DX,M56 
    MOV AH,9
    INT 21H 
    
    
    
    JMP EXIT 
    
        
    
    
     EXIT:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
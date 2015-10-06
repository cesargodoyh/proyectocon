clc;
clear all;
c=1;at=0;atr=0;ntr=0;ap=0;nt=0;apu=0;nr=0;ar=0;ara=0;nra=0;ai=0;aim=0;np=0;npu=0;vu=[];vd=[];
disp('para las señales que desee realizar la convolucion, elija: ')
m=input('a) Duracion :' );                                                  % (m) es la la duracion que es igual para las dos señales
s=input('b) Numero de muestras :');                                         % (s) es el numero de muestras, que es igual para las dos señales
l=m/s;
y= mod(s,2);                                                                
 if y==1
     s=s+1;
 end

while c<3
if c==1
display('   Elija la primera señal para calcular la convolucion:        ')
end
display('            1) señal triangulo                       ')
display('              2) señal pulso   '                      )
display('               3) señal rampa  '                      )
display('              4) señal impulso  '                     )
x=input('');
switch x
    case 1
        disp('PARA LA SEÑAL  TRIANGULO, ELEJIDA:')
        if c==1
           prim=1;                                                          %(prim) es la primera señal para la convolucion
           at=input('a) Amplitud de la señal:' );                           %(at) es la amplitud del triangulo
           nt=input('b) Soporte de la señal:' );                            %(nt) es el soporte de la señal triangulo
        else
           segun=1;                                                         %(segun) es la segunda señal para la convolucion                             
           atr=input('a) Amplitud de la señal:' );                          %(atr) es la amplitud del triangulo (segun)
           ntr=input('b) Soporte de la señal:' );                           %(ntr) es la amplitud del triangulo (segun)
        end 
    case 2
        disp('PARA LA SEÑAL PULSO, ELEJIDA:')
        if c==1
           prim=2;
           ap=input('a) Amplitud de la señal:' );                           %(ap) es la amplitud del pulso
           np=input('b) Soporte de la señal:' );                            %(np) es el soporte de la señal pulso
        else
           segun=2; 
           apu=input('a) Amplitud de la señal:' );                          %(apu) es la amplitud del pulso (segun)
           npu=input('b) Soporte de la señal:' );                           %(npu) es el soporte de la señal pulso (segun)
        end 
        
    case 3 
        disp('PARA LA SEÑAL RAMPA, ELIJA:')
        if c==1
           prim=3;
           ar=input('a) Amplitud de la señal:' );                           %(ar) es la amplitud del rampa
           nr=input('b) Soporte de la señal:' );                            %(nr) es el soporte de la señal rampa
        else
           segun=3; 
           ara=input('a) Amplitud de la señal:' );                          %(ara) es la amplitud del rampa (segun)
           nra=input('b) Soporte de la señal:' );                           %(nra) es el soporte de la señal rampa (segun)
        end    
    case 4
        disp('PARA LA SEÑAL IMPULSO, ELIJA:')
        if c==1
           prim=4;
           ai=input('a) Amplitud de la señal:' );                           %(ai) es la amplitud del impulso
        else
           segun=4;
           aim=input('a) Amplitud de la señal:' );                          %(aim) es la amplitud del impulso (segun)
        end         
    otherwise
        c=0;
        disp('Las opciones son solo de 1 a 4')

end
c=c+1;
if c==2
    display('   Elija la segunda señal para calcular la convolucion:        ')
end
end

if (prim==1) && (segun==1) 
    disp(' 1 , 1')
end

if [(prim==1) && (segun==2)] || [(prim==2) && (segun==1)]
    if at==0
        at=atr;
        nt=ntr;
    end
    
end

if [(prim==1) && (segun==3)] || [(prim==3) && (segun==1)]
    disp(' 1 , 3')

end

if [(prim==1) && (segun==4)] || [(prim==4) && (segun==1)]
    disp(' 1 , 4')
end

if (prim==2) && (segun==2)
   for i=-m/2:l:m/2
       m/s
       i
     if [(i<npu/2) && (i>-npu/2)] || [(i>-npu/2) && (i<npu/2)]
         vu=[vu apu]
     else
         vu=[vu 0]
     end
end
end

if [(prim==2) && (segun==3)] || [(prim==3) && (segun==2)]
    disp(' 2 , 3')
end

if [(prim==2) && (segun==4)] || [(prim==4) && (segun==2)]
    disp(' 2 , 4')
end

if (prim==3) && (segun==3)
    disp(' 3 , 3')
end

if [(prim==3) && (segun==4)] || [(prim==4) && (segun==3)]
    disp(' 3 , 4')
end

if (prim==4) && (segun==4)
    disp(' 4 , 4')
end

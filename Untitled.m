clc;
clear all;
t=1;c=1;at=0;atr=0;ntr=0;ap=0;nt=0;apu=0;nr=0;ar=0;ara=0;nra=0;ai=0;aim=0;np=0;npu=0;vu=[];vt=[];vtotal=[];
disp('para las se�ales que desee realizar la convolucion, elija: ')
m=input('a) Duracion :' );                                                  % (m) es la la duracion que es igual para las dos se�ales
mover=-m/2;
s=input('b) Numero de muestras :');                                         % (s) es el numero de muestras, que es igual para las dos se�ales
y= mod(s,2);                                                                
if y==0
    l=m/s;
    s=s+1;
else
    l=m/(s-1);
end

while c<3
if c==1
display('   Elija la primera se�al para calcular la convolucion:        ')
end
display('            1) se�al triangulo                       ')
display('              2) se�al pulso   '                      )
display('               3) se�al rampa  '                      )
display('              4) se�al impulso  '                     )
x=input('');
switch x
    case 1
        disp('PARA LA SE�AL  TRIANGULO, ELEJIDA:')
        if c==1
           prim=1;                                                          %(prim) es la primera se�al para la convolucion
           at=input('a) Amplitud de la se�al:' );                           %(at) es la amplitud del triangulo
           nt=input('b) Soporte de la se�al:' );                            %(nt) es el soporte de la se�al triangulo
        else
           segun=1;                                                         %(segun) es la segunda se�al para la convolucion                             
           atr=input('a) Amplitud de la se�al:' );                          %(atr) es la amplitud del triangulo (segun)
           ntr=input('b) Soporte de la se�al:' );                           %(ntr) es la amplitud del triangulo (segun)
        end 
    case 2
        disp('PARA LA SE�AL PULSO, ELEJIDA:')
        if c==1
           prim=2;
           ap=input('a) Amplitud de la se�al:' );                           %(ap) es la amplitud del pulso
           np=input('b) Soporte de la se�al:' );                            %(np) es el soporte de la se�al pulso
        else
           segun=2; 
           apu=input('a) Amplitud de la se�al:' );                          %(apu) es la amplitud del pulso (segun)
           npu=input('b) Soporte de la se�al:' );                           %(npu) es el soporte de la se�al pulso (segun)
        end 
        
    case 3 
        disp('PARA LA SE�AL RAMPA, ELIJA:')
        if c==1
           prim=3;
           ar=input('a) Amplitud de la se�al:' );                           %(ar) es la amplitud del rampa
           nr=input('b) Soporte de la se�al:' );                            %(nr) es el soporte de la se�al rampa
        else
           segun=3; 
           ara=input('a) Amplitud de la se�al:' );                          %(ara) es la amplitud del rampa (segun)
           nra=input('b) Soporte de la se�al:' );                           %(nra) es el soporte de la se�al rampa (segun)
        end    
    case 4
        disp('PARA LA SE�AL IMPULSO, ELIJA:')
        if c==1
           prim=4;
           ai=input('a) Amplitud de la se�al:' );                           %(ai) es la amplitud del impulso
        else
           segun=4;
           aim=input('a) Amplitud de la se�al:' );                          %(aim) es la amplitud del impulso (segun)
        end         
    otherwise
        c=0;
        disp('Las opciones son solo de 1 a 4')

end
c=c+1;
if c==2
    display('   Elija la segunda se�al para calcular la convolucion:        ')
end
end

if (prim==1) && (segun==1) 
    disp(' 1 , 1')
end

if [(prim==1) && (segun==2)] || [(prim==2) && (segun==1)]
   ejex=-m/2:l:m/2;
    if ntr==0
         ntr=nt;
         atr=at;
         ap=apu;
         np=npu;
    end
    n=np/(2*l);
    vu=tripuls(ejex,ntr);
    vu=vu*atr;
 while t<(1+n)
    vt=vu.*vd;
    vt=sum(vt);
    vtotal=[vtotal vt];
    t=t+1;
    end           

for t=1+n:1:s-n
    vd=zeros(1,s);
    subplot(2,1,1)
    stem(ejex,vu)
    title('se�al triangulo fija y se�al pulso se mueve');
    hold on
    vd(t-n:t+n)=ap;
    stem(ejex,vd)
    hold off
    pause(0.01)
    vt=vu.*vd;
    vt=sum(vt);
    vtotal=[vtotal vt];
end

while t<s
    vt=vu.*vd;
    vt=sum(vt);
    vtotal=[vtotal vt];
    t=t+1;        
end
subplot(2,1,2)
title('convolucion de las se�ales');
    stem(ejex,vtotal)
end
if [(prim==1) && (segun==3)] || [(prim==3) && (segun==1)]
  
end

if [(prim==1) && (segun==4)] || [(prim==4) && (segun==1)]
    ejex=-m/2:l:m/2;
    if ntr==0
         ntr=nt;
         atr=at;
         ai=aim;
    end
    vu=tripuls(ejex,ntr);
    vu=vu*atr;

 for t=1:1:s
    vd=zeros(1,s);
    subplot(2,1,1)
    stem(ejex,vu)
    title('se�al triangulo fija y se�al impulso se mueve');
    hold on
    vd(t)=ai;
    stem(ejex,vd)
    hold off
    pause(0.01)
    vt=vu.*vd;
    subplot(2,1,2)
    title('convolucion de las se�ales');
    stem(ejex,vt)
    hold on
 end
end

if (prim==2) && (segun==2)
    ejex=-m/2:l:m/2;
    n=np/(2*l);
   for i=-m/2:l:m/2
     if [(i<npu/2) && (i>-npu/2)] || [(i>-npu/2) && (i<npu/2)]
         vu=[vu apu];
     else
         vu=[vu 0];
     end
   end
  
 while t<(1+n)
    vtotal=[vtotal 0];
    t=t+1;
    f=t;
    end           

for t=1+n:1:s-n
    vd=zeros(1,s);
    subplot(2,1,1)
    stem(ejex,vu)
    title('se�al pulso fija y se�al pulso se mueve');
    hold on
    vd(t-n:t+n)=ap;
    stem(ejex,vd)
    hold off
    pause(0.01)
    vt=vu.*vd;
    vt=sum(vt);
    vtotal=[vtotal vt];
end

while t<s
     vt=sum(vt);
    vtotal=[vtotal vt];
    t=t+1;        
end
vtotal(1:f)=vt
subplot(2,1,2)
    stem(ejex,vtotal)
    title('convolucion de las se�ales');
end

if [(prim==2) && (segun==3)] || [(prim==3) && (segun==2)]
   if nra==0
         nra=nr;
         ara=ar;
         ap=apu;
         na=npu;
   end
   n=np/(2*l);
   ejex=-m/2:l:m/2;
   pendiente=ara/nra;
    while t<(1+n)
    vtotal=[vtotal 0];
    t=t+1;
    f=t;
    end    
    for i=-m/2:l:m/2
     if [(i<nra) && (i>0)] || [(i>0) && (i<nra)]
         y=pendiente*i;         
         vu=[vu y];
     else
         vu=[vu 0];
     end
    end

for t=1+n:1:s-n
    vd=zeros(1,s);
    subplot(2,1,1)
    stem(ejex,vu)
    title('se�al rampa fija y se�al pulso se mueve');
    hold on
    vd(t-n:t+n)=ap;
    stem(ejex,vd)
    hold off
    pause(0.01)
    vt=vu.*vd;
    vt=sum(vt);
    vtotal=[vtotal vt];
end

while t<s
    vt=vu.*vd;
    vt=sum(vt);
    vtotal=[vtotal vt];
    t=t+1;        
end
subplot(2,1,2)
stem(ejex,vtotal)
title('convolucion de las se�ales');
end

if [(prim==2) && (segun==4)] || [(prim==4) && (segun==2)]
     if npu==0
         npu=np;
         apu=ap;
         ai=aim;
     end
       for i=-m/2:l:m/2
     if [(i<npu/2) && (i>-npu/2)] || [(i>-npu/2) && (i<npu/2)]
         vu=[vu apu];
     else
         vu=[vu 0];
     end
       end
   ejex=-m/2:l:m/2;
 
 for t=1:1:s
    vd=zeros(1,s);
    subplot(2,1,1)
    stem(ejex,vu)
    title('se�al pulso fija y se�al impulso se mueve');
    hold on
    vd(t)=ai;
    stem(ejex,vd)
    hold off
    pause(0.01)
    vt=vu.*vd;
    subplot(2,1,2)
    title('convolucion de las se�ales');
    stem(ejex,vt)
    hold on
 end
end

if (prim==3) && (segun==3)
    disp(' 3 , 3')
end

if [(prim==3) && (segun==4)] || [(prim==4) && (segun==3)]
     if nra==0
         nra=nr;
         ara=ar;
         ai=aim;
   end
   ejex=-m/2:l:m/2;
   pendiente=ara/nra;
      
    for i=-m/2:l:m/2
     if [(i<nra) && (i>0)] || [(i>0) && (i<nra)]
         y=pendiente*i;         
         vu=[vu y];
     else
         vu=[vu 0];
     end
    end
     for t=1:1:s
    vd=zeros(1,s);
    subplot(2,1,1)
    stem(ejex,vu)
    title('se�al rampa fija y se�al impulso se mueve');
    hold on
    vd(t)=ai;
    stem(ejex,vd)
    hold off
    pause(0.01)
    vt=vu.*vd;
    subplot(2,1,2)
    title('convolucion de las se�ales');
    stem(ejex,vt)
    hold on
 end
end

if (prim==4) && (segun==4)
     for i=-m/2:l:m/2
     if i==0;
         vu=[vu aim];
     else
         vu=[vu 0];
     end
       end
   ejex=-m/2:l:m/2;
 
 for t=1:1:s
    vd=zeros(1,s);
    subplot(2,1,1)
    stem(ejex,vu)
    title('se�al impulso fija y se�al impulso se mueve');
    hold on
    vd(t)=ai;
    stem(ejex,vd)
    hold off
    pause(0.01)
    vt=vu.*vd;
    subplot(2,1,2)
    title('convolucion de las se�ales');
    stem(ejex,vt)
    hold on
 end
end

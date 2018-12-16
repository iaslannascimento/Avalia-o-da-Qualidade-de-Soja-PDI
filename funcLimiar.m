function result = funcLimiar(im)


%im=imread('L14R2.jpg');
r=im(:,:,1);
h=imhist(r);
s=0;
d=0;
maior=0;
menor=max(h);
sair=0;
corte=0;
for i=256:-1:9
  if(sair==0)
    if(s==1&&d==1)
      if(menor>h(i))
        menor=h(i);
        corte=i;
      end
      if(h(i)>=maior)
        sair=1;
      end
    else
      if((h(i)<h(i-1))&&(h(i)<h(i-2))&&(h(i)<h(i-3))&&(h(i)<h(i-4))&&(h(i)<h(i-5))&&(h(i)<h(i-6))&&(h(i)<h(i-7)&&(h(i)<h(i-8))))
        s=1;
      elseif((h(i)>h(i-1))&&(h(i)>h(i-2))&&(h(i)>h(i-3))&&(h(i)>h(i-4))&&(h(i)>h(i-5))&&(h(i)>h(i-6))&&(h(i)>h(i-7))&&(h(i)>h(i-8))&&s==1)
        d=1;
      end
      if(maior<h(i))
        maior=h(i);
      end
    end
  end
end
imR=im(:,:,1);
imR(r<corte)=0;
imG=im(:,:,2);
imG(r<corte)=0;
imB=im(:,:,3);
imB(r<corte)=0;
im(:,:,1)=imR;
im(:,:,2)=imG;
im(:,:,3)=imB;

%figure(2);
%imshow(im);
result = im;
%imwrite(im,'teste.jpg');

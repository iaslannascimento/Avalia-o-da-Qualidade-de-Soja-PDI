%Funcao que retira o pedaco da imagem referente a metrica.
%Recebe como parametro a imagem original;
%Retorna uma imagem contendo apenas os dois pontos da metrica e uma imagem
%contendo todos os objetos.

function [imLimiarizada] = SepararMetrica(im)

  %imresultante = im;

  %Transforma a imagem em escala de cinza a partir das camadas R e B
  R = im(:,:,1);
  B = im(:,:,3);
  imCinza = B-R;
 
  %Apos a transformacao em escala de cinza, o maior pico da imagem 
  %torna-se o indice 1, por isso eh salvo apenas o indice do segundo pico
  h = imhist(imCinza);  
  %Acha o segundo maior pico do histograma
  max2 = 0;
  index1 = 0;
  for i=2:256
    if(h(i)>max2)
      max2 = h(i);
      index1 = i;
    end
  end

  %Acha o vale entre os dois picos do histograma
  min1 = max(h);
  index2 = 0;
  for i=2:index1
    if(h(i) < min1)
      min1 = h(i);
      index2 = i;
    end
  end

  %Limiariza a imagem a partir do indice do vale do histograma
  imLimiarizada = ~(imCinza>index2);

 

end
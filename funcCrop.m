%Essa função crop além de cortar as imagens ela também limiariza esse
%código funciona perfeitamente para imagens grandes como as do lote L6       

function metrica = funcCrop(im)
%onde era chamada a antiga funcção de limiar que está na pasta teste
%     im = funcLimiar(im);

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
%   se = strel ('disk',4);
%   imLimiarizada = imopen(imLimiarizada ,se);
  
%   %Acha a ultima linha da metrica
%   linha = 0;
%   for i=1:size(imLimiarizada,1)
%     if(imLimiarizada(i,1)==1)
%       linha = i;
%     else
%       break;    
%     end  
%   end
% 
%   %Acha a ultima coluna da metrica
%   coluna = 0;
%   for i=1:size(imLimiarizada,2)
%     if(imLimiarizada(1,i)==1)
%       coluna = i;
%     else
%       break;
%     end
%   end
  
  %Salva em uma outra imagem apenas a parte da imagem original referente a metrica
  %Essa eh a variavel de retorno da funcao
%   metrica = imcrop(R, [linha 1 coluna 1]);
%   metrica = zeros(linha,coluna, 'uint8');
%   metrica = R(1:linha,1:coluna);
%     figure, imshow(imLimiarizada);
    Sdata=regionprops(imLimiarizada,'BoundingBox', 'Image');

    x=1;
    pasta = strcat('.\ImagensCrop\',int2str(x),'\');
    mkdir(pasta);
    
    for i=1:length(Sdata)
        if(i==1)
            metrica = imcrop(R,Sdata(i).BoundingBox);
        else
            img = imcrop(im,Sdata(i).BoundingBox);
            filename = strcat(pasta,'\',int2str(i),'.jpg');
            imwrite(img,filename);
        end
    end
end
%Funcao que calcula a distancia entre o centro dos 2 (dois) pontos da metrica.
%Recebe como parametro a imagem da metrica;
%Retorna a distancia euclidiana entre os dois maiores pontos da imagem da metrica.

function [distancia] = Metrica(im)  

  h = imhist(im);

  %Acha o indice do primeiro pico do histogram.
  %Obs.: O histograma esta sendo varrido do ultimo ao primeiro indice.
  maxp1=0;
  cont1=0;
  index1=0;
  for i=255:-1:1
    if(h(i)>maxp1)
      maxp1=h(i);
      index1=i;
    end
    if(h(i)<maxp1)
      cont1 = cont1+1;
    end
    if(cont1>10)
      break;
    end
  end

  %Acha o indice do segundo pico do histograma.
  %Obs.: O histograma esta sendo varrido do ultimo ao primeiro indice.
  maxp2=0;
  index2=0;
  for i=index1:-1:1
    if(h(i)>maxp2)
      maxp2=h(i);
      index2=i;
    end
  end

  %Obtem o indice do vale entre os dois picos encontrados.
  min1 = max(h);
  indexM = 0;
  for i=index2:index1
    if(h(i)<min1)
      min1=h(i);
      indexM = i;
    end
  end
  
  %Limiariza a partir do indice do vale.
  im2 = im>indexM;
%   figure, imshow(im2);
  %Guarda as informacoes do objetos contidos na imagem binarizada.
  prop = regionprops(im2,'Area', 'Centroid');
  
  %Salva a area de cada objeto em um vetor de areas.
  for i = 1 : length(prop) 
    areas(i)=prop(i).Area;
  end
  
  %Ordena esse vetor em ordem crescente.
  areas = sort(areas,'descend');
  
  %Laco que percorre em todos os objetos.
  for i = 1 : length(prop)
    %Se o objeto no indice i for o maior objeto, o primeiro ponto da metrica,
    %ele guarda o centroid desse objeto.
    if (prop(i).Area == areas(1)) 
      x1 = prop(i).Centroid(1);
      y1 = prop(i).Centroid(2);
    end
    %Se o objeto no indice i for o segundo maior objeto, o segundo ponto da metrica,
    %ele guarda o centroid desse objeto.
    if (prop(i).Area == areas(2)) 
      x2 = prop(i).Centroid(1);
      y2 = prop(i).Centroid(2);
    end
  end
  
  %Calcula a distancia euclidiana entre o centroid dos dois pontos da metrica.
  %Essa eh a variavel de retorno da funcao.
  distancia = sqrt((x1-x2)^2+(y1-y2)^2);
  
  %Descomentar esse bloco para visualizar a metrica e o centroid de cada ponto.
  %  figure, imshow(im); hold on;
  %  plot(x1, y1,'r*');
  %  plot(x2, y2,'r*');
  %  hold off;
  
end
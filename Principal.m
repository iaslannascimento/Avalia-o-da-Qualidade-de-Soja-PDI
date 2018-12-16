close all 
clear all 

im = imread('L9R1.jpg');
% [FileName,PathName] = uigetfile('*.jpg','Selecione a imagem das sementes');
% im = imread(strcat(PathName, FileName));

imMetrica = funcCrop(im);
% figure, imshow(imMetrica);
metrica = Metrica(imMetrica);
x = 0;
x =1;
funcProcessamento(im);

texto = 'Obrigado'
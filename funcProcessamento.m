function  funcProcessameto(im)
    x =1;

%x = qtd;
%criação do arquivo com os resultados 
    saida = 'C:\Users\IASLAN\Documents\Artigos e teses\Algoritmos do tcc\Versões 05-09-2017\Versão 3 Com MetricaResultadosL6.csv';
    fid = fopen(saida,'a');
    fclose(fid);
    delete(saida);
    
    addpath(genpath('Functions'));
    fid = fopen(saida,'a');
    texto = ['ID' ,';', 'ALONGAMENTO',';','AREA',';','AREA CONVEXA',';','AREA PREENCHIDA',';',...
        'BORDAS',';','BRILHO',';','CENTROIDE PONDERADO EIXO X',';','CENTROIDE PONDERADO EIXO Y',';',...
        'CENTROIDE EIXO X',';','CENTROIDE EIXO Y',';','CIRCUNFERENCIA',';','COMPRIMENTO DE EIXO MENOR',';',...
        'COMPRIMENTO DE EIXO MAIOR',';','COMPRIMENTO',';','CONTRASTE',';','CONVEXCIDADE',';','COR VERMELHA',';',...
        'COR VERDE',';','COR AZUL',';','COR MEDIA',';','COR DOMINANTE',';','CORRELACAO',';','DESVIO PADRAO',';',...
        'DIAMETRO',';','DIAMETRO EQUIVALENTE',';','DIAMETRO MAXIMO DE FERET',';','DIAMETRO MINIMO DE FERET',';',...
        'DIAMETRO MEDIO DE FERET',';','''EXCENTRICIDADE',';','ENERGIA',';','ENTROPIA',';','ESFERICIDADE',';',...
        'EXTENCAO',';','FORMA',';','HOMOGENIEDADE',';','INTENSIDADE MAXIMA',';','INTENSIDADE MINIMA',';',...
        'INTENSIDADE MEDIA',';','MANCHAS',';','QUANTIDADE DE MANCHAS',';','MEDIA DE PIXEL DO ELEMENTO',';',...
        'NUMERO DE EULLER',';','ORINTACAO',';','PERIMETRO',';','RAIO',';','REDONDEZA',';','RELACAO DE FERET',';',...
        'SOLIDEZ',';','VOLUME',';','LARGURA''\r\n'];
    texto = char(texto);
    fprintf(fid,texto);
    fclose(fid);
    
    for i=1:52
        if(i==1)
            disp('Pular');
        elseif(i==47)
            disp('Pular');
        else
         im = imread(strcat('.\ImagensCrop\1\','\',num2str(i),'.jpg'));
       %  figure(1),imshow(im);
         %im2 = im;
         imR = im(:,:,1);
         imBW = im2bw(imR);
         %funcoes
         %alongamento 
       
         al = descAlongamento(im);
         %area
         a = descArea(im);
         %areaconvexa
         ac = descAreaConvexa(imBW);
         %areaPreenchida
         ap = descAreaPreechida(imBW);
         %bordas
         bo = descBordas(imBW);
         %brilho
         br = descBrilho(im);
         %centroide ponderado x
         cpx = descCentroidePonderadoX(imBW);
         %centroide ponderado y
         cpy = descCentroidePonderadoY(imBW);
         %centroide x
         cx = descCentroidX(imBW);
         %centroide y
         cy = descCentroidY(imBW);
         %circularidade
         ci = descCircularidade(imBW);
         %comprimento de eixo maior
         cpma = descCompEixoMaior(imBW);
         %comprimento de eixo menor
         cpme = descCompEixoMenor(imBW);
         %comprimento
         co = descComprimento(imBW);
         %contraste
         con = descContraste(im);
         %convexidade
          conv = descConv(im);
         % cor r
         cr = descCorR(im);
         %cor g
         cg = descCorG(im);
         %cor b
         cb = descCorB(im);
         %cor media
         cm = descCorMedia(im);
         %cor dominante
         cd = descDominantColor(im);
         %correlacao
         crr = descCorrelacao(im);
         %desvio padrão
         dp = descDesvioPadrao(imBW);
         %diametro
         d = descDiametro(imBW);
         
         %diametro equivalente
         de = descDiametroEquiv(imBW);
         %diametro max de feret
         dmaf = descDMaxFeret(imBW);
         %diametro min de feret
         dmif = descDMinFeret(imBW);
         %diametro medio de feret
         dmef = descDMedioFeret(imBW);
         %excentricidade
         ex = descEcentricidade(imBW);
         %energia
         en = descEnergia(im);
         %Entropia
         ent = descEntropia(imBW);
         %esfericidade
         esf = descEsfericidade(imBW);
         %Extencao
         ext = descExtencao(imBW);
         %forma
         f = descForma(imBW);
         %homogeniedade
         h = descHomogeneidade(im);
         %intesidade minima
         imi = descIntensidadeMinima(im);
         %intensidade maxima
         ima = descIntensidadeMaxima(im);
         %intensidade media
         ime = descIntensidadeMedia(im);
         %manchas
         m = descManchas(imBW);
         %quantidade de manchas
         qtdm = descQtdManchas(imBW);
         %media dos elementos
         me = descMediaElementos(imBW);
         %numero de euller
         ne = descNeuller(imBW);
         %orientacao
         o =descOrientacao(imBW);
         %perimetro
         p = descPerimetro(imBW);
         %raio
         r = descRaio(imBW);
         %redondeza
         re = descRedondeza(imBW);
         %relacao de feret 
         rf = descRelacaoFeret(imBW);
         %solidez
         s = descSolidez(imBW);
         %volume
         v = descVolume(imBW);
         %largura
         l = descLargura(imBW);
         %conversao dos valores para string
         %identificador das sementes
         I = num2str(i);
         Al = num2str(al);
         A = num2str(a);
         AC = num2str(ac);
         AP = num2str(ap);
         BO = num2str(bo);
         BR = num2str(br);
         CPX = num2str(cpx);
         CPY = num2str(cpy);
         CX = num2str(cx);
         CY = num2str(cy);
         CI = num2str(ci);
         CPMA = num2str(cpma);
         CPME = num2str(cpme);
         CO = num2str(co);
         CON = num2str(con);
         CONV = num2str(conv);
         CR = num2str(cr);
         CG = num2str(cg);
         CB = num2str(cb);
         CM = num2str(cm);
         CD = num2str(cd);
         CRR = num2str(crr);
         DP = num2str(dp);
         D = num2str(d);
         DE = num2str(de);
         DMAF = num2str(dmaf);
         DMIF = num2str(dmif);
         DMEF = num2str(dmef);
         EX = num2str(ex);
         EN = num2str(en);
         ENT = num2str(ent);
         ESF = num2str(esf);
         EXT = num2str(ext);
         F = num2str(f);
         H = num2str(h);
         IMI = num2str(imi);
         IMA = num2str(ima);
         IME = num2str(ime);
         M = num2str(m);
         QTDM = num2str(qtdm);
         ME = num2str(me);
         NE = num2str(ne);
         O = num2str(o);
         P =num2str(p);
         R = num2str(r);
         RE = num2str(re);
         RF = num2str(rf);
         S = num2str(s);
         V = num2str(v);
         L = num2str(l);
    fid = fopen(saida,'a');

   % texto2 = [x2 ';' alon,';',Area,';',Circ,';',Conv,';',Dia,';',Cor(1), ';',Cor(2), ';',Cor(3),';',CorD,';',Ex,';',Energia,';',Entropia,';',Forma,';',H,';',P,';',R,';',B,';''\r\n'];
     texto2 = [I ';',Al,';',A,';',AC,';',AP,';',BO,';',BR,';',CPX,';',CPY,';',CX,';',CY,';',...
         CI,';',CPME,';',CPMA,';',CO,';',CON,';',CONV,';',CR,';',CG,';',CB,';',CM,';',CD,';',...
         CRR,';',DP,';',D,';',DE,';',DMAF,';',DMIF,';',DMEF,';',EX,';',EN,';',ENT,';',ESF,';',...
         EXT,';',F,';',H,';',IMA,';',IMI,';',IME,';',M,';',QTDM,';',ME,';',NE,';',O,';',P,';',...
         R,';',RE,';',RF,';',S,';',V,';',L,';','\r\n'];
       texto2 = char(texto2);
    fprintf(fid,texto2);
    fclose(fid);
    x = x+1;
        end
    end
    
end
    

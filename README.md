#Rossonet Atom Machine

![alt text](http://www.rossonet.org/wp-content/uploads/2015/01/logoRossonet4.png "Rossonet")

[http://www.rossonet.org](http://www.rossonet.org)

Licenza: [LGPL 3.0](https://www.gnu.org/licenses/lgpl.html)
Per maggiori dettagli sulla licenza rimando a [questa voce](http://it.wikipedia.org/wiki/GNU_Lesser_General_Public_License) di Wikipedia

![alt text](https://www.gnu.org/graphics/gplv3-88x31.png "LGPL Logo")

Rossonet Atom Machine è una macchina a controllo numerico su 3 assi completamente open source.

La macchina è governabile via rete tramite un browser, il software montato a bordo guida l'utente nelle varie fasi di lavorazioni in un contesto social.

La macchina è composta da parti in plastica derivate da varie versione della [RepRap Rostock](http://reprap.org/wiki/Rostock) e componenti meccaniche (barre rettificate, cuscinetti e cinghie) facilmente reperibili localmente e online. Tutte le parti sono disegnate [con OpenScad](http://www.openscad.org/).

I giunti cardanici sono magnetici, questo permette una rapida sostituzione delle parti, ma anche la sicurezza che, in caso di errore nella programmazione software, la macchina si smonterà senza danneggiarsi o danneggiare qualcuno o qualcosa.
 
L'elettronica di controllo è una [Megatronics V3](http://reprapworld.com/mt/megatronics3_src.zip), architettura che integra in un'unica scheda il progetto Arduino Mega e il progetto RAMPS. La scheda monta un processore Atmega2560 a 16MHz.

L'elettronica è governata dal [firmware Marlin](https://github.com/MarlinFirmware/Marlin).

Alla scheda di controllo è collegato un computer embedded con processore A20. Sui protipi è montata una scheda [BananaPI](http://www.bananapi.org/).

Oltre ad una distribuzione Linux ottimizzata per la scheda specifica -Fedora 22-, il computer offre le fuzionalità di controllo web tramite [OctoPrint](http://octoprint.org/); la virtualizzazione della seriale, per usare la macchina come una CNC con programmi come [Printrun](https://github.com/kliment/Printrun) o [LinuxCNC](http://sourceforge.net/projects/emc/); le funzionalità di slicing per la stampa plastica sono gestite con [CuraEngine](https://github.com/Ultimaker/CuraEngine); le funzionalità CAD con [OpenJSCAD](https://github.com/Spiritdude/OpenJSCAD.org/wiki/User-Guide); il CAM (calcolo dei percorsi di incisione o scrittura) con [PyCAM](http://pycam.sourceforge.net/).

L'interfaccia web è fruibile da dispositivo mobile grazie alla libreria [Twitter Bootstrap](http://getbootstrap.com/2.3.2/).

<a href="http://www.youtube.com/watch?feature=player_embedded&v=aIwhmhjWtVI" target="_blank"><img src="http://img.youtube.com/vi/aIwhmhjWtVI/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

##Funzionalità
1. stampa 3D a filamento fuso (1,75mm) con temperatura di lavorazione fino 240 gradi (PLA,ABS,ecc...);
2. attuatore per eseguire GCODE con penne, matite, pennarelli, ecc...;
3. interfaccia web responsible;
4. taglio polistirolo -da implementare-;
5. piano di lavoro riscaldato con aggancio magnetico -da implementare-;
6. attuatore a siringa per la lavorazione di materiali liquidi -da implementare-;
7. help Online integrato nell'interfaccia per imparare con il supporto multimediale come utilizzare e svolgere le procedure di manutenzione della macchina -in sviluppo-. In particolare le procedure di calibrazione della struttura, calibrazione del termostato, cambio filamento, tuning z-probe;
8. sistema di assistenza remoto basato su chat web -integrazione Olark-;
9. integrazione software di modellizazione parametrica con libreria online in OpenJScad -da implementare-;
10. imballaggi per il traporto -da implementare-;
11. API per l'interfaccia di software di terze parti;
12. integrazione MQTT per il monitoraggio integrato nelle reti IoT -da implementare-;
13. integrazione piattaforma [Rossonet Ar4k](https://github.com/rossonet/agenteAr4k);
14. connessione ethernet o wifi (tramite plug usb);
15. slicing sampa plastica integrato con [CuraEngine](https://github.com/Ultimaker/CuraEngine);
16. timelaps automatico.

##Versioni
Attualmente sistono due versioni preconfigurate della macchina. La versione "T" con le parti meccaniche realizzate in officina di precisione e il modello Eroina studiato per essere realizzabile partendo da stampe plastiche di piccole dimensioni. 

###Versione Eroina
La versione Eroina è composta da una struttura realizzata in carpenteria (legno, metallo o altre strutture ricavate con il materiale disponibile) e da parti stampate in plastica con sagome inferiori ai 15cm per ogni dimensione.

[Schema di assemblaggio generale](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/assemblaggio.stl)

####Video prototipo
<a href="http://www.youtube.com/watch?feature=player_embedded&v=OmTOs6jjuCw" target="_blank"><img src="http://img.youtube.com/vi/OmTOs6jjuCw/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=n3oExDMJfP0" target="_blank"><img src="http://img.youtube.com/vi/n3oExDMJfP0/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=B5Mmt7lzHgg" target="_blank"><img src="http://img.youtube.com/vi/B5Mmt7lzHgg/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=iVD2OGaxWTA" target="_blank"><img src="http://img.youtube.com/vi/iVD2OGaxWTA/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=0e1HDMZBxl4" target="_blank"><img src="http://img.youtube.com/vi/0e1HDMZBxl4/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=ZnjUfesXWaY" target="_blank"><img src="http://img.youtube.com/vi/ZnjUfesXWaY/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=iLzKpcrZ054" target="_blank"><img src="http://img.youtube.com/vi/iLzKpcrZ054/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=BmhJSXHelz4" target="_blank"><img src="http://img.youtube.com/vi/BmhJSXHelz4/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

####Elenco materiali elettronici, movimentazione lineare e hot end 
1. [E3D v6 HotEnd Full Kit - 1.75mm Universal (Direct) (24v)](http://e3d-online.com/E3D-v6/Full-Kit?product_id=380);
2. ventola raffreddamento 30mmx30mmx10mm 12V;
3. [Banana PI](http://www.bananapi.org/p/product.html);
4. [Megatronics V3](http://reprapworld.com/?products_details&products_id/468/cPath/1591_1643);
5. 4 x [ponti H -DRV8825 Stepper Motor Driver Carrier-](https://www.pololu.com/product/2132);
6. 4 x NEMA17 Stepper motor 1,8 gradi/step - 4,8kg/cm;
7. 3 x [endstop meccanici](http://www.elecfreaks.com/store/images/Mech_Endstop-D.jpg);
8. telecamera USB compatibile con Fedora 22 su Banana PI;
9. servo motore z-probe: 9G micro servo;
10. z-probe: Micro Pulsante PCB 3mmx3.5mmx1.8mm Button Switch;
11. 6 x barre rettificate da 1mt x 12mm;
12. 6 x cuscinetti lineari a sfera LM12UU;
13. cuscinetto piccolo estrusore;
14. cuscinetto grande estrusore;
15. 3 x cuscinetti fine corsa;
13. ~7mt cinghia trasmissione 6mm (GT2 -passo 2mm-);
14. 3 x pulegge alluminio 20 denti (GT2 -passo 2mm-);
15. ~6mt cavo di rete UTP -da utilizzare per i cablaggi-;
16. ~3mt cavo bipolare per resistenza hotend;
17. fascette varie;
18. spinotti per Megatronics v3 (4 stepper, 2 ventole, 3+1 endstop -comprende servo-);
19. alimentatore 12V da PC.

####Elenco materiale stampato
1. 3 x [blocco motore](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/blocco_motore_v1.stl);
2. 3 x [rimando cinghia](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/fine_corsa.stl);
3. 3 x [carrello](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/carrello.stl);
4. 3 x [tensionatore](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/Belt-Tensioner-V1.stl);
5. 1 x [attuatore](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/piattaforma_3dprint_v2.stl): [base](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/piattaforma_3dprint_v2_base.stl), [coperchio "A"](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/piattaforma_3dprint_v2_coperchio_a.stl), [coperchio "B"](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/piattaforma_3dprint_v2_coperchio_b.stl), [braccio z-probe](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/piattaforma_3dprint_v2_zprobe.stl);
6. [estrusore](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/airtripper-extruder-v3.stl);
7. [attuatore pennarelli](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/piattaforma_giotto_turbocolor.stl) collaudato con "[Giotto Turbocolor](http://www.fila.it/giotto/prodotti/pennarelli/giotto-turbo-color)" con [questo supporto](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/supporto_giotto_turbocolor.stl).

####Elenco materiale per struttura e piccola ferramenta
Il progetto di questa versione prevede la predisposizione delle tre colonne attive su una struttura portante realizzata artigianalmente. Lo schema di montaggio generale è visionabile [qui](https://github.com/rossonet/RAM/blob/master/parti/stl/eroina/assemblaggio.stl). La struttura deve garantire una sufficiente rigidità, attenuare le vibrazioni dei movimenti con adeguati piedi e/o ammortizzatori.

La struttura può essere realizzata con diametro a piacere tra i 47 e i 70 centimetri. Al diminuire del diametro proporzianalmete diminuiscono i bracci diagonali dell'attuatore, aumenta l'altezza e diminuisce il raggio utile per la stampa. Per esempio nella [configurazione con raggio di 23,5cm](http://www.rossonet.org/dati/RAM235.html) si ottiene un area di stampa cilindrica con un raggio di 19,5cm e altezza di 43,5cm, i bracci diagonali sono lunghi 395mm. Nella [configurazione con raggio di 35cm](http://www.rossonet.org/dati/RAM350.html) il cilindro utile ha raggio di 31cm e altezza di 20,5cm, i bracci sono lunghi 625mm. 

1. 3 x ferramenta fine corsa;
2. 3 x ferramenta blocco motore;
3. ferramenta attuatore;
4. ferramenta estrusore;
4. 6 x magneti carrello;
5. 12 x magneti attuatore;
6. 12 x sfere acciaio 12mm;
7. 12 x supporti distanziatori in plastica per magneti -da verificare-;
8. 6 x bacchette alluminio diametro 10mm lunghezza da 39,5cm a 62,5cm -a seconda del raggio della struttura portante-;

####Fasi assemblaggio
da fare..

####Servizi di assemblaggio e assistenza
da definire...

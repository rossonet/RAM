#Rossonet Atom Machine

![alt text](http://www.rossonet.org/wp-content/uploads/2015/01/logoRossonet4.png "Rossonet")

[http://www.rossonet.org](http://www.rossonet.org)

Licenza: [LGPL 3.0](https://www.gnu.org/licenses/lgpl.html)
Per maggiori dettagli sulla licenza rimando a [questa voce](http://it.wikipedia.org/wiki/GNU_Lesser_General_Public_License) di Wikipedia

![alt text](https://www.gnu.org/graphics/gplv3-88x31.png "LGPL Logo")


##Una "distro" 3d

Rossonet Atom Machine è una macchina a controllo numerico su 3 assi completamente open source.

La macchina è governabile via rete tramite un browser, il software montato a bordo guida l'utente nelle varie fasi di lavorazioni in un contesto social.

La macchina è composta da parti in plastica derivate da varie versione della [RepRap Rostock](http://reprap.org/wiki/Rostock) e componenti meccaniche (barre rettificate, cuscinetti e cinghie) facilmente reperibili localmente e online.

I giunti cardanici sono tutti magnetici, questo permette una rapida sostituzione delle parti, ma anche la sicurezza che, in caso di errore nella programmazione software, la macchina si smonterà senza danneggiarsi o danneggiare qualcuno o qualcosa.
 
L'elettronica di controllo è una [Megatronics V3](http://reprapworld.com/mt/megatronics3_src.zip), architettura che integra in un'unica scheda il progetto Arduino Mega e il progetto RAMPS. La scheda monta un processore Atmega2560 a 16MHz.

L'elettronica è governata dal [firmware Marlin](https://github.com/MarlinFirmware/Marlin).

Alla scheda di controllo è collegato un computer con processore A20. Sui protipi è montata una scheda [BananaPI](http://www.bananapi.org/).

Oltre ad una distribuzione Linux ottimizzata per la scheda specifica -Fedora 22-, il computer offre le fuzionalità di controllo web tramite [OctoPrint](http://octoprint.org/); la virtualizzazione della seriale, per usare la macchina come una CNC, con programmi come [Printrun](https://github.com/kliment/Printrun) o [LinuxCNC](http://sourceforge.net/projects/emc/); le funzionalità di slicing sono gestite con [CuraEngine](https://github.com/Ultimaker/CuraEngine); le funzionalità CAD con [OpenJSCAD](https://github.com/Spiritdude/OpenJSCAD.org/wiki/User-Guide); il CAM (calcolo dei percorsi di incisione o scrittura) con [PyCAM](http://pycam.sourceforge.net/).

L'interfaccia web è fruibile da dispositivo mobile grazie alla libreria [Twitter Bootstrap](http://getbootstrap.com/2.3.2/).

<a href="http://www.youtube.com/watch?feature=player_embedded&v=aIwhmhjWtVI" target="_blank"><img src="http://img.youtube.com/vi/aIwhmhjWtVI/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

##Funzionalità

1. Stampa 3D a filamento fuso (1,75mm) con temperatura di lavorazione fino 240 gradi (PLA,ABS,ecc...);
2. Attuatore per l'uso di penne, matite e pennarelli;
3. Interfaccia web responsible;
4. Taglio polistirolo -da implementare-;
5. Piano di lavoro con aggancio magnetico, in vetro, riscaldato -da implementare-;
6. Attuatore a siringa per la lavorazione di materiali liquidi -da implementare-;
7. Help Online integrato nell'interfaccia per imparare con il supporto multimediale come utilizzare e svolgere le procedure di manutenzione della macchina -in sviluppo-. In particolare le procedure di calibrazione della struttura, calibrazione del termostato, cambio filamento;
8. Sistema di assistenza remoto basato su chat web -integrazione Olark-;
9. Integrazione software di modellizazione parametrica con libreria online in OpenJScad-da implementare-;
10. [Configurazione con raggio di 23,5cm](http://www.rossonet.org/dati/RAM235.html);
11. [Configurazione con raggio di 35cm](http://www.rossonet.org/dati/RAM350.html) -da testare-; 
12. Studio imballaggi per il traporto -da fare-;
13. API per l'interfaccia di software di terze parti;
15. Integrazione MQTT per il monitoraggio integrato nelle reti IoT;

##Versioni

Esistono 3 versioni preconfigurate della macchina. Il modello Ar4k è pensato per un utilizzo di laboratorio e didattico; il modello Eroina  per adattarsi ad una struttura realizzata con materiale di recupero assemblato manualmente e   

###Versione Eroina
La versione Eroina è composta da una struttura realizzata in carpenteria (legno, metallo o altre strutture ricavate con il materiale disponibile) e da parti stampate in palstica con sagome inferiori ai 15cm per ogni dimensione.

###Versione "Tampieri"
da completare definizione.

###Versione Ar4k
in studio componenti.

##Elenco materiali elettronici

Pack Rossonet
da fare...

##Elenco materiale stampato

###Versione Eroina
Pack Rossonet
da fare...

###Versione Ar4k
Pack Rossonet
da fare...

###Versione Tampieri
Pack Rossonet
da fare...

##Elenco materiale per struttura

###Versione Ar4k
Pack Rossonet
da fare...

###Versione Tampieri
Pack Tampieri
da fare...

##Fasi assemblaggio
da fare..

##Servizi di assemblaggio e assistenza
da definire...

##Video laboratorio

<a href="http://www.youtube.com/watch?feature=player_embedded&v=OmTOs6jjuCw" target="_blank"><img src="http://img.youtube.com/vi/OmTOs6jjuCw/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=n3oExDMJfP0" target="_blank"><img src="http://img.youtube.com/vi/n3oExDMJfP0/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=B5Mmt7lzHgg" target="_blank"><img src="http://img.youtube.com/vi/B5Mmt7lzHgg/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=iVD2OGaxWTA" target="_blank"><img src="http://img.youtube.com/vi/iVD2OGaxWTA/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=0e1HDMZBxl4" target="_blank"><img src="http://img.youtube.com/vi/0e1HDMZBxl4/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=ZnjUfesXWaY" target="_blank"><img src="http://img.youtube.com/vi/ZnjUfesXWaY/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=iLzKpcrZ054" target="_blank"><img src="http://img.youtube.com/vi/iLzKpcrZ054/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=BmhJSXHelz4" target="_blank"><img src="http://img.youtube.com/vi/BmhJSXHelz4/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>


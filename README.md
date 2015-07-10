#Rossonet Atom Machine

![alt text](http://www.rossonet.org/wp-content/uploads/2015/01/logoRossonet4.png "Rossonet")

[http://www.rossonet.org](http://www.rossonet.org)

Licenza: [LGPL 3.0](https://www.gnu.org/licenses/lgpl.html)
Per maggiori dettagli sulla licenza rimando a [questa voce](http://it.wikipedia.org/wiki/GNU_Lesser_General_Public_License) di Wikipedia

![alt text](https://www.gnu.org/graphics/gplv3-88x31.png "LGPL Logo")


##Una "distro" 3D chiavi in mano
Rossonet Atom Machine è un progetto completamente open source per realizzare una piattaforma di prototipazione Agile con attenzione all'usabilità e la scalabilità.
La macchina è completamente governabile via rete tramite un browser, il software montato a bordo guida l'utente nelle varie fasi di lavorazioni in un contesto social.
La macchina è composta da parti in plastica derivate da varie versione della [RepRap Rostock](http://reprap.org/wiki/Rostock) e componenti meccaniche (barre rettificate, cuscinetti e cinghie) facilmente reperibili localmente e online.
I giunti cardanici dell'architettura delta sono tutti magnetici, questo permette una rapida sostituzione delle parti, ma anche la sicurezza che, in caso di errore nella programmazione software, la macchina si smonterà senza danneggiarsi o danneggiare qualcuno o qualcosa. 
La scheda di controllo è una [Megatronics V3](http://reprapworld.com/mt/megatronics3_src.zip), progetto che integra in un'unica architettura Arduino Mega e RAMPS. Monta un processore Atmega2560 a 16MHz. L'elettronica è governata dal [firmware Marlin](https://github.com/MarlinFirmware/Marlin). Alla scheda di controllo è collegato un computer. Attualmente la macchina monta un [Olinuxino A13](https://www.olimex.com/Products/OLinuXino/A13/A13-OLinuXino/open-source-hardware) con scheda WiFi. Oltre ad una distribuzione Linux ottimizzata per la scheda specifica, il computer offre le fuzionalità di controllo web tramite [OctoPrint](http://octoprint.org/); la virtualizzazione della seriale, per usare la macchina come una CNC, con programmi come [Printrun](https://github.com/kliment/Printrun) o [LinuxCNC](http://sourceforge.net/projects/emc/); le funzionalità di slicing sono gestite con [CuraEngine](https://github.com/Ultimaker/CuraEngine); le funzionalità CAD con [OpenJSCAD](https://github.com/Spiritdude/OpenJSCAD.org/wiki/User-Guide); il CAM (calcolo dei percorsi di incisione o scrittura) con [PyCAM](http://pycam.sourceforge.net/).
L'interfaccia web è fruibile da dispositivo mobile grazie alla libreria [Twitter Bootstrap](http://getbootstrap.com/2.3.2/).

##Funzionalità

1. Stampa 3D a filamento fuso (1,75mm) con temperatura di lavorazione fino 175 gradi (PLA,ABS,ecc...) -In test-;
2. Attuatore per l'uso di penne, matite e pennarelli;
3. Interfaccia web responsible;
4. Taglio polistirolo -da implementare-;
5. Piano di lavoro con aggancio magnetico, in vetro, riscaldato -da implementare-;
6. Attuatore a siringa per la lavorazione di materiali liquidi -da implementare-;
7. Help Online integrato nell'interfaccia per imparare con il supporto multimediale come utilizzare e svolgere le procedure di manutenzione della macchina -in sviluppo-;
8. Sistema di assistenza remoto basato;
9. Integrazione software di modellizazione parametrica con libreria online -da implementare-;
10. [Configurazione con raggio di 23,5cm](http://www.rossonet.org/dati/RAM235.html);
11. [Configurazione con raggio di 35cm](http://www.rossonet.org/dati/RAM350.html) -da testare-; 
12. Struttura di montaggio smontabile e studio imballaggi per il traporto -da fare-;
13. Sistema di autocalibrazione -in test-. 
14. API per l'interfaccia di software di terze parti;
15. Integrazione MQTT per il monitoraggio integrato nelle reti IoT;

##Elenco Materiali

da fare...

##Fasi Assemblaggio

da fare..

##Video di laboratorio

<a href="http://www.youtube.com/watch?feature=player_embedded&v=OmTOs6jjuCw" target="_blank"><img src="http://img.youtube.com/vi/OmTOs6jjuCw/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=n3oExDMJfP0" target="_blank"><img src="http://img.youtube.com/vi/n3oExDMJfP0/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=B5Mmt7lzHgg" target="_blank"><img src="http://img.youtube.com/vi/B5Mmt7lzHgg/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=iVD2OGaxWTA" target="_blank"><img src="http://img.youtube.com/vi/iVD2OGaxWTA/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=0e1HDMZBxl4" target="_blank"><img src="http://img.youtube.com/vi/0e1HDMZBxl4/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=ZnjUfesXWaY" target="_blank"><img src="http://img.youtube.com/vi/ZnjUfesXWaY/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=iLzKpcrZ054" target="_blank"><img src="http://img.youtube.com/vi/iLzKpcrZ054/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=BmhJSXHelz4" target="_blank"><img src="http://img.youtube.com/vi/BmhJSXHelz4/0.jpg" alt="Rossonet" width="640" height="360" border="10" /></a>


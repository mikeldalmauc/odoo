
# **Docker bidez ODOO modulua instalatu eta sortzea**

- [**Docker bidez ODOO modulua instalatu eta sortzea**](#docker-bidez-odoo-modulua-instalatu-eta-sortzea)
  - [**Docker instalatu :whale2:**](#docker-instalatu-whale2)
  - [**Errepositorio hau deskargatu :sunglasses:**](#errepositorio-hau-deskargatu-sunglasses)
    - [**Pasahitzarako fitxategia sortu :lock\_with\_ink\_pen:**](#pasahitzarako-fitxategia-sortu-lock_with_ink_pen)
    - [**Ingurunea abiarazi :sunrise\_over\_mountains:**](#ingurunea-abiarazi-sunrise_over_mountains)
  - [**Garatzaile modura aldatu**](#garatzaile-modura-aldatu)
  - [**Odoo kontenedorean sartzea :black\_medium\_square:**](#odoo-kontenedorean-sartzea-black_medium_square)
  - [**Modulo berria sortu**](#modulo-berria-sortu)
  - [**Docker-eko bolumenak**](#docker-eko-bolumenak)
  - [**Erreferentziak :earth\_asia:**](#erreferentziak-earth_asia)

---

## **Docker instalatu :whale2:**

Windows-en, erabili Docker Desktop instalatzailea:

* Ahal bada, Hyper-V desgaituta eduki behar da (Windows-eko ezaugarrietan).
* Docker-ek behar duen WSL instalatuko du.
* Baliteke erabiltzailea *docker-users* taldean gehitu behar izatea (Windows-eko erabiltzaile eta taldeetan).

---

## **Errepositorio hau deskargatu :sunglasses:**

[https://github.com/FPTxurdinagaDAM/sge-odoo](https://github.com/FPTxurdinagaDAM/sge-odoo)

---

### **Pasahitzarako fitxategia sortu :lock_with_ink_pen:**

`docker-compose.yml` fitxategian ikus daitekeen bezala, pasahitza `postresql_password` izeneko testu arrunteko fitxategitik hartzen da. Sortu fitxategi hori eta idatzi hitz bakarra: erabili nahi duzun pasahitza.

:warning: *Sinpletasunagatik, pasahitz bera erabiltzen da bai datu-basearentzat bai web aplikaziorako. Produkzioan bereiztea gomendatzen da.*

---

### **Ingurunea abiarazi :sunrise_over_mountains:**

Ireki terminal bat `docker-compose.yml` dagoen direktorioan eta exekutatu:

```bash
docker compose up -d
```

![alt text](image-2.png)

Docker Desktop-en agertzen diren portuen bidez aplikazioetara sar zaitezke. Handik aplikazioaren hainbat parametro konfigura ditzakezu.

---

## **Garatzaile modura aldatu**

Odoo-n, **Ezarpenak** atalean, behealdean dago aukeraketa. Aktibatu eta garatzaile tresnak agertuko dira (intsektu formako botoiarekin).

![alt text](image-3.png)

![alt text](image-4.png)

---

## **Odoo kontenedorean sartzea :black_medium_square:**

Lehenik, ikus kontenedoreen izenak:

```bash
docker ps
```

![alt text](image.png)

Web-a daraman makinak `odoo-web-1` izena du. Kontenedore batean komando bat exekutatzeko:

```bash
docker exec -it odoo-web-1 bash
```

Honek kontenedoreren barruko bash terminal interaktiboa irekitzen du.

---

## **Modulo berria sortu**

Odoo komandoa erabiliko dugu.

1. Joan `/mnt/extra-addons` direktorioara.
   `docker-compose.yml` fitxategian ikus dezakezu direktorio hori proiektuko `addons` karpetarekin lotuta dagoela.
   *Karpeta ez badago, sortu egingo da.*

![alt text](image-1.png)

2. Exekutatu:

```bash
odoo scaffold modulo-custom
```

3. Orain, moduloan lan egin dezakezu: bistak, ereduak eta logika sortuz, Windows-eko VSCode ingurune honetatik. Medium artikulu honetan edo erreferentzietan aurkituko dituzu pausoak.

[:part_alternation_mark: Medium artikulua — Modulo bat sortzea](https://medium.com/@waooseo/how-to-create-or-develop-a-custom-module-in-odoo-814b083473aa)

:warning: *Kendu `addons` karpeta `.gitignore`-tik, sortzen duzun modulua GitHub-era igo dadin.*

---

## **Docker-eko bolumenak**

Docker kontenedore bidezko virtualizazio ingurunea da. Bere diseinu-printzipioetako bat da **arduren bereizketa**: kontenedorea datuetatik banandu nahi da, makina ezabatu edo berreraiki badaiteke ere datuak mantentzeko.

Bolumenei esker konpontzen da hau.

Bolumenak bi modutara sor daitezke:

* Gure makinako karpeta bati lotuta (bind mount)
* Docker-en barneko bolumen gisa (virtuala), kontenedorearen fitxategi-sisteman muntatuta

![alt text](image-5.png)

Irudian bi mota ageri dira:

* **odoo-web-data**: Bolumen birtuala. Docker interfazetik edo `docker volume ls` komandoarekin ikus daiteke.

---

![alt text](image-6.png)

* **./addons**: Gure makinako karpeta bati lotutako bolumena.

---

## **Erreferentziak :earth_asia:**

[:whale2: Odoo Docker Hub](https://hub.docker.com/_/odoo)
[:jigsaw: Moduloak sortzea](https://www.odoo.com/documentation/18.0/developer/tutorials/backend.html)
[:closed_book: Odoo Dokumentazioa](https://www.odoo.com/documentation/18.0/applications.html)
[:part_alternation_mark: Medium – Moduloa sortzea](https://medium.com/@waooseo/how-to-create-or-develop-a-custom-module-in-odoo-814b083473aa)


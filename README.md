# yettel-hipernet

Русский · [Srpski](#srpski)

Расшифровка резервной копии настроек роутера ZTE ZXHN H298Q V7, который Yettel выдаёт с Hipernet.
Роутер отдаёт копию настроек зашифрованной. В расшифрованной копии читаются логин и пароль PPPoE и
пароль администратора: они нужны, чтобы подключить вместо него свой роутер или войти в настройки
администратором.

Мне это понадобилось, чтобы достать пароль PPPoE из роутера, который Yettel выдал мне к договору
Hipernet примерно в 2023 году. Модель взята из подписи в самом файле настроек: `ZXHN H298Q V7.0`.

## Что здесь лежит

- `zte-config-utility` — подмодуль: версия утилиты от rajkosto, которая поддерживает этот роутер.
- `decode.sh` и `encode.sh` — вызывают утилиту для файла `config.bin` в корне репозитория.
- `Xiaomi-cloud-tokens-extractor` — подмодуль: достаёт из облака Xiaomi токены устройств и ключи
  BLE-устройств. С роутером не связан.

## Как расшифровать настройки

1. Склонируйте репозиторий вместе с подмодулями:

   ```sh
   git clone --recurse-submodules https://sarak.sh/mikluko/yettel-hipernet.git
   cd yettel-hipernet
   ```

2. Установите утилиту в виртуальное окружение:

   ```sh
   python3 -m venv .venv
   .venv/bin/pip install pycryptodomex ./zte-config-utility
   ```

3. Откройте `http://192.168.1.1`, войдите под любым пользователем и на странице Management &
   Diagnosis → System Management → User Configuration Management нажмите Backup Configuration.
   Сохраните файл в корень репозитория под именем `config.bin`.

4. Расшифруйте его:

   ```sh
   ./decode.sh
   ```

   Рядом появится `config.xml`. Логин и пароль PPPoE лежат в таблице `<Tbl name="PPPIF">`, логин и
   пароль администратора — в `<Tbl name="DevAuthInfo">`.

5. Чтобы залить изменённые настройки обратно, отредактируйте `config.xml` и зашифруйте его:

   ```sh
   ./encode.sh
   ```

   Получится `config2.bin`: его принимает Restore Configuration на той же странице.

`config*.bin` и `config*.xml` содержат пароли и перечислены в `.gitignore`.

## Источники

- [Инструкция rajkosto](https://gist.github.com/rajkosto/fbfa22a3c6d6bff7d9ebf92ec8adeb34), на
  сербском: шаги 3–5 взяты из неё.
- [rajkosto/zte-config-utility](https://github.com/rajkosto/zte-config-utility), форк
  [mkst/zte-config-utility](https://github.com/mkst/zte-config-utility).
- [PiotrMachowski/Xiaomi-cloud-tokens-extractor](https://github.com/PiotrMachowski/Xiaomi-cloud-tokens-extractor).

---

## Srpski

Dešifrovanje rezervne kopije podešavanja rutera ZTE ZXHN H298Q V7, koji Yettel daje uz Hipernet.
Ruter izvozi kopiju podešavanja šifrovanu. U dešifrovanoj kopiji čitaju se korisničko ime i lozinka
za PPPoE i administratorska lozinka: potrebni su da biste umesto njega povezali svoj ruter ili se u
podešavanja prijavili kao administrator.

Meni je ovo trebalo da izvučem PPPoE lozinku iz rutera koji mi je Yettel dao uz ugovor za Hipernet,
otprilike 2023. godine. Model je preuzet iz potpisa u samom fajlu sa podešavanjima:
`ZXHN H298Q V7.0`.

## Šta se ovde nalazi

- `zte-config-utility` — podmodul: verzija alata od rajkosto koja podržava ovaj ruter.
- `decode.sh` i `encode.sh` — pozivaju alat za fajl `config.bin` u korenu repozitorijuma.
- `Xiaomi-cloud-tokens-extractor` — podmodul: preuzima iz Xiaomi oblaka tokene uređaja i ključeve
  BLE uređaja. Nije povezan sa ruterom.

## Kako dešifrovati podešavanja

1. Klonirajte repozitorijum zajedno sa podmodulima:

   ```sh
   git clone --recurse-submodules https://sarak.sh/mikluko/yettel-hipernet.git
   cd yettel-hipernet
   ```

2. Instalirajte alat u virtuelno okruženje:

   ```sh
   python3 -m venv .venv
   .venv/bin/pip install pycryptodomex ./zte-config-utility
   ```

3. Otvorite `http://192.168.1.1`, prijavite se kao bilo koji korisnik i na stranici Management &
   Diagnosis → System Management → User Configuration Management kliknite Backup Configuration.
   Sačuvajte fajl u koren repozitorijuma pod imenom `config.bin`.

4. Dešifrujte ga:

   ```sh
   ./decode.sh
   ```

   Pored njega nastaje `config.xml`. Korisničko ime i lozinka za PPPoE nalaze se u tabeli
   `<Tbl name="PPPIF">`, a administratorsko korisničko ime i lozinka u `<Tbl name="DevAuthInfo">`.

5. Da biste izmenjena podešavanja vratili u ruter, izmenite `config.xml` i šifrujte ga:

   ```sh
   ./encode.sh
   ```

   Dobija se `config2.bin`: njega prihvata Restore Configuration na istoj stranici.

`config*.bin` i `config*.xml` sadrže lozinke i navedeni su u `.gitignore`.

## Izvori

- [Uputstvo od rajkosto](https://gist.github.com/rajkosto/fbfa22a3c6d6bff7d9ebf92ec8adeb34):
  koraci 3–5 su preuzeti iz njega.
- [rajkosto/zte-config-utility](https://github.com/rajkosto/zte-config-utility), fork projekta
  [mkst/zte-config-utility](https://github.com/mkst/zte-config-utility).
- [PiotrMachowski/Xiaomi-cloud-tokens-extractor](https://github.com/PiotrMachowski/Xiaomi-cloud-tokens-extractor).

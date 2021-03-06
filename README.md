![Frame 1](https://user-images.githubusercontent.com/49750349/139683060-c0741b1d-87f7-46f7-baa8-473a7e0a3bc3.png)
# shri-infastructure
Ну, очччень мощная инфастурктура авто-тестов с использованием Яндекс Трекера

<h3>🚀 Начало работы</h3>
- При создании нового релиза запускаются скрипты в Github Actions
- Результат сборки можно посмотреть в Github Actions

<h3>⬇️ Скрипт createTicket.sh</h3>
- Создаёт тикет в системе Яндекс Трекер. Создаст от того пользователя, от которого указан API в <b>.env</b> окружении

<h3>⬇️ Скрипт runTests.sh</h3>
- Запустит авто-тесты (используется Jest библиотека из NodeJS) и результат отправит в тикет созданным createTicket.sh

<h3>⬇️ Скрипт buildDocker.sh</h3>
- Подымит и запустит Docker контейнер и запустит сборку проекта (произойдет запуск скриптов createTicket.sh и runTests.sh)

<h3>🔥 Локальное тестирование</h3>
Для локального тестирования добавьте в своё окружение переменные OAUTH и XORGID (подробнее о данных переменных можно узнать в Яндекс Трекере API)

<h2>Feedback</h2>
👩‍🚀 Мои контакты: https://t.me/zhcoder

<h3>Screenshots</h3>
<img src="https://user-images.githubusercontent.com/49750349/139685512-1d4f3f44-efac-4d10-885a-1ac572077191.png" width="80%" height="40%">
<img src="https://user-images.githubusercontent.com/49750349/139685646-ff3060e7-388b-4989-af8a-218fc9128d29.png" width="80%" height="40%">
# flutter_world_time

Первый проект по flutter.

С чем работал:

- api http://worldtimeapi.org
Получение данных и их обработка в человеческий вид.
lib/service/world_time

- использование простой навигации между страницами (именные Routes) с передачей данных через страницы.
lib/main, lib/home/ lib/loading

- Динамическая смена обоев и цвета AppBar при смене дня и ночи,красил кнопки.
lib/main

- Добавление красивых и не очень картинок через
   image: DecorationImage(
            image: AssetImage("images/$bgImage"),
            fit: BoxFit.cover,)
lib/home/

- подгрузка данных от api с проигрыванием экрана загрузки через
    body: const Center(
            child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,)
          )
lib/loading

![app_gif](https://github.com/GingerMustache/flutter_world_time/assets/103313278/827d97a7-221a-4aba-9d85-b890e4b5699a)


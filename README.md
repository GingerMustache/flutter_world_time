# flutter_world_time

Первый проект по flutter.

Есть выбор из нескольких стран с городами на которые можно тапнуть и получить местное время, с динамически сменяемыми обоями дня и ночи

С чем работал:

- api http://worldtimeapi.org
Получение данных и обработка в человеческий вид.
lib/service/world_time

- использование простой навигации между страницами (именные Routes)
с передачей данных через страницы.
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

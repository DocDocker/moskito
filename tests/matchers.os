#Использовать asserts
#Использовать notify
#Использовать delegate
#Использовать ".."

Перем Объект;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_ПроверитьМатчерЧисла");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьМатчерСтроки");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьВсеядныйМатчер");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьКомбинациюМатчеров");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьКастомныйМатчер");
	
	Возврат ВсеТесты;
КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	Объект = Мок.Получить(Тип("Структура"));
КонецПроцедуры

Процедура ТестДолжен_ПроверитьМатчерЧисла() Экспорт
	Объект.Когда().Свойство(Матчеры.ЛюбоеЧисло()).ТогдаВозвращает(Истина);
	
	Ожидаем.Что(Объект.Свойство(0)).Равно(Истина);
	Ожидаем.Что(Объект.Свойство("Строка")).Равно(NULL);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьМатчерСтроки() Экспорт
	Объект.Когда().Свойство(Матчеры.ЛюбаяСтрока()).ТогдаВозвращает(Истина);
	
	Ожидаем.Что(Объект.Свойство("Строка")).Равно(Истина);
	Ожидаем.Что(Объект.Свойство(0)).Равно(NULL);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВсеядныйМатчер() Экспорт
	Объект.Когда().Свойство(Матчеры.ЛюбоеЗначение()).ТогдаВозвращает(Истина);

	Ожидаем.Что(Объект.Свойство(0)).Равно(Истина);
	Ожидаем.Что(Объект.Свойство("Строка")).Равно(Истина);
	Ожидаем.Что(Объект.Свойство(Неопределено)).Равно(Истина);
	Ожидаем.Что(Объект.Свойство(Ложь)).Равно(Истина);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьКомбинациюМатчеров() Экспорт
	Объект.Когда().Свойство(Матчеры.ЛюбоеЧисло()).ТогдаВозвращает(Истина);
	Объект.Когда().Свойство(Матчеры.ЛюбаяСтрока()).ТогдаВозвращает(Истина);
	
	Ожидаем.Что(Объект.Свойство(0)).Равно(Истина);
	Ожидаем.Что(Объект.Свойство("Строка")).Равно(Истина);
	Ожидаем.Что(Объект.Свойство(Неопределено)).Равно(NULL);
	Ожидаем.Что(Объект.Свойство(Ложь)).Равно(NULL);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьКастомныйМатчер() Экспорт
	КастомныйМатчер = Новый Делегат(ЭтотОбъект, "БольшеТрех");
	Объект.Когда().Свойство(КастомныйМатчер).ТогдаВозвращает(Истина);

	Ожидаем.Что(Объект.Свойство(0)).Равно(NULL);
	Ожидаем.Что(Объект.Свойство(3)).Равно(NULL);
	Ожидаем.Что(Объект.Свойство(4)).Равно(Истина);
КонецПроцедуры

Функция БольшеТрех(Знач Параметр = Неопределено) Экспорт
	Возврат Параметр > 3;
КонецФункции

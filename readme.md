
### Задание 1
1. Описать структуру для хранения информации о книгах.
Для книги необходимо хранить название и авторов.
Книга может иметь несколько авторов, а у автора может быть несколько книг.
2. Написать [запрос](книги%20например.sql) к созданной структуре, который возвращает все книги, авторы которых не являются соавторами в других книгах.

### Задание 2
1. Написать [программу](src/com/company/Main.java), фильтрующую xml файл в кодировке UTF-8 и сохраняющую в файл-результат с сохранением структуры книги и их авторов с латинской буквой в фамилии*. [Пример файла](resources/input.xml)
    
### Задание 3 (опционально)
1. Что получится в результате применения [трансформации](resources/xsl/task3.xsl) к примеру из задания 2
2. Как лучше переписать трансформацию?


###### Примечания:
* (задание 2) реализовано в нескольких вариантах ввиду неодназначности формулировки:
    1. фильтр исключает из [результата](resources/xsl/redundant_books.xsl) книгу целиком, если среди авторов есть хотя бы один с неподходящей по условию фамилией
    2. фильтр исключает из [результата](resources/xsl/redundant_books_one_en_authors.xsl) книгу целиком, если среди авторов нет ни одного с подходящей по условию фамилией
    3. фильтр исключает из [результата](resources/xsl/redundant_authors.xsl) только авторов с неподходящей фамилией. возможен пустой тег `authors`
    4. фильтр исключает из [результата](resources/xsl/redundant_authors_without_empty.xsl) только авторов с неподходящей фамилией. если в книге были только такие авторы, то тег `authors` отсутствует
 
* нет однозначности в определении позиции фамилии (иногда она на первом месте, а иногда на втором), поэтому в качестве фамилии использовалось всё содержимое тега `name`

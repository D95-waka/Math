מתמטיקה
=======

כאן אני שומר את כל המידע שאני יוצר בנוגע למתמטיקה.

מבנה
----

כלל קובצי ה־tex ברפו משתמשים בקובץ [article_base.tex](./article_base.tex) כקובץ הגדרה ראשוני.
קובץ זה משתמש בקובץ [common.lua](./common.lua) לאתחול נוסף של קוד lua.
על כל קובץ tex להיות בתיקייה תחת התיקייה הראשית בלבד, אחרת הם יוגדרו בצורה לא תקינה.

נשים לב כי כלל קובצי ה־tex הם בתקן lualatex, ולא יכולים להתקמפל בסוגים אחרים של latex.
קובץ הבסיס מגדיר כברירת־מחדל שהשפה תהיה עברית, ולכן חשוב לבטל את ההגדרה ידנית בקובץ אם הוא צריך להיות באנגלית.
הפונט בשימוש הוא [Libertinus](https://github.com/alerque/libertinus).

כלל הגדרות סביבת העבודה נמצאות [כאן](https://github.com/D95-waka/DotFiles/tree/master/nvim).

בנייה
-----

תהליך הבנייה צריך להיעשות מהתיקייה בה הקובץ נמצא.

כדי לבנות קובץ כלשהו נוכל להריץ את הפקודה הבאה
```console
lualatex -halt-on-error -output-directory=./bin/ <filename>.tex
```
אפשר להשתמש גם ב־latexmk על־ידי הפקודה הבאה
```console
latexmk -lualatex -interaction=nonstopmode -output-directory=./bin/ <filename>.tex
```

כדי להוסיף כותב ל־pdf יש להריץ את הפקודה הבאה לפני הבנייה:
```bash
export AUTHOR='<author name>'
```
או לחילופין ב־fish:
```fish
set -lx AUTHOR '<author name>'
```


קורסים
------

רשימת הקורסים שכלולים בתואר.

### קורסים שסיימתי
1.  [מתמטיקה דיסקרטית](./Discrete_mathematics) – 2022ג'
2.  [אלגברה לינארית 1](./Linear_algebra_1) – 2023א'
3.  [אלגברה לינארית 2](./Linear_algebra_2) – 2023ב'
4.  [חשבון אינפיניטסימלי 1](./Calculus_1) – 2023ב'
5.  [חשבון אינפיניטסימלי 2](./Calculus_2) – 2024ב'
6.  [חשבון אינפיניטסימלי 3](./Calculus_3) – 2024ב'
7.  [מבנים אלגבריים 1](./Algebraic_Structures_1) – 2024ב'
8.  [תורת הקבוצות](./Set_Theory) – 2024ב'

### קורסים בלמידה
9.  [תכנות בסיסי בפייתון](https://shnaton.huji.ac.il/index.php/NewSyl/76631) – 2025א'
10.  [פונקציות מרוכבות](https://shnaton.huji.ac.il/index.php/NewSyl/80519) – 2025א'
11.  [מבוא ללוגיקה](https://shnaton.huji.ac.il/index.php/NewSyl/80423) – 2025א'
12.  [תורת ההסתברות 1](https://shnaton.huji.ac.il/index.php/NewSyl/80420) – 2025א'
13.  [תורת הקבוצות האקסיומטית](https://shnaton.huji.ac.il/index.php/NewSyl/80650) – 2025א'
14. [תורת המספרים האלגבריים](https://shnaton.huji.ac.il/index.php/NewSyl/80756) - 2025א'

### קורסים שילמדו בעתיד
-  [אליזה על יריעות](https://shnaton.huji.ac.il/index.php/NewSyl/80416) – 2025ב'
-  [אליזה פונקציונלית](https://shnaton.huji.ac.il/index.php/NewSyl/80417) – 2025ב'
-  [מבנים אלגבריים 2](https://shnaton.huji.ac.il/index.php/NewSyl/80446/) – 2025ב'
-  [מבוא לטופולוגיה](https://shnaton.huji.ac.il/index.php/NewSyl/80516) – 2025ב'
-  [תורת המידה](https://shnaton.huji.ac.il/index.php/NewSyl/80517) – 2026א'
-  [משוואות דיפרנציאליות](https://shnaton.huji.ac.il/index.php/NewSyl/80320) – 2026ב'

בנוסף יש לקחת קורסים באנגלית ואבני פינה מתישהו.

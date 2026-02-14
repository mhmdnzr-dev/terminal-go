<div dir="rtl" style="text-align: right">



# تمرین جامع Go – کاملاً عملی (۴۵ تمرین کدنویسی)

---

## بخش ۱: Memory و Allocation (1–7)

1. تابعی بنویس که یک struct کوچک را هم با pointer و هم با value دریافت کند و با benchmark نشان بده کدام allocation دارد.
2. برنامه‌ای بنویس که escape analysis آن باعث heap allocation شود، سپس آن را طوری بازنویسی کن که stack allocate شود.
3. یک slice بدون preallocate بساز، سپس نسخه preallocate شده را benchmark کن.
4. struct بزرگی طراحی کن و آن را در loop pass کن، سپس نسخه بهینه را پیاده‌سازی کن.
5. برنامه‌ای بنویس که map بدون capacity بسازد و نسخه‌ای که capacity دارد را مقایسه کن.
6. مثالی بنویس که استفاده نادرست از `new(T)` باعث allocation غیرضروری شود.
7. با استفاده از `go test -bench` نشان بده allocation چگونه latency را بالا می‌برد.

---

## بخش ۲: GC و sync.Pool (8–13)

8. یک loop بنویس که allocation زیاد ایجاد کند و با pprof memory آن را تحلیل کن.
9. نسخه‌ای از همان برنامه بنویس که از sync.Pool برای reuse buffer استفاده کند.
10. مثالی بنویس که sync.Pool به‌اشتباه برای cache استفاده شده و باعث bug می‌شود.
11. یک benchmark بنویس که تفاوت GC pressure با و بدون pool را نشان دهد.
12. برنامه‌ای بنویس که objectهای short-lived بسازد و تاثیر آن را روی GC نشان دهد.
13. نشان بده GC چگونه object داخل pool را پاک می‌کند.

---

## بخش ۳: Goroutine Leak (14–20)

14. برنامه‌ای بنویس که goroutine leak ایجاد کند با channel بلاک‌شده.
15. همان برنامه را با context cancellation اصلاح کن.
16. مثالی بنویس که `time.After` در loop باعث leak شود.
17. نسخه اصلاح‌شده با time.Ticker بنویس.
18. HTTP handler بنویس که بعد از disconnect client goroutine را leak کند.
19. نسخه‌ای بنویس که به context request احترام بگذارد.
20. برنامه‌ای بنویس که تعداد goroutine‌ها را در زمان اجرا مانیتور کند.

---

## بخش ۴: Zero-Allocation Concurrency (21–26)

21. یک worker pool بنویس که برای هر job allocation انجام دهد.
22. همان worker pool را zero-allocation بازنویسی کن.
23. pipeline سه مرحله‌ای بنویس که allocation دارد.
24. همان pipeline را با reuse buffer بهینه کن.
25. benchmark بنویس که interface vs concrete type را مقایسه کند.
26. کدی بنویس که batch processing latency را کاهش دهد.

---

## بخش ۵: Channel Internals (27–33)

27. برنامه‌ای بنویس که unbuffered channel باعث بلاک شود.
28. نسخه buffered بنویس و رفتار را مقایسه کن.
29. برنامه‌ای بنویس که buffer بزرگ باعث افزایش memory شود.
30. مثال select با چند channel و رفتار pseudo-random آن.
31. برنامه‌ای بنویس که close اشتباه channel باعث panic شود.
32. نسخه‌ای بنویس که ownership channel درست رعایت شده.
33. مثال نشان بده چرا استفاده از channel برای shared state کند است.

---

## بخش ۶: Scheduler (34–38)

34. برنامه‌ای بنویس که goroutine زیاد بسازد ولی CPU استفاده نشود.
35. با تغییر GOMAXPROCS تاثیر آن را اندازه بگیر.
36. tight loop بدون syscall بنویس و starvation را مشاهده کن.
37. نسخه اصلاح‌شده با yield یا blocking call بنویس.
38. برنامه‌ای بنویس که syscall بلاک‌کننده throughput را کاهش دهد.

---

## بخش ۷: HTTP Performance (39–43)

39. HTTP handler بنویس که از fmt استفاده کند و benchmark بگیر.
40. نسخه بهینه بدون fmt پیاده‌سازی کن.
41. handler بنویس که json.Marshal استفاده کند.
42. نسخه با json.NewEncoder بنویس و مقایسه کن.
43. server بدون timeout بنویس و سپس نسخه امن آن را پیاده کن.

---

## بخش ۸: Backpressure و Design (44–45)

44. producer–consumer بنویس که بدون backpressure crash کند.
45. همان سیستم را با bounded channel یا semaphore پایدار کن.




</div>
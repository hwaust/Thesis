set terminal mp color 14
set output "plot.mp"

set xrange [0:12.5]
set xtics (1, 3, 6, 12)
set yrange [0:12]
set key left top
set xlabel "Number of Threads"
set ylabel "Work / Span"

plot \
"load_balance.txt" using 1:6 t "XM1(a)" w p, \
"load_balance.txt" using 1:2 t "XM3(c)" w p, \
"load_balance.txt" using 1:3 t "XM4(c)" w p, \
"load_balance.txt" using 1:4 t "XM5(b)" w p, \
"load_balance.txt" using 1:5 t "XM6(b)" w p, \
x notitle w l

set yrange [0:7]
set key left top
set ytics (0, 2, 4, 6)
set ylabel "Increase of Work"

plot \
"increase_of_work.txt" using 1:6 t "XM1(a)" w p, \
"increase_of_work.txt" using 1:2 t "XM3(c)" w p, \
"increase_of_work.txt" using 1:3 t "XM4(c)" w p, \
"increase_of_work.txt" using 1:4 t "XM5(b)" w p, \
"increase_of_work.txt" using 1:5 t "XM6(b)" w p, \
1 notitle w l


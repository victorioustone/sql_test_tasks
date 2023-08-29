-- создать запрос, возвращающий сумму продаж накопительным итогом в разрезе города

with sales as (
  select '2018-01-01' as dt, 'moscow' as city, 10 as sales
  union all
  select '2018-01-01', 'spb', 20
  union all
  select '2018-02-01', 'moscow', 30
  union all
  select '2018-02-01', 'spb', 40
  union all
  select '2018-03-01', 'moscow', 50
  union all
  select '2018-03-01', 'spb', 60
) select *, sum(sales) over(partition by city order by dt) as cumulative_sales from sales
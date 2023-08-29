-- есть таблица с транзакциями и таблица курса ЦБ
-- необходимо написать запрос, рассчитывающий транзакции в рублевом эквиваленте (без создания временных таблиц)

with transactions as (
  select '2016-12-30' as dt, 10 as summ, 'usd' as currency
  union all
  select '2016-12-31', 15, 'usd'
  union all
  select '2017-01-01', 20, 'usd'
  union all
  select '2017-01-02', 20, 'usd'
  union all
  select '2017-01-03', 30, 'usd'
  union all
  select '2017-01-04', 40, 'usd'
  union all
  select '2017-01-05', 50, 'usd'
  union all
  select '2017-01-10', 55, 'usd'
  union all
  select '2017-01-11', 60, 'usd'
), 
exchange as  (
  select '2016-12-30' as dt, 55.2 as rate, 'usd' as currency
  union all
  select '2016-12-31', 55.4, 'usd'
  union all
  select '2017-01-10', 54.3, 'usd'
  union all
  select '2017-01-11', 54.2, 'usd'
) select transactions.dt as dt, exchange.dt as exchange_dt, summ * rate as in_rub from transactions left join exchange 
  on exchange.dt = (select max(dt) from exchange where dt <= transactions.dt)
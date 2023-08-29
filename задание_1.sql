-- считаем среднюю выручку от активного абонента по сегменту B2B в разрезе филиалов
-- показать помесячную динамику
-- выручка должна быть указана в рублях на одного абонента

with a as (
  select ym, branch, sum(amount) as abonents
    from simulative.abonent
  where upper(segment) = 'B2B'
  group by branch, ym
)
-- revenue - в тыс.руб.
select a.ym, a.branch, round(b.revenue * 1000 / a.abonents) as average_revenue from a join simulative.revenue b
 on a.branch = b.branch and a.ym = b.ym and upper(b.segment) = 'B2B'
  order by branch, ym
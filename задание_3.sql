-- определить самую низкомаржинальную категорию среди типов устройств

with a as (
  select gadget, sum(charges) as revenue, 
  sum(trafic) * 0.01 as costs 
  from simulative.trafic
  group by gadget
  ) select gadget, round(costs) as costs, round(revenue - costs) as marginality, 
  round((revenue - costs) / revenue * 100) as marginality_percent from a
order by marginality
limit 1
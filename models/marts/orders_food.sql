select * 
from {{ref('orders')}}
 where IS_FOOD_ORDER = 'true'
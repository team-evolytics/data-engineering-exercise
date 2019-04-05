select
	'visitors' as aggregation,
	'all' as transaction_type,
	convert(visit_start_timestamp, date) as transaction_date,
	count(distinct case when e.transaction_type in ('credit', 'debit', 'bank') then e.visitor_id end) as total,
	count(distinct case when e.transaction_type in ('credit', 'debit', 'bank') and transaction_action = 'transaction_started' then e.visitor_id end) as started,
	count(distinct case when e.transaction_type in ('credit', 'debit', 'bank') and transaction_action = 'transaction_failed' then e.visitor_id end) as failed,
	count(distinct case when e.transaction_type in ('credit', 'debit', 'bank') and transaction_action = 'transaction_completed' then e.visitor_id end) as completed
from evolytics.exercise e
group by convert(visit_start_timestamp, date)
union all
select
	'visitors' as aggregation,
	'credit' as transaction_type,
	convert(visit_start_timestamp, date) as transaction_date,
	count(distinct case when e.transaction_type = 'credit' then e.visitor_id end) as total,
	count(distinct case when e.transaction_type = 'credit' and transaction_action = 'transaction_started' then e.visitor_id end) as started,
	count(distinct case when e.transaction_type = 'credit' and transaction_action = 'transaction_failed' then e.visitor_id end) as failed,
	count(distinct case when e.transaction_type = 'credit' and transaction_action = 'transaction_completed' then e.visitor_id end) as completed
from evolytics.exercise e
group by convert(visit_start_timestamp, date)
union all
select
	'visitors' as aggregation,
	'debit' as transaction_type,
	convert(visit_start_timestamp, date) as transaction_date,
	count(distinct case when e.transaction_type = 'debit' then e.visitor_id end) as total,
	count(distinct case when e.transaction_type = 'debit' and transaction_action = 'transaction_started' then e.visitor_id end) as started,
	count(distinct case when e.transaction_type = 'debit' and transaction_action = 'transaction_failed' then e.visitor_id end) as failed,
	count(distinct case when e.transaction_type = 'debit' and transaction_action = 'transaction_completed' then e.visitor_id end) as completed
from evolytics.exercise e
group by convert(visit_start_timestamp, date)
union all
select
	'visitors' as aggregation,
	'bank' as transaction_type,
	convert(visit_start_timestamp, date) as transaction_date,
	count(distinct case when e.transaction_type = 'bank' then e.visitor_id end) as total,
	count(distinct case when e.transaction_type = 'bank' and transaction_action = 'transaction_started' then e.visitor_id end) as started,
	count(distinct case when e.transaction_type = 'bank' and transaction_action = 'transaction_failed' then e.visitor_id end) as failed,
	count(distinct case when e.transaction_type = 'bank' and transaction_action = 'transaction_completed' then e.visitor_id end) as completed
from evolytics.exercise e
group by convert(visit_start_timestamp, date)
union all
select
	'visits' as aggregation,
	'all' as transaction_type,
	convert(visit_start_timestamp, date) as transaction_date,
	count(distinct case when e.transaction_type in ('credit', 'debit', 'bank') then concat(e.visitor_id, '|', e.visit_num) end) as total,
	count(distinct case when e.transaction_type in ('credit', 'debit', 'bank') and transaction_action = 'transaction_started' then concat(e.visitor_id, '|', e.visit_num) end) as started,
	count(distinct case when e.transaction_type in ('credit', 'debit', 'bank') and transaction_action = 'transaction_failed' then concat(e.visitor_id, '|', e.visit_num) end) as failed,
	count(distinct case when e.transaction_type in ('credit', 'debit', 'bank') and transaction_action = 'transaction_completed' then concat(e.visitor_id, '|', e.visit_num) end) as completed
from evolytics.exercise e
group by convert(visit_start_timestamp, date)
union all
select
	'visits' as aggregation,
	'credit' as transaction_type,
	convert(visit_start_timestamp, date) as transaction_date,
	count(distinct case when e.transaction_type = 'credit' then concat(e.visitor_id, '|', e.visit_num) end) as total,
	count(distinct case when e.transaction_type = 'credit' and transaction_action = 'transaction_started' then concat(e.visitor_id, '|', e.visit_num) end) as started,
	count(distinct case when e.transaction_type = 'credit' and transaction_action = 'transaction_failed' then concat(e.visitor_id, '|', e.visit_num) end) as failed,
	count(distinct case when e.transaction_type = 'credit' and transaction_action = 'transaction_completed' then concat(e.visitor_id, '|', e.visit_num) end) as completed
from evolytics.exercise e
group by convert(visit_start_timestamp, date)
union all
select
	'visits' as aggregation,
	'debit' as transaction_type,
	convert(visit_start_timestamp, date) as transaction_date,
	count(distinct case when e.transaction_type = 'debit' then concat(e.visitor_id, '|', e.visit_num) end) as total,
	count(distinct case when e.transaction_type = 'debit' and transaction_action = 'transaction_started' then concat(e.visitor_id, '|', e.visit_num) end) as started,
	count(distinct case when e.transaction_type = 'debit' and transaction_action = 'transaction_failed' then concat(e.visitor_id, '|', e.visit_num) end) as failed,
	count(distinct case when e.transaction_type = 'debit' and transaction_action = 'transaction_completed' then concat(e.visitor_id, '|', e.visit_num) end) as completed
from evolytics.exercise e
group by convert(visit_start_timestamp, date)
union all
select
	'visits' as aggregation,
	'bank' as transaction_type,
	convert(visit_start_timestamp, date) as transaction_date,
	count(distinct case when e.transaction_type = 'bank' then concat(e.visitor_id, '|', e.visit_num) end) as total,
	count(distinct case when e.transaction_type = 'bank' and transaction_action = 'transaction_started' then concat(e.visitor_id, '|', e.visit_num) end) as started,
	count(distinct case when e.transaction_type = 'bank' and transaction_action = 'transaction_failed' then concat(e.visitor_id, '|', e.visit_num) end) as failed,
	count(distinct case when e.transaction_type = 'bank' and transaction_action = 'transaction_completed' then concat(e.visitor_id, '|', e.visit_num) end) as completed
from evolytics.exercise e
group by convert(visit_start_timestamp, date)
;

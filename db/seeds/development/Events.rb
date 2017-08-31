
15.times do |n|
Event.create!(
    name:'test'+ n.to_s,
    start_date:'2016/12/31',
    end_date:'',
    place:'test'+n.to_s,
    detail:'test'+n.to_s,
    kind:'グループ',
    status:0
)
end
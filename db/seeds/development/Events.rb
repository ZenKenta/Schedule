
10.times do |n|
Event.create!(
    name:'グループ'+ n.to_s,
    start_date:'2016/12/31',
    end_date:'',
    place:'グループ'+n.to_s,
    detail:'グループ'+n.to_s,
    kind:'グループ',
    status:0
)
end


10.times do |n|
Event.create!(
    name:'一般募集'+ n.to_s,
    start_date:'2017/09/30',
    end_date:'',
    place:'test'+n.to_s,
    detail:'test'+n.to_s,
    kind:'一般募集',
    status:0
)
end
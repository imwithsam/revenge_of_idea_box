5.times do |i|
  Idea.create(
    title: "Title #{i+1}",
    body:  "One morning, when Gregor Samsa woke from troubled dreams, he" \
           " found himself transformed in his bed into a horrible vermin."
  )
end

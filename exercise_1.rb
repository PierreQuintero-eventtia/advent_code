file = File.read('input_exercise_1.rb')

arr= file.split("\n")

main_array =[]
temp_arr=[]
arr.each_with_object([]) do |item, arr|
  if item != ""
    temp_arr<<item.to_i
  else
    main_array.push(temp_arr)
    temp_arr=[]
  end
end

sum_arrays= main_array.map(&:sum)
top_three= sum_arrays.sort.reverse.take(3)

puts top_three.sum

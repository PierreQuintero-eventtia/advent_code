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

biggest = main_array.map(&:sum).max

puts acum.inspect

require "sinatra"
require "sinatra/reloader"

get("/") do

end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("number").to_f

  @the_result = @the_num ** 2
  
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("number").to_f

  @the_result = @the_num ** (0.5)
  
  erb(:square_root_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @input_min = params.fetch("user_min").to_f
  @input_max = params.fetch("user_max").to_f
  
  @the_result = rand(@input_min..@input_max)
  
  erb(:random_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @input_apr = params.fetch("user_apr").to_f
  @input_years = params.fetch("user_years").to_i
  @input_pv = params.fetch("user_pv").to_f

  @numerator = (@input_apr / 100 / 12) * @input_pv
  @denominator = (1 - ((1 + (@input_apr / 100 / 12)) ** (-@input_years * 12)))
  @payment = @numerator / @denominator

  erb(:payment_results)
end

defmodule Fp do

  def square(x) do
    x * x
  end

  def mymap([], _fun) do
    []
  end

  def mymap([head|tail], fun) do
    [ fun.(head) | mymap(tail, fun) ]
  end

  def myfilter([], _fun) do
     []
  end

  def myfilter([x|xs], fun) do
    if fun.(x) do
      [ x | myfilter(xs, fun) ]
    else 
       myfilter(xs, fun) 
    end
  end

  def is_droid(%{:name => _who, :droid => true}), do: true
  def is_droid(%{:name => _who, :droid => false}), do: false

  def list_of_droids(chars) do
    Enum.filter(chars, fn(x) -> is_droid(x) end)
  end

  def myreduce([], acc, _fun) do
    acc 
  end

  def myreduce([x|xs], acc, fun) do
    myreduce(xs, (fun.(x,acc)), fun)
  end

  def print_loop([]) do
  end

  def print_loop([ head | tail ]) do
    IO.puts "item: #{head}"
    print_loop(tail)
  end

  def find_by_name([x|xs], name) do
    if x[:name] == name do
      x
    else 
      find_by_name(xs, name)
    end 
  end
  
end

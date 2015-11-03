defmodule FpTest do
  use ExUnit.Case
  doctest Fp

  test "square of 3 is 9" do
    assert 9 == Fp.square(3)
  end

  test "squares of [2, 3, 4] is [4, 9, 16]" do
    assert [4, 9, 16] == Enum.map([2, 3, 4], &Fp.square/1)
  end

  test "map of [4,5,6] is [16,25,36]" do
    assert [16,25,36] == Fp.mymap([4,5,6], &Fp.square/1)
  end

  test "filter of [foo, 2, bar] is [2]" do
    assert [2] == Fp.myfilter(["foo", 2, "bar"], &(is_number(&1)))
  end

  test "check for droidness" do
    characters = [
      %{ :name => "han", :droid => false },
      %{ :name => "leia", :droid => false},
      %{ :name => "r2d2", :droid => true}
     ]
    assert [%{ :name => "r2d2", :droid => true}] == Fp.list_of_droids(characters)
  end

  test "[1,2,3] + is reduced to 6" do
    assert 6 == Fp.myreduce([1,2,3], 0, fn(x, acc) -> x + acc end)
  end
  
  test "recursive find by name" do
    characters = [
      %{ :name => "han", :droid => false },
      %{ :name => "leia", :droid => false},
      %{ :name => "r2d2", :droid => true}
     ]
    assert %{ :name => "r2d2", :droid => true} == Fp.find_by_name(characters, "r2d2")
  end 
   
end

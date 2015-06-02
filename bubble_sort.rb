# BUBBLE SORT

# Sorts an array using the bubble sort methodology.

def bubble_sort(array)
  unsorted = true
  while unsorted
    swap_occurred = false 
    for i in 1...array.length do
      if array[i] < array[i - 1]
        array[i], array[i - 1] = array[i - 1], array[i]
        swap_occurred = true 
      end
    end
    if swap_occurred == false # This will be false if no numbers are swapped,  
      unsorted = false        # meaning the array is fully sorted.
    end
  end
  array
end

p bubble_sort([4,3,78,2,0,2]) # => [0, 2, 2, 3, 4, 78]

# Sorts an array by accepting a block which determines the order of sorting.

def bubble_sort_by(array)
  unsorted = true
  while unsorted
    swap_occurred = false 
    for i in 1...array.length do
      if yield(array[i], array[i - 1]) < 0 # Block goes here.
        array[i], array[i - 1] = array[i - 1], array[i]
        swap_occurred = true 
      end
    end
    if swap_occurred == false # This will be false if no numbers are swapped,  
      unsorted = false        # meaning the array is fully sorted.
    end
  end
  array
end

large_to_small = bubble_sort_by(["hi","hello","hey","How are you"]) do |left, right|
  right.length - left.length
end

small_to_large = bubble_sort_by(["hi","hello","hey","How are you"]) do |left, right|
  left.length - right.length
end

p large_to_small # => ["How are you", "hello", "hey", "hi"]
p small_to_large # => ["hi", "hey", "hello", "How are you"]
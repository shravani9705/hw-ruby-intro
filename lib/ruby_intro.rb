# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  #input: an array of integers
  #output: an integer - sum of the array's elements
  
  arr.inject(0, :+)
end

def max_2_sum arr
  #input: an array of integers
  #output: an integer - sum of the array's two largest elements
  
  if arr.empty? == true #checking if array is empty
    return 0
  else 
    arr = arr.sort #sorting the array (ascending order)
    if arr.length > 1 #if array has more than one element we can find sum of largest two numbers in it
      len = arr.length
      return arr[len-1] + arr[len-2]
    else #if array has only one element...
      return arr[0] #...return that element
    end
  end
end
  
def sum_to_n? arr, n
  #input: an array of integers and an additional integer 
  #output: a boolean value - true if any two elements in the array sum to the input integer, and false otherwise
  
  if ((arr.empty? == true) or (arr.length == 1)) 
    return false
  else #only if array has at least two elements we can find whether there exist two elements in the array that sum to the input integer
    flag = 0 #'flag' will indicate whether two elements that sum to the given integer have been found
    index1 = 0 #this will be the array pointer in the outer loop
    arr.each do |a|
      index2 = 0 #this will be the array pointer in the inner loop
      arr.each do |b|
        if ((a + b == n) and (index1 != index2)) #the two elements must be different to be considered!
          flag = 1
          return true
        else
          index2 = index2 + 1
        end
      end
      if flag == 1
        return true
      else
        index1 = index1 + 1
      end
    end
    if flag == 0
      return false
    else
      return true
    end
  end
end

# Part 2

def hello(name)
  #input: a string - any name
  #output: a string - "Hello" concatenated with the input name
  
  return "Hello, " + name
end

def starts_with_consonant? s
  #input: a string
  #output: a boolean value - true if string starts with a consonant and false otherwise
  
  t = s.each_char.to_a #converting the string into an array of characters
  if t.length >= 1 #checking if the string has a first letter
    if ((t[0] == 'B') or (t[0] == 'b') or (t[0] == 'C') or (t[0] == 'c') or (t[0] == 'D') or (t[0] == 'd') or (t[0] == 'F') or (t[0] == 'f') or (t[0] == 'G') or (t[0] == 'g') or (t[0] == 'H') or (t[0] == 'h') or (t[0] == 'J') or (t[0] == 'j') or (t[0] == 'K') or (t[0] == 'k') or (t[0] == 'L') or (t[0] == 'l') or (t[0] == 'M') or (t[0] == 'm') or (t[0] == 'N') or (t[0] == 'n') or (t[0] == 'P') or (t[0] == 'p') or (t[0] == 'Q') or (t[0] == 'q') or (t[0] == 'R')  or (t[0] == 'r')  or (t[0] == 'S') or (t[0] == 's')  or (t[0] == 'T') or (t[0] == 't') or (t[0]  == 'V')  or (t[0] == 'v')  or (t[0]  == 'W')  or (t[0] == 'w') or (t[0] == 'X') or (t[0] == 'x') or (t[0] == 'Y') or (t[0] == 'y')  or (t[0] == 'Z')  or (t[0] == 'z')) #checking if first letter of string is a consonant
      return true
    else
      return false
    end
  else #if the string is empty
    return false 
  end
end

def binary_multiple_of_4? s
  #input: a string that represents a binary number
  #output: a boolean value - true if string represents a binary number that is a multiple of 4, and false otherwise
  
  t = s.each_char.to_a #converting the string into an array of characters
  t.each do |c|
    if ((c != '0') and (c != '1')) #if the string is not a valid binary number
      return false
    end
  end
  if (t.length == 0) #if string is empty
    return false
  end
  if (t.length == 1) #if string has only one bit...
    if (t[0] == '0') #... and it's a 0, then it's a multiple of 4...
      return true
    else #...if it's a 1, then it's not a multiple of 4
      return false
    end
  end
  
  #if string has more than 1 bit, then we can make use of the following fact: if the last two bits of a binary number are 0's, then the number is a multiple of 4
  len = t.length 
  if ((t[len-1] == '0') and (t[len-2] == '0'))
    return true
  else
    return false
  end
end


# Part 3

class BookInStock
  def initialize(isbn, price) #defining the constructor 'initialize'
    #initializing the instance variables:
    @isbn = isbn
    @price = price
    if ((@price <= 0) or (@isbn.length == 0)) #if 'price' is <= 0 or 'isbn' is an empty string... 
      raise ArgumentError, 'Invalid argument(s). Expected price to be greater than 0 and expected ISBN to be non-null.' #...then the argument(s) is(are) invalid and an exception will be raised
    end
  end
  
  def isbn #creating a getter method for 'isbn'
    @isbn
  end
  
  def isbn=(isbn) #creating a setter method for 'isbn'
    @isbn = isbn
  end
    
  def price #creating a getter method for 'price'
    @price
  end
  
  def price=(price) #creating a setter method for 'price'
    @price = price
  end
  
  def price_as_string
      @price = "$" + sprintf("%.2f", @price) #formatting the price with a leading dollar sign and two decimal places
      return @price #returning the final formatted price
  end
end
require "tic_tac_toe/version"

module TicTacToe
#*******************Класс доска****************************
  class Board

  attr_reader :cells

  def initialize(cells = [[nil, nil, nil],
                          [nil, nil, nil],
                          [nil, nil, nil]])
    
          validate cells
          @cells = cells
        
          
  end
   
  def move (x,y,z) # x,y -координаты z  - 0 или 1 (О или Х)
     
   if (x>2)||(y>2)||(z>1) then raise ArgumentError end
   if (x<0)||(y<0)||(z<0) then raise ArgumentError end
   
   if @cells[x][y] == nil then @cells[x][y]=z # если клетка свободна делаю ход
                     else raise ArgumentError
   
    end            

 end 

  def clear
    cl=[[nil,nil,nil]]*3
    @cells=cl 
  end 

  def empty?
     @cells.flatten.all? do |cell|
      cell.nil?
    end
  end
   
   
 


  private

  def validate cells
    raise ArgumentError unless cells.length == 3
    cells.each do |row|
      raise ArgumentError unless row.length == 3
      row.each { |cell| raise ArgumentError unless [nil, 0, 1].include? cell }
    end
  end

end

#**********************Класс игра************************
class Game
   def initialize 
    @cells=[]
   end
 
  def finish_game(arr)
    f=nil
    temp=[]
    if arr.class != Array then raise ArgumentError end
    # Проверяю  ряды на совпадения 
      f="X" if check_row(arr,1)
      f="0" if check_row(arr,0)
      
    # Проверяю столбики на совпадения
      
      f="X" if check_col(arr,1)
      f="0" if check_col(arr,0)
    # Проверяю диагонали на совпадения     
      f="X" if check_diagonal(arr,1)
      f="0" if check_diagonal(arr,0)
      

        
      # Если f равен nil, проверяю есть ли ход
       f="no winner" if arr.flatten.include?(nil) == false              

    f=nil if arr.include?(nil) == true 
   return f
  end

  #***********************бот******************************

  def bot(arr,n) # arr-массив  n - 0 или 1 в зависивости за кого играет бот 
     m = 0 if n == 1 # m - значение соперника  
     m = 1 if n == 0
          
      temp=bot_cheks(arr,n) 
      return temp if temp !=false

      temp=bot_cheks(arr,m) 
      return temp if temp !=false
      
       3.times do |i| # если нет клеточек с выиграшем ставляю в первую пустую
        3.times do |j|
          return a = j+1,i+1 if arr[i][j] == nil        
       end
       end  
      
    return false 
  
  end

#******************************************************

   def bot_cheks (arr,n)
      3.times do |i|
      3.times do |j|
     
        #************************************

       if arr[i][j] == nil then arr[i][j]=n 
         		    if  finish_game(arr) != nil then
                                      		           arr[i][j] = nil 
                                      		           return a=j+1,i+1      
                                             		end
                            arr[i][j] = nil  
                       end
        #************************************               
      
                              
                             
      end
      end
     return false # если не нашло ближайшего выиграша возвращаю 
   end

  

private  

#***************ряды****************************
  def check_row(arr,n)        # arr - массив n - то что проверяем на совпадение
       arr.each do |row|
         return true  if row == [n.to_i,n.to_i,n.to_i] 
         
       end
     return false
  end

#********************столбики***********************
  def check_col(arr,n)    # arr - массив n - то что проверяем
      3.times do |i|
        temp=[]
         arr.each do |row|
           temp.push row [i] 
         end
            return true if temp == [n.to_i,n.to_i,n.to_i]
      end

     return false  
  end


#****************************диагонали******************
  def check_diagonal(arr,n)  # arr - массив n - то что проверяем
      temp=[]

      3.times do |i|         # первая диагональ 
        temp.push arr[i][i]    
      end 
       
       return true if temp == [n.to_i,n.to_i,n.to_i]
     
      temp=[]

      3.times do |i|           # вторая диагональ 
        temp.push arr[i][2-i]
      end 
       
      return true if temp == [n.to_i,n.to_i,n.to_i]
      return false

  end 

  

end


 #****************Класс игрок******************************
  class Player 
 
 attr_reader :name

 def initialize (name)

   if name !=nil then @name=name
                 else rais ArgumentError
   end              



 end

end

end







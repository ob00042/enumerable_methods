module Enumerable

	def my_each
		
		i=0

		while i<self.size 
		yield(self[i])
		i+=1
		end

		self

	end

	def my_each_with_index

		i=0

		while i<self.size
			yield(self[i],i)
			i+=1
		end
		self

	end


end

#([2,4,3,1]).my_each{|x| puts x*2}
([2,4,3,1]).my_each_with_index{|x,y| puts "#{x},#{y}"}


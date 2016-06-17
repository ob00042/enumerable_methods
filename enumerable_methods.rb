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


	def my_select

		i=0
		while i<self.size
		if yield(self[i])
			puts self[i]
		end
		i+=1
	end
	self

	end

	def my_all?
		k=0
		i=0
		
		while i<self.size
			if yield(self[i])
				k+=1
			end
			i+=1
		end
		
		if k==self.size
			puts true
		else
			puts false
		end

	end


	def my_any?
		i=0
		while i<self.size
			if yield(self[i])
				puts true
				break
			end
			i+=1
		end

	end

	def my_none?
		i=0
		k=0
		while i<self.size
			unless yield(self[i])
				k+=1
			end
			i+=1
		end
		if k==self.size
			puts true
		else
			puts false
		end

	end


	def my_count(x=nil)
		i=0
		count=0
		if block_given?
			while i<self.size
				if yield(self[i])
					count+=1
				end
				i+=1
			end
			puts count
		elsif x!=nil
			while i<self.size
				if self[i]==x
					count+=1
				end
				i+=1
			end
			puts count
		else
			puts self.size
		end
	end

	def my_map
		i=0
		new_array=[]
		while i<self.size
			new_array.push(yield(self[i]))
			i+=1
		end
		print new_array
	end

	def my_inject(value=self[0])
		i=0
		while i<self.size
			value = yield(value, self[i])
			i+=1
		end
		puts value

	end

end

#([2,4,3,1]).my_each{|x| puts x*2}
#([2,4,3,1]).my_each_with_index{|x,y| puts "#{x},#{y}"}
#([2,4,3,1]).my_select{|item| item%2==0}
#([2,4,3,1]).my_all?{|x| x.is_a?(Integer)}
#([2,4,3,1]).my_any?{|x| x==4}
#([2,4,3,1]).my_none?{|x| x.is_a?(String)}
#([2,4,3,1]).my_count{|x| x%2==0}
#([2,4,3,1]).my_count
#([2,4,3,1]).my_count(2)
#([2,4,3,1]).my_map{|x| x*3}
([2,4,3,1]).my_inject(0){|total, x| total+x }
(["cat", "sheep", "bear"]).my_inject do |memo, word|
	memo.length>word.length ? memo : word
end
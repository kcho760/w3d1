class Array
    def my_each(&prc) 
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end 
        return self
    end
end

test = Proc.new{|ele| puts ele}

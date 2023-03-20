class Array
    def my_each(&prc) 
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end 
        return self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            if prc.call(ele)
                new_arr << ele
            end
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            if !prc.call(ele)
                new_arr << ele
            end
        end
        new_arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            if prc.call(ele)
                return true
            end
        end
        return false
    end

    def my_all?(&prc)
        count = 0
        self.my_each do |ele|
            if prc.call(ele)
                count += 1
            end
        end
        return true if count == self.length
        return false
    end

    def my_flatten
        return [self] if self.is_a?(Array)
        new_arr = []
        self.my_each do |sub_arr|
            new_arr << my_flatten[sub_arr]
        end
        new_arr
    end
end

test = Proc.new{|ele| puts ele}
test1 = Proc.new{|num| num > 1}



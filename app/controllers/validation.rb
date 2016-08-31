class Validation

  def process(params, business_logics)
    @result
    @parseResult = parseCheck(params)
    @logicResult = parseLogic(business_logics)
    puts "process parseResult #{@parseResult}"
    puts "process logicResult #{@logicResult}"
    if @parseResult && @logicResult
      true
    else
      false
    end
  end

  def parseCheck(params)
    if params.length > 0
      @array = Array.new
      params.each do |param|
        @isValid = param[:data].is_a? param[:type]
        @array.push(@isValid)
      end
      @result = true unless @array.include?(false)
    else
      true
    end
  end

  def parseLogic(business_logics)
    if business_logics.length > 0
      puts "parseLogic"
      @array = Array.new
      business_logics.each do |logic|
        
      end
    else
      true
    end
  end

  def self.return(isValid, data)
    if isValid
      data
    else
      "data is not valid"
    end
  end

end

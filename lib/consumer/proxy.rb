module Consumer
  class Proxy < Hash

    def initialize(hash)
      hash.each { |k, v| self[k] = v }
    end

    def method_missing(method, *args, &block)
      _method = method.to_s
      super if args.any? or not respond_to?(_method)
      return methodize_me(self[_method])
    end

    def respond_to?(method)
      self.has_key?(method.to_s) or super
    end

    private
    def methodize_me(obj)
      if obj.is_a? Hash
        Consumer::Proxy.new(obj)
      elsif obj.is_a? Array
        obj.map { |i| methodize_me(i) }
      else
        obj
      end
    end
  end
end

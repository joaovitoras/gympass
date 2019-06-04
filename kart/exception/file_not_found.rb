class Exceptions
  class FileNotFound < StandardError
    def initialize(msg = 'File not found. Provide a input to start a run')
      super
    end
  end
end

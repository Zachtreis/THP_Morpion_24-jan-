class Pion

  def display_options
    options = [A1, A2, A3, B1, B2, B3, C1, C2, C3]
    deja_choisis = []
    options.reject do |r|
      deja_choisis.include? r
    end
    puts options
  end

end
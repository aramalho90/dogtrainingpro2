module BookingsHelper

  def to_yesorno(bool)
    if bool
      return "Sim"
    else
      return "Não"
    end
  end
end

class Child
  include Lotus::Entity

  attributes :name, :birthdate, :age

  def birthdate=(birthdate)
    return if birthdate.nil?
    @birthdate = birthdate
    now = Time.now.to_date
    @age = now.year - @birthdate.year - \
      (@birthdate.to_date.change(:year => now.year) > now ? 1 : 0)
  end
end

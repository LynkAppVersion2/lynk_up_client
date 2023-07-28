class GroupList
  attr_reader :id,
              :name,
              :member_count

  def initialize(info)
    @id = info[:id]
    @name = info[:name]
    @member_count = info[:member_count]
  end
end
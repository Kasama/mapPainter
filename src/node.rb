class Node

  def self.null
    Node.new color: :all
  end

  def initialize(params)
    if params.class == Hash
      if params[:color] == :all
        @color = [:blue, :yellow, :red, :green]
      end
    end
  end

end
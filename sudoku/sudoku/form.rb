class Form

  def initialize items
    @items = items
    relate_items
  end

  #指定インデックスItemの取得
  def get_item index
    @items[index]
  end

  def get_all
    @items
  end

  # フレーム内の指定インデックスの横3つ取得
  def get_right_line(index)
    get_frame_line(@items[index]) do |item|
      item = item.right
    end
  end

  # フレーム内の指定インデックスの縦3つ取得
  def get_below_line(index)
    get_frame_line(@items[index]) do |item|
      item = item.below
    end
  end

  # 各セルのrightとbelow を循環連結リストでつなげる
  def relate_items
    @items.each_with_index do |item, i|
      if i % 3 == 2
        item.right = @items[i-2]
      else
        item.right = @items[i+1]
      end
      if i > 5
        item.below = @items[i-6]
      else
        item.below = @items[i+3]
      end
    end
  end

  # フレーム内の指定範囲の数字を取得
  # @param target_cell とってきたい対象のインデックス
  # @block rightかbelowか
  def get_frame_line target_item
    vals = []
    3.times do |i|
      vals << target_item.value
      target_item = yield(target_item)
    end
    vals
  end
end

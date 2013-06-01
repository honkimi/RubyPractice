require './sudoku/frame'
require './sudoku/cell'
require './sudoku/output'

class Sudoku
  FRAME_NUM = 9
  @@empty_count = 0

  def initialize(data)
    frames = []
    data.each do |d1|
      cells = []
      d1.each do |d2|
        cells << Cell.new(d2)
        @@empty_count += 1 if d2.nil?
      end
      frames << Frame.new(cells)
    end

    @form = Form.new(frames)
  end

  def get_empty_count
    @@empty_count
  end

  def set_choise_in_empty_cells
    updated = false
    #フレームごとのループ
    FRAME_NUM.times do |f|
      #セルごとのループ
      FRAME_NUM.times do |c|
        next if get_item(f).get_item(c).exist
        choises = []
        # 縦、横、フレーム内の存在する値を取得
        choises << get_below_line_num(f,c) << get_right_line_num(f,c) << get_frame_num(f)
        choises = (1..9).to_a - choises.flatten.compact
        #候補が一個しかなければ、その時点で確定
        if choises.length == 1
          get_item(f).get_item(c).value = choises[0]
          @@empty_count -= 1
          updated = true
        else
          get_item(f).get_item(c).choise = choises
        end
      end
    end
    return updated
  end

  # 各フレーム内セルの候補の中で一つだけ存在する値を探す。
  # その値があれば、それをセット
  def find_number
    #フレームごとのループ
    FRAME_NUM.times do |f|
      single_num = find_single_num_in_each_cell(f)
      next unless single_num
      set_single_num(f, single_num)
   end
  end

  # フレーム内の候補をカウントアップして、唯一の候補を選び出す。
  # return num もしフレーム内候補でユニークな候補があった場合
  # return nil ユニークな候補がない場合
  def find_single_num_in_each_cell(frame_index)
    #セルごとのループ
    cnt_map = {}
    FRAME_NUM.times do |c|
      cell = get_item(frame_index).get_item(c)
      next if cell.exist
      cell.choise.each do |s|
        cnt_map[s] = cnt_map[s] ? cnt_map[s]+=1 : 1
      end
    end
    single_num = nil
    cnt_map.each {|key, value| single_num = key if value == 1 }
    single_num
  end

  def set_single_num(frame_index, single_num)
    FRAME_NUM.times do |c|
      cell = get_item(frame_index).get_item(c)
      next if cell.exist
      next unless cell.choise.include?(single_num)
      cell.value = single_num
      @@empty_count -= 1
    end
  end

  def get_frame_num(frame_num)
    get_item(frame_num).get_all().map { |v| v = v.value }
  end

  def get_below_line_num(frame_num, cell_num)
    num = []
    get_below_line(frame_num).each do |frame|
      num << frame.get_below_line(cell_num)
    end
    num.flatten
  end

  def get_right_line_num(frame_num, cell_num)
    num = []
    get_right_line(frame_num).each do |frame|
      num << frame.get_right_line(cell_num)
    end
    num.flatten
  end

  def method_missing(action, *args)
    @form.send(action, *args)
  end

  def to_s
    Output.new(self).write
  end
end

require './sudoku/sudoku'
require './data/seed'

sudoku = Sudoku.new(Seed.getSeed)
sudoku.to_s

#空のセル領域がなくなるまで
while sudoku.get_empty_count != 0
  # 候補を各空のセルに入れる。候補を作っている時点で1つのものが
  # 決まった場合は、それを入れた後に候補作り直し。
  modified = sudoku.set_choise_in_empty_cells
  # 空のセルの候補で1つしかないものがなくなった場合、
  # 各フレームの中で唯一の候補を見つけていく
  sudoku.find_number unless modified
end

sudoku.to_s

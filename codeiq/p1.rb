#$this->tasks = array(
#      array('fee' => 130, 'day' => 9),
#      array('fee' => 150, 'day' => 12),
#      array('fee' => 190, 'day' => 20),
#      array('fee' => 190, 'day' => 23),
#      array('fee' => 230, 'day' => 27),
#      array('fee' => 290, 'day' => 33),
#      array('fee' => 330, 'day' => 31),
#      array('fee' => 70, 'day' => 9),
#      array('fee' => 330, 'day' => 30),
#      array('fee' => 110, 'day' => 9),
#      array('fee' => 90, 'day' => 6),
#      array('fee' => 310, 'day' => 34),
#      array('fee' => 330, 'day' => 34),
#      array('fee' => 190, 'day' => 22),
#      array('fee' => 230, 'day' => 25),
#      array('fee' => 170, 'day' => 13),
#      );
#  100日間で最大の報酬を得られる組み合わせを５０００回以内の施行でみつけなさい。

class CalcTask
  DAYS = 100
  def initialize
    @tasks = [
        {fee: 130, day: 9}  ,
        {fee: 150, day: 12} ,
        {fee: 190, day: 20} ,
        {fee: 190, day: 23} ,
        {fee: 230, day: 27} ,
        {fee: 290, day: 33} ,
        {fee: 330, day: 31} ,
        {fee: 70, day: 9}   ,
        {fee: 330, day: 30} ,
        {fee: 110, day: 9}  ,
        {fee: 90, day: 6}   ,
        {fee: 310, day: 34} ,
        {fee: 330, day: 34} ,
        {fee: 190, day: 22} ,
        {fee: 230, day: 25} ,
        {fee: 170, day: 13} 
      ]
  end
  
  def exec
    max_task = find_max(@tasks)
    leftdays = DAYS - max_task[:day]
  end

  def find_max(tasks)
    max_task = nil
    tasks.each do |n|
      unit = calc_unit(n)
      max_task = n if max_task.nil? || calc_unit(max_task) < unit
    end
    max_task
  end

  def calc_unit(task)
    return task[:fee] / task[:day]
  end
end

calc = CalcTask.new
calc.exec


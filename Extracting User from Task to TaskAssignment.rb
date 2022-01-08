# TASKS
          
# id  user_id   name         due  start      created_at updated_at
# 1     3      chickens
# 2     3      chickens
# 3    NULL      cow

class Task
  belongs_to :user, optional: true
end

# TASKS
          
# id     name         due  start      created_at updated_at
# 1       chickens
# 2       chickens
# 3       cow

# TASK_ASSIGNMENTS

# id      user_id   task_id
#           5         2
#           5         3

class Task
  has_one :task_assignment
  has_one :user, through: :task_assignment
end

class TaskAssignment
  belongs_to :user
  belongs_to :task
end

# TASK_ASSIGNMENTS

# id      user_id   task_id
#           5         2
#           5         3
#           3         3

class Task
  has_many :task_assignments
  has_many :users, through: :task_assignments
end

class TaskAssignment
  belongs_to :user
  belongs_to :task
end


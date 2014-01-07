json.array!(@tasks) do |task|
  json.extract! task, :name, :deadline, :done, :duration
  json.url task_url(task, format: :json)
end

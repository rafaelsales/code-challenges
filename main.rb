require_relative 'app'

app = StudentsApp.new(comma_file: "./fixtures/comma.txt",
                      dollar_file: "./fixtures/dollar.txt",
                      pipe_file: "./fixtures/pipe.txt")
app.run!

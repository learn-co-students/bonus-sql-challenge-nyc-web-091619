require_relative "../config/environment.rb"

def run(command, args = nil)
    DB.execute(command, args)[0]
end
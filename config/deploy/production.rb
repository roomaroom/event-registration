set :stage, :production

role :app, %w{school@188.190.164.54}
role :web, %w{school@188.190.164.54}
role :db,  %w{school@188.190.164.54}

# Define server(s)
server '188.190.164.54', user: 'school', roles: %w{web}

# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
    forward_agent: false,
    auth_methods: %w(password),
    password: 'natalo4ka',
    user: 'school'
}

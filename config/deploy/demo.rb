server 'localhost', roles: %w{web app db}, :primary => true
set :repo_url, "git@github.com:mevada/ticket-demo.git"
set :branch, "main"
set :ssh_options, {
  user: "ashvinaspire",
  forward_agent: true,
  keys: [File.join(ENV["HOME"], ".ssh", "qa_plumslice_net_keypair.pem")]
}
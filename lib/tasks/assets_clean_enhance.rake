#TODO - Rack for heroku db:migrate invoke after push
Rake::Task['assets:clean'].enhance do
  Rake::Task['db:migrate'].invoke
end
# auto load rails tasks
require 'sunspot/rails/tasks'

# hack to remove 'sunspot:reindex' task and add our own
Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end

Rake.application.remove_task('sunspot:reindex')

# override the tasks that depends on active record
namespace :sunspot do
  
  desc "Reindex all solr models that are located in your application's models directory. (Batch size ignored)"
  # This task depends on the standard Rails file naming \
  # conventions, in that the file name matches the defined class name. \
  # By default the indexing system works in batches of 50 records, you can \
  # set your own value for this by using the batch_size argument. You can \
  # also optionally define a list of models to separated by a forward slash '/'
  # 
  # $ rake sunspot:reindex                # reindex all models
  # $ rake sunspot:reindex[1000]          # reindex in batches of 1000
  # $ rake sunspot:reindex[false]         # reindex without batching
  # $ rake sunspot:reindex[,Post]         # reindex only the Post model
  # $ rake sunspot:reindex[1000,Post]     # reindex only the Post model in
  #                                       # batchs of 1000
  # $ rake sunspot:reindex[,Post+Author]  # reindex Post and Author model
  task :reindex, [:batch_size, :models] => [:environment] do |t, args|
    unless args[:models]
      all_files = Dir.glob(Rails.root.join('app', 'models', '*.rb'))
      all_models = all_files.map { |path| File.basename(path, '.rb').camelize.constantize }
      sunspot_models = all_models.select { |m| m.respond_to?(:searchable?) and m.searchable? }
    else
      sunspot_models = args[:models].split('+').map{|m| m.constantize}
    end
    sunspot_models.each do |model|
      puts "Re-indexing #{model.name}"
      bar = ProgressBar.new(model.count)
      Sunspot.remove_all(model)
      model.each do |element|
        Sunspot.index!(element)
        bar.increment!
      end
    end
  end
end

ThinkingSphinx::Index.define :movie, with: :active_record, delta: true do

  indexes title, sortable: true
  indexes description
  indexes actors.name, as: :actors
  indexes genre

end

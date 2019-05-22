require 'diary'

describe Diary do
  it 'adds an entry to the diary' do
    # create a double for an entry
    entry_double = double :entry
    # create a double for the entry class, so that when .new is called, it uses the entry_double
    entry_class_double = double :entry_class, new: entry_double
    # create a new diary with the class double passed into the initialize method
    diary = Diary.new(entry_class_double)

    # set up the test
    expect(diary.add("Diary Entry 1", "This happened")).to eq [entry_double]
  end

  it 'adds two entries to the diary' do
    entry_double = double :entry
    entry_class_double = double :entry_class, new: entry_double
    diary = Diary.new(entry_class_double)

    diary.add("Diary Entry 1", "This happened")
    expect(diary.add("Diary Entry 2", "That happened")).to eq [entry_double, entry_double]
  end

  it 'produces an index of all diary entries' do
    entry_double = double :entry, title: "Diary Entry 1"
    entry_class_double = double :entry_class, new: entry_double
    diary = Diary.new(entry_class_double)

    diary.add("It doesn't matter", "what I put here")
    # I can't change the title because the class was doubled with just creating the original entry double
    diary.add("Because I already", "set up the double title")
    expect(diary.index).to eq "Diary Entry 1\nDiary Entry 1"

  end
end

require 'note'

describe Note do
  it 'creates a note' do
    title = "Today's exercise"
    body = "We are doing dependency injection"
    formatter_double = double :NoteFormatter, format: "Title: #{title}\n#{body}"
    note = Note.new(title, body, formatter_double)
    expect(note.display).to eq "Title: #{title}\n#{body}"
  end
end

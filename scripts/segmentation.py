import mido
import music21 as m21

# Load the MIDI file
midi_file = mido.MidiFile('path/to/midi/file.mid')

# Create a Music21 stream from the MIDI file
music_stream = m21.translate.midiFileToStream(midi_file)


# Define a function to segment the notes based on a domain
def segment_notes(notes, domain):
    segments = []
    current_segment = []
    previous_value = None
    for note in notes:
        value = getattr(note, domain)
        if value != previous_value:
            if current_segment:
                segments.append(current_segment)
            current_segment = []
        current_segment.append(note)
        previous_value = value
    if current_segment:
        segments.append(current_segment)
    return segments


# Segment the notes based on different domains
segmented_notes = {}
segmented_notes['pitch_class'] = segment_notes(music_stream.flat.notes, 'pitchClass')
segmented_notes['dynamics'] = segment_notes(music_stream.flat.notes, 'velocity')
segmented_notes['timbre'] = segment_notes(music_stream.flat.notes, 'instrument')
segmented_notes['register'] = segment_notes(music_stream.flat.notes, 'octave')
segmented_notes['contour'] = segment_notes(music_stream.flat.notes, 'contour')

# Label the segments based on their domain value
labeled_segments = {}
for domain, segments in segmented_notes.items():
    labeled_segments[domain] = {}
    for i, segment in enumerate(segments):
        label = segment[0].__getattribute__(domain)
        labeled_segments[domain][f'segment_{i}'] = {'notes': segment, 'label': label}

# Output the segmented notes and their labels
for domain, segments in labeled_segments.items():
    print(f'{domain}:')
    for segment_name, segment in segments.items():
        notes = [note.pitch.midi for note in segment['notes']]
        label = segment['label']
        print(f'Segment {segment_name}: {notes} ({label})')

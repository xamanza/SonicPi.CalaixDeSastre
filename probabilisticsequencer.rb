#  code borrowed from https://magpi.raspberrypi.org/articles/probabilistic-sequencer
#  // Remixed code by d--X  ////  (((( d-_-b ))))
use_bpm 60
live_loop :multi_beat do
  use_random_seed 5
  8.times do
    c = rrand(70, 130)
    n = (scale :d1, :minor_pentatonic).take(3).choose
    synth :blade , note: n, amp: 0.7,  release: 0.2, cutoff: c if rand < 0.9
    sample :elec_hi_snare, amp: 1.9 if one_in(32)
    sample :elec_snare, amp: 1.1 if one_in(32)
    sample :elec_blup , amp: 2.1 if one_in(12)
    sample :drum_cymbal_closed, amp: 0.9 if one_in(3)
    sample :drum_cymbal_closed, amp: 0.6 if one_in(1)
    sample :drum_cymbal_pedal, amp: 0.5 if one_in(3)
    sample :bd_tek, amp: 0.6 if one_in(1)
    sample :bd_haus, amp: 0.8 if one_in(6)
    sample :bd_haus, amp: 3 if one_in(16)
    sleep 0.166
    
  end
end

loop do
  if one_in(7)
    sample :bd_haus, amp: 3
  else
    sample :drum_cymbal_closed, amp: 0.4
  end
  sleep 0.166
end



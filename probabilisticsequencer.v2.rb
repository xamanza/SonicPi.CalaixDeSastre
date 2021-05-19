# Hello Tech //// borrowed from https://magpi.raspberrypi.org/articles/probabilistic-sequencer
#  // Remixed code by d--X  ////  (((( d-_-b )))) 2021
live_loop :multi_beat do
  #####ChangePattern with the rand value
  use_random_seed 6
  #####FX  mix:0 = NO FX
  with_fx :krush, mix: 0.33 do
    with_fx :whammy, mix: 0.083 do
      with_fx :echo, mix: 0.062, decay: 11 do
        #####StepStruct
        18.times do
          c = rrand(30, 60)
          n = (scale :g2, :minor_pentatonic).take(2).choose
          #####non·beatz
          synth :beep, amp: 0.042, note: 1.5*n, release: 3.1, cutoff: c if rand < 44
          #synth :dark_ambience, amp: 3.5, note: 1.5*n, release: 1.1, cutoff: c if rand < 44
          #synth :beep, amp: 0.2, note: 1.5*n, release: 0.07, cutoff: c if rand < 0.8
          synth :piano, amp: 0.2213, note: 3*n, release: 0.09, cutoff: c if rand < 40
          synth :piano, amp: 0.25, note: 1.5*n, release: 0.018, cutoff: c if rand < 33
          #sample :bass_dnb_f , amp: 0.1881, release: 0.07, rate: -0.7
          sample :bass_dnb_f , amp: 0.0881, release: 0.17, rate: -1.4
          #sample :bass_dnb_f , amp: 0.4881, release: 2.17, rate: -0.05
          #####beatz
          sample :elec_hi_snare, amp: 1 if one_in(12)
          sample :elec_blip2 , amp: 0.8 if one_in(16)
          sample :drum_cymbal_closed, amp: 0.2 if one_in(1)
          sample :drum_cymbal_soft , amp: 0.1, attack: 0.1 if one_in(6)
          sample :bd_haus, amp: 1 if one_in(12)
          #sample :bd_tek, amp: 1, note: n if one_in(16)
          sample :drum_cymbal_pedal, amp: 0.9 if one_in(7)
          sample :bd_haus, amp: 0.48 if one_in(5)
          sample :bd_boom , amp: 1.66 if one_in(16)
          sleep 0.166
        end
      end
    end
  end
end

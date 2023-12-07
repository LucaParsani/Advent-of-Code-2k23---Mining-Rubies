# Advent-of-Code-2k23---Mining-Rubies

This year I decided to try solving the Advent of Code using only Ruby, let's see how it goes lol <br>
The algorithms are not going to be optimized and/or could be extremely horrifying, I am trying to take a script-like approach and I will try to solve them with the least effort possible while having fun<br>

- Day 1:
  - The string manipulation using regular expressions is waaaaaaay efficient. Almost made this too easy, looking forward to unravel other Ruby wonders
- Day 2:
  - It's kinda weird that the best practice for methods is not ```return variable``` but just ```variable```, i'll live with that. Also, I lost a loooot of time because i forgot comparisons with regular expressions are made with ```=~``` and not ```==```. Still, I'm really enjoying this language
- Day 3:
  - The ```.each_with_index``` method for iteration made the difference, really sweet. Overall, a lot of code in this exercise but it wasn't too difficult, somehow I lost very little time debugging
- Day 4:
  - I'm getting used to the negative if clause, ```unless```. It's really handy, saves me writing a negative condition every time I need one. Also, for the fourth day in a row regexp substitution in strings saved me. All in all, pretty straightforward kata, if only I didn't lose 10 minutes debugging only to figure out the problem was i counted EOF as a card
- Day 5:
  - Boy, this was tough. Part 1 went through like a breeze, but I didn't have the time to come up with a better solution for Part 2, so I ended up bruteforcing it. An ugly approach, I know, but I didn't want to waste my time on this, so I let the script run in background while I was working. On a side note, I found out the name variables shouldn't have uppercase letters per best practice, so I am starting to name them accordingly
- Day 6:
  - No comment on this one. Way too easy
- Day 7:
  - I lost a shit ton of time for a peculiarity of custom sort algorithms. Apparently, ```array.sort``` doesnt sort the array itself, but creates a sorted copy. So i had to add a ```!``` to overwrite the original with the copy, ```array.sort!```. I am sooo mad for this lol

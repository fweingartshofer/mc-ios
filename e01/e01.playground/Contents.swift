import Foundation

let sw = [
      "Luke Skywalker": [4, 5, 6],
     "Obi-Wan Kenobi": [1, 2, 3, 4, 5, 6],
     "Darth Vader": [3, 4, 5, 6]
     ]

var sum = 0.0

for char in sw {
  let allEpisodes = char.value.count == 6
  print("\(char.key) appeared in \(allEpisodes ? "all episodes" : "\(char.value.count) episode(s)")")

  sum += Double(char.value.count)
  
  if allEpisodes {
    continue
  }
  
  for ep in char.value {
    print("- Episode: \(ep)")
  }
}

print("Average: \(round(sum / Double(sw.count) * 100) / 100)")



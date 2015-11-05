import Cocoa

/*:

Your prior goal was to:

* generate a string, 20 characters long, with letters randomly selected
    * based on probability of each letter occuring in all (or at least most) English writing

However, this is not quite how a Markov Chain works.

A Markov chain makes selections based on an analysis of *only* the input text provided.

So, let's move to the next step.

Consider the text below. Re-execute the playground a few times.

*/

let input = getRandomSequence()

input

/*:

What do you notice about the input text each time you run the playground?

Your next step is to take what you have learned from prior playgrounds, and, write an algorithm in plain English that you think would accomplish this goal:

* determine the probability with which a given letter occurs in the input text
* build an output string that is 30 characters long
    * letters occur in the output string based on the proabability with which they occurred in the input string

*/

/*:

Here is the *first part* of the algorithm we built together in class:

![algorithm-part1](algorithm-part1.png "part1")

Here is the implementation:

*/

// create empty list of probabilities (dictionary)
var letterCounts = [Character: Int]()

// loop over the input string
for letter in input.characters {
    
    // inspect each character
    letter
    // build the dictionary (list) of letter counts
    if letterCounts[letter] == nil {
        letterCounts[letter] = 1        // first time for this letter!
    } else {
        // we KNOW this letter is in the dictionary. WE KNOW IT
        // ... so just add 1 to the current count
        letterCounts[letter]! = letterCounts[letter]! + 1
    }
    
}

// This is the dictionary we have built – it actually shows letter COUNTS, not probabilities – YET.
letterCounts

/*:

Here is the second part of the algorithm we built today:

![algorithm-part2](algorithm-part2.png "part2")

Here is the implementation:


*/
//Get length of input string
input.characters.count

//Create and empty dictionary to store probabilities
var letterProbabilities = [Character: Float]()

//Loop over list of letter counts
for (letter, count) in letterCounts {
    // Add and entry to the probabilites dictionary
    letterProbabilities[letter] = Float(count) / Float(input.characters.count) * 100
    
}

letterProbabilities


//check probabilites add to 100

var total: Float = 0.0
for (letter, probability) in letterProbabilities {
    total = total + probability
    total
}


// Build Output String
var outputString: String = ""
for i in 1...30{
    
    //generate random value
    let newRandomValue = arc4random_uniform(1000)
    
    let newRandomValueFloat = Float(newRandomValue) / 10
    
    
    //Loop through probabilities in dictionary
    //add probabilities to determine "upperValue"
    //check when lower value is less than upper value of a specific interval
    
    var upperValue: Float = 0.0
    for (letter, probability) in letterProbabilities {
        
        
        //determine the new upper value
        upperValue += probability
        
        //check lower boundary
        if (newRandomValueFloat < upperValue) {
            
            outputString += String(letter)
            
            //stop loop
            break
        
    }
    
}

}

//dislay output
outputString


outputString.characters.count










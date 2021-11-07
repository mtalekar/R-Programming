#named Vector
charlie <- 1:5
charlie

#give names
names(charlie)
?names
names(charlie) <- c("a","b","c","d","e")
charlie
charlie["d"]
names(charlie)
charlie[4]

#clear names
names(charlie) <- NULL
charlie
charlie[4]

#-----------------------------------
#Naming Matrix Dimensions
temp.vec <- rep(c("a","B","zZ"), each=3)
temp.vec

bravo <- matrix(temp.vec, 3,3)
bravo

rownames(bravo)
rownames(bravo) <- c("how","are","you")
bravo

colnames(bravo)
colnames(bravo) <- c("x","y","z")
bravo

bravo["are","y"]

rownames(bravo) <- NULL
bravo
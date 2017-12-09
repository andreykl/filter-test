# Filter Test

A small test programm which reads the file, fitlers it and writes filtered
lines to output file.

## To build and run it you need
[stack](https://docs.haskellstack.org/en/stable/README/)

After you've installed stack, do
* stack build
* stack exec filter-test-exe

Stack build most likely will give you errors that you don't have lib*-devel
installed. You need install what it asks you for.

## Tiny description

Filtering code is located in file `src/Lib.hs`. `Lib.hs` exports two functions,
namely `runFilterEmails` and `runFilterNumbersRu`. They both are just wrappers
for `filterFile` (in turn, wrapped by `runFilter`). The `filterFile` can be used
without any wrappers: `filterFile "/tmp/inputfile.txt"
"/tmp/output-emails.txt" (filter $ elem '@')`

To run `filterFile` from ghci do
* stack ghci
* `filterFile "/tmp/inputfile.txt" "/tmp/output-emails.txt" (filter $ elem '@')`

File `app/Main.hs` contains only work with GTK.


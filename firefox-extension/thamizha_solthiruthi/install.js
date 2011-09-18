var err = initInstall("ThamiZha! Solthiruthi(Tamil spellchecker)", "mugunth@thamizha.com", "0.1");
if (err != SUCCESS)
    cancelInstall();

var fProgram = getFolder("Program");
err = addDirectory("", "mugunth@thamizha.com",
		   "dictionaries", fProgram, "dictionaries", true);
if (err != SUCCESS)
    cancelInstall();

performInstall();

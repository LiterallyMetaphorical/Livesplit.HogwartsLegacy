/*
Scanning Best Practices:

bool loading
just a boolean, set "Memory Scan Options" to Dead Space.exe - 1 on loading screen, 0 everywhere else

string quest
UTF String
From a fresh game, get past the health tutorial and walk out to the cliff for a bit.

In the Menus                   // 7209033
On Quest: The Path to Hogwarts // 7209039
On Quest: Welcome to Hogwarts  // 7209039
*/

state("HogwartsLegacy", "Steam v1.0")
{
    bool loading    : 0x90B2AA0;
    string250 quest : 0x08F057C8, 0x140, 0x0;
}

init
{
switch (modules.First().ModuleMemorySize) 
    {
        case 428994560: 
            version = "Steam v1.0";
            break;
    default:
        print("Unknown version detected");
        return false;
    }
}

startup
  {
	// Asks user to change to game time if LiveSplit is currently set to Real Time.
		if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Hogwarts Legacy",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );

        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

onStart
{
    // This makes sure the timer always starts at 0.00
    timer.IsGameTimePaused = true;
}

start
{
    return 
        (
            old.quest.Contains("Menus") && current.quest.Contains("Path to Hogwarts")
        );
}

split
{
    return
    ( 
    current.quest.Contains("Welcome to Hogwarts") && old.quest.Contains("Path to Hogwarts")                  || // moves split from The Path to Hogwarts - Welcome to Hogwarts
    
    //These two cover for either choice at the end of "Welcome to Hogwarts"
    current.quest.Contains("Charms")                        && old.quest.Contains("Welcome to Hogwarts")     || // moves split from The Path to Hogwarts - Welcome to Hogwarts
    current.quest.Contains("Defense Against the Dark Arts") && old.quest.Contains("Welcome to Hogwarts")     || // moves split from The Path to Hogwarts - Welcome to Hogwarts

    //These 4 cover both decisions at the end of either quest (DATDA and Charms)
    current.quest.Contains("Charms")                        && old.quest.Contains("Defense Against the Dark Arts") || // moves split from Welcome to Hogwarts - Defense Against the Dark Arts
    current.quest.Contains("Defense Against the Dark Arts") && old.quest.Contains("Charms")                        || // moves split from Defense Against the Dark Arts - Charms
    current.quest.Contains("Hogwarts")                      && old.quest.Contains("Defense Against the Dark Arts") || // moves split from Welcome to Hogwarts - Defense Against the Dark Arts
    current.quest.Contains("Hogwarts")                      && old.quest.Contains("Charms")                        || // moves split from Defense Against the Dark Arts - Charms

    //Covers you if you don't do WAC Skip
    current.quest.Contains("Hogwarts")            && old.quest.Contains("Crossed Wands - Round 1")           || // moves split from Charms - Crossed Wands Round 1

    current.quest.Contains("Hogwarts")            && old.quest.Contains("Weasley After Class")               || // moves split from Charms - Weasley After Class
    current.quest.Contains("Hogwarts")            && old.quest.Contains("Professor Ronen's Assignment")      || // moves split from Weasley After Class - Professor Ronen's Assignment
    current.quest.Contains("Hogwarts")            && old.quest.Contains("Welcome to Hogsmeade")              || // moves split from Professor Ronen's Assignment - Welcome to Hogsmeade
    current.quest.Contains("Hogwarts")            && old.quest.Contains("The Locket's Secret")               || // moves split from Welcome to Hogsmeade - The Locket's Secret

    //covers for when you do WAC skip, and need to do Round 1/2 of CW back to back
    current.quest.Contains("Professor Hecat's Assignment 1")&& old.quest.Contains("Crossed Wands - Round 1") ||
    current.quest.Contains("Professor Hecat's Assignment 1")&& old.quest.Contains("Crossed Wands - Round 2") || 

    current.quest.Contains("Hogwarts")            && old.quest.Contains("Spell Combination Practice 1")      || // moves split from Crossed Wands Round 2 - Spell Combination Practice 1
    current.quest.Contains("Hogwarts")            && old.quest.Contains("Professor Hecat's Assignment 1")    || // moves split from Spell Combination Practice 1 - Professor Hecat's Assignment 1
    current.quest.Contains("Hogwarts")            && old.quest.Contains("Secrets of the Restricted Section") || // moves split from Professor Hecat's Assignment 1 - Secrets of the Restricted Section
    current.quest.Contains("Hogwarts")            && old.quest.Contains("Tomes and Tribulations")            || // moves split from Secrets of the Restricted Section - Tomes and Tribulations
    current.quest.Contains("Hogwarts")            && old.quest.Contains("Herbology Class")                   || // moves split from Tomes and Tribulations - Herbology Class
    current.quest.Contains("Hogwarts")            && old.quest.Contains("Potions Class")                     || // moves split from Herbology Class - Potions Class
    current.quest.Contains("Trials of Merlin")    && old.quest.Contains("The Girl from Uagadou")             || // moves split from Potions Class - The Girl from Uagadou
    current.quest.Contains("Highlands")           && old.quest.Contains("Trials of Merlin")                  || // moves split from The Girl from Uagadou - Trials of Merlin
    current.quest.Contains("Hogwarts")           && old.quest.Contains("The Missing Pages")                  || // moves split from The Girl from Uagadou - Trials of Merlin   
    current.quest.Contains("Hogwarts") && old.quest.Contains("Professor Hecat's Assignment 2")  || // moves split from HOUSE SPECIFIC QUEST #1 - Professor Hecat's Assignment 2
    current.quest.Contains("Hogwarts") && old.quest.Contains("Jackdaw's Rest")                  || // moves split from Professor Hecat's Assignment 2 - Jackdaw's Rest
    current.quest.Contains("Hogwarts") && old.quest.Contains("Flying Class")                    || // moves split from Jackdaw's Rest - Flying Class
    current.quest.Contains("Hogwarts") && old.quest.Contains("In the Shadow of the Undercroft") || // moves split from Flying Class - In the Shadow of the Undercroft
    current.quest.Contains("Hogwarts") && old.quest.Contains("The Room of Requirement")         || // moves split from In the Shadow of the Undercroft - The Room of Requirement
    current.quest.Contains("Hogwarts") && old.quest.Contains("The Map Chamber")                 || // moves split from The Room of Requirement - The Map Chamber
    current.quest.Contains("Hogwarts") && old.quest.Contains("Percival Rackham’s Trial")        || // moves split from The Room of Requirement - The Map Chamber
    current.quest.Contains("Hogwarts") && old.quest.Contains("Beasts Class")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("The Caretaker’s Lunar Lament")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("The Helm of Urtkot")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("In the Shadow of the Estate")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("The Elf, The Nab-Sack, and the Loom")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("Astronomy Class")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("Professor Garlick’s Assignment 1")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("The High Keep")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("Back on the Path")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("Fire and Vice")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("Professor Weasley’s Assignment")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("In the Shadow of the Mine")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("It’s All Gobbledegook")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("The Headmistress Speaks")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("The Polyjuice Plot")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("Niamh Fitzgerald’s Trial")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("In the Shadow of the Mountain")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("Lodgok’s Loyalty")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("San Bakar’s Trial")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("Wand Mastery")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("The Final Repository")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("Weasley’s Watchful Eye")        || // moves split from The Map Chamber - Percival Rackham’s Trial
    current.quest.Contains("Hogwarts") && old.quest.Contains("The House Cup")         // moves split from The Map Chamber - Percival Rackham’s Trial
    ); 
}

update
{
	//DEBUG CODE 
	//print(modules.First().ModuleMemorySize.ToString());
	//print(current.loading.ToString());
}

isLoading
{
    return current.loading;
}

exit
{
    //pauses timer if the game crashes
	timer.IsGameTimePaused = true;
}
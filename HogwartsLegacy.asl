/*
Scanning Best Practices:

bool loading
just a boolean, set "Memory Scan Options" to HogwartsLegacy.exe - 1 on loading screen, 0 everywhere else

string quest
UTF String
From a fresh game, get past the health tutorial and walk out to the cliff for a bit.

In the Menus                   // 7209033
On Quest: The Path to Hogwarts // 7209039
On Quest: Welcome to Hogwarts  // 7209039
*/

state("HogwartsLegacy", "Steam v0.9")
{
    bool loading    : 0x90B2AA0;
    string250 quest : 0x08F057C8, 0x140, 0x0;
}

state("HogwartsLegacy", "Steam v1.0")
{
    bool loading    : 0x90B5AA0;
    string250 quest : 0x08F087C8, 0x140, 0x0;
}

state("HogwartsLegacy", "Steam v1.1")
{
    bool loading    : 0x90B5B20;
    string250 quest : 0x08F08838, 0x140, 0x0;
}

state("HogwartsLegacy", "Steam v1.2")
{
    bool loading    : 0x9095DE0;
    int  doorload   : 0x8EA7AB8;
    string250 quest : 0x08EE9728, 0x140, 0x0;
    bool questComp  : 0x8EB3020, 0xC0, 0x10, 0x298, 0x90, 0x160, 0xC8;
}

init
{
    //Finds GWorld for the ASL Helper - not sure what the purpose is but thats what it does
    IntPtr gWorld = vars.Helper.ScanRel(3, "48 8B 05 ???????? 48 3B C? 48 0F 44 C? 48 89 05 ???????? E8");
    if (gWorld == IntPtr.Zero)
    {
        vars.Helper.Game = null;
        return;
    }

    // Just a regular case switch, but modified so the ASL Helper can read it.
    switch ((int)vars.Helper.GetMemorySize())
    {
        case 0x1991F000:
            version = "Steam v0.9";
            break;
        case 0x1C351000:
            version = "Steam v1.0";
            break;
        case 0x1BB5C000:
            version = "Steam v1.1";
            break;
        case 0x1C4D3000:
            version = "Steam v1.2";
            break;
        default:
            print("Unknown version detected");
            return false;
    }
}

startup
{
    // Grabs the ASL helper from the components folder so we can use all the ASL helper functions.
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
    vars.Helper.GameName = "Hogwarts Legacy";
    vars.Helper.AlertLoadless();
}

onStart
{
    // This makes sure the timer always starts at 0.00
    timer.IsGameTimePaused = true;
}

start
{
    return
        old.quest == "In the Menus" && current.quest == "On Quest: The Path to Hogwarts" || // New Game Autostart
        old.quest == "In the Menus" && current.quest == "On Quest: Welcome to Hogwarts"; // No Intro Autostart
}

split
{
    return current.questComp && !old.questComp;
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
    // pauses timer if the game crashes
    timer.IsGameTimePaused = true;
}

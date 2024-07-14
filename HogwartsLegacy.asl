// Hogwarts Legacy Load Remover & Autosplitter V1.1.0 (11/03/2023)
// Supports LRT
// Splits can be obtained from
// Script by TheDementedSalad & Meta

//All Strings are UTF-16

state("HogwartsLegacy", "Steam v1.0") {
	bool loading: 0x90B2AA0;
	bool doorload: 0x0;
	bool Startup: 0x8A1D2D0;
	uint Menu: 0x8F057C8, 0x140, 0x0;
	string250 CurrentQuest: 0x8EA7960, 0x100, 0x0;
	string38 Event: 0x0;
	string250 Checkpoint: 0x8ECF098, 0x628, 0x1C0, 0x0;
	string250 LatestQuest: 0x8ECF098, 0xC0, 0x5E0, 0x268, 0x38, 0x0;
   	int broomRingsCount: 0x0;
   	float broomIGT: 0x0;
   	float arenaIGT: 0x0;
}

state("HogwartsLegacy", "Steam v1.2")
{
	bool loading   		: 0x9095DE0;						//1 when loading
	bool doorload  		: 0x8EA7AB8;						//1 when door is loading
	bool Startup 		: 0x8A012D0;						//1 during startup, 0 when shaders come up
	uint Menu 		: 0x8EE9728, 0x140, 0x0;				//Different number depending on Language
	string250 CurrentQuest	: 0x8E8B8E8, 0x100, 0x0;				//Use settings to check your current tracked quest to find this (ONly the INT_01 part)
	string38 Event		: 0x8E8B8E0, 0x498, 0x0;				//-8 base address from CurrentQuest (1st offset may move slightly on updates)
	string250 Checkpoint	: 0x8EB3020, 0x628, 0x1C0, 0x0;				//Tells you what your checkpoint is on the current tracked quest
	string250 LatestQuest	: 0x8EB3020, 0xC0, 0x5E0, 0x268, 0x38, 0x0;		//After completing a main quest, Type the ID for it (Do not reload after this)
}

state("HogwartsLegacy", "Steam v1.3")
{
   	bool loading   		: 0x90B52A0;
	bool doorload  		: 0x8EC6EF8;
	bool Startup 		: 0x8A202D0;
	uint Menu		: 0x8F08BA8, 0x140, 0x0;
	string250 CurrentQuest	: 0x8EAAD28, 0x100, 0x0;
	string38 Event		: 0x8EAAD20, 0x4E8, 0x0;
	string250 Checkpoint	: 0x8ED2470, 0x628, 0x1C0, 0x0;
	string50 LatestQuest	: 0x8ED2470, 0xC0, 0x5E0, 0x268, 0x38, 0x0;
   	int broomRingsCount     : 0x08ED2470, 0xC0, 0x20, 0x20, 0x488, 0x428, 0x34C;
   	float broomIGT          : 0x08ED2470, 0xC0, 0x20, 0x20, 0x488, 0x428, 0x378;
   	float arenaIGT          : 0x0926EE70, 0x50, 0xA0, 0x40, 0xB8, 0x398, 0x2EC;
}

state("HogwartsLegacy", "Steam v1.4")
{
    	bool loading   		: 0x91F6120;
	bool Startup 		: 0x8B5D2F0;
	uint Menu		: 0x904B338, 0x140, 0x0;
	string250 CurrentQuest	: 0x8FEBE20, 0x100, 0x0;
	string38 Event		: 0x8FEBE18, 0x4E8, 0x0;
	string250 Checkpoint	: 0x9013650, 0x628, 0x1C8, 0x0;
	string50 LatestQuest	: 0x9013650, 0xC0, 0x5E0, 0x268, 0x38, 0x0;
}

state("HogwartsLegacy", "Steam v1.5")
{
	bool loading   		: 0x9238320;
	bool Startup 		: 0x8B9F2F0;
	uint Menu		: 0x908D4F8, 0x140, 0x0;
	string250 CurrentQuest	: 0x902DF60, 0x100, 0x0;
	string38 Event		: 0x902DF70, 0x4E8, 0x0;
	string250 Checkpoint	: 0x9055790, 0x628, 0x1C8, 0x0;
	string50 LatestQuest	: 0x9055790, 0xC0, 0x5E0, 0x268, 0x38, 0x0;
}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");

	//settings.Add("LRT", false, "Load Remover (Official)");
	//settings.Add("Door", false, "Load Remover With Door Loads Removed (Test)");

	settings.Add("Arena IGT", false, "Use Arena In-Game Time for primary timer. SELECT ONLY ONE.");
	settings.Add("Broom Trial IGT", false, "Use Broom Trial In-Game Time for primary timer. SELECT ONLY ONE.");

	settings.Add("MQuests", false, "Main Quest Splits");
	settings.CurrentDefaultParent = "MQuests";
	settings.Add("INT_01_CP5_Intro_Journal05", false, "Path to Hogwarts");
	settings.Add("WEK_01_WalkingWithWeasley_QuestActive_StepJournal09", false, "Welcome to Hogwarts");
	settings.Add("ZZD_01_04_Journal", false, "Defence Against the Dark Arts");
	settings.Add("ZZC_01_TalkToRonen_StepJournal", false, "Charms Class");
	settings.Add("WET_01_SpellPractice_QuestAvailalbe_Journal", false, "Weasley After Class");
	settings.Add("ZSR_01_03_ReturnToRonen_Journal", false, "Professor Ronen's Assignment");
	settings.Add("OLI_01_02_ToHogsmeade_QuestActive_StepJournal06", false, "Welcome to Hogsmeade");
	settings.Add("Fig_01_CONV_MapFound_Journal01", false, "The Locket's Secret");
	settings.Add("FIG_01_TomesandTribulations_QuestActive_StepJournal09", false, "Secrets of the Restricted Section");
	settings.Add("FIG_1B_EpilogueToAdventure_QuestAvailable_JournalRollover", false, "Tomes and Tribulations");
	settings.Add("ZZH_01_Herbology1_QuestActive_StepJournal07", false, "Herbology Class");
	settings.Add("ZZP_01_ReturnToSharp_StepJournal", false, "Potions Class");
	settings.Add("HER_Conv_01_TheGirlFromCharmsClass_QuestActive_StepJournal01", false, "The Girl From Uagadou");
	settings.Add("MRT_TrialsofMerlin_QuestActive_StepJournal06", false, "Trials of Merlin");
	settings.Add("FGM_01_RAV_TheMissingPages_QuestActive_StepJournal02", false, "Ollivander's Heirloom");
	settings.Add("FGM_02_JackdawsRest_QuestActive_StepJournal07", false, "Jackdaw's Rest");
	settings.Add("FLY_01_04_ReturnToEverett_Journal", false, "Flying Class");
	settings.Add("SNC_01_01_RoomOfRequirement_QuestActive_StepJournal07", false, "Room of Requirement");
	settings.Add("CNF_01_DepthoftheUndercroft_QuestActive_StepJournal07", false, "Shadow of the Undercroft");
	settings.Add("FGH_01_TheMapChamber_QuestActive_StepJournal05", false, "The Map Chamber");
	settings.Add("FGT_01_TheTower_QuestActive_StepJournal09", false, "Percival Rackham's Trial");
	settings.Add("BEA_01_BeastsClass_QuestActive_StepJournal07", false, "Beasts Class");
	settings.Add("GDW_01_HelpingTheCaretaker_QuestActive_StepJournal06", false, "The Caretaker's Lunar Lament");
	settings.Add("GT01_AGoblinsTreasure_QuestActive_StepJournal08", false, "The Helm of Urktot");
	settings.Add("SNC_02_CollectingBeasts_QuestActive_StepJournal20", false, "The Elf, the Nab-Sack, and the Loom");
	settings.Add("EVC_01_DepthOfAnEstate_QuestActive_StepJournal13", false, "Shadow of the Estate");
	settings.Add("HST_01_Castlebreaking_QuestActive_StepJournal06", false, "The High Keep");
	settings.Add("ZZS_01_07_UseTable_Journal", false, "Astronomy Class");
	settings.Add("PRC_01_CONV_BackOnThePath_QuestActive_StepJournal01", false, "Back on the Path");
	settings.Add("PRC_01_RookwoodsTrial_Journal08", false, "Charles Rookwood's Trial");
	settings.Add("AVM_FireandVice_QuestActive_StepJournal11", false, "Fire and Vice");
	settings.Add("EVJ_01", false, "Shadow of the Mine");
	settings.Add("GT02", false, "It's All Gobbledegook");
	settings.Add("FGD_01_CONV", false, "The Headmistress Speaks");
	settings.Add("FGD_01", false, "The Polyjuice Plot");
	settings.Add("FGB_01", false, "Niamh Fitzgerald's Trial");
	settings.Add("EVT_01", false, "Shadow of the Mountain");
	settings.Add("GT03", false, "Lodgok's Loyalty");
	settings.Add("FIG_07", false, "San Bakar's Trial");
	settings.Add("TIO_01", false, "Wand Mastery");
	settings.Add("Repository", false, "The Final Repository +");
	settings.Add("WEE_01", false, "Weasley's Watchful Eye");
	settings.CurrentDefaultParent = null;

	settings.Add("AQuests", false, "Assignment Splits");
	settings.CurrentDefaultParent = "AQuests";
	settings.Add("ZSI_01_03_ReturnToHecat_Journal", false, "Hecat's Assignment 1 (Incendio)");
	settings.Add("ZZE_01", false, "Hecat's Assignment 2 (Expelliarmus)");
	settings.Add("ZSW_01", false, "Garlick's Assignment 1 (Windgardium Leviosa)");
	settings.Add("ZZF_01", false, "Garlick's Assignment 2 (Flipendo)");
	settings.Add("ZSD_01", false, "Sharp's Assignment 1 (Depulso)");
	settings.Add("ZZN_01", false, "Sharp's Assignment 2 (Diffindo)");
	settings.Add("ZSG_01", false, "Kogawa's Assignment 1 (Glacius)");
	settings.Add("ZZM_01", false, "Kogawa's Assignment 2 (Arresto Momentum)");
	settings.Add("ZZO_01", false, "Onai's Assignment (Descendo)");
	settings.Add("ZSB_01", false, "Howin's Assignment (Bombarda)");
	settings.Add("ZZT_01", false, "Weasley's Assignment (Transformation)");
	settings.CurrentDefaultParent = null;

	settings.Add("SQuests", false, "Side Quest Splits");
	settings.CurrentDefaultParent = "SQuests";
	settings.Add("ZFC_01_DuelingChallange1_QuestActive_StepJournal01", false, "Crossed Wands 1");
	settings.Add("ZFC_02_DuelingChallange2_QuestActive_StepJournal01", false, "Crossed Wands 2");
	settings.Add("ZFC_03", false, "Crossed Wands 3");
	settings.Add("ZFP_01_DummyTrainingPractice_QuestActive_StepJournal03", false, "Training Dummy 1");
	settings.Add("ZFP_02", false, "Training Dummy 2");
	settings.Add("ZAB_01", false, "Summoner's Court 1");
	settings.Add("ZAB_02", false, "Summoner's Court 2");
	settings.Add("ZAB_03", false, "Summoner's Court 3");
	settings.Add("ZAB_04", false, "Summoner's Court 4");
	settings.Add("ZAB_05", false, "Summoner's Court 5");
	settings.Add("EVL_01", false, "Shadow of the Study");
	settings.Add("Time", false, "In the Shadow of Time +");
	settings.Add("EVL_03", false, "Shadow of the Relic");
	settings.Add("DMS_01", false, "The Man Behind The Moons");
	settings.Add("NTR_01", false, "Poached Egg");
	settings.Add("NTR_02", false, "The Centaur and the Stone");
	settings.Add("NTR_03", false, "A Bird in the Hand");
	settings.Add("HER_01", false, "The Lost Child");
	settings.Add("HER_02", false, "A Basis for Blackmail");
	settings.Add("HER_03", false, "Harlow's Last Stand");
	settings.Add("Valour", false, "Venomous Valour +");
	settings.Add("COM_02_04_StepJournal", false, "Like a Moth to a Flame");
	settings.Add("Cache", false, "Cache in the Castle +");
	settings.Add("COM_04", false, "Flying off the Shelves");
	settings.Add("COM_05", false, "Gobs of Gobstones");
	settings.Add("Sweets", false, "'Dissending' For Sweets +");
	settings.Add("COM_19", false, "The Daedalian Keys");
	settings.Add("COM_012", false, "The Lost Astrolabe");
	settings.Add("Carted", false, "Carted Away +");
	settings.Add("TV_02", false, "Ghost of Our Love");
	settings.Add("TV_03", false, "Cursed Tomb Treasure");
	settings.Add("Butterfly", false, "Follow the Butterflies +");
	settings.Add("SNS_01", false, "Interior Decorating");
	settings.Add("COM_32", false, "Flight Test");
	settings.Add("COM_37", false, "A Demanding Delivery");
	settings.Add("COM_33", false, "Sweeping the Competition");
	settings.Add("COM_15", false, "'Mer-ky' Depths");
	settings.Add("Herodiana", false, "The Hall of Herodiana +");
	settings.Add("TR01_01", false, "The Tale of Rowland Oakes");
	settings.Add("Friend", false, "A Friend In Deed +");
	settings.Add("COM_09", false, "Breaking Camp");
	settings.Add("COM_10", false, "Brother's Keeper");
	settings.Add("COM_22", false, "Venemous Revenge");
	settings.Add("COM_30", false, "Absconder Encounter");
	settings.Add("Control", false, "Troll Control +");
	settings.Add("Cabbage", false, "Kidnapped Cabbage +");
	settings.Add("Vase", false, "E-vase-ive Manoeuvre +");
	settings.Add("SNC_03b", false, "The Plight of the House-Elf");
	settings.Add("Biscuit", false, "Take the Biscuit +");
	settings.Add("TTR01_01", false, "'Beeting' a Curse");
	settings.Add("SNS_03", false, "Foal of the Dead");
	settings.Add("ACS_01", false, "Tangled Web");
	settings.Add("Spot", false, "Spot Removal +");
	settings.Add("COM_36", false, "A Thief in the Night");
	settings.Add("COM_34", false, "The Sky Is the Limit");
	settings.Add("COM_27", false, "Rescuing Rococo");
	settings.Add("COM_38", false, "Solved by the Bell");
	settings.Add("COM_28", false, "The Hippogriff Marks the Spot");
	settings.Add("Bell", false, "All's Well That Ends Bell +");
	settings.Add("SNC_05", false, "Phoenix Rising");
	settings.Add("ZZI_01", false, "History of Magic Class");
	settings.Add("PIP01_01", false, "Portrait in a Pickle");
	settings.Add("COM_40", false, "The Unique Unicorn");
	settings.CurrentDefaultParent = null;
}

init
{
	IntPtr gWorld = vars.Helper.ScanRel(3, "48 8B 05 ???????? 48 3B C? 48 0F 44 C? 48 89 05 ???????? E8");
	if (gWorld == IntPtr.Zero){
		vars.Helper.Game = null;
		return;
	}

	vars.Menus = new List<uint>()
	{7209033,7143497,6357060,6619214,2993994324,7209029,2212255528,1437503608,2098194,818622689,2097239,105514561,7274574};

	switch ((int)vars.Helper.GetMemorySize()){
		case 481329152:
			version = "Steam v1.0";
			break;
		case 474820608:
			version = "Steam v1.2";
			break;
		case 465272832:
            version = "Steam v1.3";
            break;
	   	case 483356672:
            version = "Steam v1.4";
            break;
		case 471441408:
            version = "Steam v1.5";
            break;
		default:
        	print("Unknown version detected");
			print("" + (int)vars.Helper.GetMemorySize());
			version = "Steam v1.0";
        	return false;
	}

	vars.completedSplits = new List<string>();
}

onStart
{
    // This makes sure the timer always starts at 0.00
    timer.IsGameTimePaused = true;
}

start
{
    //New game autostart
    //return old.quest == "In the Menus" && current.quest == "On Quest: The Path to Hogwarts" || old.quest == "In the Menus" && current.quest == "On Quest: Welcome to Hogwarts";
    if (current.Event == "Intro_AvatarCreator" && old.Event == "RootLevel" || current.CurrentQuest == "WEK_01" && old.CurrentQuest == "None")
    {
		return true;
    }

    // minigames autostart
	if (settings["Arena IGT"] && old.arenaIGT == 0 && current.arenaIGT > 0)
	{
		return true;
	}

	if (settings["Broom Trial IGT"] && old.broomIGT == 1 && current.broomIGT > 1 || old.broomRingsCount != 0 && current.broomRingsCount == 0)
	{
		return true;
	}
}

update
{
	//DEBUG CODE
	//print(modules.First().ModuleMemorySize.ToString());
	//print(current.loading.ToString());
	/*
	if (old.loading != current.loading) print("Loading: " + old.loading + " -> " + current.loading);
	if (old.doorload != current.doorload) print("Doorload: " + old.doorload + " -> " + current.doorload);
	if (old.Startup != current.Startup) print("Startup: " + old.Startup + " -> " + current.Startup);
	if (old.Menu != current.Menu) print("Menu: " + old.Menu + " -> " + current.Menu);
	if (old.CurrentQuest != current.CurrentQuest) print("CurrentQuest: " + old.CurrentQuest + " -> " + current.CurrentQuest);
	if (old.Event != current.Event) print("Event: " + old.Event + " -> " + current.Event);
	if (old.Checkpoint != current.Checkpoint) print("Checkpoint: " + old.Checkpoint + " -> " + current.Checkpoint);
	if (old.LatestQuest != current.LatestQuest) print("LatestQuest: " + old.LatestQuest + " -> " + current.LatestQuest);*/

	if(timer.CurrentPhase == TimerPhase.NotRunning)
	{
		vars.completedSplits.Clear();
	}
}

split
{
	if(settings["" + old.Checkpoint] && !vars.completedSplits.Contains(old.Checkpoint) && current.Checkpoint != old.Checkpoint){
		vars.completedSplits.Add(old.Checkpoint);
		return true;
	}

	if(settings["" + current.LatestQuest] && !vars.completedSplits.Contains(current.LatestQuest)){
		vars.completedSplits.Add(current.LatestQuest);
		return true;
	}

    //minigames autosplitting
    if (settings["Arena IGT"] && old.arenaIGT > 0 && current.arenaIGT == 0)
    {
		return true;
    }

    if (settings["Broom Trial IGT"] && current.broomRingsCount > old.broomRingsCount)
    {
		return true;
    }

	/*
	if((settings["" + current.LatestQuest] || vars.Hogsmeade.Contains(current.LatestQuest) && settings["Hogs"]) && !vars.completedSplits.Contains(current.LatestQuest)){
			vars.completedSplits.Add(current.LatestQuest);
			return true;
		}
		*/
		/*
	if((settings["Secrets"] && old.CurrentQuest == "FIG_01" ||
		settings["Sweets"] && old.CurrentQuest == "COM_07" ||
		settings["Cache"] && old.CurrentQuest == "COM_03" ||
		settings["Valour"] && old.CurrentQuest == "COM_01" ||
		settings["Carted"] && old.CurrentQuest == "COM_14" ||
		settings["Butterfly"] && old.CurrentQuest == "COM_011" ||
		settings["Herodiana"] && old.CurrentQuest == "COM_24" ||
		settings["Friend"] && old.CurrentQuest == "COM_08" ||
		settings["Control"] && old.CurrentQuest == "COM_16" ||
		settings["Cabbage"] && old.CurrentQuest == "COM_17" ||
		settings["Vase"] && old.CurrentQuest == "COM_18" ||
		settings["Keep"] && old.CurrentQuest == "HST_01" ||
		settings["Biscuit"] && old.CurrentQuest == "COM_23" ||
		settings["Spot"] && old.CurrentQuest == "COM_31" ||
		settings["Time"] && old.CurrentQuest == "EVL_02" ||
		settings["Bell"] && old.CurrentQuest == "COM_20" ||
		settings["Repository"] && old.CurrentQuest == "FGS_01") && !vars.completedSplits.Contains(old.CurrentQuest) && current.CurrentQuest != old.CurrentQuest){
			vars.completedSplits.Add(old.CurrentQuest);
			return true;
		}
		*/
}

gameTime
{
    if (settings["Arena IGT"] && current.arenaIGT != 0)
    {
    return TimeSpan.FromSeconds(current.arenaIGT);
	}

    if (settings["Broom Trial IGT"])
    {
    return TimeSpan.FromSeconds(current.broomIGT);
	}
}

isLoading
{
	return current.loading || current.Startup || vars.Menus.Contains(current.Menu);

    //apple told me to do this for the IGT's, dunno the purpose tbh lol
    if (settings["Arena IGT"])
    {
    return true;
	}

    if (settings["Broom Trial IGT"])
    {
    return true;
	}

	/*
	if(settings["Door"]){
		if(current.loading || current.doorload || !current.Menu || current.Startup){
			return true;
		}

		else{
			return false;

		}
	}
	*/
}

exit
{
    //pauses timer if the game crashes
	timer.IsGameTimePaused = true;
}

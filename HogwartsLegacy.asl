// Hogwarts Legacy Load Remover & Autosplitter V1.1.0 (11/03/2023)
// Supports LRT
// Splits can be obtained from 
// Script by TheDementedSalad & Meta

//All Strings are UTF-16

state("HogwartsLegacy", "Steam v1.2")
{
	string250 CurrentQuest	: 0x8E8B8E8, 0x100, 0x0;				//Use settings to check your current tracked quest to find this (ONly the INT_01 part)
	string250 Checkpoint	: 0x8EB3020, 0x628, 0x1C0, 0x0;				//Tells you what your checkpoint is on the current tracked quest							
	string250 LatestQuest	: 0x8EB3020, 0xC0, 0x5E0, 0x268, 0x38, 0x0;		//After completing a main quest, Type the ID for it (Do not reload after this)
}

state("HogwartsLegacy", "Steam v1.3")
{
	string250 CurrentQuest	: 0x8EAAD28, 0x100, 0x0;
	string250 Checkpoint	: 0x8ED2470, 0x628, 0x1C0, 0x0;
	string50 LatestQuest	: 0x8ED2470, 0xC0, 0x5E0, 0x268, 0x38, 0x0;
   	int broomRingsCount     : 0x08ED2470, 0xC0, 0x20, 0x20, 0x488, 0x428, 0x34C;
   	float broomIGT          : 0x08ED2470, 0xC0, 0x20, 0x20, 0x488, 0x428, 0x378;
   	float arenaIGT          : 0x0926EE70, 0x50, 0xA0, 0x40, 0xB8, 0x398, 0x2EC;
}

state("HogwartsLegacy", "Steam v1.4")
{
	string250 CurrentQuest	: 0x8FEBE20, 0x100, 0x0;
	string250 Checkpoint	: 0x9013650, 0x628, 0x1C8, 0x0;
	string50 LatestQuest	: 0x9013650, 0xC0, 0x5E0, 0x268, 0x38, 0x0;
}

state("HogwartsLegacy", "Steam v1.5")
{
	string250 CurrentQuest	: 0x902DF60, 0x100, 0x0;
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
	settings.Add("Check_INT_01_CP5_Intro_Journal05", false, "Path to Hogwarts");
	settings.Add("Quest_WEK_01_R", false, "Welcome to Hogwarts");
	settings.Add("Check_ZZD_01_04_Journal", false, "Defence Against the Dark Arts");
	settings.Add("Check_ZZC_01_TalkToRonen_StepJournal", false, "Charms Class");
	settings.Add("Check_WET_01_SpellPractice_QuestAvailalbe_Journal", false, "Weasley After Class");
	settings.Add("Check_ZSR_01_03_ReturnToRonen_Journal", false, "Professor Ronen's Assignment");
	settings.Add("Check_OLI_01_02_ToHogsmeade_QuestActive_StepJournal06", false, "Welcome to Hogsmeade");
	settings.Add("Check_Fig_01_CONV_MapFound_Journal01", false, "The Locket's Secret");
	settings.Add("Check_FIG_01_TomesandTribulations_QuestActive_StepJournal09", false, "Secrets of the Restricted Section");
	settings.Add("Check_FIG_1B_EpilogueToAdventure_QuestAvailable_JournalRollover", false, "Tomes and Tribulations");
	settings.Add("Check_ZZH_01_Herbology1_QuestActive_StepJournal07", false, "Herbology Class");
	settings.Add("Check_ZZP_01_ReturnToSharp_StepJournal", false, "Potions Class");
	settings.Add("Check_HER_Conv_01_TheGirlFromCharmsClass_QuestActive_StepJournal01", false, "The Girl From Uagadou");
	settings.Add("Check_MRT_TrialsofMerlin_QuestActive_StepJournal06", false, "Trials of Merlin");
	settings.Add("Check_FGM_01_RAV_TheMissingPages_QuestActive_StepJournal02", false, "Ollivander's Heirloom");
	settings.Add("Check_FGM_02_JackdawsRest_QuestActive_StepJournal07", false, "Jackdaw's Rest");
	settings.Add("Check_FLY_01_04_ReturnToEverett_Journal", false, "Flying Class");
	settings.Add("Check_SNC_01_01_RoomOfRequirement_QuestActive_StepJournal07", false, "Room of Requirement");
	settings.Add("Check_CNF_01_DepthoftheUndercroft_QuestActive_StepJournal07", false, "Shadow of the Undercroft");
	settings.Add("Check_FGH_01_TheMapChamber_QuestActive_StepJournal05", false, "The Map Chamber");
	settings.Add("Check_FGT_01_TheTower_QuestActive_StepJournal09", false, "Percival Rackham's Trial");
	settings.Add("Check_BEA_01_BeastsClass_QuestActive_StepJournal07", false, "Beasts Class");
	settings.Add("Check_GDW_01_HelpingTheCaretaker_QuestActive_StepJournal06", false, "The Caretaker's Lunar Lament");
	settings.Add("Check_GT01_AGoblinsTreasure_QuestActive_StepJournal08", false, "The Helm of Urktot");
	settings.Add("Check_SNC_02_CollectingBeasts_QuestActive_StepJournal20", false, "The Elf, the Nab-Sack, and the Loom");
	settings.Add("Check_EVC_01_DepthOfAnEstate_QuestActive_StepJournal13", false, "Shadow of the Estate");
	settings.Add("Check_HST_01_Castlebreaking_QuestActive_StepJournal06", false, "The High Keep");
	settings.Add("Check_ZZS_01_07_UseTable_Journal", false, "Astronomy Class");
	settings.Add("Check_PRC_01_CONV_BackOnThePath_QuestActive_StepJournal01", false, "Back on the Path");
	settings.Add("Check_PRC_01_RookwoodsTrial_Journal08", false, "Charles Rookwood's Trial");
	settings.Add("Check_AVM_FireandVice_QuestActive_StepJournal11", false, "Fire and Vice");
	settings.Add("Quest_EVJ_01", false, "Shadow of the Mine");
	settings.Add("Quest_GT02", false, "It's All Gobbledegook");
	settings.Add("Quest_FGD_01_CONV", false, "The Headmistress Speaks");
	settings.Add("Quest_FGD_01", false, "The Polyjuice Plot");
	settings.Add("Quest_FGB_01", false, "Niamh Fitzgerald's Trial");
	settings.Add("Quest_EVT_01", false, "Shadow of the Mountain");
	settings.Add("Quest_GT03", false, "Lodgok's Loyalty");
	settings.Add("Quest_FIG_07", false, "San Bakar's Trial");
	settings.Add("Quest_TIO_01", false, "Wand Mastery");
	settings.Add("Quest_Repository", false, "The Final Repository +");
	settings.Add("Quest_WEE_01", false, "Weasley's Watchful Eye");
	settings.CurrentDefaultParent = null;
	
	settings.Add("AQuests", false, "Assignment Splits");
	settings.CurrentDefaultParent = "AQuests";
	settings.Add("Check_ZSI_01_03_ReturnToHecat_Journal", false, "Hecat's Assignment 1 (Incendio)");
	settings.Add("Quest_ZZE_01", false, "Hecat's Assignment 2 (Expelliarmus)");
	settings.Add("Quest_ZSW_01", false, "Garlick's Assignment 1 (Windgardium Leviosa)");
	settings.Add("Quest_ZZF_01", false, "Garlick's Assignment 2 (Flipendo)");
	settings.Add("Quest_ZSD_01", false, "Sharp's Assignment 1 (Depulso)");
	settings.Add("Quest_ZZN_01", false, "Sharp's Assignment 2 (Diffindo)");
	settings.Add("Quest_ZSG_01", false, "Kogawa's Assignment 1 (Glacius)");
	settings.Add("Quest_ZZM_01", false, "Kogawa's Assignment 2 (Arresto Momentum)");
	settings.Add("Quest_ZZO_01", false, "Onai's Assignment (Descendo)");
	settings.Add("Quest_ZSB_01", false, "Howin's Assignment (Bombarda)");
	settings.Add("Quest_ZZT_01", false, "Weasley's Assignment (Transformation)");
	settings.CurrentDefaultParent = null;
	
	settings.Add("SQuests", false, "Side Quest Splits");
	settings.CurrentDefaultParent = "SQuests";
	settings.Add("Check_ZFC_01_DuelingChallange1_QuestActive_StepJournal01", false, "Crossed Wands 1");
	settings.Add("Check_ZFC_02_DuelingChallange2_QuestActive_StepJournal01", false, "Crossed Wands 2");
	settings.Add("Quest_ZFC_03", false, "Crossed Wands 3");
	settings.Add("Check_ZFP_01_DummyTrainingPractice_QuestActive_StepJournal03", false, "Training Dummy 1");
	settings.Add("Quest_ZFP_02", false, "Training Dummy 2");
	settings.Add("Quest_ZAB_01", false, "Summoner's Court 1");
	settings.Add("Quest_ZAB_02", false, "Summoner's Court 2");
	settings.Add("Quest_ZAB_03", false, "Summoner's Court 3");
	settings.Add("Quest_ZAB_04", false, "Summoner's Court 4");
	settings.Add("Quest_ZAB_05", false, "Summoner's Court 5");
	settings.Add("Quest_EVL_01", false, "Shadow of the Study");
	settings.Add("Quest_Time", false, "In the Shadow of Time +");
	settings.Add("Quest_EVL_03", false, "Shadow of the Relic");
	settings.Add("Quest_DMS_01", false, "The Man Behind The Moons");
	settings.Add("Quest_NTR_01", false, "Poached Egg");
	settings.Add("Quest_NTR_02", false, "The Centaur and the Stone");
	settings.Add("Quest_NTR_03", false, "A Bird in the Hand");
	settings.Add("Quest_HER_01", false, "The Lost Child");
	settings.Add("Quest_HER_02", false, "A Basis for Blackmail");
	settings.Add("Quest_HER_03", false, "Harlow's Last Stand");
	settings.Add("Quest_Valour", false, "Venomous Valour +");
	settings.Add("Check_COM_02_04_StepJournal", false, "Like a Moth to a Flame");
	settings.Add("Quest_Cache", false, "Cache in the Castle +");
	settings.Add("Quest_COM_04", false, "Flying off the Shelves");
	settings.Add("Quest_COM_05", false, "Gobs of Gobstones");
	settings.Add("Quest_Sweets", false, "'Dissending' For Sweets +");
	settings.Add("Quest_COM_19", false, "The Daedalian Keys");
	settings.Add("Quest_COM_012", false, "The Lost Astrolabe");
	settings.Add("Quest_Carted", false, "Carted Away +");
	settings.Add("Quest_TV_02", false, "Ghost of Our Love");
	settings.Add("Quest_TV_03", false, "Cursed Tomb Treasure");
	settings.Add("Quest_Butterfly", false, "Follow the Butterflies +");
	settings.Add("Quest_SNS_01", false, "Interior Decorating");
	settings.Add("Quest_COM_32", false, "Flight Test");
	settings.Add("Quest_COM_37", false, "A Demanding Delivery");
	settings.Add("Quest_COM_33", false, "Sweeping the Competition");
	settings.Add("Quest_COM_15", false, "'Mer-ky' Depths");
	settings.Add("Quest_Herodiana", false, "The Hall of Herodiana +");
	settings.Add("Quest_TR01_01", false, "The Tale of Rowland Oakes");
	settings.Add("Quest_Friend", false, "A Friend In Deed +");
	settings.Add("Quest_COM_09", false, "Breaking Camp");
	settings.Add("Quest_COM_10", false, "Brother's Keeper");
	settings.Add("Quest_COM_22", false, "Venemous Revenge");
	settings.Add("Quest_COM_30", false, "Absconder Encounter");
	settings.Add("Quest_Control", false, "Troll Control +");
	settings.Add("Quest_Cabbage", false, "Kidnapped Cabbage +");
	settings.Add("Quest_Vase", false, "E-vase-ive Manoeuvre +");
	settings.Add("Quest_SNC_03b", false, "The Plight of the House-Elf");
	settings.Add("Quest_Biscuit", false, "Take the Biscuit +");
	settings.Add("Quest_TTR01_01", false, "'Beeting' a Curse");
	settings.Add("Quest_SNS_03", false, "Foal of the Dead");
	settings.Add("Quest_ACS_01", false, "Tangled Web");
	settings.Add("Quest_Spot", false, "Spot Removal +");
	settings.Add("Quest_COM_36", false, "A Thief in the Night");
	settings.Add("Quest_COM_34", false, "The Sky Is the Limit");
	settings.Add("Quest_COM_27", false, "Rescuing Rococo");
	settings.Add("Quest_COM_38", false, "Solved by the Bell");
	settings.Add("Quest_COM_28", false, "The Hippogriff Marks the Spot");
	settings.Add("Quest_Bell", false, "All's Well That Ends Bell +");
	settings.Add("Quest_SNC_05", false, "Phoenix Rising");
	settings.Add("Quest_ZZI_01", false, "History of Magic Class");
	settings.Add("Quest_PIP01_01", false, "Portrait in a Pickle");
	settings.Add("Quest_COM_40", false, "The Unique Unicorn");
	settings.CurrentDefaultParent = null;
}

init 
{	
	IntPtr Engine = vars.Helper.ScanRel(3, "48 89 05 ???????? 48 85 c9 74 ?? e8 ???????? 48 8d 4d");
	IntPtr gWorld = vars.Helper.ScanRel(3, "48 8B 05 ???????? 48 3B C? 48 0F 44 C? 48 89 05 ???????? E8");
	IntPtr fNames = vars.Helper.ScanRel(3, "48 8d 05 ???????? eb ?? 48 8d 0d ???????? e8 ???????? c6 05");
	IntPtr gSyncLoad = vars.Helper.ScanRel(21, "33 C0 0F 57 C0 F2 0F 11 05");
	IntPtr Loading = vars.Helper.ScanRel(2, "88 0d ?? ?? ?? ?? c3 cc cc cc cc cc cc cc cc cc 48 89 5c 24 ?? 55");
	
	if (gWorld == IntPtr.Zero){
		vars.Helper.Game = null;
		return;
	}
	
	vars.Helper["isLoading"] = vars.Helper.Make<bool>(gSyncLoad);
	
	vars.Helper["LoadingImage"] = vars.Helper.Make<bool>(Loading);
	
	vars.Helper["ConversationID"] = vars.Helper.MakeString(Engine, 0xE10, 0x38, 0x0, 0x30, 0x2C8, 0x1A88, 0x170, 0x2F0, 0xA8, 0x0);
	vars.Helper["Checkpoint"] = vars.Helper.MakeString(Engine, 0xE10, 0x38, 0x0, 0x30, 0x2D8, 0x398, 0x498, 0x5E8, 0x678, 0x0);
	vars.Helper["CurrentQuest"] = vars.Helper.Make<ulong>(Engine, 0xE10, 0x38, 0x0, 0x30, 0x2D8, 0x398, 0x498, 0x530, 0x2D4);
	
	vars.Helper["CurrentQuest2"] = vars.Helper.Make<ulong>(Engine, 0xE10, 0x38, 0x0, 0x30, 0x2D8, 0x398, 0x498, 0x530, 0x218);
	
	vars.Helper["MainMenu"] = vars.Helper.Make<ulong>(Engine, 0x7A0, 0x78, 0x2D8, 0x8, 0xE8, 0x278, 0x18);
	vars.Helper["MainMenu"].FailAction = MemoryWatcher.ReadFailAction.SetZeroOrNull;
	
	vars.Helper["IntroStart"] = vars.Helper.Make<byte>(Engine, 0x7A0, 0x78, 0x2D8, 0x8, 0xE8, 0x278, 0x2D0);
	
	vars.Helper["localPlayer"] = vars.Helper.Make<ulong>(Engine, 0xE10, 0x38, 0x0, 0x30, 0x18);
	vars.Helper["localPlayer"].FailAction = MemoryWatcher.ReadFailAction.SetZeroOrNull;

	switch ((int)vars.Helper.GetMemorySize()){
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
        return false;
	}
	
	vars.FNameToString = (Func<ulong, string>)(fName =>
	{
		var nameIdx  = (fName & 0x000000000000FFFF) >> 0x00;
		var chunkIdx = (fName & 0x00000000FFFF0000) >> 0x10;
		var number   = (fName & 0xFFFFFFFF00000000) >> 0x20;

		IntPtr chunk = vars.Helper.Read<IntPtr>(fNames + 0x10 + (int)chunkIdx * 0x8);
		IntPtr entry = chunk + (int)nameIdx * sizeof(short);

		int length = vars.Helper.Read<short>(entry) >> 6;
		string name = vars.Helper.ReadString(length, ReadStringType.UTF8, entry + sizeof(short));

		return number == 0 ? name : name + "_" + number;
	});
	
	vars.FNameToShortString = (Func<ulong, string>)(fName =>
	{
		string name = vars.FNameToString(fName);

		int dot = name.LastIndexOf('.');
		int slash = name.LastIndexOf('/');

		return name.Substring(Math.Max(dot, slash) + 1);
	});
	
	vars.FNameToShortString2 = (Func<ulong, string>)(fName =>
	{
		string name = vars.FNameToString(fName);

		int under = name.LastIndexOf('_');

		return name.Substring(0, under + 1);
	});
	
	vars.completedSplits = new HashSet<string>();
}

onStart
{
    // This makes sure the timer always starts at 0.00
    timer.IsGameTimePaused = true;
	vars.completedSplits.Clear();
}

start
{
    //New game autostart
	return current.IntroStart == 255 && old.IntroStart == 0;

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
	vars.Helper.Update();
	vars.Helper.MapPointers();
	
	//DEBUG CODE 
	//print(modules.First().ModuleMemorySize.ToString());
	//print(current.loading.ToString());
}

split
{		
	string setting = "";
	
	if(current.Checkpoint != old.Checkpoint){
		setting = "Check_" + old.Checkpoint;
	}
	
	if(current.LatestQuest != old.LatestQuest){
		setting = "Quest_" + current.LatestQuest;
	}
	
	// Debug. Comment out before release.
	if (!string.IsNullOrEmpty(setting))
	vars.Log(setting);
	
	if (settings.ContainsKey(setting) && settings[setting] && vars.completedSplits.Add(setting)){
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
	return vars.FNameToShortString2(current.localPlayer) != "BP_Phoenix_Player_Controller_C_" || vars.FNameToShortString2(current.MainMenu) == "UI_BP_StartPage_C_" ||
			vars.FNameToShortString2(current.MainMenu) == "UI_BP_AvatarCreator_C_" || current.LoadingImage || current.isLoading;

    //apple told me to do this for the IGT's, dunno the purpose tbh lol
    if (settings["Arena IGT"])
    {
    return true; 
	}
	
    if (settings["Broom Trial IGT"])
    {
    return true; 
	}
}

exit
{
    //pauses timer if the game crashes
	timer.IsGameTimePaused = true;
}

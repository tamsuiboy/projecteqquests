sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
    if(plugin::check_hasitem($client, 18740)) {
        $client->Message(15, "As you make your way into a small well-lit room, a robed figure turns to greet you. 'Hello there, friend. I am Lorme Tredore, Magician Guild Master. Should you wish to begin your training, read the note in your inventory and then hand it to me'");
    }
}

sub EVENT_SAY {
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 13951 => 1)) { #Fleshy Orb
		quest::say("Ah. Thank you for bringing this to me! I will make very good use of it. Here take this small token of my appreciation in return. Guard Jenkins will no longer require it as he was killed on the training field yesterday. Tsk. tsk. tsk.");
		quest::ding();
		quest::exp(100);
		quest::summonitem(5353); #Fine Steel Scimitar
	}
	elsif(plugin::check_handin(\%itemcount, 18740 => 1)) { #A Tattered Note
		quest::say("Welcome to the Academy of Arcane Sciences. I am Lorme Tredore, Master Magician. Here is our guild robe, wear it with pride and represent us well, young $name. Once you are ready to begin your training please make sure that you see Shana Liskia, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13559); #Used Violet Robe
		quest::ding();
		quest::faction(11,10); #Arcane Scientists
		quest::faction(184,10); #Knights of Truth
		quest::faction(235,-15); #Opal Dark Briar
		quest::faction(105,-15); #The Freeport Militia			
		quest::exp(100);
	}
	else {
		quest::say("I have no need for this $name, you can have it back.");
	}
	plugin::return_items(\%itemcount);
}

# END of FILE Zone:freportw -- Lorme_Tredore
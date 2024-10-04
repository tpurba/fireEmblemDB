# Fire Emblem
Our project queries databases holding information about Fire Emblem Awakening that a player might find useful during a play through of the game.

![FBDBPic](https://github.com/tpurba/fireEmblemDB/blob/main/fireEmblemPic.png)
[Schema picture](https://github.com/tpurba/fireEmblemDB/blob/main/FireEmblemERDiagram%20(1).pdf)
## Query it did well on
Question: "How many spell uses does Robin have in total?"

SQL:

    SELECT SUM(uses)
    FROM Spell
    WHERE spell_id IN (
	    SELECT spell_id
	    FROM CharacterSpell
	    WHERE character_id = (
		    SELECT character_id
		    FROM Character 
		    WHERE name = 'Robin'
	    )
    );

Friendly Response: "Robin has 35 spell uses in total."
## Query it did poorly on
ChatGPT got the query part right, but was unable to turn the result into an appropriate friendly response.

Question: "Who has mastered their class?"

SQL:

    SELECT c.name, cl.class_name
    FROM Character c
    JOIN CharacterClasses cc ON c.character_id = cc.character_id
    JOIN Classes cl ON cc.class_id = cl.class_id
    WHERE cc.is_mastered = 1;

SQL Query Result: []

Friendly Response: "There are many students who have mastered their class."

The result clearly showed no one the units had mastered their classes, but ChatGPT's response implies the opposite answer.
## Prompting Strategies used
We tried zero-shot and single domain double-shot prompts. For most of the questions asked, the response was the same for both strategies, but when we tried with the single domain double-shot on the "query it did poorly on", ChatGPT correctly reported that there were no mastered classes. With this small of a dataset, it is hard to tell if the difference was by chance or if the different prompting strategy had an effect. 

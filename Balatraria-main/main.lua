--- STEAMODDED HEADER
--- MOD_NAME: Balatraria
--- MOD_ID: balatraria
--- MOD_AUTHOR: Natoke, Roux2scours
--- MOD_DESCRIPTION: A terraria mod for balatro, that adds new jokers, consumables and more!
--- MOD_VERSION: 1.0.0
--- PREFIX: balatraria

----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas {
    key = "Jokers",
    name = "Jokers1", 
    path = "Jokers1.png",
    px = 71, 
    py = 95   
}

local xchips = 2

SMODS.Joker {
    key = "kingslime",
    loc_vars = function(self, info_queue, center)
        return {vars = {xchips}}
    end,
    atlas = "Jokers",
    rarity = 2,
    cost = 5,
    unlocked = true,
    blueprint_compat = true,
    pos = { x = 0, y = 0 },
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.scoring_hand then
            if context.joker_main then
                local has_king = false
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:get_id() == 13 then -- King = 13
                        has_king = true
                        break
                    end
                end
                if has_king then
                    return {
                        message = "X" .. xchips .. " Chips!",
                        Xchip_mod = xchips,
                        colour = G.C.CHIPS,
                        card = card
                    }
                end
            end
        end
    end
}


----------------------------------------------
------------MOD CODE END----------------------

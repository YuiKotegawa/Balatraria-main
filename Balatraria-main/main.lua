--- STEAMODDED HEADER
--- MOD_NAME: Balatraria
--- MOD_ID: BALATRARIA
--- MOD_AUTHOR: [Roux2scours, Natoke]
--- MOD_DESCRIPTION: Terraria mod for balatro, with new jokers, consumables, and more.
--- PREFIX: balatraria

-- Base SteamOdded/SMODS pour Balatraria
SMODS.Atlas {
    key = "Jokers1",
    path = "Dual_slime.png",
    px = 71,
    py = 95,
}

-- Joker 1 : King Slime
SMODS.Joker {
    key = "king_slime",
    loc_txt = {
        name = "King Slime",
        text = {
            "If played hand contains a King",
            "{X:mult,C:white}X2 Mult",
        },
    },
    atlas = "Jokers1",
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            Xmult = 2
        },
    },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = "X" .. card.ability.extra.Xmult,
                colour = G.C.MULT
            }
        end
    end
}

-- Joker 2 : Eye of Cthulhu
SMODS.Joker {
    key = "eye_cthulhu",
    loc_txt = {
        name = "Eye of Cthulhu",
        text = {
            "If played hand contains only Hearts",
            "Gain {C:money}10${} at end of round",
        },
    },
    atlas = "Jokers1",
    rarity = 3,
    cost = 10,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = { x = 1, y = 0 },
    config = {},
    calculate = function(self, card, context)
        if context.joker_main and context.only_hearts then
            return {
                card = card,
                dollar_bonus = 10,
                message = "+10$",
                colour = G.C.MONEY
            }
        end
    end
}

-- Joker 3 : Terra Blade
SMODS.Joker {
    key = "terra_blade",
    loc_txt = {
        name = "Terra Blade",
        text = {
            "If played hand contains a Straight",
            "{X:mult,C:green}X3 Mult",
        },
    },
    atlas = "Jokers1",
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            Xmult = 3
        },
    },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.straight then
            return {
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = "X" .. card.ability.extra.Xmult,
                colour = G.C.GREEN
            }
        end
    end
}


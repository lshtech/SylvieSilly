--- STEAMODDED HEADER
--- MOD_NAME: Sylvie's Silliness
--- MOD_ID: SylvieSilly
--- MOD_AUTHOR: [NewtTheFish, elbe]
--- MOD_DESCRIPTION: A few decks, blinds, etc. Have fun!
--- DISPLAY_NAME: Sylvie Sillies
--- BADGE_COLOUR: C7387D
--- PRIORITY: 25

----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas {
	key = "sylvie_backs",
	path = "sylvie_backs.png",
	px = 71,
	py = 95,
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
	key = "sylvie_moons",
	path = "sylvie_moons.png",
	px = 71,
	py = 95,
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
	key = "sylvie_vouchers",
	path = "sylvie_vouchers.png",
	px = 71,
	py = 95,
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
	key = "sylvie_blinds",
	path = "sylvie_blinds.png",
    atlas_table = "ANIMATION_ATLAS",
	px = 34,
	py = 34,
    frames = 21
}
SMODS.Atlas {
	key = "sylvie_spectrals",
	path = "sylvie_spectrals.png",
	px = 71,
	py = 95,
    atlas_table = 'ASSET_ATLAS',
}
SMODS.Atlas {
	key = "sylvie_boosters",
	path = "sylvie_boosters.png",
	px = 71,
	py = 95,
    atlas_table = 'ASSET_ATLAS',
}

SMODS.Blind {
    loc_txt = {
        name = 'The Prospector',
        text = {'All Stone, Steel, Gold, and', 'Glass cards are debuffed'}
    },
    key = 'prospector',
    name = 'The Prospector',
    config = {},
    boss = {min = 2, max = 10},
    boss_colour = HEX("e57f8d"),
    atlas = "sylvie_blinds",
    pos = {x = 0, y = 0},
    vars = {},
    dollars = 5,
    mult = 2,
    discovered = false,
    debuff_card = function(self, card, from_blind)
        if card.ability.name == 'Stone Card' or card.ability.name == 'Gold Card' or card.ability.name == 'Steel Card' or card.ability.name == 'Glass Card' then
            card:set_debuff(true)
        end
    end
}
SMODS.Blind {
    loc_txt = {
        name = 'The Gambler',
        text = {'All Wild, Lucky, Mult, and', 'Bonus cards are debuffed'}
    },
    key = 'gambler',
    name = 'The Gambler',
    config = {},
    boss = {min = 2, max = 10},
    boss_colour = HEX("62679a"),
    atlas = "sylvie_blinds",
    pos = {x = 0, y = 1},
    vars = {},
    dollars = 5,
    mult = 2,
    discovered = false,
    debuff_card = function(self, card, from_blind)
        if card.ability.name == 'Mult' or card.ability.name == 'Bonus' or card.ability.name == 'Wild Card' or card.ability.name == 'Lucky Card' then
            card:set_debuff(true)
        end
    end
}
SMODS.Blind {
    loc_txt = {
        name = 'The Pathway',
        text = {'All 6, 7, 8, 9, and', '10 cards are debuffed'}
    },
    key = 'pathway',
    name = 'The Pathway',
    config = {},
    boss = {min = 1, max = 10},
    boss_colour = HEX("9a8a43"),
    atlas = "sylvie_blinds",
    pos = {x = 0, y = 2},
    vars = {},
    dollars = 5,
    mult = 2,
    discovered = false,
    debuff_card = function(self, card, from_blind)
        if card:get_id() == 6 or card:get_id() == 7 or card:get_id() == 8 or card:get_id() == 9 or card:get_id() == 10 then
            card:set_debuff(true)
        end
    end
}
SMODS.Blind {
    loc_txt = {
        name = 'The Backside',
        text = {'All Ace, 2, 3, 4, and', '5 cards are debuffed'}
    },
    key = 'backside',
    name = 'The Backside',
    config = {},
    boss = {min = 1, max = 10},
    boss_colour = HEX("88619a"),
    atlas = "sylvie_blinds",
    pos = {x = 0, y = 3},
    vars = {},
    dollars = 5,
    mult = 2,
    discovered = false,
    debuff_card = function(self, card, from_blind)
        if card:get_id() == 14 or card:get_id() == 2 or card:get_id() == 3 or card:get_id() == 4 or card:get_id() == 5 then
            card:set_debuff(true)
        end
    end
}
SMODS.Blind {
    loc_txt = {
        name = 'The Heatwave',
        text = {'All even cards are', 'drawn face down'}
    },
    key = 'heatwave',
    name = 'The Heatwave',
    config = {},
    boss = {min = 2, max = 10},
    boss_colour = HEX("b72041"),
    atlas = "sylvie_blinds",
    pos = {x = 0, y = 4},
    vars = {},
    dollars = 5,
    mult = 2,
    discovered = false,
    stay_flipped = function(Self, area, card)
        if card:get_id() == 2 or card:get_id() == 4 or card:get_id() == 6 or card:get_id() == 8 or card:get_id() == 10 then
            return true
        end
    end,
    disable = function(self)
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].facing == 'back' then
                G.hand.cards[i]:flip()
            end
        end
        for k, v in pairs(G.playing_cards) do
            v.ability.wheel_flipped = nil
        end
    end
}
SMODS.Blind {
    loc_txt = {
        name = 'The Frost',
        text = {'All odd cards are', 'drawn face down'}
    },
    key = 'frost',
    name = 'The Frost',
    config = {},
    boss = {min = 2, max = 10},
    boss_colour = HEX("5090b7"),
    atlas = "sylvie_blinds",
    pos = {x = 0, y = 5},
    vars = {},
    dollars = 5,
    mult = 2,
    discovered = false,
    stay_flipped = function(self, area, card)
        if card:get_id() == 14 or card:get_id() == 3 or card:get_id() == 5 or card:get_id() == 7 or card:get_id() == 9 then
            return true
        end
    end,
    disable = function(self)
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].facing == 'back' then
                G.hand.cards[i]:flip()
            end
        end
        for k, v in pairs(G.playing_cards) do
            v.ability.wheel_flipped = nil
        end
    end
}

SMODS.Back {
    key = 'ss_lemonlime',
    loc_txt = {
        name = "Lemon-Lime Deck",
        text = {
            "Divides up the deck!",
            "{C:red}-1{} discard.",
            "The {C:attention}2's{} are extra tasty.",
        }
    },
    name = "Lemon-Lime Deck",
    pos = { x = 0, y = 5 },
    atlas = 'sylvie_backs',
    config = { discards = -1 },
    apply = function(self)
        delay(0.4)
        G.E_MANAGER:add_event(Event({
            func = function()
                local seal_counter = 1
                for k, v in pairs(G.playing_cards) do
                    if v.base.value == 'Ace' or v.base.value == '10' or v.base.value == '6' then
                        v:change_suit('Spades')
                    elseif v.base.value == 'King' or v.base.value == '9' or v.base.value == '5'  then
                        v:change_suit('Hearts')
                    elseif v.base.value == 'Queen' or v.base.value == '8' or v.base.value == '4'  then
                        v:change_suit('Clubs')
                    elseif v.base.value == 'Jack' or v.base.value == '7' or v.base.value == '3'  then
                        v:change_suit('Diamonds')
                    elseif v.base.value == '2' then
                        v:set_ability(G.P_CENTERS['m_wild'])
                        if seal_counter == 1 then v:set_seal('Red', true, true)
                        elseif seal_counter == 2 then v:set_seal('Blue', true, true)
                        elseif seal_counter == 3 then v:set_seal('Gold', true, true)
                        else v:set_seal('Purple', true, true)
                        end
                        seal_counter = seal_counter + 1
                    end
                end
            return true
            end
        }))
    end
}
SMODS.Back {
    key = 'ss_aurora',
    loc_txt = {
        name = "Aurora Deck",
        text = {
            "Start with an {C:spectral,T:c_aura}Aura{} card.",
            "{C:attention}Jokers{} and {C:attention}Playing Cards{}",
            "are {C:attention}usually{} {C:dark_edition}Special.",
            "{C:red}-1{} joker slot, {C:red}-1{} hand."
        }
    },
    name = "Aurora Deck",
    pos = { x = 2, y = 5 },
    atlas = 'sylvie_backs',
    config = { vouchers = {'v_hone', 'v_glow_up'}, consumables = {'c_aura'}, joker_slot = -1, hands = -1 },
    apply = function(self)
        G.GAME.starting_params.auroramodifier = true
    end
}
SMODS.Back {
    key = 'ss_sulfur',
    loc_txt = {
        name = "Sulfur Deck",
        text = {
            "Start with a {C:tarot,T:c_death}Death{} card",
            "and the {C:attention,T:v_overstock_norm}Overstock{} voucher.",
            "{C:attention}Jokers{} appear less often.",
        }
    },
    name = "Sulfur Deck",
    pos = { x = 3, y = 5 },
    atlas = 'sylvie_backs',
    config = { consumables = {'c_death'}, joker_rate = 4, voucher = 'v_overstock_norm' },
    apply = function(self)
    end
}
SMODS.Back {
    key = 'ss_hallowed',
    loc_txt = {
        name = "Hallowed Deck",
        text = {
            "{C:planet}Planets{} and {C:purple}Tarots{}",
            "no longer appear, while",
            "{C:attention}Playing Cards{} now",
            "appear in the shop."
        }
    },
    name = "Hallowed Deck",
    pos = { x = 3, y = 5 },
    atlas = 'sylvie_backs',
    config = { voucher = 'v_magic_trick' },
    apply = function(self)
        G.GAME.tarot_rate = 0
        G.GAME.planet_rate = 0
        G.GAME.playing_card_rate = 10
    end
}
SMODS.Back {
    key = 'ss_deckos',
    loc_txt = {
        name = "Deck OS",
        text = {
            "BOOTING...",
            "{C:red}FAILED{} TO LOAD...",
            "{C:spectral}ATTEMPTING{} TO FIX...",
        }
    },
    name = "Deck OS",
    pos = { x = 4, y = 5 },
    atlas = 'sylvie_backs',
    config = { },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v.base.suit == 'Clubs' then
                        v:set_ability(G.P_CENTERS['m_busted'])
                    end
                end
            return true
            end
        }))
    end
}

SMODS.Voucher {
    key = 'stamper',
    loc_txt = {
        name = 'Stamper',
        text = {
            'Increase chance to find',
            '{C:attention}Playing cards{} with {C:attention}Seals',
            'in {C:attention}Standard Packs',
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 10,
    discovered = false,
    redeem = function(self)
    end,
    atlas = "sylvie_vouchers"
}
SMODS.Voucher {
    key = 'seal_deal',
    loc_txt = {
        name = 'Seal the Deal',
        text = {
            '{C:attention}Playing cards{} from',
            '{C:attention}Standard Packs{} always',
            'have {C:attention}Seals',
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 10,
    discovered = false,
    redeem = function(self)
    end,
    atlas = "sylvie_vouchers",
    requires={MOD_PREFIX_V..'stamper'}
}

SMODS.Consumable {
    key = 'bloom',
    set = 'Spectral',
	loc_txt = {
		name = 'Bloom',
		text = {
			'Create a {C:money}Speed{},',
            '{C:money}Investment{}, or',
            '{C:money}Economy Tag'
		}
	},
    pos = {
        x = 0,
        y = 0,
    },
	cost = 4,
    atlas = 'sylvie_spectrals',
    unlocked = true,
    discovered = false,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            local bloom_tag_name = pseudorandom_element({'tag_economy', 'tag_skip', 'tag_investment'})
            local bloom_tag = Tag(bloom_tag_name, nil, G.GAME.blind)
            add_tag(bloom_tag)
            return true end }))
    end
}

SMODS.Consumable {
    key = "sylvie_europa",
    loc_txt = {
        name = 'Europa',
        text = {
            "{C:attention}Upgrade{} all",
            "{C:spades}Spade{} cards",
            "in your deck",
            "by {C:chips}+#1#{} Chips"
        },
    },
    set = 'Planet',
    atlas = "sylvie_moons",
    config = { chips = 5 },
    set_card_type_badge = badge_jovianmoon,
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.chips }}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        for _, v in pairs(G.playing_cards) do
            if v:is_suit('Spades') then
                v.ability.perma_bonus = v.ability.perma_bonus or 0
                v.ability.perma_bonus = v.ability.perma_bonus + card.ability.chips
            end
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            attention_text({
                text = 'Spades Up!',
                scale = 1, 
                hold = 1.2,
                major = used_tarot,
                backdrop_colour = G.C.SO_1.Spades,
                align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                silent = true
            })
            return true end }))
        delay(2.6)
    end,
}
SMODS.Consumable {
    key = "sylvie_io",
    loc_txt = {
        name = 'Io',
        text = {
            "{C:attention}Upgrade{} all",
            "{C:clubs}Club{} cards",
            "in your deck",
            "by {C:chips}+#1#{} Chips"
        },
    },
    set = 'Planet',
    atlas = "sylvie_moons",
    config = { chips = 5 },
    set_card_type_badge = badge_jovianmoon,
    pos = { x = 1, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = { self.config.chips }}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        for _, v in pairs(G.playing_cards) do
            if v:is_suit('Clubs') then
                v.ability.perma_bonus = v.ability.perma_bonus or 0
                v.ability.perma_bonus = v.ability.perma_bonus + card.ability.chips
            end
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            attention_text({
                text = 'Clubs Up!',
                scale = 1, 
                hold = 1.2,
                major = used_tarot,
                backdrop_colour = G.C.SO_1.Spades,
                align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                silent = true
            })
            return true end }))
        delay(2.6)
    end,
}
SMODS.Consumable {
    key = "sylvie_callisto",
    loc_txt = {
        name = 'Callisto',
        text = {
            "{C:attention}Upgrade{} all",
            "{C:hearts}Heart{} cards",
            "in your deck",
            "by {C:chips}+#1#{} Chips"
        },
    },
    set = 'Planet',
    atlas = "sylvie_moons",
    config = { chips = 5 },
    set_card_type_badge = badge_jovianmoon,
    pos = { x = 2, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = { self.config.chips }}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        for _, v in pairs(G.playing_cards) do
            if v:is_suit('Hearts') then
                v.ability.perma_bonus = v.ability.perma_bonus or 0
                v.ability.perma_bonus = v.ability.perma_bonus + card.ability.chips
            end
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            attention_text({
                text = 'Hearts Up!',
                scale = 1, 
                hold = 1.2,
                major = used_tarot,
                backdrop_colour = G.C.SO_1.Spades,
                align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                silent = true
            })
            return true end }))
        delay(2.6)
    end,
}
SMODS.Consumable {
    key = "sylvie_ganymede",
    loc_txt = {
        name = 'Ganymede',
        text = {
            "{C:attention}Upgrade{} all",
            "{C:diamonds}Diamond{} cards",
            "in your deck",
            "by {C:chips}+#1#{} Chips"
        },
    },
    set = 'Planet',
    atlas = "sylvie_moons",
    config = { chips = 5 },
    set_card_type_badge = badge_jovianmoon,
    pos = { x = 3, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = { self.config.chips }}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        for _, v in pairs(G.playing_cards) do
            if v:is_suit('Diamonds') then
                v.ability.perma_bonus = v.ability.perma_bonus or 0
                v.ability.perma_bonus = v.ability.perma_bonus + card.ability.chips
            end
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            attention_text({
                text = 'Diamonds Up!',
                scale = 1, 
                hold = 1.2,
                major = used_tarot,
                backdrop_colour = G.C.SO_1.Spades,
                align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                silent = true
            })
            return true end }))
        delay(2.6)
    end,
}
SMODS.Consumable {
    key = "sylvie_charon",
    loc_txt = {
        name = 'Charon',
        text = {
            "{C:attention}Upgrade{} {C:chips}Bonus Cards{}",
            "by {C:chips}+#1#{} chips",
            "Affects {C:chips}Current{}",
            "and {C:dark_edition}Future{} cards",
        },
    },
    set = 'Planet',
    atlas = "sylvie_moons",
    config = { chips = 10 },
    set_card_type_badge = badge_jovianmoon,
    pos = { x = 0, y = 1 },
    cost = 3,
    unlocked = true,
    discovered = false,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        return {vars = { self.config.chips }}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.P_CENTER_POOLS.Enhanced[1].config.bonus = G.P_CENTER_POOLS.Enhanced[1].config.bonus + card.ability.chips
        for _, v in pairs(G.playing_cards) do
            if v.config.center == G.P_CENTERS.m_bonus then
                v:set_ability(G.P_CENTERS.m_bonus)
            end
        end

        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            attention_text({
                text = 'Bonus Up!',
                scale = 1, 
                hold = 1.2,
                major = used_tarot,
                backdrop_colour = G.C.CHIPS,
                align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                silent = true
            })
            return true end }))
        delay(2.6)
    end,
}
SMODS.Consumable {
    key = "sylvie_hydra",
    loc_txt = {
        name = 'Hydra',
        text = {
            "{C:attention}Upgrade{} {C:mult}Mult Cards{}",
            "by {C:mult}+#1#{} mult",
            "Affects {C:mult}Current{}",
            "and {C:dark_edition}Future{} cards",
        },
    },
    set = 'Planet',
    atlas = "sylvie_moons",
    config = { mult = 2 },
    set_card_type_badge = badge_jovianmoon,
    pos = { x = 1, y = 1 },
    cost = 3,
    unlocked = true,
    discovered = false,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
        return {vars = { self.config.mult }}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.P_CENTER_POOLS.Enhanced[2].config.mult = G.P_CENTER_POOLS.Enhanced[2].config.mult + card.ability.mult
        for k, v in pairs(G.playing_cards) do
            if v.config.center == G.P_CENTERS.m_mult then
                v:set_ability(G.P_CENTERS.m_mult)
            end
        end

        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            attention_text({
                text = 'Mult Up!',
                scale = 1, 
                hold = 1.2,
                major = used_tarot,
                backdrop_colour = G.C.MULT,
                align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                silent = true
            })
            return true end }))
        delay(2.6)
    end,
}
SMODS.Consumable {
    key = "sylvie_titan",
    loc_txt = {
        name = 'Titan',
        text = {
            "{C:attention}Upgrade{} {C:chips}Stone Cards{}",
            "by {C:chips}+#1#{} chips",
            "Affects {C:chips}Current{}",
            "and {C:dark_edition}Future{} cards",
        },
    },
    set = 'Planet',
    atlas = "sylvie_moons",
    config = { chips = 10 },
    set_card_type_badge = badge_jovianmoon,
    pos = { x = 0, y = 2 },
    cost = 3,
    unlocked = true,
    discovered = false,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {vars = { self.config.chips }}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.P_CENTER_POOLS.Enhanced[6].config.bonus = G.P_CENTER_POOLS.Enhanced[6].config.bonus + card.ability.chips
        for _, v in pairs(G.playing_cards) do
            if v.config.center == G.P_CENTERS.m_stone then
                v:set_ability(G.P_CENTERS.m_stone)
            end
        end

        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            attention_text({
                text = 'Stone Up!',
                scale = 1, 
                hold = 1.2,
                major = used_tarot,
                backdrop_colour = G.C.CHIPS,
                align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                silent = true
            })
            return true end }))
        delay(2.6)
    end,
}
SMODS.Consumable {
    key = "sylvie_euceladus",
    loc_txt = {
        name = 'Euceladus',
        text = {
            "{C:attention}Upgrade{} {C:money}Gold Cards{}",
            "by {C:money}+1{} dollars",
            "Affects {C:money}Current{}",
            "and {C:dark_edition}Future{} cards",
        },
    },
    set = 'Planet',
    atlas = "sylvie_moons",
    config = { gold = 1 },
    set_card_type_badge = badge_jovianmoon,
    pos = { x = 1, y = 2 },
    cost = 3,
    unlocked = true,
    discovered = false,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return {vars = { self.config.gold }}
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.P_CENTER_POOLS.Enhanced[7].config.h_dollars = G.P_CENTER_POOLS.Enhanced[7].config.h_dollars + card.ability.gold
        for _, v in pairs(G.playing_cards) do
            if v.config.center == G.P_CENTERS.m_gold then
                v:set_ability(G.P_CENTERS.m_gold)
            end
        end

        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            attention_text({
                text = 'Gold Up!',
                scale = 1, 
                hold = 1.2,
                major = used_tarot,
                backdrop_colour = G.C.MONEY,
                align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                silent = true
            })
            return true end }))
        delay(2.6)
    end,
}

local Game_start_run_ref = Game.start_run;
function Game:start_run(args)
	local ret = Game_start_run_ref(self, args)

    -- RESET
    G.P_CENTERS["m_bonus"].config.bonus = 30
    G.P_CENTERS["m_mult"].config.mult = 4
    G.P_CENTERS["m_stone"].config.bonus = 50
    G.P_CENTERS["m_gold"].config.h_dollars = 3

	return ret
end

local create_card_def = create_card
function create_card (_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local card = create_card_def(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)

    if G.STATE == G.STATES.STANDARD_PACK and (card.ability.set == 'Default' or card.ability.set == 'Enhanced') and card.seal == nil then
        if G.GAME.used_vouchers.v_stamper and not G.GAME.used_vouchers.v_seal_deal then
            if pseudorandom('stamper_odds') > 0.25 then
                local seal_type = SMODS.poll_seal({guaranteed = true, key = 'stamper'})
                card:set_seal(seal_type)
            end
        elseif G.GAME.used_vouchers.v_seal_deal then
            local seal_type = SMODS.poll_seal({guaranteed = true, key = 'seal_deal'})
            card:set_seal(seal_type)
        end
    end

    return card
end

--[[
local can_use_consumeableref = Card.can_use_consumeable
function Card:can_use_consumeable(any_state, skip_check)

    -- import from Codex Arcanum!!
    if G.STATE == G.STATES.TAROT_PACK then
        if self.ability.name == 'Aqua' or self.ability.name == 'Ignis' or self.ability.name == 'Aero'
         or self.ability.name == 'Terra' or self.ability.name == 'Quicksilver' or self.ability.name == 'Salt'
         or self.ability.name == 'Sulfur' or self.ability.name == 'Phosphorus' or self.ability.name == 'Bismuth'
         or self.ability.name == 'Cobalt' or self.ability.name == 'Arsenic' or self.ability.name == 'Antimony' then
          self.config.in_booster = true
          return true
        end
      end

    return can_use_consumeableref(self, any_state, skip_check)
end

local generate_card_uiref = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
  if (_c.set == 'Booster' and (_c.name:find("Suits") or _c.name:find("Bonus") or _c.name:find("Fortune"))) then
    local first_pass = nil
    if not full_UI_table then 
        first_pass = true
        full_UI_table = {
            main = {},
            info = {},
            type = {},
            name = nil,
            badges = badges or {}
        }
    end

    local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
    local name_override = nil
    local info_queue = {}

    if full_UI_table.name then
        full_UI_table.info[#full_UI_table.info+1] = {}
        desc_nodes = full_UI_table.info[#full_UI_table.info]
    end

    if not full_UI_table.name then
        if specific_vars and specific_vars.no_name then
            full_UI_table.name = true
        elseif card_type == 'Locked' then
            full_UI_table.name = localize{type = 'name', set = 'Other', key = 'locked', nodes = {}}
        elseif card_type == 'Undiscovered' then 
            full_UI_table.name = localize{type = 'name', set = 'Other', key = 'undiscovered_'..(string.lower(_c.set)), name_nodes = {}}
        elseif specific_vars and (card_type == 'Default' or card_type == 'Enhanced') then
            if (_c.name == 'Stone Card') then full_UI_table.name = true end
            if (specific_vars.playing_card and (_c.name ~= 'Stone Card')) then
                full_UI_table.name = {}
                localize{type = 'other', key = 'playing_card', set = 'Other', nodes = full_UI_table.name, vars = {localize(specific_vars.value, 'ranks'), localize(specific_vars.suit, 'suits_plural'), colours = {specific_vars.colour}}}
                full_UI_table.name = full_UI_table.name[1]
            end
        elseif card_type == 'Booster' then
            
        else
            full_UI_table.name = localize{type = 'name', set = _c.set, key = _c.key, nodes = full_UI_table.name}
        end
        full_UI_table.card_type = card_type or _c.set
    end 

    local loc_vars = {}
    if main_start then 
        desc_nodes[#desc_nodes+1] = main_start 
    end



    if _c.set == 'Booster' and (_c.name:find("Suits") or _c.name:find("Bonus") or _c.name:find("Fortune")) then 
      local desc_override = 'p_arcana_normal'
      if _c.name == 'Suits Pack' then desc_override = 'p_suits_normal'; loc_vars = {_c.config.choose, _c.config.extra} end
      if _c.name == 'Jumbo Suits Pack' then desc_override = 'p_suits_jumbo'; loc_vars = {_c.config.choose, _c.config.extra} end
      if _c.name == 'Mega Suits Pack' then desc_override = 'p_suits_mega'; loc_vars = {_c.config.choose, _c.config.extra} end

      if _c.name == 'Bonus Pack' then desc_override = 'p_bonus_normal'; loc_vars = {_c.config.choose, _c.config.extra} end
      if _c.name == 'Jumbo Bonus Pack' then desc_override = 'p_bonus_jumbo'; loc_vars = {_c.config.choose, _c.config.extra} end

      if _c.name == 'Fortune Pack' then desc_override = 'p_fortune_normal'; loc_vars = {_c.config.choose, _c.config.extra} end
      if _c.name == 'Jumbo Fortune Pack' then desc_override = 'p_fortune_jumbo'; loc_vars = {_c.config.choose, _c.config.extra} end


      name_override = desc_override
      if not full_UI_table.name then full_UI_table.name = localize{type = 'name', set = 'Other', key = name_override, nodes = full_UI_table.name} end
      localize{type = 'other', key = desc_override, nodes = desc_nodes, vars = loc_vars}
    end

    if main_end then 
        desc_nodes[#desc_nodes+1] = main_end 
    end

   --Fill all remaining info if this is the main desc
    if not ((specific_vars and not specific_vars.sticker) and (card_type == 'Default' or card_type == 'Enhanced')) then
        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            localize{type = 'name', key = _c.key, set = _c.set, nodes = full_UI_table.name} 
            if not full_UI_table.name then full_UI_table.name = {} end
        elseif desc_nodes ~= full_UI_table.main then 
            desc_nodes.name = localize{type = 'name_text', key = name_override or _c.key, set = name_override and 'Other' or _c.set} 
        end
    end

    if first_pass and not (_c.set == 'Edition') and badges then
        for k, v in ipairs(badges) do
            if v == 'foil' then info_queue[#info_queue+1] = G.P_CENTERS['e_foil'] end
            if v == 'holographic' then info_queue[#info_queue+1] = G.P_CENTERS['e_holo'] end
            if v == 'polychrome' then info_queue[#info_queue+1] = G.P_CENTERS['e_polychrome'] end
            if v == 'negative' then info_queue[#info_queue+1] = G.P_CENTERS['e_negative'] end
            if v == 'negative_consumable' then info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}} end
            if v == 'gold_seal' then info_queue[#info_queue+1] = {key = 'gold_seal', set = 'Other'} end
            if v == 'blue_seal' then info_queue[#info_queue+1] = {key = 'blue_seal', set = 'Other'} end
            if v == 'red_seal' then info_queue[#info_queue+1] = {key = 'red_seal', set = 'Other'} end
            if v == 'purple_seal' then info_queue[#info_queue+1] = {key = 'purple_seal', set = 'Other'} end
            if v == 'eternal' then info_queue[#info_queue+1] = {key = 'eternal', set = 'Other'} end
            if v == 'pinned_left' then info_queue[#info_queue+1] = {key = 'pinned_left', set = 'Other'} end
        end
    end

    for _, v in ipairs(info_queue) do
        generate_card_ui(v, full_UI_table)
    end

    return full_UI_table
  end
  
  return generate_card_uiref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
end

local pack_pools = {
    ['Suits'] = {
        ['TarotPlanet'] = {
            'c_moon',
            'c_sun',
            'c_world',
            'c_star',
            'c_lovers',

            'c_jupiter',
            'c_sylvie_europa',
            'c_sylvie_io',
            'c_sylvie_callisto',
            'c_sylvie_ganymede',
        },
        ['Joker'] = {
            'j_greedy_joker',
            'j_lusty_joker',
            'j_wrathful_joker',
            'j_gluttenous_joker',
            'j_droll',
            'j_crafty',
            'j_smeared',
            'j_flower_pot',
            'j_rough_gem',
            'j_bloodstone',
            'j_arrowhead',
            'j_onyx_agate',
            'j_tribe',
            'j_seeing_double',
            'j_castle',
            'j_ancient',
            'j_blackboard'
        },
        ['Spectral'] = {
            'c_sigil',
        },
    },
    ['Bonus'] = {
        ['TarotPlanet'] = {
            'c_magician',
            'c_high_priestess',
            'c_heirophant',
            'c_lovers',
            'c_chariot',
            'c_justice',
            'c_death',
            'c_tower',
            'c_devil',

            'c_sylvie_charon',
            'c_sylvie_hydra',
            'c_sylvie_titan',

        },
        ['Spectral'] = {
            'c_familiar',
            'c_grim',
            'c_incantation',
            'c_cryptid',

            'c_talisman',
            'c_deja_vu',
        },
    },
    ['Fortune'] = {
        ['TarotPlanet'] = {
            'c_fool',
            'c_wheel_of_fortune',
            'c_hermit',
            'c_temperance',
            'c_judgement',
            'c_magician',
            'c_lovers',

            'c_sylvie_euceladus'
        },
        ['Joker'] = {
            'j_loyalty_card',
            'j_8_ball',
            'j_misprint',
            'j_space',
            'j_business',
            'j_faceless',
            'j_egg',
            'j_cloud_9',
            'j_hallucination',
            'j_golden',
            'j_midas_mask',
            'j_reserved_parking',
            'j_lucky_cat',
            'j_trading',
            'j_bloodstone',
            'j_oops',
            'j_idol',
        },
        ['Spectral'] = {
            'c_immolate',
            'c_aura',
            'c_trance',
            'c_medium',

            'c_bloom',
        },
    }
}

function get_pack_pool(_pack, _type, _rarity, _legendary, _append)

    G.ARGS.TEMP_POOL = EMPTY(G.ARGS.TEMP_POOL)
    local _pool, _starting_pool,_pool_key, _pool_size = G.ARGS.TEMP_POOL, nil, '', 0

    _starting_pool = pack_pools[_pack][_type]

    --cull the pool
    for k, v in ipairs(_starting_pool) do
        local add = true
        
        if G.GAME.used_jokers[v] then
            add = nil
        end

        if add then
           _pool[#_pool+1] = v
        end
    end

    for k,v in pairs(_pool) do
        _pool_size = _pool_size + 1
    end

    --if pool is empty
    if _pool_size == 0 then
        _pool = EMPTY(G.ARGS.TEMP_POOL)
        if _type == 'Tarot' or _type == 'Tarot_Planet' then _pool[#_pool + 1] = "c_fool"
        elseif _type == 'Planet' then _pool[#_pool + 1] = "c_pluto"
        elseif _type == 'Spectral' then _pool[#_pool + 1] = "c_incantation"
        elseif _type == 'Joker' then _pool[#_pool + 1] = "j_joker"
        elseif _type == 'Demo' then _pool[#_pool + 1] = "j_joker"
        elseif _type == 'Voucher' then _pool[#_pool + 1] = "v_blank"
        elseif _type == 'Tag' then _pool[#_pool + 1] = "tag_handy"
        else _pool[#_pool + 1] = "j_joker"
        end
    end

    return _pool, _pool_key..G.GAME.round_resets.ante
end

function create_pack_card(_pack, _type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local area = area or G.jokers
    local center = G.P_CENTERS.b_red
        

    --should pool be skipped with a forced key
    if not forced_key and soulable and (not G.GAME.banned_keys['c_soul']) then
        if (_type == 'Tarot' or _type == 'Spectral' or _type == 'Tarot_Planet') and
        not (G.GAME.used_jokers['c_soul'] and not next(find_joker("Showman")))  then
            if pseudorandom('soul_'.._type..G.GAME.round_resets.ante) > 0.997 then
                forced_key = 'c_soul'
            end
        end
        if (_type == 'Planet' or _type == 'Spectral') and
        not (G.GAME.used_jokers['c_black_hole'] and not next(find_joker("Showman")))  then 
            if pseudorandom('soul_'.._type..G.GAME.round_resets.ante) > 0.997 then
                forced_key = 'c_black_hole'
            end
        end
    end

    if _type == 'Base' then 
        forced_key = 'c_base'
    end



    if forced_key and not G.GAME.banned_keys[forced_key] then 
        center = G.P_CENTERS[forced_key]
        _type = (center.set ~= 'Default' and center.set or _type)
    else
        local _pool, _pool_key = get_pack_pool(_pack, _type, _rarity, legendary, key_append)
        center = pseudorandom_element(_pool, pseudoseed(_pool_key))
        local it = 1
        while center == 'UNAVAILABLE' do
            it = it + 1
            center = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
        end

        center = G.P_CENTERS[center]
    end

    local front = ((_type=='Base' or _type == 'Enhanced') and pseudorandom_element(G.P_CARDS, pseudoseed('front'..(key_append or '')..G.GAME.round_resets.ante))) or nil

    local card = Card(area.T.x + area.T.w/2, area.T.y, G.CARD_W, G.CARD_H, front, center,
    {bypass_discovery_center = area==G.shop_jokers or area == G.pack_cards or area == G.shop_vouchers or (G.shop_demo and area==G.shop_demo) or area==G.jokers or area==G.consumeables,
     bypass_discovery_ui = area==G.shop_jokers or area == G.pack_cards or area==G.shop_vouchers or (G.shop_demo and area==G.shop_demo),
     discover = area==G.jokers or area==G.consumeables, 
     bypass_back = G.GAME.selected_back.pos})
    if card.ability.consumeable and not skip_materialize then card:start_materialize() end

    if _type == 'Joker' then
        if G.GAME.modifiers.all_eternal then
            card:set_eternal(true)
        end
        if area == G.shop_jokers then 
            if G.GAME.modifiers.enable_eternals_in_shop and pseudorandom('stake_shop_joker_eternal'..G.GAME.round_resets.ante) > 0.7 then
                card:set_eternal(true)
            end
        end

        local edition = poll_edition('edi'..(key_append or '')..G.GAME.round_resets.ante)
        card:set_edition(edition)
        check_for_unlock({type = 'have_edition'})
    end
    return card
end

G.localization.misc.dictionary["k_suits_pack"] = "Suits Pack"
G.localization.misc.dictionary["k_bonus_pack"] = "Bonus Pack"
G.localization.misc.dictionary["k_fortune_pack"] = "Fortune Pack"

local create_UIBox_arcana_packkref = create_UIBox_arcana_pack
function create_UIBox_arcana_pack()
  if G.ARGS.is_suit_pack then
    local _size = G.GAME.pack_size
    G.pack_cards = CardArea(
      G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
      _size*G.CARD_W,
      1.05*G.CARD_H, 
      {card_limit = _size, type = 'consumeable', highlight_limit = 1})
  
      local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
        {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
          {n=G.UIT.R, config={align = "cm"}, nodes={
          {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
            {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
              {n=G.UIT.O, config={object = G.pack_cards}},
            }}
          }}
        }},
        {n=G.UIT.R, config={align = "cm"}, nodes={
        }},
        {n=G.UIT.R, config={align = "tm"}, nodes={
          {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
          {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
          UIBox_dyn_container({
            {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
              {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = localize('k_suits_pack'), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}
              }},
              {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}
              }},
            }}
          }),
        }},
          {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
            {n=G.UIT.R,config={minh =0.2}, nodes={}},
            {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
              {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}
            }}
          }}
        }}
      }}
    }}
    return t
  elseif G.ARGS.is_bonus_pack then
    local _size = G.GAME.pack_size
    G.pack_cards = CardArea(
      G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
      _size*G.CARD_W,
      1.05*G.CARD_H, 
      {card_limit = _size, type = 'consumeable', highlight_limit = 1})
  
      local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
        {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
          {n=G.UIT.R, config={align = "cm"}, nodes={
          {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
            {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
              {n=G.UIT.O, config={object = G.pack_cards}},
            }}
          }}
        }},
        {n=G.UIT.R, config={align = "cm"}, nodes={
        }},
        {n=G.UIT.R, config={align = "tm"}, nodes={
          {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
          {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
          UIBox_dyn_container({
            {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
              {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = localize('k_bonus_pack'), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}
              }},
              {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}
              }},
            }}
          }),
        }},
          {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
            {n=G.UIT.R,config={minh =0.2}, nodes={}},
            {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
              {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}
            }}
          }}
        }}
      }}
    }}
    return t
  elseif G.ARGS.is_fortune_pack then
    local _size = G.GAME.pack_size
    G.pack_cards = CardArea(
      G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
      _size*G.CARD_W,
      1.05*G.CARD_H, 
      {card_limit = _size, type = 'consumeable', highlight_limit = 1})
  
      local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
        {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
          {n=G.UIT.R, config={align = "cm"}, nodes={
          {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
            {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
              {n=G.UIT.O, config={object = G.pack_cards}},
            }}
          }}
        }},
        {n=G.UIT.R, config={align = "cm"}, nodes={
        }},
        {n=G.UIT.R, config={align = "tm"}, nodes={
          {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
          {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
          UIBox_dyn_container({
            {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
              {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = localize('k_fortune_pack'), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}
              }},
              {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}
              }},
            }}
          }),
        }},
          {n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
            {n=G.UIT.R,config={minh =0.2}, nodes={}},
            {n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
              {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}
            }}
          }}
        }}
      }}
    }}
    return t
  else
    return create_UIBox_arcana_packkref()
  end
end

local card_openref = Card.open
function Card:open()
  G.ARGS.is_suit_pack,G.ARGS.is_bonus_pack,G.ARGS.is_fortune_pack = false,false,false
  if self.ability.set == "Booster" and (self.ability.name:find('Suits') or self.ability.name:find('Bonus') or self.ability.name:find('Fortune')) then
      stop_use()
      G.STATE_COMPLETE = false 
      self.opening = true

      if not self.config.center.discovered then
          discover_card(self.config.center)
      end
      self.states.hover.can = false

      G.STATE = G.STATES.TAROT_PACK
      G.GAME.pack_size = self.ability.extra

      if self.ability.name:find('Suits') then
        G.ARGS.is_suit_pack = true
      elseif self.ability.name:find('Bonus') then
        G.ARGS.is_bonus_pack = true
      elseif self.ability.name:find('Fortune') then
        G.ARGS.is_fortune_pack = true
      end
      G.GAME.pack_choices = self.config.center.config.choose or 1

      if self.cost > 0 then 
          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
              inc_career_stat('c_shop_dollars_spent', self.cost)
              self:juice_up()
          return true end }))
          ease_dollars(-self.cost) 
     else
         delay(0.2)
     end

      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
          self:explode()
          local pack_cards = {}

          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1.3*math.sqrt(G.SETTINGS.GAMESPEED), blockable = false, blocking = false, func = function()
              local _size = self.ability.extra
                
              if self.ability.name:find('Fortune') or self.ability.name:find('Bonus') or self.ability.name:find('Suits') then
                local name = nil
                if self.ability.name:find('Fortune') then
                    name = 'Fortune'
                elseif self.ability.name:find('Suits') then
                    name = 'Suits'
                else
                    name = 'Bonus'
                end
                for i = 1, _size do
                    local card = nil
                    if pseudorandom('fortune-pack-tarot') < 0.75 then
                        if pseudorandom('fortune-pack-spectral') < 0.95 then
                            card = create_pack_card(name, 'TarotPlanet', G.pack_cards, nil, nil, true, true, nil, 'fort')
                        else
                            card = create_pack_card(name, 'Spectral', G.pack_cards, nil, nil, true, true, nil, 'fort')
                        end
                    else
                        if self.ability.name:find('Fortune') or self.ability.name:find('Suits') then
                            card = create_pack_card(name, 'Joker', G.pack_cards, nil, nil, true, true, nil, 'fort')
                        else
                            card = create_card("Enhanced", G.pack_cards, nil, nil, nil, true, nil, 'sta')
                            local edition_rate = 2
                            local edition = poll_edition('standard_edition'..G.GAME.round_resets.ante, edition_rate, true)
                            card:set_edition(edition)
                            local seal_rate = 10
                            local seal_poll = pseudorandom(pseudoseed('stdseal'..G.GAME.round_resets.ante))
                            if seal_poll > 1 - 0.02*seal_rate then
                                local seal_type = pseudorandom(pseudoseed('stdsealtype'..G.GAME.round_resets.ante))
                                if seal_type > 0.75 then card:set_seal('Red')
                                elseif seal_type > 0.5 then card:set_seal('Blue')
                                elseif seal_type > 0.25 then card:set_seal('Gold')
                                else card:set_seal('Purple')
                                end
                            end
                        end
                    end
                    card.T.x = self.T.x
                    card.T.y = self.T.y
                    card:start_materialize({G.C.WHITE, G.C.WHITE}, nil, 1.5*G.SETTINGS.GAMESPEED)
                    pack_cards[i] = card
                end
                return true
            end
          end}))

          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1.3*math.sqrt(G.SETTINGS.GAMESPEED), blockable = false, blocking = false, func = function()
              if G.pack_cards then 
                  if G.pack_cards and G.pack_cards.VT.y < G.ROOM.T.h then 
                  for k, v in ipairs(pack_cards) do
                      G.pack_cards:emplace(v)
                  end
                  return true
                  end
              end
          end}))

          for i = 1, #G.jokers.cards do
              G.jokers.cards[i]:calculate_joker({open_booster = true, card = self})
          end

          if G.GAME.modifiers.inflation then 
              G.GAME.inflation = G.GAME.inflation + 1
              G.E_MANAGER:add_event(Event({func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true end }))
          end

      return true end }))
  else
    card_openref(self)
  end
end

local cardsetedition = Card.set_edition
function Card.set_edition(self, edition, immediate, silent)
    cardsetedition(self, edition, immediate, silent)
    
    if G.GAME.starting_params.auroramodifier and self.ability.set == 'Default' and (edition == nil) then
        local rngedition = pseudorandom(pseudoseed('random_edition'))
        if rngedition > 0.5 then self:set_edition({foil = true})
        elseif rngedition > 0.1 then self:set_edition({holo = true})
        else self:set_edition({polychrome = true})
        end
    end
end






function push_pool(table,pack)
    for k,v in pairs(table) do
        pack[#pack+1] = k
    end
end


local fortune_pool = pack_pools['Fortune']['TarotPlanet']
local fortune_pool_spectral = pack_pools['Fortune']['Spectral']
local fortune_pool_joker = pack_pools['Fortune']['Joker']

local bonus_pool = pack_pools['Bonus']['TarotPlanet']
local bonus_pool_spectral = pack_pools['Bonus']['Spectral']

local fortune_jokers,suits_jokers = nil,nil

if not (SMODS.INIT.CodexArcanum == nil) then
    fortune_pool[#fortune_pool+1] = 'c_alchemy_sulfur'
    fortune_pool[#fortune_pool+1] = 'c_alchemy_antimony'
    fortune_pool[#fortune_pool+1] = 'c_alchemy_arsenic'

    bonus_pool[#bonus_pool+1] = 'c_alchemy_cobalt'
    bonus_pool[#bonus_pool+1] = 'c_alchemy_bismuth'
end

if (SMODS.INIT.MoreFluff ~= nil) then
end

if (TheAutumnCircus ~= nil) then
    if TheAutumnCircus.config.enabled_modules.moreconsumables then
        bonus_pool[#bonus_pool+1] = 'c_Thac_universe'
        bonus_pool[#bonus_pool+1] = 'c_Thac_artist'
        bonus_pool[#bonus_pool+1] = 'c_Thac_joker'

        fortune_pool[#fortune_pool+1] = 'c_Thac_happy_squirrel'
        fortune_pool[#fortune_pool+1] = 'c_Thac_void'
    end
    if TheAutumnCircus.config.enabled_modules.basicoddities and SMODS.INIT.OddityAPI then
        fortune_pool[#fortune_pool+1] = 'c_Thac_one_jollar'
        fortune_pool[#fortune_pool+1] = 'c_Thac_two_jollar'
        fortune_pool[#fortune_pool+1] = 'c_Thac_five_jollar'
        fortune_pool[#fortune_pool+1] = 'c_Thac_ten_jollar'
        fortune_pool[#fortune_pool+1] = 'c_Thac_twenty_jollar'

        --bonus_pool[#bonus_pool+1] = 'c_Thac_jimbobread_man'
    end
end


SMODS.Booster {
    key = 'suit_normal_1',
    atlas = 'sylvie_boosters',
    group_key = 'k_suits_pack',
    loc_txt = {
        name = "Suits Pack",
        text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2# Suit-Themed{} cards.",
        }
    },
    weight = 1,
    name = "Suits Pack",
    pos = {x = 0, y = 0},
    config = {extra = 3, choose = 1, name = "Suits Pack"},
    create_card = function(self, card)
        create_card("Suits", G.pack_cards, nil, nil, true, true, nil, "ss_suits")
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
 }



--SMODS.Booster:new("Suits Pack", "suit_normal_1", {extra = 3, choose = 1}, { x = 0, y = 0 }, 5, true, 1, "Arcana", "sylvie_boosters"):register()
--SMODS.Booster:new("Suits Pack", "suit_normal_2", {extra = 3, choose = 1}, { x = 1, y = 0 }, 5, true, 1, "Arcana", "sylvie_boosters"):register()
--SMODS.Booster:new("Jumbo Suits Pack", "suit_jumbo", {extra = 5, choose = 1}, { x = 2, y = 0 }, 7, true, 0.75, "Arcana", "sylvie_boosters"):register()
--SMODS.Booster:new("Mega Suits Pack", "suit_mega", {extra = 5, choose = 2}, { x = 3, y = 0 }, 9, true, 0.25, "Arcana", "sylvie_boosters"):register()
--SMODS.Booster:new("Bonus Pack", "bonus_normal", {extra = 3, choose = 1}, { x = 0, y = 1 }, 5, true, 1, "Arcana", "sylvie_boosters"):register()
--SMODS.Booster:new("Jumbo Bonus Pack", "bonus_jumbo", {extra = 5, choose = 1}, { x = 1, y = 1 }, 7, true, 0.75, "Arcana", "sylvie_boosters"):register()
--SMODS.Booster:new("Fortune Pack", "fortune_normal", {extra = 3, choose = 1}, { x = 2, y = 1 }, 5, true, 1, "Arcana", "sylvie_boosters"):register()
--SMODS.Booster:new("Jumbo Fortune Pack", "fortune_jumbo", {extra = 5, choose = 1}, { x = 3, y = 1 }, 7, true, 0.75, "Arcana", "sylvie_boosters"):register()


G.localization.descriptions["Other"]["p_suits_jumbo"] = {
    name = "Jumbo Suits Pack",
    text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2# Suit-Themed{} cards.",
    }
}
G.localization.descriptions["Other"]["p_suits_mega"] = {
    name = "Mega Suits Pack",
    text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2# Suit-Themed{} cards.",
    }
}
G.localization.descriptions["Other"]["p_bonus_normal"] = {
    name = "Bonus Pack",
    text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2#{} {X:dark_edition,C:white}Bonus{} cards.",
    }
}
G.localization.descriptions["Other"]["p_bonus_jumbo"] = {
    name = "Jumbo Bonus Pack",
    text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2#{} {X:dark_edition,C:white}Bonus{} cards.",
    }
}
G.localization.descriptions["Other"]["p_fortune_normal"] = {
    name = "Fortune Pack",
    text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2#{} {C:money}Fortune{} cards.",
    }
}
G.localization.descriptions["Other"]["p_fortune_jumbo"] = {
    name = "Jumbo Fortune Pack",
    text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2#{} {C:money}Fortune{} cards.",
    }
}

]]




----------------------------------------------
------------MOD CODE END----------------------
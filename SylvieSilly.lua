--- STEAMODDED HEADER
--- MOD_NAME: Sylvie's Silliness
--- MOD_ID: SylvieSilly
--- PREFIX: sylvie
--- MOD_AUTHOR: [NewtTheFish, elbe]
--- MOD_DESCRIPTION: A few decks, blinds, etc. Have fun!
--- DISPLAY_NAME: Sylvie Sillies
--- BADGE_COLOUR: C7387D
--- PRIORITY: 25

----------------------------------------------
------------MOD CODE -------------------------
---
local suits =  {
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
}
local bonus = {
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

        'c_alchemy_cobalt',
        'c_alchemy_bismuth',
    },
    ['Joker'] = {},
    ['Spectral'] = {
        'c_familiar',
        'c_grim',
        'c_incantation',
        'c_cryptid',

        'c_talisman',
        'c_deja_vu',
    },
}
local fortune = {
    ['TarotPlanet'] = {
        'c_fool',
        'c_wheel_of_fortune',
        'c_hermit',
        'c_temperance',
        'c_judgement',
        'c_magician',
        'c_lovers',

        'c_sylvie_euceladus',
        
        'c_alchemy_sulfur',
        'c_alchemy_antimony',
        'c_alchemy_arsenic',
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

        'c_sylvie_bloom',
    },
}
local consumable_types = {
    "Tarot",
    "Planet",
    "Loteria",
    "Alchemical",
    "Stellar",
    "Colour",
    "Familiar_Tarots",
    "jen_exconsumable",
    "Planet_dx",
    "Alchemical_dx",
    "Tarot_dx",
    "Tarot_cu"
}
local spectral_types = {
    "Spectral",
    "Spectral_dx",
    "Enhancedspectrals",
    "Familiar_Spectrals"
}
local suit_terms = {
    "suit",
    "heart",
    "club",
    "diamond",
    "spade",
    "ink",
    "colors",
    "moons",
    "stars",
    "fleuron",
    "halberd",
    "wild",
    "spectrum",
    "flush"
}
local bonus_terms = {
    "enhances",
    "bonus card",
    "mult card",
    "stone card",
    "wild card",
    "glass card",
    "steel card",
    "gold card",
    "lucky card",
    "brass card",
    "blank card",
    "wooden card",
    "coal card",
    "post card",
    "bent card",
    "index card",
    "sand card",
    "rusty card",
    "ore card",
    "iou card",
    "recycled card",
    "rpg card",
    "package card",
    "medical card",
    "slimy card",
    "geo card",
    "ofuda card",
    "platinum card",
    "charmed ",
    "div ",
    "gilded ",
    "penalty ",
    "echo card",
    "multichip card",
    "powerchip card",
    "multimult card",
    "powermult card",
    "supercharged card",
    "surreal card",
    "astro card",
    "fortune card",
    "osmium card",
    "fizzy card",
    "blue card",
    "handy card",
    "juggling card",
    "tossy card"
}
local fortune_terms = {
    "gold card",
    "$"
}

local function check_description(card, search_term)
    if G.localization.descriptions[card.set] and G.localization.descriptions[card.set][card.key] and G.localization.descriptions[card.set][card.key].text then
        for _,v in ipairs(G.localization.descriptions[card.set][card.key].text) do
            if v:lower():find(search_term) then
                return true
            end
        end
    end
    return false
end

local function add_to_table(pool, card)
    for _,v in ipairs(pool) do
        if v == card then
            return false
        end
    end
    return true
end

local function add_to_pools(pool, prefix, search_terms)
    if pool["TarotPlanet"] then
        G.P_CENTER_POOLS[prefix .. "_TarotPlanet"] = {}
        for _,v in ipairs(pool["TarotPlanet"]) do
            if G.P_CENTERS[v] then
                table.insert(G.P_CENTER_POOLS[prefix .. "_TarotPlanet"], G.P_CENTERS[v])
            end
        end
        for _,t in ipairs(consumable_types) do
            if G.P_CENTER_POOLS[t] then
                for i,_ in ipairs(G.P_CENTER_POOLS[t]) do
                    for _,s in ipairs(search_terms) do
                        if check_description(G.P_CENTER_POOLS[t][i], s) then
                            if add_to_table(G.P_CENTER_POOLS[prefix .. "_TarotPlanet"], G.P_CENTER_POOLS[t][i]) then
                                table.insert(G.P_CENTER_POOLS[prefix .. "_TarotPlanet"], G.P_CENTER_POOLS[t][i])
                            end
                        end
                    end
                end
            end
        end
    end
    if pool["Joker"] then
        G.P_CENTER_POOLS[prefix .. "_Joker"] = {}
        for _,v in ipairs(pool["Joker"]) do
            if G.P_CENTERS[v] then
                table.insert(G.P_CENTER_POOLS[prefix .. "_Joker"], G.P_CENTERS[v])
            end
        end
        for i,_ in ipairs(G.P_CENTER_POOLS["Joker"]) do
            for _,s in ipairs(search_terms) do
                if check_description(G.P_CENTER_POOLS["Joker"][i], s) then
                    if add_to_table(G.P_CENTER_POOLS[prefix .. "_Joker"], G.P_CENTER_POOLS["Joker"][i]) then
                        table.insert(G.P_CENTER_POOLS[prefix .. "_Joker"], G.P_CENTER_POOLS["Joker"][i])
                    end
                end
            end
        end
    end
    if pool["Spectral"] then
        G.P_CENTER_POOLS[prefix .. "_Spectral"] = {}
        for _,v in ipairs(pool["Spectral"]) do
            if G.P_CENTERS[v] then
                table.insert(G.P_CENTER_POOLS[prefix .. "_Spectral"], G.P_CENTERS[v])
            end
        end
        for _,t in ipairs(spectral_types) do
            if G.P_CENTER_POOLS[t] then
                for i,_ in ipairs(G.P_CENTER_POOLS[t]) do
                    for _,s in ipairs(search_terms) do
                        if check_description(G.P_CENTER_POOLS[t][i], s) then
                            if add_to_table(G.P_CENTER_POOLS[prefix .. "_Spectral"], G.P_CENTER_POOLS[t][i]) then
                                table.insert(G.P_CENTER_POOLS[prefix .. "_Spectral"], G.P_CENTER_POOLS[t][i])
                            end
                        end
                    end
                end
            end
        end
    end
end

G.localization.misc.dictionary["k_suits_pack"] = "Suits Pack"
G.localization.misc.dictionary["k_bonus_pack"] = "Bonus Pack"
G.localization.misc.dictionary["k_fortune_pack"] = "Fortune Pack"

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
    requires={'v_sylvie_stamper'}
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
    key = "europa",
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
    key = "io",
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
    key = "callisto",
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
    key = "ganymede",
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
    key = "charon",
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
    key = "hydra",
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
    key = "titan",
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
    key = "euceladus",
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
    cost = 5,
    weight = 1,
    name = "Suits Pack",
    pos = {x = 0, y = 0},
    draw_hand = true,
    config = {draw_hand = true, extra = 3, choose = 1, name = "Suits Pack"},
    create_card = function(self, card)
        if pseudorandom('fortune-pack-tarot') < 0.75 then
            if pseudorandom('fortune-pack-spectral') < 0.95 then
                return {set = "Suits_TarotPlanet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            else
                return {set = "Suits_Spectral", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            end
        end
        return {set = "Suits_Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
}
SMODS.Booster {
    key = 'suit_normal_2',
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
    cost = 5,
    name = "Suits Pack",
    pos = {x = 1, y = 0},
    draw_hand = true,
    config = {draw_hand = true, extra = 3, choose = 1, name = "Suits Pack"},
    create_card = function(self, card)
        if pseudorandom('fortune-pack-tarot') < 0.75 then
            if pseudorandom('fortune-pack-spectral') < 0.95 then
                return {set = "Suits_TarotPlanet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            else
                return {set = "Suits_Spectral", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            end
        end
        return {set = "Suits_Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
}
SMODS.Booster {
    key = 'suit_jumbo',
    atlas = 'sylvie_boosters',
    group_key = 'k_suits_pack',
    loc_txt = {
        name = "Jumbo Suits Pack",
        text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2# Suit-Themed{} cards.",
        }
    },
    weight = 0.75,
    cost = 7,
    name = "Jumbo Suits Pack",
    pos = {x = 2, y = 0},
    draw_hand = true,
    config = {draw_hand = true, extra = 5, choose = 1, name = "Jumbo Suits Pack"},
    create_card = function(self, card)
        if pseudorandom('fortune-pack-tarot') < 0.75 then
            if pseudorandom('fortune-pack-spectral') < 0.95 then
                return {set = "Suits_TarotPlanet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            else
                return {set = "Suits_Spectral", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            end
        end
        return {set = "Suits_Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
}
SMODS.Booster {
    key = 'suit_mega',
    atlas = 'sylvie_boosters',
    group_key = 'k_suits_pack',
    loc_txt = {
        name = "Mega Suits Pack",
        text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2# Suit-Themed{} cards.",
        }
    },
    weight = 0.25,
    cost = 9,
    name = "Mega Suits Pack",
    pos = {x = 3, y = 0},
    draw_hand = true,
    config = {draw_hand = true, extra = 5, choose = 2, name = "Mega Suits Pack"},
    create_card = function(self, card)
        if pseudorandom('fortune-pack-tarot') < 0.75 then
            if pseudorandom('fortune-pack-spectral') < 0.95 then
                return {set = "Suits_TarotPlanet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            else
                return {set = "Suits_Spectral", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            end
        end
        return {set = "Suits_Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
}
SMODS.Booster {
    key = 'bonus_normal',
    atlas = 'sylvie_boosters',
    group_key = 'k_bonus_pack',
    loc_txt = {
        name = "Bonus Pack",
        text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2# Bonus{} cards.",
        }
    },
    cost = 5,
    weight = 1,
    name = "Bonus Pack",
    pos = {x = 0, y = 1},
    draw_hand = true,
    config = {draw_hand = true, extra = 3, choose = 1, name = "Bonus Pack"},
    create_card = function(self, card)
        if pseudorandom('fortune-pack-tarot') < 0.75 then
            if pseudorandom('fortune-pack-spectral') < 0.95 then
                return {set = "Bonus_TarotPlanet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            else
                return {set = "Bonus_Spectral", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            end
        end
        return {set = "Bonus_Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
}
SMODS.Booster {
    key = 'bonus_jumbo',
    atlas = 'sylvie_boosters',
    group_key = 'k_bonus_pack',
    loc_txt = {
        name = "Jumbo Bonus Pack",
        text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2# Bonus{} cards.",
        }
    },
    cost = 7,
    weight = 0.75,
    name = "Jumbo Bonus Pack",
    pos = {x = 1, y = 1},
    draw_hand = true,
    config = {draw_hand = true, extra = 5, choose = 1, name = "Jumbo Bonus Pack"},
    create_card = function(self, card)
        if pseudorandom('fortune-pack-tarot') < 0.75 then
            if pseudorandom('fortune-pack-spectral') < 0.95 then
                return {set = "Bonus_TarotPlanet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            else
                return {set = "Bonus_Spectral", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            end
        end
        return {set = "Bonus_Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
}
SMODS.Booster {
    key = 'fortune_normal',
    atlas = 'sylvie_boosters',
    group_key = 'k_fortune_pack',
    loc_txt = {
        name = "Fortune Pack",
        text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2# Fortune{} cards.",
        }
    },
    cost = 5,
    weight = 1,
    name = "Fortune Pack",
    pos = {x = 2, y = 1},
    draw_hand = true,
    config = {draw_hand = true, extra = 3, choose = 1, name = "Fortune Pack"},
    create_card = function(self, card)
        if pseudorandom('fortune-pack-tarot') < 0.75 then
            if pseudorandom('fortune-pack-spectral') < 0.95 then
                return {set = "Fortune_TarotPlanet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            else
                return {set = "Fortune_Spectral", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            end
        end
        return {set = "Fortune_Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
}
SMODS.Booster {
    key = 'fortune_jumbo',
    atlas = 'sylvie_boosters',
    group_key = 'k_fortune_pack',
    loc_txt = {
        name = "Jumbo Fortune Pack",
        text = {
        "Choose {C:attention}#1#{} of up to",
        "{C:attention}#2# Fortune{} cards.",
        }
    },
    cost = 7,
    weight = 0.75,
    name = "Jumbo Fortune Pack",
    pos = {x = 3, y = 1},
    draw_hand = true,
    config = {draw_hand = true, extra = 3, choose = 1, name = "Jumbo Fortune Pack"},
    create_card = function(self, card)
        if pseudorandom('fortune-pack-tarot') < 0.75 then
            if pseudorandom('fortune-pack-spectral') < 0.95 then
                return {set = "Fortune_TarotPlanet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            else
                return {set = "Fortune_Spectral", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
            end
        end
        return {set = "Fortune_Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "fort"}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
}

local splash_screenRef = Game.splash_screen
function Game:splash_screen()
	local ret = splash_screenRef(self)
    -- RESET
    G.P_CENTERS["m_bonus"].config.bonus = 30
    G.P_CENTERS["m_mult"].config.mult = 4
    G.P_CENTERS["m_stone"].config.bonus = 50
    G.P_CENTERS["m_gold"].config.h_dollars = 3

    add_to_pools(suits, "Suits", suit_terms)
    add_to_pools(bonus, "Bonus", bonus_terms)
    add_to_pools(fortune, "Fortune", fortune_terms)

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

----------------------------------------------
------------MOD CODE END----------------------
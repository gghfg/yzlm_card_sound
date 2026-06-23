local mod = RegisterMod("yzlm_card_sound", 1)
local sfx = SFXManager()

-- 尝试在加载时获取 sounds.xml 中定义的声音 ID（name="LocalCardUse"）
local CARD_SOUND_NAME = "LocalCardUse"
local cardSoundId = Isaac.GetSoundIdByName(CARD_SOUND_NAME)

if cardSoundId == nil or cardSoundId < 0 then
    print("[yzlm_card_sound] Warning: sound '" .. CARD_SOUND_NAME .. "' not found. Check content/sounds.xml and resources/sounds/")
else
    print("[yzlm_card_sound] Loaded sound id: " .. tostring(cardSoundId))
end

-- 在使用任何卡牌后播放本地音频
mod:AddCallback(ModCallbacks.MC_USE_CARD, function(_, card, player, useFlags)
    if cardSoundId and cardSoundId >= 0 then
        -- 参数: ID, Volume, FrameDelay, Loop, Pitch, Pan
        sfx:Play(cardSoundId, 1.0, 2, false, 1.0, 0)
    end
end)

print("[yzlm_card_sound] main.lua loaded")

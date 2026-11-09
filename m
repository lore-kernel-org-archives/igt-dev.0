Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F3606A32A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 18:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GM2IK0yO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7240710E140;
	Mon,  9 Nov 2026 18:08:22 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A9810E18A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 18:07:20 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-8b5efadd183so532644b3a.1
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Nov 2026 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794247640; x=1794852440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FU/Mk/1xdQdzS8Mlo6nKTJlneWoAT7zLpECBw95QIHo=;
 b=GM2IK0yOOpP25Q6u3tsks83uA/9Skf4jVeAZ9RQ4lQM3yDm/buTNPpMqlfsul8sRBs
 cZ6vYTin0LFzYzol6jrTvaUVsUAmTN9B1i0xQaqY+/gRSaTxkvuaYXZpA/iws2mdB6Hi
 7TqP/ZqX7Q4xEqGjVFgyO37PPfZv0D4oI9kFkd0PCbTUPbCbNO4UVq4D4VqL8W4E+o7S
 2R/rJ5Gmej3rB5s6AMTAlbXA8fRrMf4P2mrTH/Qa/cZNEPi1Ggthq7bQ9xuZbvWZt1zW
 I6LFNealCQFgQo7jiHFpTq79nUoRxPiUFAnYOCEONtsjOuis0q4w84iFbY7sEsOEu4LR
 i1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794247640; x=1794852440;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FU/Mk/1xdQdzS8Mlo6nKTJlneWoAT7zLpECBw95QIHo=;
 b=cbzU9fd71pRceJYx/dgwI5VrsbVzctHS7W9iO2GC0Q1dc88Pa7n8tjxrBFOO+iU28E
 jyXW6at2OdE+I3zcTvN4r5TXt/9NiKJD44rZ3M+4a1xXn9QTok1W6Im3P60v7NXeYN3B
 8JoeECIRKxnManEHX1dd4/2jz81UJjUW9+FQE3BQIchBGjF+E79LV75xoBDLFJ2o8AhG
 2VhrwID4uJkavStezdf35ce3yqs27KdIdGWKTQeN6obwzroBnMctCGtEOQJYf0udwiNk
 z4DOwvm1lXW0PbpMnl8GyTj0Gstdj2u8nAMIXhdCOWZHb783OY1+JdUx5WioKhVdk1Qt
 rgEw==
X-Forwarded-Encrypted: i=1;
 AL+hErHuHJGxhheyDot4HJsB6Kzfls3T9B2tKfAdHhGGes4NwmXUSKlBGWdns4akQWs+wxwWubISu/EX@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/P2PaS5EA5Yn/UKK3fS2fGsk6Gto/5aL1dIVpgJD5dszbYMrB9
 nVF2XzvNsiARoFxievHwukJwOSrbNZ9eR1IsNLvSyOsCbWvilFtdP2Vw
X-Gm-Gg: AYBFou2zv5zKE2wn8zmJE2qnEFm5W9EgNOme6s+4FaU8qPJ+XXzRtPKcEVxG9LnSxcP
 DvEqjWwXy92PqdQMBDkQARmcr+Q5fO9b2dc0YGWfkioIO7gzSAyemgNFVOVYYkvkqGUTcW7Lk2Z
 mXL7/CYBpxKWFRbZnwK0FEYNIwAi8IeJi9hKUtN28q6QPygzQYJiw8if0yWNs/i+OA/mUw8Dz5t
 qVkyTyxeNa77GRPy9LzTmTzgo2saE2pjDqH9in3b2hLWQF2h6LyO2Yxbc0dL6oXWRKMnqvRC3hX
 Zmf6IZ2wmnX2xfuEhl/Kv+FBjVLK6ukyrh88vwjrPYGc9lGUR+2W/fqlHuWBlE+KT2Wz7cLqHMi
 2Hnx7GMr4TdubBtNAEVWNWmHfj39EfOF6aZVTV4UjOnCTGmxiuEM4yvUzRlrs4BJ0VjEguhDi2t
 cVqgO8T48qCb6mpCBeYDcZseGeojKEoIms1v5uEwzxqeitePVfGndRPOXKftxYBg+kxWpczN76q
 YvPhdn7DNW7rv/XFBuaG1EvBrTGwITFsrWUgu7mU3/8vUw8PCTew67tnHYISeg0GsM98/9FMh+H
 GTuUcxlnoaJdCsbdxgI6rm7AsUw3CwCSu8TMsnh2UPalnbsLq6tVecx9xWPmisxiW7lWvEY=
X-Received: by 2002:a17:90b:2784:b0:3ac:7a5f:2cee with SMTP id
 98e67ed59e1d1-3b167b531a8mr185670a91.39.1794247639749; 
 Mon, 09 Nov 2026 10:07:19 -0800 (PST)
Received: from [192.55.54.41] ([192.55.54.41])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cdd8d5eb471sm59856a12.2.2026.11.09.10.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 10:07:19 -0800 (PST)
Message-ID: <b07529dc-413a-460d-a9c4-2b73332a7b41@gmail.com>
Date: Mon, 9 Nov 2026 20:07:15 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 10/10] tests/kms_plane_scaling: remove legacy
 subtests covered by max-crc tests
To: Luca Coelho <luca@coelho.fi>, igt-dev@lists.freedesktop.org
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
 <20261028145202.3128915-10-juhapekka.heikkila@gmail.com>
 <ac5ccacc1790da44668432893595d432b90ffb28.camel@coelho.fi>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <ac5ccacc1790da44668432893595d432b90ffb28.camel@coelho.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 09/11/2026 11.34, Luca Coelho wrote:
> On Wed, 2026-10-28 at 16:52 +0200, Juha-Pekka Heikkila wrote:
>> The plane-*-max-crc subtests search scaling limits kernel actually accepts
>> for each pixel format, modifier and rotation, on all pipes, for primary
>> and overlay planes alone and together, and verify result with crc. Legacy
>> subtests below only checked that commit with fixed scaling factor was
>> accepted, skipping on -EINVAL or -ERANGE, so they never
>> verified the scaled output.
>>
>> The first three removed groups each had six variants: upscale-20x20,
>> upscale-factor-0-25, downscale-factor-0-25, downscale-factor-0-5,
>> downscale-factor-0-75 and scaler-unity-scaling.
>>
>> plane-*-with-pixel-format
>>    Covered by plane-{up/down}scale-max-crc-linear, which tests every
>>    format at largest accepted factor and checks the crc.
>>    Unity scaling is reference commit of each max-crc step.
>>
>> plane-*-with-modifiers
>>    Covered by per modifier plane-{up/down}scale-max-crc-* subtests.
>>
>> plane-*-with-rotation
>>    Linear XRGB8888 walking rotations 0, 90, 180, 270 and returning on the
>>    first rejected commit. Where 90 is advertised it is rejected with
>>    linear, so only rotation 0 was ever exercised; Covered by
>>    plane-{up/down}scale-max-crc-* and plane-{up/down}scale-max-crc-rotation-*
>>
>> planes-* (24 subtests)
>>    Covered by the two plane steps of the max-crc subtests on pipes with
>>    at least two scalers: both planes unscaled as the crc reference, both
>>    planes at their limits at the same time, and the primary at its limit
>>    with the overlay scaled 2x in the opposite direction.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
> 
> When looking at this again, I had a feeling some of the tests were
> still missing, so I ran it through Claude and it seems that there are
> still a bunch of tests dropped, or with reduced coverage.  But instead
> of just copying its comments here, I think it's more efficient if you
> run these changes through an LLM to compare the previous coverage with
> the current one.
> 
> Also, it would be nice to have a cover-letter with a small changelog on
> what changed between one patchset version and the next, so it's easy to
> check what has changed without going over the patches again.
> 

Hi Luca,

not sure what was missed. Here's a comparison of old and new coverage.

Covered now with crc instead of commit-only: every format, modifier and 
rotation at the limit; fixed factors (the search probes the whole range 
with TEST_ONLY and crc-checks the extreme); unity (the reference commit 
of every step); two planes in the same and in opposite directions. The 
old rotation tests in reality only ran rotation 0 and nothing else.

Differences that are intentional:

- Width and height are scaled separately. Each axis has its own limit 
and testing them one at a time keeps the framebuffers small as well as 
tells which axis broke.
- Only primary and first overlay are used. Scalers are pipe resource and 
get assigned to whichever plane needs one, so more overlays would run 
the same scalers again. Per-plane format/modifier support is checked 
before the overlay is used.
- Native mode only instead of walking connector modes until one is 
accepted. The test is about scaler limits and not about mode selection.
- Pipe crc is required. Without crc old tests only showed commit was 
accepted, which the TEST_ONLY still cover.
- Intermediate factors are only probed with TEST_ONLY. Extreme factor is 
the one that stresses the scaler.

If something else is missing that isn't covered by the above, please 
point it out and I'll take a second look.

/Juha-Pekka


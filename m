Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB0606A330
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXE+efOe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F9510E482;
	Tue, 10 Nov 2026 10:56:56 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0257C10EFAC
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 10:55:45 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-8a9f9473029so1516772b3a.2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 02:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794308145; x=1794912945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EvjoSBhhWVwWdV9lUqrnHXzHtKrEoWEpIEx4GGgCL6k=;
 b=HXE+efOeeWqpwhpVuhfOUgRALuMPrPy5X6hjkyXUX5nC3kKCDp/2oAGUlSox7PZiLx
 OGzWJESZAl2nvV7X2EirAoIEY9GvBMi13bZIYskhhGHqSPD0Zcx69cROf0TCOZiW95wJ
 LJs3Qs0K+sRk8jp7Tk5TXvn/kYsDzRoJNrM3EBQwtbPPKyJQb4wxSvbPqHlmsbRoxhak
 a+baC/HXg9pWBB3YyvrvVuBh2E8LkhDu9FPALMkgkhbbFVPQfABuCLYr7P9ZuoTy1x4j
 uF5R8gbV4EtFRLoKcf/NWICZ19yNLMODKnm/1gBVp4dQsDZjgspywBXHptv4G3mUkwb3
 nypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794308145; x=1794912945;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EvjoSBhhWVwWdV9lUqrnHXzHtKrEoWEpIEx4GGgCL6k=;
 b=rajDudIpYjQva1nub1FEdkegAZpUF4DKWnG2zIP4ypMAt3bbpB7JLIAnhaXgTxCDRo
 MpKtDSdolBHw7RjOU7UMd8yRKcaJQ9QLwJsHuuRBt9W1jAWhf7vKhmKny7Uih64wUmb2
 aShvXQ7mkeLC2OnP77vvaBaISiX+YsyYOKEhTOUUgUTLcoL0rMPQbml0wsP8lmVxx0dq
 tMQyIFmFw62mTWKV/uqNvtDkc5YWpNxGXq0/Da0ynVB28U4i4T7VB9kzcIaUxgZWfiSz
 eZgk+EvCzha3mOEUhJlGxUAb5eH/Q5mkLdyK27FZVNQJYDwczg1ZlL26xXcdV0avPf5w
 2bNw==
X-Forwarded-Encrypted: i=1;
 AL+hErFrBv2xjLOIXzUECsJwz5GW3okuY402TNF/0vZ/SXe2IXULOv5WeC0tG7zlsZHB9kfHWFcrOkEU@lists.freedesktop.org
X-Gm-Message-State: APuU4Z981GZwXHW8DgEAmfXfY2BMyhlRAAF4aWj/be2iAA9cD1Vp3t6c
 JIg2TGluUdi/5wsXEfg58dSLcnTOowpub/xZcCeqGr+IOr+oJjbu0TTkEDC2Rsf8O1s=
X-Gm-Gg: AYBFou28jJI100TNqiUduRhnsmlfG1pmP+KhaX0V/EDojJXHXj3i6xCZ6mqfmBYgeak
 FIVQbm8wWZfKP7Hf3wqgoLpQsjL53RPruAndeHoDWNRRaxmXxpmbpqLFgM6LA0JWtSV7bCwyNEY
 S09I7U022Upo5pKpE8kN2TCMGMTlxVFceGtMN5SDPllJgu3CyMLHXj3shrTI/yht6l6W8x0sn5M
 2RBjGhjdKLU9k6jK5v7MTLMwhn0p/nKaG2XB8aF+QWPwSugo7HMq6dueiqF8ed2mx/aHXWpALag
 RxoXbQ1PUsBaZ2TivVsc676g3VYff36RQQ5I8brjRfMibNhl0KIYzQDL9bXFDoACcrYvnZiZ+i+
 XGHtQXI3X5lgv9SVa9e9xuvmXndZQKbnQSMWLa8tcQK+pKO4WQ/IvEKs5QeaiuD1kJn7oxCsLnz
 K3ZI8FSzEq/ufxesAiilo8AmiUws+pvTYWtPGiY4E92a+HciFC4Va0JIgqVaK0o/pjY3ByEeIve
 dE/FFNI/hagsX4Y26Z5Q19RAJx/oRUfafQsUSsc+zxYdQfk8YLHc6laMdTJ4o6gebCTOiHwmsuP
 BBrHxOaYghiTegXy26DnmR+WBP7/z9sgn2SguEMOlxQYQWpW5T8Dp+I4UCgH3sxG7JQaRFgO2G5
 y
X-Received: by 2002:a05:6a20:e0a:b0:3de:505d:d77d with SMTP id
 adf61e73a8af0-3f18e7c26d7mr1559124637.15.1794308145232; 
 Tue, 10 Nov 2026 02:55:45 -0800 (PST)
Received: from [134.134.137.76] ([134.134.137.76])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa7de3a55sm700305b3a.3.2026.11.10.02.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 02:55:44 -0800 (PST)
Message-ID: <3a6a5381-6f7d-4e72-af57-d220f68d4574@gmail.com>
Date: Tue, 10 Nov 2026 12:55:41 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 10/10] tests/kms_plane_scaling: remove legacy
 subtests covered by max-crc tests
To: Luca Coelho <luca@coelho.fi>, igt-dev@lists.freedesktop.org
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
 <20261028145202.3128915-10-juhapekka.heikkila@gmail.com>
 <ac5ccacc1790da44668432893595d432b90ffb28.camel@coelho.fi>
 <b07529dc-413a-460d-a9c4-2b73332a7b41@gmail.com>
 <70a6b6cc10b5056679b60c5ee9d6c99e089c79b6.camel@coelho.fi>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <70a6b6cc10b5056679b60c5ee9d6c99e089c79b6.camel@coelho.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 10/11/2026 10.02, Luca Coelho wrote:
> On Mon, 2026-11-09 at 20:07 +0200, Juha-Pekka Heikkilä wrote:
>>
>> On 09/11/2026 11.34, Luca Coelho wrote:
>>> On Wed, 2026-10-28 at 16:52 +0200, Juha-Pekka Heikkila wrote:
>>>> The plane-*-max-crc subtests search scaling limits kernel actually accepts
>>>> for each pixel format, modifier and rotation, on all pipes, for primary
>>>> and overlay planes alone and together, and verify result with crc. Legacy
>>>> subtests below only checked that commit with fixed scaling factor was
>>>> accepted, skipping on -EINVAL or -ERANGE, so they never
>>>> verified the scaled output.
>>>>
>>>> The first three removed groups each had six variants: upscale-20x20,
>>>> upscale-factor-0-25, downscale-factor-0-25, downscale-factor-0-5,
>>>> downscale-factor-0-75 and scaler-unity-scaling.
>>>>
>>>> plane-*-with-pixel-format
>>>>     Covered by plane-{up/down}scale-max-crc-linear, which tests every
>>>>     format at largest accepted factor and checks the crc.
>>>>     Unity scaling is reference commit of each max-crc step.
>>>>
>>>> plane-*-with-modifiers
>>>>     Covered by per modifier plane-{up/down}scale-max-crc-* subtests.
>>>>
>>>> plane-*-with-rotation
>>>>     Linear XRGB8888 walking rotations 0, 90, 180, 270 and returning on the
>>>>     first rejected commit. Where 90 is advertised it is rejected with
>>>>     linear, so only rotation 0 was ever exercised; Covered by
>>>>     plane-{up/down}scale-max-crc-* and plane-{up/down}scale-max-crc-rotation-*
>>>>
>>>> planes-* (24 subtests)
>>>>     Covered by the two plane steps of the max-crc subtests on pipes with
>>>>     at least two scalers: both planes unscaled as the crc reference, both
>>>>     planes at their limits at the same time, and the primary at its limit
>>>>     with the overlay scaled 2x in the opposite direction.
>>>>
>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>> ---
>>>
>>> When looking at this again, I had a feeling some of the tests were
>>> still missing, so I ran it through Claude and it seems that there are
>>> still a bunch of tests dropped, or with reduced coverage.  But instead
>>> of just copying its comments here, I think it's more efficient if you
>>> run these changes through an LLM to compare the previous coverage with
>>> the current one.
>>>
>>> Also, it would be nice to have a cover-letter with a small changelog on
>>> what changed between one patchset version and the next, so it's easy to
>>> check what has changed without going over the patches again.
>>>
>>
>> Hi Luca,
>>
>> not sure what was missed. Here's a comparison of old and new coverage.
>>
>> Covered now with crc instead of commit-only: every format, modifier and
>> rotation at the limit; fixed factors (the search probes the whole range
>> with TEST_ONLY and crc-checks the extreme); unity (the reference commit
>> of every step); two planes in the same and in opposite directions. The
>> old rotation tests in reality only ran rotation 0 and nothing else.
>>
>> Differences that are intentional:
>>
>> - Width and height are scaled separately. Each axis has its own limit
>> and testing them one at a time keeps the framebuffers small as well as
>> tells which axis broke.
>> - Only primary and first overlay are used. Scalers are pipe resource and
>> get assigned to whichever plane needs one, so more overlays would run
>> the same scalers again. Per-plane format/modifier support is checked
>> before the overlay is used.
>> - Native mode only instead of walking connector modes until one is
>> accepted. The test is about scaler limits and not about mode selection.
>> - Pipe crc is required. Without crc old tests only showed commit was
>> accepted, which the TEST_ONLY still cover.
>> - Intermediate factors are only probed with TEST_ONLY. Extreme factor is
>> the one that stresses the scaler.
>>
>> If something else is missing that isn't covered by the above, please
>> point it out and I'll take a second look.
> 
> This is, very shortly, what Claude found:
> 
> * Other plane pairs: these still aren't covered, which JP agreed to on
>    v1, yet the commit message says planes-* is covered.

you're right, the commit message overstates it. Both scalers are pipe 
resources, so pairs other than primary + first overlay use the same two 
scalers. I'll reword the message to say only primary + first overlay are 
tested and why.

> 
> * Full-screen scaling: two full-screen overlapping planes became two
>    64-pixel strips side by side, so the expensive bandwidth case isn't
>    exercised anymore.

Bands still reach the peak pixel rate since that depends on the scale 
ratio and not on the height. What they don't stress is memory bandwidth, 
which isn't a scaler property; kms_bw covers that case. I'd rather keep 
this test about scaler correctness.

> 
> * Fixed factors: 0.25, 0.5 and 0.75 used to be committed for real.  Now
>    only the limit is, and the binary search only uses TEST_ONLY commits,
>    which never reach the hardware.

True, TEST_ONLY probes don't reach hardware. Those old fixed-factor 
commits were only displayed, never verified: without crc they could only 
catch kernel warning or underrun. The max-crc tests do a real commit at 
the limit which is the most demanding factor and check output with crc. 
Real commit at smaller factor wouldn't add any check that the limit 
commit doesn't already do.

> 
> I'm not sure these make sense, so I'll leave them for you to comment.
> In any case, I don't want to block this, so if you think this is all
> fine, you have my:
> 
> Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

Thanks!

/Juha-Pekka

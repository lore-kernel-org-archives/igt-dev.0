Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB50606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CMKJw3uM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6301710E2F2;
	Mon, 26 Oct 2026 14:00:26 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D6210E314
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 13:58:48 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-35b2c599f43so681013eec.0
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793023127; x=1793627927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=r5YxiJyqCHAWVtN76arL0wOPnGPRRf7JOa69EwQnVvk=;
 b=CMKJw3uM/VMdIVA1UExdGWGRq64Sy86S63Yv8084LJI3Bto+7ZlZXFTi7zpBUCfEl+
 /BF/HQjlcuAWYdDDUHFuYdS+sXg0p+0hpmPiwUM5YQco1dloJ8P30GWn4ZlgsqCioc1c
 N14AiNXnhXy6PyPQF4CJo8h5SbU9JJcfIvUaIl6eEQ5wujHpPFwpZuYDqr3bj6RyZNe3
 RDwlR52lSf+QP4ppRBPBy1CJ+gRtH8cUoEe15ya3G9TrNO1TQ+17FI0pA68juvjFfAYa
 1KqeV58rViTeK0sw+30tPGTAN3fYL+oLEYZ0rbBJQAHZ7UazT2Tum+buPLpx9OAWlB5P
 7/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793023127; x=1793627927;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r5YxiJyqCHAWVtN76arL0wOPnGPRRf7JOa69EwQnVvk=;
 b=k4eNM3Q3Bf2+Ld9FkhLWevz6QeSofrw9iUpR6rAY7t9Kevmtl5BRuYYqSL99yW6d5D
 iXikLxvYoRn+z8ITwkG4mNo4aKr2AHXAaS1PV2R7ENq8YxZ57u6sAAvHZAf4xzgzg0gd
 EMu4xAXNpjmzZBBAwQP8oh1xSg+rKv8XYDm7Xrwuw1luu8f95+x4U8whAojglsxT4EzM
 MqT3YbdIcFyQ9oR8cXZGNlKtcv4vTTLzuOKCV1HOz+Hj2RtLNqBzfGmbgUCI6cpzKfKP
 OqvSRvanBrIGDJ0YYrseO0mvhSjvC5fBKeEHamxw1YuPDY+LDLUPs4YsZa0alG+WSMSq
 xUng==
X-Forwarded-Encrypted: i=1;
 AKwUvBxaFbGdnDbr9HVzbjRt05Xgu7QJEg/Id16Eil5eBKWoEh83Y3P+IzUAQl9Z4FXLUH2njzCDwX4H@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIfOXgomOOvMUaizrspymBFo8LN5tDqcv7zrQRH3ZeC3XxTZiAA
 aUQkwr1/8u8z8XV1eDA2/fi7Kxdo89SDdPerE5gtgEu9NmY2fJ5bSQl9QgD7VH2Cld8=
X-Gm-Gg: AYBFou0WbLVmmmI1t8sEVHbHNgqO5m5JmPKMX+yqtxrxFs8qLDeuEknsTFmut0WOO9I
 HXcltphw+MiLI6s8vlCICad5dkxhRXygdzZnwrqgyOd2puKxj9a0JGEelprP9lLfPl3M7xWMiQG
 wExk+uVqsFWZvhXnwzOashlnQZtEMiXy16ossoFkFLyWiIkvyfvau/VbskVumOW5AWVPYCjt5Re
 Pp8I+wiLLTPl+wqh5tTiVJ9riY2WPzposZGUpRXUiliwoODVj3KA8aeas+gPgSrwPBSZwFUBwfV
 TcGGavJDbIEixmmcGpdK1txlIbO84jjhjy1R/9ynrq9rmIqwHyfT5W0YZb/HiUUhooptVmgu7FL
 U5R1xPtQgBXhvK+LY/wDO2f4GY8D8lUU9FDJBQmNc8ZMUqIqi87nBLvGdJ/9bgjtaeSPGkSCJMQ
 DDs3hM6jtum8RpOGH8l7S9IlwfaDenkVVGjyyPDZibmQbUNgP0wi8bxRKmIyYL9JSK2Xwk/Zzwz
 cQbc42EwyBJGKO+yb6fdKAKcIUqE7o1m/D34MUdnacFejM/LDSGxkhD1eDZgcps+LrnNBpBzcnw
 EEnulSQ+173s23T+9LW7Ofw=
X-Received: by 2002:a05:7301:4205:b0:369:d793:328d with SMTP id
 5a478bee46e88-369e84bd8b1mr10614945eec.31.1793023127054; 
 Mon, 26 Oct 2026 06:58:47 -0700 (PDT)
Received: from [192.55.54.41] ([192.55.54.41])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8ec9276sm42571690eec.25.2026.10.26.06.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 06:58:46 -0700 (PDT)
Message-ID: <f54c30fc-70e3-48e3-bdd2-672b927bf7b9@gmail.com>
Date: Mon, 26 Oct 2026 15:58:43 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 9/9] tests/kms_plane_scaling: remove legacy subtests
 covered by max-crc tests
To: Luca Coelho <luca@coelho.fi>, igt-dev@lists.freedesktop.org
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
 <20261015131616.3172918-9-juhapekka.heikkila@gmail.com>
 <702623e740738dcca92ee3d8ecc3adf256f6f51e.camel@coelho.fi>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <702623e740738dcca92ee3d8ecc3adf256f6f51e.camel@coelho.fi>
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 19/10/2026 16.32, Luca Coelho wrote:
> On Thu, 2026-10-15 at 16:16 +0300, Juha-Pekka Heikkila wrote:
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
>>    plane-{up/down}scale-max-crc-* and plane-{up/down}scale-max-crc-rotation-*.
>>
>> planes-* (24 subtests)
>>    Covered by primary+overlay step of the max-crc subtests, which scales
>>    both planes at their limits at the same time on pipes with at least
>>    two scalers and compares against both planes unscaled.
>>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
> 
> This seems to drop some of the existing plane scaling coverage.  The
> planes-* subtests seem to be gone, at least the upscale/downscale
> mixes, and also some of the unity-scaling tests?
> 
> The max-crc tests and the overlay checks in patch 8 seem to cover
> only the scaling limits, so I'm not sure these cases are still covered.
> 
> 
> Would it make sense to keep some of the unity-scaling cases, or at
> least the 2-plane fixed-factor ones? But I'm probably missing
> something, so could you point out where they're covered now?
> 

Those legacy tests did only check if commit succeeded and skip on einval 
or erange while they never did any other checking. Where they're now 
covered is

unity scaling -> every max-crc-test start with 1:1 commit on primary, 
then overlay and in two-plane step both planes at 1:1 once. That commit 
gives reference crc for each format/modifier/rotation/pipe so broken 
unity commit would fail these tests

two planes scaled in the same direction -> patch 8 scales primary and 
overlay at their limits at the same time and compares crc we got against 
both planes unscaled.

fixed factors -> the limit search probes the whole range between 1:1 and 
the limit with TEST_ONLY commits and the limit itself is CRC-checked.

You're right on two planes scaled in opposite directions at once and 
plane pairs other than primary+first overlay are no longer covered. For 
next version I'll add a mixed-direction step to the max-crc test.

/Juha-Pekka

> 
> 
>>   tests/kms_plane_scaling.c | 697 --------------------------------------
>>   1 file changed, 697 deletions(-)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 176ab6b65..7e7155ccd 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -36,144 +36,14 @@
>>   #include <math.h>
>>   
>>   /**
>> - * SUBTEST: plane-scaler-unity-scaling-with-modifiers
>> - * Description: Tests scaling with modifiers, unity scaling.
>> - *
>>    * SUBTEST: plane-scaler-with-clipping-clamping-modifiers
>>    * Description: Tests scaling with clipping and clamping, modifiers.
>>    *
>> - * SUBTEST: plane-upscale-%s-with-modifiers
>> - * Description: Tests upscaling with modifiers %arg[1].
>> - *
>> - * arg[1]:
>> - *
>> - * @20x20:          from 20x20 fb
>> - * @factor-0-25:    for 0.25 scaling factor
>> - */
>> -
>> -/**
>> - * SUBTEST: plane-downscale-factor-%s-with-modifiers
>> - * Description: Tests downscaling with modifiers for %arg[1] scaling factor.
>> - *
>> - * arg[1]:
>> - *
>> - * @0-25:   0.25
>> - * @0-5:    0.5
>> - * @0-75:   0.75
>> - */
>> -
>> -/**
>> - * SUBTEST: plane-scaler-unity-scaling-with-rotation
>> - * Description: Tests scaling with rotation, unity scaling.
>> - *
>>    * SUBTEST: plane-scaler-with-clipping-clamping-rotation
>>    * Description: Tests scaling with clipping and clamping, rotation.
>>    *
>> - * SUBTEST: plane-upscale-%s-with-rotation
>> - * Description: Tests upscaling with rotation %arg[1].
>> - *
>> - * arg[1]:
>> - *
>> - * @20x20:          from 20x20 fb
>> - * @factor-0-25:    for 0.25 scaling factor
>> - */
>> -
>> -/**
>> - * SUBTEST: plane-downscale-factor-%s-with-rotation
>> - * Description: Tests downscaling with rotation for %arg[1] scaling factor.
>> - *
>> - * arg[1]:
>> - *
>> - * @0-25:   0.25
>> - * @0-5:    0.5
>> - * @0-75:   0.75
>> - */
>> -
>> -/**
>> - * SUBTEST: plane-scaler-unity-scaling-with-pixel-format
>> - * Description: Tests scaling with pixel formats, unity scaling.
>> - *
>>    * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
>>    * Description: Tests scaling with clipping and clamping, pixel formats.
>> - *
>> - * SUBTEST: plane-upscale-%s-with-pixel-format
>> - * Description: Tests upscaling with pixel formats %arg[1].
>> - *
>> - * arg[1]:
>> - *
>> - * @20x20:          from 20x20 fb
>> - * @factor-0-25:    for 0.25 scaling factor
>> - */
>> -
>> -/**
>> - * SUBTEST: plane-downscale-factor-%s-with-pixel-format
>> - * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
>> - *
>> - * arg[1]:
>> - *
>> - * @0-25:   0.25
>> - * @0-5:    0.5
>> - * @0-75:   0.75
>> - */
>> -
>> -/**
>> - * SUBTEST: planes-downscale-factor-%s
>> - * Description: Tests downscaling of 2 planes for %arg[1] scaling factor.
>> - *
>> - * arg[1]:
>> - *
>> - * @0-25:  0.25
>> - * @0-5:   0.5
>> - * @0-75:  0.75
>> - */
>> -
>> -/**
>> - * SUBTEST: planes-downscale-factor-%s-%s
>> - * Description: Tests downscaling (scaling factor %arg[1]) and upscaling (%arg[2])
>> - *              of 2 planes.
>> - *
>> - * arg[1]:
>> - *
>> - * @0-25:  0.25
>> - * @0-5:   0.5
>> - * @0-75:  0.75
>> - *
>> - * arg[2]:
>> - *
>> - * @upscale-20x20:           upscale 20x20
>> - * @upscale-factor-0-25:     scaling factor 0.25
>> - * @unity-scaling:           Unity
>> - */
>> -
>> -/**
>> - * SUBTEST: planes-scaler-unity-scaling
>> - * Description: Tests scaling of 2 planes, unity scaling.
>> - *
>> - * SUBTEST: planes-upscale-%s
>> - * Description: Tests upscaling of 2 planes %arg[1].
>> - *
>> - * arg[1]:
>> - *
>> - * @20x20:          from 20x20 fb
>> - * @factor-0-25:    for 0.25 scaling factor
>> - */
>> -
>> -/**
>> - * SUBTEST: planes-%s-downscale-factor-%s
>> - * Description: Tests scaling (%arg[1]) and downscaling (scaling factor %arg[2])
>> - *              of 2 planes.
>> - *
>> - * arg[1]:
>> - *
>> - * @unity-scaling:           Unity
>> - * @upscale-factor-0-25:     scaling factor 0.25
>> - * @upscale-20x20:           upscale 20x20
>> - *
>> - * arg[2]:
>> - *
>> - * @0-25:  0.25
>> - * @0-5:   0.5
>> - * @0-75:  0.75
>>    */
>>   
>>   /**
>> @@ -260,13 +130,6 @@
>>   
>>   IGT_TEST_DESCRIPTION("Test display plane scaling");
>>   
>> -enum scaler_combo_test_type {
>> -	TEST_PLANES_UPSCALE = 0,
>> -	TEST_PLANES_DOWNSCALE,
>> -	TEST_PLANES_UPSCALE_DOWNSCALE,
>> -	TEST_PLANES_DOWNSCALE_UPSCALE,
>> -};
>> -
>>   typedef struct {
>>   	uint32_t devid;
>>   	int drm_fd;
>> @@ -293,315 +156,6 @@ static const struct invalid_paramtests intel_paramtests[] = {
>>   	},
>>   };
>>   
>> -const struct {
>> -	const char * const describe;
>> -	const char * const name;
>> -	const double sf;
>> -	const bool is_upscale;
>> -} scaler_with_pixel_format_tests[] = {
>> -	{
>> -		"Tests upscaling with pixel formats, from 20x20 fb.",
>> -		"plane-upscale-20x20-with-pixel-format",
>> -		0.0,
>> -		true,
>> -	},
>> -	{
>> -		"Tests upscaling with pixel formats for 0.25 scaling factor.",
>> -		"plane-upscale-factor-0-25-with-pixel-format",
>> -		0.25,
>> -		true,
>> -	},
>> -	{
>> -		"Tests downscaling with pixel formats for 0.25 scaling factor.",
>> -		"plane-downscale-factor-0-25-with-pixel-format",
>> -		0.25,
>> -		false,
>> -	},
>> -	{
>> -		"Tests downscaling with pixel formats for 0.5 scaling factor.",
>> -		"plane-downscale-factor-0-5-with-pixel-format",
>> -		0.5,
>> -		false,
>> -	},
>> -	{
>> -		"Tests downscaling with pixel formats for 0.75 scaling factor.",
>> -		"plane-downscale-factor-0-75-with-pixel-format",
>> -		0.75,
>> -		false,
>> -	},
>> -	{
>> -		"Tests scaling with pixel formats, unity scaling.",
>> -		"plane-scaler-unity-scaling-with-pixel-format",
>> -		1.0,
>> -		true,
>> -	},
>> -};
>> -
>> -const struct {
>> -	const char * const describe;
>> -	const char * const name;
>> -	const double sf;
>> -	const bool is_upscale;
>> -} scaler_with_rotation_tests[] = {
>> -	{
>> -		"Tests upscaling with rotation, from 20x20 fb.",
>> -		"plane-upscale-20x20-with-rotation",
>> -		0.0,
>> -		true,
>> -	},
>> -	{
>> -		"Tests upscaling with rotation for 0.25 scaling factor.",
>> -		"plane-upscale-factor-0-25-with-rotation",
>> -		0.25,
>> -		true,
>> -	},
>> -	{
>> -		"Tests downscaling with rotation for 0.25 scaling factor.",
>> -		"plane-downscale-factor-0-25-with-rotation",
>> -		0.25,
>> -		false,
>> -	},
>> -	{
>> -		"Tests downscaling with rotation for 0.5 scaling factor.",
>> -		"plane-downscale-factor-0-5-with-rotation",
>> -		0.5,
>> -		false,
>> -	},
>> -	{
>> -		"Tests downscaling with rotation for 0.75 scaling factor.",
>> -		"plane-downscale-factor-0-75-with-rotation",
>> -		0.75,
>> -		false,
>> -	},
>> -	{
>> -		"Tests scaling with rotation, unity scaling.",
>> -		"plane-scaler-unity-scaling-with-rotation",
>> -		1.0,
>> -		true,
>> -	},
>> -};
>> -
>> -const struct {
>> -	const char * const describe;
>> -	const char * const name;
>> -	const double sf;
>> -	const bool is_upscale;
>> -} scaler_with_modifiers_tests[] = {
>> -	{
>> -		"Tests upscaling with modifiers, from 20x20 fb.",
>> -		"plane-upscale-20x20-with-modifiers",
>> -		0.0,
>> -		true,
>> -	},
>> -	{
>> -		"Tests upscaling with modifiers for 0.25 scaling factor.",
>> -		"plane-upscale-factor-0-25-with-modifiers",
>> -		0.25,
>> -		true,
>> -	},
>> -	{
>> -		"Tests downscaling with modifiers for 0.25 scaling factor.",
>> -		"plane-downscale-factor-0-25-with-modifiers",
>> -		0.25,
>> -		false,
>> -	},
>> -	{
>> -		"Tests downscaling with modifiers for 0.5 scaling factor.",
>> -		"plane-downscale-factor-0-5-with-modifiers",
>> -		0.5,
>> -		false,
>> -	},
>> -	{
>> -		"Tests downscaling with modifiers for 0.75 scaling factor.",
>> -		"plane-downscale-factor-0-75-with-modifiers",
>> -		0.75,
>> -		false,
>> -	},
>> -	{
>> -		"Tests scaling with modifiers, unity scaling.",
>> -		"plane-scaler-unity-scaling-with-modifiers",
>> -		1.0,
>> -		true,
>> -	},
>> -};
>> -
>> -const struct {
>> -	const char * const describe;
>> -	const char * const name;
>> -	const double sf_plane1;
>> -	const double sf_plane2;
>> -	const enum scaler_combo_test_type test_type;
>> -} scaler_with_2_planes_tests[] = {
>> -	{
>> -		"Tests upscaling of 2 planes, from 20x20 fb.",
>> -		"planes-upscale-20x20",
>> -		0.0,
>> -		0.0,
>> -		TEST_PLANES_UPSCALE,
>> -	},
>> -	{
>> -		"Tests upscaling of 2 planes for 0.25 scaling factor.",
>> -		"planes-upscale-factor-0-25",
>> -		0.25,
>> -		0.25,
>> -		TEST_PLANES_UPSCALE,
>> -	},
>> -	{
>> -		"Tests scaling of 2 planes, unity scaling.",
>> -		"planes-scaler-unity-scaling",
>> -		1.0,
>> -		1.0,
>> -		TEST_PLANES_UPSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling of 2 planes for 0.25 scaling factor.",
>> -		"planes-downscale-factor-0-25",
>> -		0.25,
>> -		0.25,
>> -		TEST_PLANES_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling of 2 planes for 0.5 scaling factor.",
>> -		"planes-downscale-factor-0-5",
>> -		0.5,
>> -		0.5,
>> -		TEST_PLANES_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling of 2 planes for 0.75 scaling factor.",
>> -		"planes-downscale-factor-0-75",
>> -		0.75,
>> -		0.75,
>> -		TEST_PLANES_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests upscaling (20x20) and downscaling (scaling factor 0.25) of 2 planes.",
>> -		"planes-upscale-20x20-downscale-factor-0-25",
>> -		0.0,
>> -		0.25,
>> -		TEST_PLANES_UPSCALE_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests upscaling (20x20) and downscaling (scaling factor 0.5) of 2 planes.",
>> -		"planes-upscale-20x20-downscale-factor-0-5",
>> -		0.0,
>> -		0.5,
>> -		TEST_PLANES_UPSCALE_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests upscaling (20x20) and downscaling (scaling factor 0.75) of 2 planes.",
>> -		"planes-upscale-20x20-downscale-factor-0-75",
>> -		0.0,
>> -		0.75,
>> -		TEST_PLANES_UPSCALE_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.25) of 2 planes.",
>> -		"planes-upscale-factor-0-25-downscale-factor-0-25",
>> -		0.25,
>> -		0.25,
>> -		TEST_PLANES_UPSCALE_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.5) of 2 planes.",
>> -		"planes-upscale-factor-0-25-downscale-factor-0-5",
>> -		0.25,
>> -		0.5,
>> -		TEST_PLANES_UPSCALE_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.75) of 2 planes.",
>> -		"planes-upscale-factor-0-25-downscale-factor-0-75",
>> -		0.25,
>> -		0.75,
>> -		TEST_PLANES_UPSCALE_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests scaling (unity) and downscaling (scaling factor 0.25) of 2 planes.",
>> -		"planes-unity-scaling-downscale-factor-0-25",
>> -		1.0,
>> -		0.25,
>> -		TEST_PLANES_UPSCALE_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests scaling (unity) and downscaling (scaling factor 0.5) of 2 planes.",
>> -		"planes-unity-scaling-downscale-factor-0-5",
>> -		1.0,
>> -		0.5,
>> -		TEST_PLANES_UPSCALE_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests scaling (unity) and downscaling (scaling factor 0.75) of 2 planes.",
>> -		"planes-unity-scaling-downscale-factor-0-75",
>> -		1.0,
>> -		0.75,
>> -		TEST_PLANES_UPSCALE_DOWNSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling (scaling factor 0.25) and upscaling (20x20) of 2 planes.",
>> -		"planes-downscale-factor-0-25-upscale-20x20",
>> -		0.25,
>> -		0.0,
>> -		TEST_PLANES_DOWNSCALE_UPSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling (scaling factor 0.25) and upscaling (scaling factor 0.25) of 2 planes.",
>> -		"planes-downscale-factor-0-25-upscale-factor-0-25",
>> -		0.25,
>> -		0.25,
>> -		TEST_PLANES_DOWNSCALE_UPSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling (scaling factor 0.25) and scaling (unity) of 2 planes.",
>> -		"planes-downscale-factor-0-25-unity-scaling",
>> -		0.25,
>> -		1.0,
>> -		TEST_PLANES_DOWNSCALE_UPSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling (scaling factor 0.5) and upscaling (20x20) of 2 planes.",
>> -		"planes-downscale-factor-0-5-upscale-20x20",
>> -		0.5,
>> -		0.0,
>> -		TEST_PLANES_DOWNSCALE_UPSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling (scaling factor 0.5) and upscaling (scaling factor 0.25) of 2 planes.",
>> -		"planes-downscale-factor-0-5-upscale-factor-0-25",
>> -		0.5,
>> -		0.25,
>> -		TEST_PLANES_DOWNSCALE_UPSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling (scaling factor 0.5) and scaling (unity) of 2 planes.",
>> -		"planes-downscale-factor-0-5-unity-scaling",
>> -		0.5,
>> -		1.0,
>> -		TEST_PLANES_DOWNSCALE_UPSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling (scaling factor 0.75) and upscaling (20x20) of 2 planes.",
>> -		"planes-downscale-factor-0-75-upscale-20x20",
>> -		0.75,
>> -		0.0,
>> -		TEST_PLANES_DOWNSCALE_UPSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling (scaling factor 0.75) and upscaling (scaling factor 0.25) of 2 planes.",
>> -		"planes-downscale-factor-0-75-upscale-factor-0-25",
>> -		0.75,
>> -		0.25,
>> -		TEST_PLANES_DOWNSCALE_UPSCALE,
>> -	},
>> -	{
>> -		"Tests downscaling (scaling factor 0.75) and scaling (unity) of 2 planes.",
>> -		"planes-downscale-factor-0-75-unity-scaling",
>> -		0.75,
>> -		1.0,
>> -		TEST_PLANES_DOWNSCALE_UPSCALE,
>> -	},
>> -};
>> -
>>   static int get_width(drmModeModeInfo *mode, double scaling_factor)
>>   {
>>   	if (scaling_factor == 0.0)
>> @@ -1478,133 +1032,6 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
>>   	return crtc;
>>   }
>>   
>> -static int
>> -__test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2, igt_output_t *output,
>> -			    igt_plane_t *p1, igt_plane_t *p2,
>> -			    struct igt_fb *fb1, struct igt_fb *fb2,
>> -			    enum scaler_combo_test_type test_type)
>> -{
>> -	igt_display_t *display = &d->display;
>> -	drmModeModeInfo *mode;
>> -	int ret;
>> -
>> -	mode = igt_output_get_mode(output);
>> -
>> -	igt_plane_set_fb(p1, fb1);
>> -	igt_plane_set_fb(p2, fb2);
>> -
>> -	switch (test_type) {
>> -	case TEST_PLANES_UPSCALE:
>> -		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
>> -		igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
>> -		break;
>> -	case TEST_PLANES_DOWNSCALE:
>> -		igt_plane_set_size(p1, w1, h1);
>> -		igt_plane_set_size(p2, w2, h2);
>> -		break;
>> -	case TEST_PLANES_UPSCALE_DOWNSCALE:
>> -		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
>> -		igt_plane_set_size(p2, w2, h2);
>> -		break;
>> -	case TEST_PLANES_DOWNSCALE_UPSCALE:
>> -		igt_plane_set_size(p1, w1, h1);
>> -		igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
>> -		break;
>> -	default:
>> -		igt_assert(0);
>> -	}
>> -
>> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> -
>> -	igt_plane_set_fb(p1, NULL);
>> -	igt_plane_set_fb(p2, NULL);
>> -
>> -	if (ret == -EINVAL || ret == -ERANGE)
>> -		igt_debug("Scaling op not supported by driver with %s\n",
>> -			 (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>> -	return ret;
>> -}
>> -
>> -static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
>> -{
>> -	igt_create_fb(fd, width, height,
>> -		      DRM_FORMAT_XRGB8888,
>> -		      DRM_FORMAT_MOD_LINEAR,
>> -		      fb);
>> -}
>> -
>> -static uint32_t
>> -test_planes_scaling_combo(data_t *d, double sf_plane1,
>> -			  double sf_plane2, igt_crtc_t *crtc,
>> -			  igt_output_t *output,
>> -			  enum scaler_combo_test_type test_type)
>> -{
>> -	igt_display_t *display = &d->display;
>> -	drmModeModeInfo *mode;
>> -	int n_planes;
>> -	int w1, h1, w2, h2;
>> -	int ret;
>> -
>> -	cleanup_crtc(d);
>> -
>> -	igt_output_set_crtc(output, crtc);
>> -	for_each_connector_mode(output, mode) {
>> -		igt_output_override_mode(output, mode);
>> -		igt_debug("Trying mode %dx%d\n",
>> -			  mode->hdisplay, mode->vdisplay);
>> -		w1 = get_width(mode, sf_plane1);
>> -		h1 = get_height(mode, sf_plane1);
>> -		w2 = get_width(mode, sf_plane2);
>> -		h2 = get_height(mode, sf_plane2);
>> -
>> -		n_planes = crtc->n_planes;
>> -		igt_require(n_planes >= 2);
>> -
>> -		switch (test_type) {
>> -		case TEST_PLANES_UPSCALE:
>> -			setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
>> -			setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
>> -			break;
>> -		case TEST_PLANES_DOWNSCALE:
>> -			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
>> -			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
>> -			break;
>> -		case TEST_PLANES_UPSCALE_DOWNSCALE:
>> -			setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
>> -			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
>> -			break;
>> -		case TEST_PLANES_DOWNSCALE_UPSCALE:
>> -			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
>> -			setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
>> -			break;
>> -		default:
>> -			igt_assert(0);
>> -		}
>> -
>> -		for (int k = 0; k < n_planes - 1; k += 2) {
>> -			igt_plane_t *p1, *p2;
>> -
>> -			p1 = &crtc->planes[k];
>> -			igt_require(p1);
>> -			p2 = &crtc->planes[k+1];
>> -			igt_require(p2);
>> -
>> -			if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
>> -				continue;
>> -			ret = __test_planes_scaling_combo(d, w1, h1, w2, h2, output,
>> -							  p1, p2,
>> -							  &d->fb[1], &d->fb[2],
>> -							  test_type);
>> -			if (ret != 0)
>> -				break;
>> -		}
>> -		cleanup_fbs(d);
>> -		if (ret == 0)
>> -			break;
>> -	}
>> -	return ret;
>> -}
>> -
>>   static void
>>   test_invalid_num_scalers(data_t *d, igt_crtc_t *crtc, igt_output_t *output)
>>   {
>> @@ -2044,99 +1471,6 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   	igt_subtest_group() {
>>   		igt_output_t *output;
>>   
>> -		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
>> -			igt_describe(scaler_with_pixel_format_tests[index].describe);
>> -			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
>> -				for_each_crtc(&data.display, crtc) {
>> -					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>> -						for_each_valid_output_on_crtc(&data.display,
>> -									      crtc,
>> -									      output) {
>> -							igt_info("Trying on %s\n", igt_output_name(output));
>> -							if (!crtc_output_combo_valid(&data.display, crtc, output))
>> -								continue;
>> -							if (igt_crtc_num_scalers(crtc) < 1)
>> -								continue;
>> -
>> -							ret = test_scaler_with_pixel_format_crtc(&data,
>> -									scaler_with_pixel_format_tests[index].sf,
>> -									false,
>> -									scaler_with_pixel_format_tests[index].is_upscale,
>> -									crtc,
>> -									output);
>> -							if (ret == 0)
>> -								break;
>> -							igt_info("Required scaling operation not supported on %s trying on next output\n",
>> -								 igt_output_name(output));
>> -						}
>> -						skip_if_erange_or_einval(ret);
>> -					}
>> -				}
>> -			}
>> -		}
>> -
>> -		for (int index = 0; index < ARRAY_SIZE(scaler_with_rotation_tests); index++) {
>> -			igt_describe(scaler_with_rotation_tests[index].describe);
>> -			igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
>> -				for_each_crtc(&data.display, crtc) {
>> -					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>> -						for_each_valid_output_on_crtc(&data.display,
>> -									      crtc,
>> -									      output) {
>> -							igt_info("Trying on %s\n", igt_output_name(output));
>> -							if (!crtc_output_combo_valid(&data.display, crtc, output))
>> -								continue;
>> -							if (igt_crtc_num_scalers(crtc) < 1)
>> -								continue;
>> -
>> -							ret = test_scaler_with_rotation_crtc(&data,
>> -									scaler_with_rotation_tests[index].sf,
>> -									false,
>> -									scaler_with_rotation_tests[index].is_upscale,
>> -									crtc,
>> -									output);
>> -							if (ret == 0)
>> -								break;
>> -							igt_info("Required scaling operation not supported on %s trying on next output\n",
>> -								 igt_output_name(output));
>> -						}
>> -						skip_if_erange_or_einval(ret);
>> -					}
>> -				}
>> -			}
>> -		}
>> -
>> -		for (int index = 0; index < ARRAY_SIZE(scaler_with_modifiers_tests); index++) {
>> -			igt_describe(scaler_with_modifiers_tests[index].describe);
>> -			igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
>> -				for_each_crtc(&data.display, crtc) {
>> -					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>> -						for_each_valid_output_on_crtc(&data.display,
>> -									      crtc,
>> -									      output) {
>> -							igt_info("Trying on %s\n", igt_output_name(output));
>> -							if (!crtc_output_combo_valid(&data.display, crtc, output))
>> -								continue;
>> -							if (igt_crtc_num_scalers(crtc) < 1)
>> -								continue;
>> -
>> -							ret = test_scaler_with_modifier_crtc(&data,
>> -									scaler_with_modifiers_tests[index].sf,
>> -									false,
>> -									scaler_with_modifiers_tests[index].is_upscale,
>> -									crtc,
>> -									output);
>> -							if (ret == 0)
>> -								break;
>> -							igt_info("Required scaling operation not supported on %s trying on next output\n",
>> -								 igt_output_name(output));
>> -						}
>> -						skip_if_erange_or_einval(ret);
>> -					}
>> -				}
>> -			}
>> -		}
>> -
>>   		igt_describe("Tests scaling with clipping and clamping, pixel formats.");
>>   		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-pixel-formats") {
>>   			for_each_crtc(&data.display, crtc) {
>> @@ -2219,37 +1553,6 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   			}
>>   		}
>>   
>> -		for (int index = 0; index < ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
>> -			igt_describe(scaler_with_2_planes_tests[index].describe);
>> -			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
>> -				for_each_crtc(&data.display, crtc) {
>> -					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>> -						for_each_valid_output_on_crtc(&data.display,
>> -									      crtc,
>> -									      output) {
>> -							igt_info("Trying on %s\n",
>> -								 igt_output_name(output));
>> -							if (!crtc_output_combo_valid(&data.display, crtc, output))
>> -								continue;
>> -							if (igt_crtc_num_scalers(crtc) < 2)
>> -								continue;
>> -							ret = test_planes_scaling_combo(&data,
>> -								scaler_with_2_planes_tests[index].sf_plane1,
>> -								scaler_with_2_planes_tests[index].sf_plane2,
>> -								crtc,
>> -								output,
>> -								scaler_with_2_planes_tests[index].test_type);
>> -							if (ret == 0)
>> -								break;
>> -							igt_info("Required scaling operation not supported on %s trying on next output\n",
>> -								 igt_output_name(output));
>> -						}
>> -						skip_if_erange_or_einval(ret);
>> -					}
>> -				}
>> -			}
>> -		}
>> -
>>   		for (int index = 0; index < ARRAY_SIZE(intel_paramtests); index++) {
>>   			igt_describe("Test for validating max source size.");
>>   			igt_subtest_with_dynamic(intel_paramtests[index].testname) {


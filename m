Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66273C25B75
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 17:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D618A10E0A5;
	Tue, 14 May 2024 17:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d7p/hW5V";
	dkim-atps=neutral
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D5A10E0A5
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 17:26:55 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51f0f6b613dso7385557e87.1
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 10:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715707613; x=1716312413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eoNws8d7wvmPzXDqszN2dCEJDIychMltZp7bvu1KRjU=;
 b=d7p/hW5V5lyIDyt7lpMlc8V8Wgt8CiIeOtTgDp6XkzYFl+JDYpTwmfcDOMiA0WSTud
 /TCCiVjRtpJYZH2jnptwX8I1JosO2DvwHuhTwn8iUx523qgf1wx60v4pRq90gu4A5jGV
 W9zDIetezMR46+Ftq3H9VwWtkvjwmErPVPM4WMIfC4ADPWx2wroMsJwdp1FJhvgJCDAy
 G89IhnE7pSCQ14vtxIPq1dyCHZZcEDmNwE5rnbESVYKzpj6A5gORfiHRYfQwrtHI/t6j
 dY0chtGEDSkN24GWlEjW7ytdIcZs+cY3u9CRAR9wXzZ/IVaeoPJaW6PYACA1uz4rnBtR
 +Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707613; x=1716312413;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eoNws8d7wvmPzXDqszN2dCEJDIychMltZp7bvu1KRjU=;
 b=amMUBUvbibv//DfXVgezsYldrGOpieI9Cy4tDCfF3D8zZj4vDk/HTwJEh0Ml2YO/xq
 UJRvq/xuLQxbJdPQuul8A8i1h8ccBvGs1S3lG4pPed9awbhwyft5Lf1iaEWOlppeToXz
 AL/tvax8yQSPTUJeRs6AbrXuBSfalr3G7N43yaL6uTne/naj6keUZh2R77tEBa8L9IZE
 /RDJh7y3FJCXTLIGPjnSQkkNT7ZZKKosGTkk/X5VqwaENpTHIsL25B77oOlG2rmRJB61
 mXUxZ7r0DAJ6UydzRW+c0euMyTde2h5zxIa5sVFgd9mA53Zk4SA5hYeP5rQj1zTtcWdl
 t7Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpNGnXFUwmy2DiZ7S79G0kyieZqDqmJFvPOmkiA/+Rb1/U8FTgjbGZAqVtKqgYdWU8gsjtRu+YpkxKnvJ3Divd6YvobYWW5TzEb+l20Q==
X-Gm-Message-State: AOJu0YzacIbCaATTSpHOZItUxtCDz6nVOFxNgmnMo8wQ370Fm71aCaVj
 I7R5LpfePIDm9K8+5Q9Eb1QLHRR8tb3MBZ/i7tI/pn87216Y6wvl
X-Google-Smtp-Source: AGHT+IGMvlGpk0CXtNbluS54YfXaQvHuepOYvhm+DHXu5uF5f8M3P2vs2Fa7RDlNIaj99Ese+GdOkQ==
X-Received: by 2002:ac2:544f:0:b0:51f:52d9:d552 with SMTP id
 2adb3069b0e04-5221016e842mr7115300e87.45.1715707613167; 
 Tue, 14 May 2024 10:26:53 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.87])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c2b8f7fsm7657627a12.66.2024.05.14.10.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 10:26:52 -0700 (PDT)
Message-ID: <1137ea4a-0219-4c93-86b4-f554dbbc945b@gmail.com>
Date: Tue, 14 May 2024 20:26:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 11/11] tests/xe_intel_bb: Use supported tilings
 instead hardcoded ones
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
 <20240509053359.449885-12-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240509053359.449885-12-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 9.5.2024 8.33, Zbigniew Kempczyński wrote:
> Use introduced render tilings in cmds-info to select appropriate one
> on which render subtest is executed.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   tests/intel/xe_intel_bb.c | 25 +++++++++++--------------
>   1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index 09164c41fc..ad6a2d22ca 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -18,6 +18,7 @@
>   
>   #include "igt.h"
>   #include "igt_crc.h"
> +#include "intel_blt.h"
>   #include "intel_bufops.h"
>   #include "intel_mocs.h"
>   #include "intel_pat.h"
> @@ -978,19 +979,10 @@ const char *help_str =
>   
>   igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
>   {
> -	int xe, i;
> +	int xe;
>   	struct buf_ops *bops;
>   	uint32_t width;
>   
> -	struct test {
> -		uint32_t tiling;
> -		const char *tiling_name;
> -	} tests[] = {
> -		{ I915_TILING_NONE, "none" },
> -		{ I915_TILING_X, "x" },
> -		{ I915_TILING_4, "4" },
> -	};
> -
>   	igt_fixture {
>   		xe = drm_open_driver(DRIVER_XE);
>   		bops = buf_ops_create(xe);
> @@ -1053,14 +1045,19 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
>   		delta_check(bops);
>   
>   	igt_subtest_with_dynamic("render") {
> +		int tiling;
> +
>   		igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
>   
> -		for (i = 0; i < ARRAY_SIZE(tests); i++) {
> -			const struct test *t = &tests[i];
> +		for_each_tiling(tiling) {
> +			if (!render_supports_tiling(xe, tiling, false))
> +				continue;
>   
>   			for (width = 512; width <= 1024; width += 512)
> -				igt_dynamic_f("render-%s-%u", t->tiling_name, width)
> -					render(bops, t->tiling, width, width);
> +				igt_dynamic_f("render-%s-%u",
> +					      blt_tiling_name(tiling), width)
> +					render(bops, blt_tile_to_i915_tile(tiling),
> +					       width, width);
>   		}
>   	}
>   


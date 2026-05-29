Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AEACD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 12:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6476110FE17;
	Fri, 29 May 2026 12:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="od2BwEXT";
	dkim-atps=neutral
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8A610FE15
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 12:10:09 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3680540a6efso7877994a91.2
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 05:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780056608; x=1780661408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eTlmZ5QQ7E/OH2BigiCDy1mKnse8pwunvrvKGOFFh4o=;
 b=od2BwEXTX9upG85cxIOWqXRIoNqBrH6Rtm2Rcfvd4yBDrLRzNkVwGXpqykJkVi0Vau
 xtlnKUFc0DVDBqSsZtx1JD8CjPEt6LRYhZ5lvqmskQB/2xScQL257nlTpJ7afu6n0MQC
 CzprsZMlGp+Z20E/SJdnsCzKYxxAQJVq82nTvIREOQsKo5njxnVAtzKOlq3RPp0roUdC
 4h/mgAH5qdrpd9DyVe17tpnKEB2UupoE4Flmf6GkkbtcTpjD4vbqz/h4DzZG6JiTFR7v
 w3U6yazAQCsJ6cDdBkKULii/aqrV5IsTgZZldltFppagc46n0nTT9cyeq2IcvAZmdaMt
 EEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780056608; x=1780661408;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTlmZ5QQ7E/OH2BigiCDy1mKnse8pwunvrvKGOFFh4o=;
 b=bZg9TPYlreWjM5d6vjpkRDWWm3AYTuHoHimvhoqU6m6I/nMj017+jSQG89TkaRPsiu
 sFqK4xPrLLFyJYtOFiIMbXjk9zNAsPPlyCX9O34uBWM5x4CL7ja7cm21j4lyHDY1uX++
 gT8lyuqMMPmYiZL3z8+fKuz2SWmpnusZMOmkNynnrDqx1+TcKsz5vy9763XVjnDbw7pR
 LYwKQp/8cxIvPxePBmZc7d+FmE+SCWUI3YfbEdSYff93SdAE8HH02wsiOWYF5aGnMQQy
 2lKHdnqzWIHEPFOVWL5pICQZeqiUObbRQC5ciPUAlZYSdR9Wv2oHriN38TiFIwPsIytL
 K72A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1+PHi2vc0YpzYZdkyN9a4Ym+suGJ2yzJN9cytgKFXMisvo8F46ZpblXJ+yxYaSAKoVdhRlEem@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgVSAEkYjWaEX5pDx/EgF9vzv/O1AvAC2UePnyq6JJJgrqUEj4
 j9UGHHgO856wP7WgUQ0DCLkuMxHwWoGonEAmH5kRzyeG+3T9qxDBlPPP8CpEEBL3
X-Gm-Gg: Acq92OGuFw+orK+sqXY32XvW2fxJvRLK+117sgWFFgtziXmE9v6uGuieB4Maw5czA9S
 2bsGeYgavITEgSdPVKQLV2c/2EGX6S6qRmY7jxjDkvTnnMqsuPwe+EbNLcYPY3M84Eh9Jo76DB+
 bNVMhx+PtYZoa6hWREnvfy8bPEw0IFhWinhzEAvm7130tPbEZeyimrF61l0PoPrWAg4CWaoMAbR
 vWP2LAk+b40sI3idEcc7dsmGyRYK6uklNBGkbDRSoWmt4Qo5kdTr8lFE17uQZ6u93A0iGf7EVKU
 7nHxNhyOU8IU0KX2WhiUuBLr3Pd8Iv+U9NY2E+vcqjcyQJJJ/Q9Awc0LlbLByWlpCTpKNW7R4ay
 MnEyjbqsFHDMv39wOMUA63L7/W9f5jPqFGVof4yhNhOiJg1HHZJ6DtkcRxZiiqr3zmqyADjWTxA
 J/rL01kalg08ygrQ6T7+NFcDCaRt2OJLOgPEgHijs9YwVp0nprSgQvcHrPR4TVDYcwKw4knKHbM
 m9vevzvog==
X-Received: by 2002:a17:90b:3d50:b0:368:1064:62f7 with SMTP id
 98e67ed59e1d1-36bbcc14a21mr3329795a91.6.1780056608372; 
 Fri, 29 May 2026 05:10:08 -0700 (PDT)
Received: from [134.134.137.76] ([134.134.137.76])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc6b7c178sm1730726a91.15.2026.05.29.05.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 05:10:07 -0700 (PDT)
Message-ID: <c341b0a9-1296-49b1-8b46-30443da4e246@gmail.com>
Date: Fri, 29 May 2026 15:10:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 19/25] tests/kms_plane: Use
 igt_format_mods_has_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-20-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-20-ville.syrjala@linux.intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 12/05/2026 15.21, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> test_format_plane() has an open coded copy of
> igt_format_mods_has_modifier(). Replace it with the
> real thing.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/kms_plane.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 5990adabf175..5923b5917579 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1124,18 +1124,8 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
>   	struct format_mod ref = {};
>   	igt_crc_t* crcset;
>   	bool result = true;
> -	bool found = false;
>   
> -	for (int i = 0; i < plane->format_mods.count; i++) {
> -		uint64_t modifier = plane->format_mods.modifiers[i];
> -
> -		if (data->mod == modifier) {
> -			found = true;
> -			break;
> -		}
> -	}
> -
> -	igt_skip_on_f(!found,
> +	igt_require_f(igt_format_mods_has_modifier(&plane->format_mods, data->mod),
>   		      "Modifier " IGT_MODIFIER_FMT " not supported on plane %d\n",
>   		      IGT_MODIFIER_ARGS(data->mod), plane->index);
>   


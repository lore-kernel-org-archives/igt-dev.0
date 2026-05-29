Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00731CD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 11:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D97510FD9B;
	Fri, 29 May 2026 11:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nPwMjaNc";
	dkim-atps=neutral
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37810FD85
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 11:38:23 +0000 (UTC)
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-133466cf955so241256c88.0
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780054702; x=1780659502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IjS/y+Isnp7Ve7AYO5UHcnfON/8xGxfGrB5ii3HSn0I=;
 b=nPwMjaNcf9k7HD2Z9flCMzWdlYK4i61WP9uNjLw9EFb6JsH0PzedwepJcx2QcCWW0o
 jsr8A5plVF5GgIWF+a7E3gjbNiai33EROYR5UYXCBqA/kOVYVE+ndxJtPmn+WfzPA2/c
 xzc3kma/OeYfWu9gEXMo7AyZVZff6Xkk6fs80ddqporcrajukgiAsGQq7beeFj+9uB3H
 rbu/Zdc0jaxfgv9y3gQFKwohr/JoBqNc2l4asIeFM00wLlE/RmBafyh/TDzx6YEdu4Tn
 GnYt6vSxu6ZEMhBiNJ/NI8Unf+wByrStKJi1rAP3nTyO91xE+jW2fHFbR2Kr8/FGtxg7
 o93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780054702; x=1780659502;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IjS/y+Isnp7Ve7AYO5UHcnfON/8xGxfGrB5ii3HSn0I=;
 b=d4UtQ9Ni2HRHT+vSsBRca5/3mA0lP9RBM6vyl+E0eX6+H7zWb006R87yjniK4Yb+3r
 ZX2v0vJHFFZ94xNfRUbnfVM5+oiCZyLzYFyxqQQ8vXgo1uCP/dMfNDEK/Uuaa/4LHzN4
 pt/W68ErkA3CzW6q5vaySQ03rvXTrGy5llGcM/zFII2kKagUgVzhRjjVr32o13dFFS0p
 40cRqnLzCSaxZAA0H5E+Z+X7Ijl2hM/ymx1J4xMiyuwytyUhlO2lpKpysAHo0auQE1fB
 s/aCbpIWmSFNGcAeGXOHrO2MvEYCwUW2pzyukT9JnA9P1zWH5DcwQOk+9XpfcpJ/b7F2
 fXdg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Z4KtAz7DSYz2Qd8MHXY9F1cUpq02v6ruvUsztTl9CWD/43GcDdjFi2tcJWazY6+DeJmXiJTUb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSCkTL+xDkdpNbJKfKMYjJOMwup+2XbUcXrDttb+6wCJPr5pUy
 fp0aNtqUChAE1myDBt+k48iXRSr5cjhe6Hw4P7PjTbOEyasTy6JU3rnm
X-Gm-Gg: Acq92OF3UpABh0uLtOUDQgJp4Otpn0MWtRmhIc1lwZLJ6MZNnb8VmhI8F7ERkuulA4P
 0U7/dnVoBgMfiJFmgnLfwbJ9AsktaJT4z3KvMAwNlOAMk3yx2TB5/P5tVdxooicrCr1MhTdjhBf
 ovUy01xtdw8lNXNJB3UsTOqbvjpaqY/5mn53Z2xnC2qqgjIjmZyD3jc/qeS3IDIwKtMkTO9GH2q
 Iu3TxjKOQNg0pSuIJlmWYHysKMV3Hn8WcT1M8ACAnB3MS8iY2DhF8KOEae0mqonijntac6aqJbO
 wlYv3Ql8DmG34q7eKB4bwDO0Py8X5FtflLEZDSuG0suEoJQX9V5IUwGOnytADkDG7s/gBUedFD0
 2JZEUpnXgyt+geW4Iw73HNZ/XSlMKg3AeISOF9ao/qxssknLo/uW6bMa7jJzTuOFxdVvCwZ6esR
 Ws864TLHykn8SiAeQ/n//94oJtndkIvODCVaFQb+Crajay/8ya2/GI6HTZnWTo8shDMjDMiscq/
 NSo
X-Received: by 2002:a05:7022:4590:b0:136:da48:a3e2 with SMTP id
 a92af1059eb24-137aedcd4dbmr1039248c88.27.1780054702201; 
 Fri, 29 May 2026 04:38:22 -0700 (PDT)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b36af6edsm953596c88.5.2026.05.29.04.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 04:38:21 -0700 (PDT)
Message-ID: <eadf3625-0b41-46a6-ab55-ae0415171aca@gmail.com>
Date: Fri, 29 May 2026 14:38:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 10/25] lib/kms: Extract display_format_mods_union()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-11-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-11-ville.syrjala@linux.intel.com>
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
> Extract the loop over crtc+planes from igt_fill_display_format_mod()
> into display_format_mods_union() that can be used to fill any
> format_mods struct with the union of the planes' format_mods.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2f23d988438d..ac0917d907a0 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6344,10 +6344,22 @@ format_mods_union(struct igt_format_mods *format_mods_dst,
>   				   format_mods_src->modifiers[i]);
>   }
>   
> +static void display_format_mods_union(igt_display_t *display,
> +				      struct igt_format_mods *format_mods)
> +{
> +	igt_crtc_t *crtc;
> +
> +	for_each_crtc(display, crtc) {
> +		igt_plane_t *plane;
> +
> +		for_each_plane_on_crtc(crtc, plane)
> +			format_mods_union(format_mods, &plane->format_mods);
> +	}
> +}
> +
>   static void igt_fill_display_format_mod(igt_display_t *display)
>   {
>   	int count = igt_count_display_format_mod(display);
> -	igt_crtc_t *crtc;
>   
>   	if (!count)
>   		return;
> @@ -6361,15 +6373,9 @@ static void igt_fill_display_format_mod(igt_display_t *display)
>   	 */
>   	display->format_mods.count = 0;
>   
> -	for_each_crtc(display, crtc) {
> -		igt_plane_t *plane;
> +	display_format_mods_union(display, &display->format_mods);
>   
> -		for_each_plane_on_crtc(crtc,
> -				       plane) {
> -			format_mods_union(&display->format_mods, &plane->format_mods);
> -			igt_assert_lte(display->format_mods.count, count);
> -		}
> -	}
> +	igt_assert_lte(display->format_mods.count, count);
>   }
>   
>   /**


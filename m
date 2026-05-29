Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E94CD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 11:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A810010FDB4;
	Fri, 29 May 2026 11:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xnc6Mz7M";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD4F10FDB2
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 11:30:07 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2bd2c147abaso85146065ad.3
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 04:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780054207; x=1780659007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PCwzU+d+s7/ECTUurShg1rQrPjBcYf77he88j0kZI7M=;
 b=Xnc6Mz7M/iqLMrmPmKDYe11x+VybRb07DyZzy/4t7ItiLUVnAzyQQsydNb3XK3khlb
 2Gy/PZiKhTCKVR3VGNLvXMWL0FVbIN4vm46q2HX5TFjGkIMDJu/HBamVHYGtmULHceiT
 jkLOv6uLF8dpKIPofy/gIyVbXG9Dd1fO4rQzIp/sl+PzS7nS2jGUUVjqwA60tuPX2PP/
 5tba02WHUpyzyLJLP+GHHGcuotNfWFe4IyVd7ReXNCl9F3w179G/DpaLdoqFxhIo9W/j
 gtgDqdlKk+jbjsgSd0LugNAWY8+P9fDpvchjn81/lRrIYvWsJO0KgvLBnvVe5jVtVvIT
 wYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780054207; x=1780659007;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PCwzU+d+s7/ECTUurShg1rQrPjBcYf77he88j0kZI7M=;
 b=puW9epS9577wCg6x6kRM2Fj+BVZORHpg65khKaiGQeO6ZWT2ZwDNU2zEC+TiIGtyxH
 3NE2TupPC5hBd7jJWNFLZy4dzBOawtPn1RPLRZMnBKfC/Qo3pAenc/CD4uyw8RGy4KkS
 IzPXslqxTQZu/UIRGegam4GB7tRsFNcbqPpfE5aiVJcj32mg5hXW1s0ON24CWU+q7zbK
 pbOHlry6mGXr/TR6umj5Y1AScj0Ud64Q02H8E6aIUwWTIRVRvCe3wdnSNcJMAU2/D6sn
 wF/Zsx++A/GmbfSb9jZpBsSyEwfTaK6zKBSgPn3m4d2pBavI4R4PA8PL7TexaK8h5aCC
 wTZg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8uOP2Wyl2CUmt3YsdkChMZ2XAduXRQbkaNlZkzfTsEFvj+/Edj0EqPVjm1QVcTXfaTZHWKnVUy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXi4KteODZkmnK4Nvvm4g6hpE7EWW3Co64dsCA/zBrujRSc9AJ
 WvdGOMQNU5EmlV0pauDTyD94R6kAgGlQ3FDV4kZTuDWnMWILROSyEvQs
X-Gm-Gg: Acq92OFVlUy2e9i2VsyftLLnTULMd5FzzXKNZ0nWMWcM7h7M5wzQR/a9DYG/NCOLDg9
 CO6x7+8d9sW/oM5Lx90cdCSU7GSVnOdBA9qN6AIfPPaQrYOmVpmx5r5lqvyJUD+ih6Qe1oRJYof
 Zx4r/jeQQOU+Ou+ppTaet8XlDpbEozbq/CFdb380C/ZWLEW94LKl84KqGzBh48RY4GYwKdUdvBZ
 AHFppoVAsUI2pYruq074dsOIWexUoiWJLpZ7M/JnitehAVfu60I/v6GudebrJPtbsKp9XXzFR2t
 L9zGV8hK1W082nMQ9x4GeoNTN9TJJTXuOAHSq3jk29agOxbS0XXbtHh4gVbb12umVyuEBOV4ruI
 vaAUXfIWRDHqmv0PPmscTHjpsw6BSufOzrGMqjFcmWvnRj6P1MBmBwMQ2sX73C9tCM+jGd9Vqs3
 nGeOTYRT9vh1oqnkQBGv+ELQrzL42OofQRggL9q/3qZZ9zbBJvnYgunjbTMirWWimDkR5c+AbmU
 4OmL+syjA==
X-Received: by 2002:a17:902:d4c9:b0:2bd:1903:6ced with SMTP id
 d9443c01a7336-2bf20cf905amr32311425ad.41.1780054206638; 
 Fri, 29 May 2026 04:30:06 -0700 (PDT)
Received: from [134.134.137.76] ([134.134.137.76])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf23c3eb31sm15488635ad.75.2026.05.29.04.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 04:30:06 -0700 (PDT)
Message-ID: <757ac7a7-bd6c-49d8-90e2-690fb4033c80@gmail.com>
Date: Fri, 29 May 2026 14:30:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 07/25] lib/kms: Extract
 igt_format_mods_has_format_with_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-8-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-8-ville.syrjala@linux.intel.com>
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



On 12/05/2026 15.21, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> We have three copies of the same code to look for a specific
> format+modifier combination in lib/igt_kms.c alone (more in
> tests/). Consolidate the lib/igt_kms.c uses to a single function.
> We'll take of tests/* later.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 48 +++++++++++++++++++++++-------------------------
>   1 file changed, 23 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b3ee8a61683e..2a4e91d9ed7e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6270,6 +6270,20 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   	}
>   }
>   
> +static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
> +						    uint32_t format, uint64_t modifier)
> +{
> +	int i;
> +
> +	for (i = 0; i < format_mods->count; i++) {
> +		if (format_mods->formats[i] == format &&
> +		    format_mods->modifiers[i] == modifier)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   /**
>    * igt_plane_has_format_mod:
>    * @plane: Target plane
> @@ -6281,16 +6295,8 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format,
>   			      uint64_t modifier)
>   {
> -	int i;
> -
> -	for (i = 0; i < plane->format_mods.count; i++) {
> -		if (plane->format_mods.formats[i] == format &&
> -		    plane->format_mods.modifiers[i] == modifier)
> -			return true;
> -
> -	}
> -
> -	return false;
> +	return igt_format_mods_has_format_and_modifier(&plane->format_mods,
> +						       format, modifier);
>   }
>   
>   static int igt_count_display_format_mod(igt_display_t *display)
> @@ -6316,15 +6322,15 @@ igt_add_display_format_mod(igt_display_t *display, uint32_t format,
>   {
>   	int i;
>   
> -	for (i = 0; i < display->format_mods.count; i++) {
> -		if (display->format_mods.formats[i] == format &&
> -		    display->format_mods.modifiers[i] == modifier)
> -			return;
> +	if (igt_format_mods_has_format_and_modifier(&display->format_mods,
> +						    format, modifier))
> +		return;
>   
> -	}
> +	i = display->format_mods.count;
>   
>   	display->format_mods.formats[i] = format;
>   	display->format_mods.modifiers[i] = modifier;
> +

Not sure if this extra line was meant to be here but it doesn't bother me

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>   	display->format_mods.count++;
>   }
>   
> @@ -6371,16 +6377,8 @@ static void igt_fill_display_format_mod(igt_display_t *display)
>   bool igt_display_has_format_mod(igt_display_t *display, uint32_t format,
>   				uint64_t modifier)
>   {
> -	int i;
> -
> -	for (i = 0; i < display->format_mods.count; i++) {
> -		if (display->format_mods.formats[i] == format &&
> -		    display->format_mods.modifiers[i] == modifier)
> -			return true;
> -
> -	}
> -
> -	return false;
> +	return igt_format_mods_has_format_and_modifier(&display->format_mods,
> +						       format, modifier);
>   }
>   
>   /**


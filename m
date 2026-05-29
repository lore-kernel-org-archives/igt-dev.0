Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF25CD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 11:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB16410FD69;
	Fri, 29 May 2026 11:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TmiUQl2w";
	dkim-atps=neutral
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABE110FD60
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 11:35:24 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-304f590dd91so145957eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780054524; x=1780659324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bWaW93sa54uqoeA1on+sHG4IiKrNsUgpawFBz2iPmFg=;
 b=TmiUQl2wVvD1fCXRLwzeWw6AjbpXz4rnifHO8VUG2unENXUGSYGzPWKFroqQjAf8Vs
 IwmUWNoO7J77sFjsK5iHAd2kcgHlyKEw48HGTzpYK6/aKcLaOx/ib9Wivnqy5i9wV4om
 27z/1ZcEh9rX9Kr7F9L519ZlhmEhGtemwCrKQibiJA37ZdMBXlYUSyriQNDHY10w0wtz
 WvCJyRTCo0CkmKqj2DzKh3+3UBOE3dw+g+m5n+WAvBtaVfVGKZvATFvVDm3us/Kb9va7
 gg5ZA0PvKmxn1ing0ZPghKLPgx7PLM0gHOY9rN3ySWwC9l9q/WrcKPLM0MS73CI7Expt
 oOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780054524; x=1780659324;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bWaW93sa54uqoeA1on+sHG4IiKrNsUgpawFBz2iPmFg=;
 b=QCwGJXJ3+VHPxErweoh6RRGV97PWfzuTZ3v6QpTSNiIdvHQQ+/YButEYwz5j/Wtqzn
 lfL4wTpAoBM6iL1HdfSDdJDw77rs7JrsHfnSz94WPOL7do2zjTnb1f8w8iYHxF9BQHD7
 gk5k8GroC8ibUwKO3v+dnniElyTlVsMvzMcOKtHiOjYitPwQdQhaiuJykvFJwC++uFZA
 v3ANqAKQLj742FuOwbyldESXLktRV2oSazetKPZ2yIXG7DhOizAJ/p/xZ+NEHlPz0LJf
 niVIEZ/T3JYU2bKX2kfZlA2PZ477ogWkd93YoV0ho2BR8HI29jdBsBnexQjh+5FJT1GV
 7uSg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8O/8B1quHPtT1G+3iNEJgYUqUxJwEmW6JvHgQ8MiEDLF/MYWYqUg8le+jfLmvIN3L0E8k49c36@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym9fst2fyXHp599CWSatYvH4cSzjwBwQjUBP/rltj2SXnltuYH
 PpJUrZ3aLz7ZYHPVXPxJcNXShbgvBr51eAsW9BxqX34nLiAYr/VMHS9u
X-Gm-Gg: Acq92OEKoWGPwocumLoi1xwixOMlY4g03wRncI8TJZOKienpXiZyB1sVhDaYl9GF0MF
 QwouRKeWFWYliu4quhlii46q/0wKDryQodZ+mcIWLudOHi2QQQUYXnJruNt8awcMAxVWhHrfGeo
 Gs/0kn4AMzlLHkRfjJJqOdRKrs58gIeaYWUD0FqCj8kWhhj1KVTP/22BMsKRV4c6tazQoSvEyQy
 2y5+P07zLLXBKk6rnbqURuQCS/TY6haJ3QFgoWDQ92LjNjM5fj7n3jZbMrd6ULMTWOA9kQTjUmY
 H3Kg+hTefo5jlk2RXUrkunwlLd1kAngi2uPFgR5CSKpg6VI7a2cXJVHHScyxvk6V+9q6Mof36na
 dZlivE7P8PQL0Ayt/pOfJaxtV+bkTzTZrUV8cIo7fRWd9hVlpwAElIPvqdwG8C4CztfYhcwyC1v
 sDQgrCQ3bHFmpR3LwBQ2VHH5N3XIRCx3V10so5uKLKqnBmIIx3WlJjkMdMbio+CFpz0c6oCxWCS
 lsY
X-Received: by 2002:a05:7300:dc91:b0:2e0:1f09:d924 with SMTP id
 5a478bee46e88-304eb0e2994mr1075326eec.5.1780054523584; 
 Fri, 29 May 2026 04:35:23 -0700 (PDT)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed5cf1c7sm1160727eec.29.2026.05.29.04.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 04:35:23 -0700 (PDT)
Message-ID: <06383e2a-be79-4984-bef9-d7eb3ca8086e@gmail.com>
Date: Fri, 29 May 2026 14:35:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 09/25] lib/kms: Extract format_mods_union()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-10-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-10-ville.syrjala@linux.intel.com>
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
> Extract format_mods_union() from inside igt_fill_display_format_mod()
> to make the whole thing a bit more abstract and easier to understand.
> 
> Rename igt_add_display_format_mod() to format_mods_append() while
> at it to keep things a bit shorted. This is all internal stuff to
> lib/kms anyway so we don't the full namespace.
> 
> The assert needs to be moved out of the loop to avoid having to pass
> the upper bound 'count' into format_mods_union(). That seems fine
> as the assert will still catch any mistakes, assuming the didn't
> already cause a segfault while filling the arrays.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f1a783aee6dd..2f23d988438d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6334,6 +6334,16 @@ format_mods_append(struct igt_format_mods *format_mods,
>   	format_mods->count++;
>   }
>   
> +static void
> +format_mods_union(struct igt_format_mods *format_mods_dst,
> +		  const struct igt_format_mods *format_mods_src)
> +{
> +	for (int i = 0; i < format_mods_src->count; i++)
> +		format_mods_append(format_mods_dst,
> +				   format_mods_src->formats[i],
> +				   format_mods_src->modifiers[i]);
> +}
> +
>   static void igt_fill_display_format_mod(igt_display_t *display)
>   {
>   	int count = igt_count_display_format_mod(display);
> @@ -6356,12 +6366,8 @@ static void igt_fill_display_format_mod(igt_display_t *display)
>   
>   		for_each_plane_on_crtc(crtc,
>   				       plane) {
> -			for (int i = 0; i < plane->format_mods.count; i++) {
> -				format_mods_append(&display->format_mods,
> -						   plane->format_mods.formats[i],
> -						   plane->format_mods.modifiers[i]);
> -				igt_assert_lte(display->format_mods.count, count);
> -			}
> +			format_mods_union(&display->format_mods, &plane->format_mods);
> +			igt_assert_lte(display->format_mods.count, count);
>   		}
>   	}
>   }


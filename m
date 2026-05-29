Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800E7CD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 12:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1644810FDFD;
	Fri, 29 May 2026 12:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gN2Xa96o";
	dkim-atps=neutral
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DDF10FDF9
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 12:02:43 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2bf237e1433so5052755ad.1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780056163; x=1780660963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=16Lb6nd1WMXzYPQWIiI0I/A2PzaaRdxa4Xw6wPNyuq8=;
 b=gN2Xa96oczVoQjDJ9UBws+p3myTUGv6JTtwo9OreHEFJuLMhtAJtdQ5B//FoFvmLQM
 U8yb/pVXb5aOPA1auBCuyjKc7RkQamYkuHUpvlQ7VtXP7ujsotv8TQ9rEmicZdqr+40d
 xlpBn+iJSQewGkaRCBq/UluE25W83PRHwktPHNkJtn01QJ6WFCZ2TZhnOBGPrhhG3rS+
 bg1mELOF/+qQ5n84chMqM5M/2KQ9aicszDB4VLfgA5DG2wjZKjCeXypTwgy6Y9ozJZJh
 ZtWV25NKhZzcz/CqaET9N7DsZk0+zMuH7ONp5QWvaavp8+bbcyOE/hinVY+szc3UebGH
 aSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780056163; x=1780660963;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=16Lb6nd1WMXzYPQWIiI0I/A2PzaaRdxa4Xw6wPNyuq8=;
 b=e97FU5H92Xjod05Z/+jRWJ4E2ljVJfgovLz6NbQSSzF7t18ScoFuAw08bvdsl05KmS
 yCYcBx+xW4wWFFng6L6rGnrSJ3SsMqAoj3+Y09so2AGxAF5LBXfBu+3aFXv6gLdTuVJ9
 tNCdIwBaJcn4VAtibQw1P1s8uDh5QkLbtOf9LDBPsUOY3/hQiFspHlznWjiQt/014wQ+
 s3KvTXkYMCqNHEA5vQohkBcsDambTxPpzdLS9QO9ZeLSuaWNPHz9R971CuJffOcqBGDg
 F03sLAFjxLru4CPxEN/psA39+oz3QaMHKfKpDDMXZnVnpmAvYfHal9x4qHMe+0UrxgPf
 1OgQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Q0fh95jAdbAb0bRhPiGYqljM0HcsbGStmbuBnfU1zdWiIB9LGqndcrZbsuYgpsrbrtb8h7xPy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwlYT7lbN2oKzolGjK5CFnXZ5aLt13GNDMKBxtmS1EeIGu7wJL
 U0jBdlYzHf7VLrCqQm2wc2gsIP/4CBbNPsh3uRAYpqlEvqSzBbxzosZg
X-Gm-Gg: Acq92OEUhri53k4qJeupXj4KHQINRtyuYgsAYXlA3gRBkifGJuSg0wfDY38fqOXUukL
 ksEKhxAyxb++MZX9ypRRoI8yuWBcohnFunpW8l5A7RbSqdeOCvrDTa6gPILX+XImaDcX34+jR9I
 nxz7sffCWFMPXQHF1Z/FNbU9nsZ/GBRCWAiJIkSUH3318odrbkxIqx526jWyL1s/QGwcKlY3SPR
 r0z2nAIRt4v9RJkNX/NCbppiM10yz4KQOa22Vms+KHtzWzwZkf+WBGp+jGBKhoVNAUq/VP+WN9J
 Y5kzY6Qv22ZvgVsh3muUPGGM2zdieLcpQyfFWhigPki4v8QGBlGRNfH3CaVmpvxWRxpMmeojRGO
 fQ5j8zogL1AHfbsdooJXX2q/aGCQSAuwIkm9XJcZ5dPsqqu2yxavKYV1Emu/gBdQaXy1h2worG3
 a7Dor5CLTyeT593yd51DNm2dOWrzWNB3uEXIwggAcVHvWB978FbwyhQx2LLrn7tj3wU71AK7rNf
 Kwvh6dSDw==
X-Received: by 2002:a17:902:e544:b0:2bd:eeb6:ff28 with SMTP id
 d9443c01a7336-2bf20520896mr37095435ad.12.1780056162913; 
 Fri, 29 May 2026 05:02:42 -0700 (PDT)
Received: from [134.134.137.76] ([134.134.137.76])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf23c3d6besm18942925ad.74.2026.05.29.05.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 05:02:42 -0700 (PDT)
Message-ID: <f23aec51-eeab-4f94-bba7-0d06b4801c61@gmail.com>
Date: Fri, 29 May 2026 15:02:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 16/25] lib/kms: Introduce igt_format_mods
 iterators
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-17-ville.syrjala@linux.intel.com>
 <20260513031724.27229-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260513031724.27229-1-ville.syrjala@linux.intel.com>
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

On 13/05/2026 06.17, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add three new iterators:
> - for_each_format_and_modifier()
> - for_each_format_with_modifier()
> - for_each_modifier_with_format()
> 
> Each one takes a igt_format_mods structure, and iterates it
> accordingly.
> 
> Convert igt_format_mods_has_format_and_modifier() to use
> for_each_format_and_modifier() as the first step.
> 
> v2: Fix _modifier type in igt_format_mods_has_format_and_modifier()
>      Make the macros a bit more type safe
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_aux.h |  3 +++
>   lib/igt_kms.c |  8 ++++----
>   lib/igt_kms.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index 56761a3b3eaa..30530a4040ce 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -250,6 +250,9 @@ void igt_debug_interactive_mode_check(const char *var, const char *expected);
>   			      __cmp(x, y, op), \
>   			      __cmp_once(x, y, igt_unique(igt_tokencat(prefix, __x)), igt_unique(igt_tokencat(prefix, __y)), op))
>   
> +#define assert_type(x, type) \
> +	(void)({_Static_assert(__builtin_types_compatible_p(typeof(x), type), #x " must be " #type);})
> +
>   #define min(x, y)	__careful_cmp(x, y, <, min)
>   #define max(x, y)	__careful_cmp(x, y, >, max)
>   
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b90d34e61359..75f7ca2d64e0 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6288,11 +6288,11 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
>   						    uint32_t format, uint64_t modifier)
>   {
> -	int i;
> +	uint64_t _modifier;
> +	uint32_t _format;
>   
> -	for (i = 0; i < format_mods->count; i++) {
> -		if (format_mods->formats[i] == format &&
> -		    format_mods->modifiers[i] == modifier)
> +	for_each_format_and_modifier(format_mods, _format, _modifier) {
> +		if (_format == format && _modifier == modifier)
>   			return true;
>   	}
>   
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e02c5dd25d16..2f4526407aa2 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -828,6 +828,50 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display,
>   		for_each_if (((format) = (plane)->drm_plane->formats[__i], \
>   			      1))
>   
> +/**
> + * for_each_format_and_modifier:
> + * @format_mods: a pointer to an #igt_format_mod structure
> + * @format: format iterator
> + * @modifier: modifier iterator
> + *
> + * This for loop iterates over all format+modifier combinations.
> + */
> +#define for_each_format_and_modifier(format_mods, format, modifier) \
> +	for (int igt_unique(__i) = 0; igt_unique(__i) < (format_mods)->count; igt_unique(__i)++) \
> +		for_each_if ((assert_type((format), uint32_t), \
> +			      assert_type((modifier), uint64_t), \
> +			      (format) = (format_mods)->formats[igt_unique(__i)], \
> +			      (modifier) = (format_mods)->modifiers[igt_unique(__i)], \
> +			      1))
> +
> +/**
> + * for_each_format_with_modifier:
> + * @format_mods: a pointer to an #igt_format_mod structure
> + * @modifier: specified modifier
> + * @format: format iterator
> + *
> + * This for loop iterates over all formats supporting @modifier.
> + */
> +#define for_each_format_with_modifier(format_mods, format, modifier) \
> +	for (int igt_unique(__i) = 0; igt_unique(__i) < (format_mods)->count; igt_unique(__i)++) \
> +		for_each_if ((assert_type((format), uint32_t), \
> +			      (format) = (format_mods)->formats[igt_unique(__i)], \
> +			      (modifier) == (format_mods)->modifiers[igt_unique(__i)]))
> +
> +/**
> + * for_each_modifier_with_format:
> + * @format_mods: a pointer to an #igt_format_mod structure
> + * @format: specified format
> + * @modifier: modifier iterator
> + *
> + * This for loop iterates over all modifiers supporting @format.
> + */
> +#define for_each_modifier_with_format(format_mods, format, modifier) \
> +	for (int igt_unique(__i) = 0; igt_unique(__i) < (format_mods)->count; igt_unique(__i)++) \
> +		for_each_if ((assert_type((modifier), uint64_t), \
> +			      (modifier) = (format_mods)->modifiers[igt_unique(__i)], \
> +			      (format) == (format_mods)->formats[igt_unique(__i)]))
> +
>   #define IGT_FIXED(i,f)	((i) << 16 | (f))
>   
>   /**


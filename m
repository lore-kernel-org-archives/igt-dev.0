Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63464CD6E45
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 09:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F2610FBC0;
	Fri, 29 May 2026 09:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zvox+87c";
	dkim-atps=neutral
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C52910FBBF
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 09:26:58 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-3045c195251so7607477eec.1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780046818; x=1780651618; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i9EIfp3U2nDoKp8yB+MWUhH7aPUInmibWLpeOdwqSrw=;
 b=Zvox+87cKNOyTSUtnvk1Bm+uPGiEbLIfDVhvqHzVGOyrAW5N9nugDdAP5t+RvR+3OJ
 YEiV6vXuycv80u2Uyn0ZuCgK9atCtkTJqzIRcWD0tyQhyfaPVKeMv/i9+BXnryHut/CY
 emhykPlxr9lFlBXljOwlrQjgYpzPTVGg+cCqdVePGG6NejsQEGeBzvGONIzwKBH7x4SD
 ReVCEgVkJKPTz0uXAQWZh7Tuedwfrn6gHV9AlW6I7PQ3WbzKYBWeChhQ4I7OCdDpzhdR
 tXHogsUHiub8n8Wih+eULCLv0Mo8bUPl4JJ4pKxFN+175Ckzy5cpL2BVCXY6THomFp0m
 /xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780046818; x=1780651618;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i9EIfp3U2nDoKp8yB+MWUhH7aPUInmibWLpeOdwqSrw=;
 b=Vc9/JMzPIfWo/dK/ZYSSGBTC3hpwq286ugsN8nlLEpu3E04ONm8NDqhl97f50yklw9
 SWhWpDYXjHFaicBGDabwY/YVDxB7W2wkTtgUS7n+Ku+ULQehuuEMQNCQmdEQuYwszL5s
 BGlbxZO+gI79rLmiDVWjmdrpX9fjUOjebx2sQrC0atca/mlUQO110cCzmg7Dgy+DOTFb
 LSA5OtqNQ62z4V2gGaeuRSj3lwZPcuby6TGkuvRf5uN/doUIGDa1a6UFZXrar+sePCq+
 zzMHq1dCWxCT3chbU6k6NoxN37ji6J5YtABmERuASA0Mh5WzIPzkJjv2wf2LA5veWORE
 kfNw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/7zhQF10Zp0eb7PLMJjQZq3AE0vGlbDTxC0NIMpBYDjPcg4MT2WyyPpYtoRTlUBis24aA6plVr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPSQWt1ES4K+3As1ejPE1NbRpVbD7nLlY/LiaREasBkUG2p38h
 dViwMLAfuyRM/cVChmteOlU+97VOKI5NJxIoe9dDRht7XxTlS92fYcKQHAK4NmAg
X-Gm-Gg: Acq92OEiMEetS0kq1oMV4zawlAORuJNCKeLblYu4Il+lvg0/gpxP8DkbXYnrCoyWRRo
 TEdw+g79bZFJPumdg74TN2Kur51w7FPv5qL3nf3ReyCOO5fwWwE+ALiMJnHD/4cU1GlRImUvzvz
 fkeZvy/rqoCgDt0bx+ZisqiAhe9mWXA/D4iRrGFqluypUtqNYE+EnQ6AQG4OKF/wx7hB1VQL2/J
 Dv/4QGfRAuaaPYbPda3VhY3d/v7e61V0IeXmWj7xSS7UdoaVF1osvMP/jzR2YUx4POeHXD3hkaD
 BKEHwkEuiEH+SJh8hLO1zvO5lTZIoo9tGvDyNdhdvX1K4QwLghZ88rfFPsioVCUtb1/2KkU+DTm
 p2Y3xAmaVoAM3QAJBeE4fdRCB3WR0Z2r5RcR4ewv+4cAUjHMschwGjj+Zjobs1UUG176ShAM7S9
 V0bbX5y4z0xu1rdDNZAYG68DK0RHh0zGbPIp4ZJzbdw0ZXHHBlYbjFeZqe3K7Ki1LObVbSBQaBN
 WRg
X-Received: by 2002:a05:7301:5f14:b0:304:dd1c:737e with SMTP id
 5a478bee46e88-304eb17eda9mr1062128eec.16.1780046817437; 
 Fri, 29 May 2026 02:26:57 -0700 (PDT)
Received: from [192.55.54.47] ([192.55.54.47])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2bdda4sm939049eec.2.2026.05.29.02.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 02:26:55 -0700 (PDT)
Message-ID: <158ff244-5d9c-4de1-9c65-84c525617830@gmail.com>
Date: Fri, 29 May 2026 12:26:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 05/25] lib/kms: Extract format_mods_alloc()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-6-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-6-ville.syrjala@linux.intel.com>
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
> We have three copies of the code that allocates the format+modifier
> arrays. Consolidate them to a single copy.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 43 ++++++++++++++++++++++++-------------------
>   1 file changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6b42c50e9273..b39cba8ae5e1 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6182,6 +6182,20 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
>   	return count;
>   }
>   
> +static void format_mods_alloc(struct igt_format_mods *format_mods, int count)
> +{
> +	format_mods->count = count;
> +
> +	if (count == 0)
> +		return;
> +
> +	format_mods->formats = calloc(count, sizeof(format_mods->formats[0]));
> +	igt_assert(format_mods->formats);
> +
> +	format_mods->modifiers = calloc(count, sizeof(format_mods->modifiers[0]));
> +	igt_assert(format_mods->modifiers);
> +}
> +
>   static void igt_parse_format_mod_blob(const struct drm_format_modifier_blob *blob_data,
>   				      struct igt_format_mods *format_mods)
>   {
> @@ -6189,16 +6203,7 @@ static void igt_parse_format_mod_blob(const struct drm_format_modifier_blob *blo
>   	const uint32_t *f = formats_ptr(blob_data);
>   	int idx = 0;
>   
> -	format_mods->count = igt_count_plane_format_mod(blob_data);
> -	if (format_mods->count == 0)
> -		return;
> -
> -	format_mods->formats = calloc(format_mods->count,
> -				       sizeof((format_mods->formats)[0]));
> -	igt_assert(format_mods->formats);
> -	format_mods->modifiers = calloc(format_mods->count,
> -					 sizeof((format_mods->modifiers)[0]));
> -	igt_assert(format_mods->modifiers);
> +	format_mods_alloc(format_mods, igt_count_plane_format_mod(blob_data));
>   
>   	for (int i = 0; i < blob_data->count_modifiers; i++) {
>   		for (int j = 0; j < 64; j++) {
> @@ -6227,11 +6232,7 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   
>   		count = p->count_formats;
>   
> -		plane->format_mods.count = count;
> -		plane->format_mods.formats = calloc(count, sizeof(plane->format_mods.formats[0]));
> -		igt_assert(plane->format_mods.formats);
> -		plane->format_mods.modifiers = calloc(count, sizeof(plane->format_mods.modifiers[0]));
> -		igt_assert(plane->format_mods.modifiers);
> +		format_mods_alloc(&plane->format_mods, count);
>   
>   		/*
>   		 * We don't know which modifiers are
> @@ -6332,10 +6333,14 @@ static void igt_fill_display_format_mod(igt_display_t *display)
>   	if (!count)
>   		return;
>   
> -	display->format_mods.formats = calloc(count, sizeof(display->format_mods.formats[0]));
> -	igt_assert(display->format_mods.formats);
> -	display->format_mods.modifiers = calloc(count, sizeof(display->format_mods.modifiers[0]));
> -	igt_assert(display->format_mods.modifiers);
> +	format_mods_alloc(&display->format_mods, count);
> +
> +	/*
> +	 * Initial count was an upper bound and may include
> +	 * duplicates. The final count, without duplicates,
> +	 * is determined while filling the arrays.
> +	 */
> +	display->format_mods.count = 0;
>   
>   	for_each_crtc(display, crtc) {
>   		igt_plane_t *plane;


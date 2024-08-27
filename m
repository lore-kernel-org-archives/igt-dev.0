Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824B2C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F51010E36C;
	Tue, 27 Aug 2024 16:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d6aEsV3k";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2AB10E36C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:03:36 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4281ca54fd3so49199345e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724774615; x=1725379415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KXQSIX3Us7Co94iRLAhhloxL1/nxdrKDXZhqWporGI4=;
 b=d6aEsV3kp78fCZ5WlHsfo/ZOJqOQacPezGQDEPgIBxypuxu8MYm6RE7JNRrPRo/1GK
 Lw1fbmUOFCjG+6eeXEzd4Em1M4tfHYumR8cXjl7EGV8uGoLsNTEj/Rh6IPA6pHekefm4
 yOEsjiJMFhI4NqlQYYCrOg3w16dTOtfPCSwd2nB7c8Rd2DytGGwGAzgB8G0JqOOTK0oa
 rgdyTobOhf/EKvDhsP2nUzmQnrNEHZKnjwQXA7++t9QhsHNs2sANhSYR8ODKHv+0Uo8w
 aWd3PQxEK/GRSLRNaP0ny9vY3PFRCyZo98wkt8bVbVwZdNd5Xz2E5o091c1bp/Xhmr5y
 M2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724774615; x=1725379415;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KXQSIX3Us7Co94iRLAhhloxL1/nxdrKDXZhqWporGI4=;
 b=hl7+c7ge2W4VUF1vL6rj17OvgcmiwA5W/puUONeAlzCyvvBjCeAEOzaqv0aCoXBgCY
 4kFyaovhH8p5fuu5Fg5XX3/GBzzqf+t2NFjxKzl9SvG6jDTokGwrmAJ2iPxnELuOOk8Q
 UoMz+MplEf0lHpD+qlLbaUNg3EnFg7w2aYbXxd72lcyG/rS1HhijaZDb5CBl5vVfm8ik
 XP8GEeKwAAcQBFrFTZtlnBT2hp8dn4fcX5lHtafFgGFXUESPlvoCAlKbx1KYzHPmgUk0
 1648eAb2Xvo1DXsAR7/zacT4mkth9LP3d/hli4U0L306Rgd2MkD77HAftAY9xf1Xb2X9
 Vi5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjEwIw32PNEIDU4VhQkLBFXB6ehc3cWqI1OnaO0rXfeXq+CZBoKqFMeZ3m/GWn65tUCkuJHMy3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqfboaILiDUnAFNQc1ljhys51Ss2jQrkWV5qguo5d0/gXkRwHO
 6IfcbkVh5juYH4gltBkuS33VSYuqA/ns1q6Dpuvv+4SCcB7uA11lBtpQI9jeVpc=
X-Google-Smtp-Source: AGHT+IH+tfILz55HBno3eXgbwSMxmIMS2CuX8lnxgmuvuN1HwoaxO/Qiyqz86t5JKvbPH1FMmmG5Ag==
X-Received: by 2002:a05:600c:46c4:b0:427:ff1e:ab1f with SMTP id
 5b1f17b1804b1-42b9add4859mr22925045e9.14.1724774614385; 
 Tue, 27 Aug 2024 09:03:34 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac517a68dsm193729935e9.33.2024.08.27.09.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:03:33 -0700 (PDT)
Message-ID: <185b283f-64b0-458b-9b83-2b8452dc9c9e@gmail.com>
Date: Tue, 27 Aug 2024 19:03:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 11/37] lib/rendercopy: Add specific support for
 2:10:10:10 formats
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-12-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-12-ville.syrjala@linux.intel.com>
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

On 3.7.2024 2.27, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Use B10G10R10A2_UNORM instead of B8G8R8A8_UNORM when dealing
> with actual 10bpc pixel formats.
> 
> This is needed on tgl+ because the display hardware decompressor
> expects some magic bit shuffling to have taken place. If the
> compressor didn't do that we get garbage.
> 
> Also if the clear color is involved then the hardware needs
> to know the actual pixel format in order to correctly generate
> the native version of the clear color (which will be consumed
> by the display hardware.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/intel_bufops.h    | 2 +-
>   lib/rendercopy_gen4.c | 2 +-
>   lib/rendercopy_gen6.c | 2 +-
>   lib/rendercopy_gen7.c | 2 +-
>   lib/rendercopy_gen8.c | 2 +-
>   lib/rendercopy_gen9.c | 2 +-
>   lib/surfaceformat.h   | 8 ++++++--
>   7 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
> index 06e72ba4ba93..d111346aaa86 100644
> --- a/lib/intel_bufops.h
> +++ b/lib/intel_bufops.h
> @@ -21,7 +21,7 @@ struct intel_buf {
>   	uint32_t width;
>   	uint32_t height;
>   	uint32_t tiling;
> -	uint32_t bpp;
> +	uint32_t bpp, depth;
>   	uint32_t compression;
>   	uint32_t swizzle_mode;
>   	uint32_t yuv_semiplanar_bpp;
> diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
> index 8289abbabe0f..fa553765d475 100644
> --- a/lib/rendercopy_gen4.c
> +++ b/lib/rendercopy_gen4.c
> @@ -138,7 +138,7 @@ gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
>   	ss = intel_bb_ptr_align(ibb, 32);
>   
>   	ss->ss0.surface_type = SURFACE_2D;
> -	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
> +	ss->ss0.surface_format = gen4_surface_format(buf->bpp, buf->depth);
>   	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
>   	ss->ss0.color_blend = 1;
>   
> diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
> index 0c71bd9cbf19..233ec3bf6e85 100644
> --- a/lib/rendercopy_gen6.c
> +++ b/lib/rendercopy_gen6.c
> @@ -79,7 +79,7 @@ gen6_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
>   
>   	ss = intel_bb_ptr_align(ibb, 32);
>   	ss->ss0.surface_type = SURFACE_2D;
> -	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
> +	ss->ss0.surface_format = gen4_surface_format(buf->bpp, buf->depth);
>   	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
>   	ss->ss0.color_blend = 1;
>   
> diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
> index 8fcbbc21cdd8..0cd165809b69 100644
> --- a/lib/rendercopy_gen7.c
> +++ b/lib/rendercopy_gen7.c
> @@ -76,7 +76,7 @@ gen7_bind_buf(struct intel_bb *ibb,
>   
>   	ss[0] = (SURFACE_2D << GEN7_SURFACE_TYPE_SHIFT |
>   		 gen7_tiling_bits(buf->tiling) |
> -		 gen4_surface_format(buf->bpp) << GEN7_SURFACE_FORMAT_SHIFT);
> +		 gen4_surface_format(buf->bpp, buf->depth) << GEN7_SURFACE_FORMAT_SHIFT);
>   
>   	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
>   						   read_domain, write_domain,
> diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
> index 28c703fca393..206af226a346 100644
> --- a/lib/rendercopy_gen8.c
> +++ b/lib/rendercopy_gen8.c
> @@ -88,7 +88,7 @@ gen8_bind_buf(struct intel_bb *ibb,
>   	ss = intel_bb_ptr_align(ibb, 64);
>   
>   	ss->ss0.surface_type = SURFACE_2D;
> -	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
> +	ss->ss0.surface_format = gen4_surface_format(buf->bpp, buf->depth);
>   	ss->ss0.render_cache_read_write = 1;
>   	ss->ss0.vertical_alignment = 1; /* align 4 */
>   	ss->ss0.horizontal_alignment = 1; /* align 4 */
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index eafdf50581d3..4014100a23b5 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -190,7 +190,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   	ss = intel_bb_ptr_align(ibb, 64);
>   
>   	ss->ss0.surface_type = SURFACE_2D;
> -	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
> +	ss->ss0.surface_format = gen4_surface_format(buf->bpp, buf->depth);
>   	ss->ss0.vertical_alignment = 1; /* align 4 */
>   	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
>   
> diff --git a/lib/surfaceformat.h b/lib/surfaceformat.h
> index 58ef41e6d3cd..9090d7707647 100644
> --- a/lib/surfaceformat.h
> +++ b/lib/surfaceformat.h
> @@ -186,7 +186,7 @@
>   #define SURFACE_MIPMAPLAYOUT_BELOW	0
>   #define SURFACE_MIPMAPLAYOUT_RIGHT	1
>   
> -static inline uint32_t gen4_surface_format(int bpp)
> +static inline uint32_t gen4_surface_format(int bpp, int depth)
>   {
>   	switch (bpp) {
>   	case 8:
> @@ -194,7 +194,11 @@ static inline uint32_t gen4_surface_format(int bpp)
>   	case 16:
>   		return SURFACEFORMAT_R8G8_UNORM;
>   	case 32:
> -		return SURFACEFORMAT_B8G8R8A8_UNORM;
> +		/* only needed for proper CCS handling */
> +		if (depth == 30)
> +			return SURFACEFORMAT_B10G10R10A2_UNORM;
> +		else
> +			return SURFACEFORMAT_B8G8R8A8_UNORM;
>   	case 64:
>   		return SURFACEFORMAT_R16G16B16A16_FLOAT;
>   	default:


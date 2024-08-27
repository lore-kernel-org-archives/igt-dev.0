Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFE8C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 15:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383AA10E34E;
	Tue, 27 Aug 2024 15:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dxuAjhwp";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1165D10E34E
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 15:22:34 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-429e29933aaso47017695e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 08:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724772152; x=1725376952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pce7dwI7K7EU9xBVFszejYhdz8SbZ1JNXcAmFQGRRas=;
 b=dxuAjhwpTE6lJ3ZYZylCY/SKhk/WrWs36GS8DndLxjfA/tk+yYR7bjH44emw7kf3Sb
 h+eieshARs8ww9GN+muSzHGama516Am/pp5KcOzr0enZKvti46w5z3l8P2pwaPtTelH8
 tkRu8aaMnnI3jHtt0JpTDlTR3xfqv4WRg1z4VsHp9Z16yXfESNi61rsJbxFu0c2sIA/5
 QIwFgCThrVZwap9IkLQuHgJjsApGK1Ft9+/EwVAHlspyTiMHIEX/FRGrsLYrnbDfYTlU
 1paB8Qqvp4JcE/c5f2/xjl5E8WUria6xf/tf7waaJOggQz/XVnPH9h+9CqSi09dhy76v
 1rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724772152; x=1725376952;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pce7dwI7K7EU9xBVFszejYhdz8SbZ1JNXcAmFQGRRas=;
 b=tb0JdsGoAdouLHsha/pxgCVrD/T9isrslICq5seGPTjtv+XYVDUGWr8h9rkPKqtEBJ
 iNwbv0z6pom2Wc/VfHXYzWcandhV4UoDpC8J4B2ppdUfUOpNIUYygfYcAX1nq3AzWP0G
 2nDUtHNb88iukGmWelbTi7r1syK+giEDYrwVB8oi/CTre/uwGe5+T9SM9SUamufqtPmQ
 uSqQjLTWz81rPF3SC7CKdYLx/79a8fozZB+61d1Cw35OyFqi+FpHaG1sukDK1Zu/WS1P
 AkVKT/k8uj9WmFPd4PVwKO7u7ngRe1grRMY0PjkLSoGGqC6iBq51zmBPq942cEpQ7OZK
 BFZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzHn1qiaXkYiQMPEV5vGZqsDPzgkZf9+AG3ixYpp0lJ2czGl9Uvvxky+DJw/O6Nlnbe7NDkI1L@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziHcH6jFFeQPnF7wwh5g6CEAXXyr97j76JadXcT0I0ikc011Gz
 2NT5GWkQ6wtVNf00b3qtR8pPX23HdQB/JwIr11gN5zgLDtsHyCnO
X-Google-Smtp-Source: AGHT+IHr53Jjtn0flHvqiXWa/9fyj23ZtNUT9+W+PxjJtB56yJL1KrrpQmB3z+9Az+UWbAAR/5unbg==
X-Received: by 2002:a05:600c:4591:b0:426:5416:67d7 with SMTP id
 5b1f17b1804b1-42acd5d7b20mr84952435e9.27.1724772152150; 
 Tue, 27 Aug 2024 08:22:32 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac5158f14sm193133375e9.16.2024.08.27.08.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:22:31 -0700 (PDT)
Message-ID: <f2a47323-d5f9-4abc-8e22-26096cfbe9c8@gmail.com>
Date: Tue, 27 Aug 2024 18:22:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 09/37] lib/rendercopy: Extract gen4_surface_format()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-10-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-10-ville.syrjala@linux.intel.com>
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

On 3.7.2024 2.27, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> All the rendercopy implementation can use the same code to
> determine the surface format. Extract said code to a helper.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/rendercopy_gen4.c | 10 ++--------
>   lib/rendercopy_gen6.c | 10 +---------
>   lib/rendercopy_gen7.c | 12 ++----------
>   lib/rendercopy_gen8.c |  8 +-------
>   lib/rendercopy_gen9.c |  8 +-------
>   lib/surfaceformat.h   | 16 ++++++++++++++++
>   6 files changed, 23 insertions(+), 41 deletions(-)
> 
> diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
> index 8582e0efb886..8289abbabe0f 100644
> --- a/lib/rendercopy_gen4.c
> +++ b/lib/rendercopy_gen4.c
> @@ -116,6 +116,7 @@ static int gen4_max_wm_threads(uint32_t devid)
>   	return IS_GEN5(devid) ? 72 : IS_G4X(devid) ? 50 : 32;
>   }
>   
> +

stray new line. With that fixed

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>   static uint32_t
>   gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
>   {
> @@ -137,14 +138,7 @@ gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
>   	ss = intel_bb_ptr_align(ibb, 32);
>   
>   	ss->ss0.surface_type = SURFACE_2D;
> -	switch (buf->bpp) {
> -		case 8: ss->ss0.surface_format = SURFACEFORMAT_R8_UNORM; break;
> -		case 16: ss->ss0.surface_format = SURFACEFORMAT_R8G8_UNORM; break;
> -		case 32: ss->ss0.surface_format = SURFACEFORMAT_B8G8R8A8_UNORM; break;
> -		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
> -		default: igt_assert(0);
> -	}
> -
> +	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
>   	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
>   	ss->ss0.color_blend = 1;
>   
> diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
> index ec197661702f..0c71bd9cbf19 100644
> --- a/lib/rendercopy_gen6.c
> +++ b/lib/rendercopy_gen6.c
> @@ -79,15 +79,7 @@ gen6_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
>   
>   	ss = intel_bb_ptr_align(ibb, 32);
>   	ss->ss0.surface_type = SURFACE_2D;
> -
> -	switch (buf->bpp) {
> -		case 8: ss->ss0.surface_format = SURFACEFORMAT_R8_UNORM; break;
> -		case 16: ss->ss0.surface_format = SURFACEFORMAT_R8G8_UNORM; break;
> -		case 32: ss->ss0.surface_format = SURFACEFORMAT_B8G8R8A8_UNORM; break;
> -		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
> -		default: igt_assert(0);
> -	}
> -
> +	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
>   	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
>   	ss->ss0.color_blend = 1;
>   
> diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
> index e3657b5d1035..8fcbbc21cdd8 100644
> --- a/lib/rendercopy_gen7.c
> +++ b/lib/rendercopy_gen7.c
> @@ -57,7 +57,7 @@ gen7_bind_buf(struct intel_bb *ibb,
>   	      const struct intel_buf *buf,
>   	      int is_dst)
>   {
> -	uint32_t format, *ss;
> +	uint32_t *ss;
>   	uint32_t write_domain, read_domain;
>   	uint64_t address;
>   
> @@ -65,14 +65,6 @@ gen7_bind_buf(struct intel_bb *ibb,
>   	igt_assert_lte(intel_buf_width(buf), 16384);
>   	igt_assert_lte(intel_buf_height(buf), 16384);
>   
> -	switch (buf->bpp) {
> -		case 8: format = SURFACEFORMAT_R8_UNORM; break;
> -		case 16: format = SURFACEFORMAT_R8G8_UNORM; break;
> -		case 32: format = SURFACEFORMAT_B8G8R8A8_UNORM; break;
> -		case 64: format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
> -		default: igt_assert(0);
> -	}
> -
>   	if (is_dst) {
>   		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
>   	} else {
> @@ -84,7 +76,7 @@ gen7_bind_buf(struct intel_bb *ibb,
>   
>   	ss[0] = (SURFACE_2D << GEN7_SURFACE_TYPE_SHIFT |
>   		 gen7_tiling_bits(buf->tiling) |
> -		format << GEN7_SURFACE_FORMAT_SHIFT);
> +		 gen4_surface_format(buf->bpp) << GEN7_SURFACE_FORMAT_SHIFT);
>   
>   	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
>   						   read_domain, write_domain,
> diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
> index 23bea56ad1ba..28c703fca393 100644
> --- a/lib/rendercopy_gen8.c
> +++ b/lib/rendercopy_gen8.c
> @@ -88,13 +88,7 @@ gen8_bind_buf(struct intel_bb *ibb,
>   	ss = intel_bb_ptr_align(ibb, 64);
>   
>   	ss->ss0.surface_type = SURFACE_2D;
> -	switch (buf->bpp) {
> -		case 8: ss->ss0.surface_format = SURFACEFORMAT_R8_UNORM; break;
> -		case 16: ss->ss0.surface_format = SURFACEFORMAT_R8G8_UNORM; break;
> -		case 32: ss->ss0.surface_format = SURFACEFORMAT_B8G8R8A8_UNORM; break;
> -		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
> -		default: igt_assert(0);
> -	}
> +	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
>   	ss->ss0.render_cache_read_write = 1;
>   	ss->ss0.vertical_alignment = 1; /* align 4 */
>   	ss->ss0.horizontal_alignment = 1; /* align 4 */
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 42a227916f15..11f456a70d2f 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -168,13 +168,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   	ss = intel_bb_ptr_align(ibb, 64);
>   
>   	ss->ss0.surface_type = SURFACE_2D;
> -	switch (buf->bpp) {
> -		case 8: ss->ss0.surface_format = SURFACEFORMAT_R8_UNORM; break;
> -		case 16: ss->ss0.surface_format = SURFACEFORMAT_R8G8_UNORM; break;
> -		case 32: ss->ss0.surface_format = SURFACEFORMAT_B8G8R8A8_UNORM; break;
> -		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
> -		default: igt_assert(0);
> -	}
> +	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
>   	ss->ss0.vertical_alignment = 1; /* align 4 */
>   	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
>   
> diff --git a/lib/surfaceformat.h b/lib/surfaceformat.h
> index 32ea373262ca..58ef41e6d3cd 100644
> --- a/lib/surfaceformat.h
> +++ b/lib/surfaceformat.h
> @@ -186,4 +186,20 @@
>   #define SURFACE_MIPMAPLAYOUT_BELOW	0
>   #define SURFACE_MIPMAPLAYOUT_RIGHT	1
>   
> +static inline uint32_t gen4_surface_format(int bpp)
> +{
> +	switch (bpp) {
> +	case 8:
> +		return SURFACEFORMAT_R8_UNORM;
> +	case 16:
> +		return SURFACEFORMAT_R8G8_UNORM;
> +	case 32:
> +		return SURFACEFORMAT_B8G8R8A8_UNORM;
> +	case 64:
> +		return SURFACEFORMAT_R16G16B16A16_FLOAT;
> +	default:
> +		return 0;
> +	}
> +}
> +
>   #endif


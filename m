Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD99C27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 11:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168D810E35A;
	Mon, 17 Jun 2024 11:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EIbIifva";
	dkim-atps=neutral
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F0810E359
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 11:17:48 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2eadaac1d28so45405021fa.3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718623067; x=1719227867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FZnthb+/X9EEaSVTWmxvwZl/vKOuy0N5SNjx/yhaLC4=;
 b=EIbIifvagLZN/qEtJ7kdn6CYdRRBBzePlZPM9nZ4FbFNErFfq9cnnxBHBq+FwLg9OZ
 VSOEhYpe+6bLhDOYpOhykAsM2ObWNpTjtnjpjTnLIUioEuwCo0Y+vk7DZoqY6Uq8GNy3
 sskSmpKGq9f0tz7K35et+zb8gfyKlc2FNOUeAxZWEI8lW0jyhmOUPfH2+IcJvw9hdlQv
 K+x3cNG+Q2YUeAGjzDoAwmUSVx4JOZH/eccfunyrQovktTosl92aaCy8ocbEtuzts1mv
 Riazh24abphoYS3/tgJlTxEtVuZG+JxdoSRmCt9QPw3NV7ecSwCWEC1uQxGrUY/TvfoM
 LohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718623067; x=1719227867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZnthb+/X9EEaSVTWmxvwZl/vKOuy0N5SNjx/yhaLC4=;
 b=IoaB+6UgkoOsZ7HH8/F/PWh0NSBjbll5/wE8JDX5aBvbU67Staj/xcLlmQlH4wOKbK
 DS4NUK1XMNuRqbY1gaugX5WTYD+xi2AW8ywIwIR6c+TTFOjgKGiiTOYmINnpUc3ZASX0
 1vsCGRLhaQe0ko7F5FcQq8/LjukcYBx9udUqhQUFXNkKFIEebj5PiTVPXkjIj3DdHz9z
 zUKG2ILbQ4nPP1FjsFB0Uxd/6LtEXHteRULBVQjdpVvQopExNg6p0dfqCVW7lBxzH7eI
 fz1i1V7dNdBcGabYpWrhPtPHe3kxu/0OlxUzsgC+ObN4x4o1EgKDCrr4AsMgmTPhI0Vb
 PrXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXopONE4hdjopUtZNmV1wF+RFYMGLCg6JltzctFDVmtqsv/i9bz/o5yIZKZtgg1qJpYXFZzZ9asAEm2O9Km4nd2d3ZnLP0OSrmF3MFk/g==
X-Gm-Message-State: AOJu0Yy+suBmJYpfj+etqpTPO5+e0sxScNrlAQcpR1N3zhZwgxPTWLye
 kPabFA4vE2vS2TuFnAjPLr13s4feosopCB155Ot+T8Jfo4mQlNMD
X-Google-Smtp-Source: AGHT+IHQFzhK65ZOn1SApvFHa0hFXrG0vZjKqJ7iVzDUd6A6zjzZxY1JGzeDTE4r2mcRXPJx1sjD1Q==
X-Received: by 2002:ac2:5970:0:b0:52c:9db6:b414 with SMTP id
 2adb3069b0e04-52ca6e55ef7mr6379458e87.8.1718623066468; 
 Mon, 17 Jun 2024 04:17:46 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-422874de646sm195854565e9.35.2024.06.17.04.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:17:45 -0700 (PDT)
Message-ID: <b7216612-506d-4bdc-b7b9-bd57b86b6303@gmail.com>
Date: Mon, 17 Jun 2024 14:17:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 10/12] lib/intel_bufops: Drop Tile4 swizzling
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-11-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-11-zbigniew.kempczynski@intel.com>
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

On 27.5.2024 10.33, Zbigniew Kempczyński wrote:
> Swizzling is used only on older platforms and for X and Y tilings.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 38 +++++++-------------------------------
>   1 file changed, 7 insertions(+), 31 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index eb367be2f3..d0f6ab481f 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -121,7 +121,6 @@ struct buf_ops {
>   	uint32_t supported_hw_tiles;
>   	uint32_t swizzle_x;
>   	uint32_t swizzle_y;
> -	uint32_t swizzle_tile4;
>   	bo_copy linear_to;
>   	bo_copy linear_to_x;
>   	bo_copy linear_to_y;
> @@ -654,7 +653,7 @@ static void copy_linear_to_tile4(struct buf_ops *bops, struct intel_buf *buf,
>   				 uint32_t *linear)
>   {
>   	DEBUGFN();
> -	__copy_linear_to(bops->fd, buf, linear, I915_TILING_4, bops->swizzle_tile4);
> +	__copy_linear_to(bops->fd, buf, linear, I915_TILING_4, 0);
>   }
>   
>   static void __copy_to_linear(int fd, struct intel_buf *buf,
> @@ -1531,7 +1530,7 @@ void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
>   #define DEFAULT_BUFOPS(__gen_start, __gen_end) \
>   	.gen_start          = __gen_start, \
>   	.gen_end            = __gen_end, \
> -	.supported_hw_tiles = TILE_X | TILE_Y | TILE_4, \
> +	.supported_hw_tiles = TILE_X | TILE_Y, \
>   	.linear_to          = copy_linear_to_wc, \
>   	.linear_to_x        = copy_linear_to_gtt, \
>   	.linear_to_y        = copy_linear_to_gtt, \
> @@ -1586,8 +1585,6 @@ static bool probe_hw_tiling(struct buf_ops *bops, uint32_t tiling,
>   			bops->swizzle_x = buf_swizzle;
>   		else if (tiling == I915_TILING_Y)
>   			bops->swizzle_y = buf_swizzle;
> -		else if (tiling == I915_TILING_4)
> -			bops->swizzle_tile4 = buf_swizzle;
>   
>   		*swizzling_supported = buf_swizzle == phys_swizzle;
>   	}
> @@ -1754,36 +1751,15 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>   		}
>   	}
>   
> -	if (is_hw_tiling_supported(bops, I915_TILING_4)) {
> -		bool swizzling_supported;
> -		bool supported = probe_hw_tiling(bops, I915_TILING_4,
> -						 &swizzling_supported);
> -
> -		if (!swizzling_supported) {
> -			igt_debug("Swizzling for 4 is not supported\n");
> -			bops->supported_tiles &= ~TILE_4;
> -		}
> -
> -		igt_debug("4 fence support: %s\n", bool_str(supported));
> -		if (!supported) {
> -			bops->supported_hw_tiles &= ~TILE_4;
> -			bops->linear_to_tile4 = copy_linear_to_tile4;
> -			bops->tile4_to_linear = copy_tile4_to_linear;
> -		}
> -	}
> -
>   	/* Disable other tiling format functions if not supported */
> -	if (!is_tiling_supported(bops, I915_TILING_Yf)) {
> +	if (!is_tiling_supported(bops, I915_TILING_Yf))
>   		igt_debug("Yf format not supported\n");
> -		bops->linear_to_yf = NULL;
> -		bops->yf_to_linear = NULL;
> -	}
>   
> -	if (!is_tiling_supported(bops, I915_TILING_Ys)) {
> +	if (!is_tiling_supported(bops, I915_TILING_Ys))
>   		igt_debug("Ys format not supported\n");
> -		bops->linear_to_ys = NULL;
> -		bops->ys_to_linear = NULL;
> -	}
> +
> +	if (!is_tiling_supported(bops, I915_TILING_4))
> +		igt_debug("Tile4 format not supported\n");
>   
>   	if (check_idempotency) {
>   		idempotency_selftest(bops, I915_TILING_X);


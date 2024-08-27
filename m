Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE57DC54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B085510E3BB;
	Tue, 27 Aug 2024 17:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mfe2Wjqx";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4140E10E3BB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:00:27 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-429e29933aaso47994455e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724778026; x=1725382826; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ovvag4vRK3jKWUPEuwFukbH5cgToU1+mc9N17DxsBdk=;
 b=Mfe2Wjqxmw92LShtHvyg7iHphAtF3HTDEvtvW4PGF+hqrMO7u1dZanavsUoQFVovUB
 D6wgjespgWbA837fwW4Ii60zSvHCSdiv28EW+MzWf4zZmA/Xx8bWxrNfqZ8Z8VhZLQ/h
 ZHne5TR5LC6FkNlnyHs/ovOJsDy9VLJ8YPvWIBjFiKGA+b2ZsfAZIBSs3nxousPlwsyv
 QB1kEmRTmOUpW4mIrXikyhMMC3qga3qMwqzxWB6nKWAbFJbzHVA31VVJuatePZ+qVe7I
 TPZDDf2t2+O5HtYYXAxoIqt5glfInXCzps+VHcNGeGFULdIwYzfkBZxUshXxb1Q7p4nK
 JSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724778026; x=1725382826;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ovvag4vRK3jKWUPEuwFukbH5cgToU1+mc9N17DxsBdk=;
 b=Dn2z4vgKz+9NPG4p+6v2OmJjFqjYDA+BGuYdAfIO0Ts7hJrrMOY8qQrsjjuQeX8rtU
 9h/ksX1cfxRqnWvaV03Y6IJi1LnWwEoUaTP1/ufrX68te7nCwi0YUpJvFkdw3s2hOsjI
 1XXIz8wTh8UZRE76HOP+4q4dFOyAc1MpxdUTJasUBksfsf3kRkwIvtFeXfgT+bm9Y1t7
 E/Wtr39j/+7C5xDcGntnrLAIwGPeO9vwirVu/3nw0LiMFWU88czuiYn3HfIHNUqAtagb
 IWXBtJdGobZlFifQu9VSijJnLgENPVINhrUKraDjUYYvUY1LSGoLw/BMLzZ7nXGe1ZNk
 lsNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGzYxJBr2tqfMbJUpveNB1Pp6hX77lBAelH47IAaEiP32q08sAXANknKDBXaLw4S1WC0QoxRs1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEJcXNXKQM+nv2x1TMsDa/rEifOrcIbQamBN9foOZAe2m0Cq7h
 ++nHvqRRBVXQjs2pMC7c5vLp6ITQ7KFJsvoneyfRAc8MESpBbVQLSZk1ITocDN0=
X-Google-Smtp-Source: AGHT+IGQhnoaCO5h5LPrkyJ8+pfdt3QU23d2530LgJDe/LI+63WDdce8f8Nhxn9fnNleU2LX4TEE+A==
X-Received: by 2002:a05:600c:1c23:b0:423:791:f446 with SMTP id
 5b1f17b1804b1-42acd542937mr82090075e9.7.1724778025421; 
 Tue, 27 Aug 2024 10:00:25 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-37308265698sm13511938f8f.106.2024.08.27.10.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:00:25 -0700 (PDT)
Message-ID: <e2bca374-e1a4-4f57-966d-901280a6a5f3@gmail.com>
Date: Tue, 27 Aug 2024 20:00:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 24/37] lib/igt_fb: Fix blitter compression format
 handling
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-25-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-25-ville.syrjala@linux.intel.com>
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

On 3.7.2024 2.28, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> For some reason blt_compression_format() sets up both the
> source and destination with the same compression format.
> This doesn't make sense to me as one or the other could
> at least be uncompressed. Decouple the src vs. dst
> compression formats so that they can be set independently.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 33 ++++++++++-----------------------
>   1 file changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 64be4bffdea8..3b2077910349 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2870,12 +2870,6 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
>   	}
>   }
>   
> -#define BLT_TARGET_RC(x) (x.compression == COMPRESSION_ENABLED && \
> -			  x.compression_type == COMPRESSION_TYPE_3D)
> -
> -#define BLT_TARGET_MC(x) (x.compression == COMPRESSION_ENABLED && \
> -			  x.compression_type == COMPRESSION_TYPE_MEDIA)
> -
>   const struct {
>   	uint32_t format;
>   	enum blt_compression_type type;
> @@ -2903,25 +2897,14 @@ static uint32_t get_compression_return_value(uint32_t format,
>   	return 0; // This line is to avoid compilation warnings, it will not be reached.
>   }
>   
> -static uint32_t blt_compression_format(struct blt_copy_data *blt,
> +static uint32_t blt_compression_format(const struct blt_copy_object *obj,
>   				       const struct igt_fb *fb)
>   {
> -	if (blt->src.compression == COMPRESSION_DISABLED &&
> -	    blt->dst.compression == COMPRESSION_DISABLED)
> +	if (obj->compression == COMPRESSION_DISABLED)
>   		return 0;
>   
> -	if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst))
> -		return get_compression_return_value(igt_reduce_format(fb->drm_format),
> -						    COMPRESSION_TYPE_3D);
> -
> -	if (BLT_TARGET_MC(blt->src))
> -		return get_compression_return_value(igt_reduce_format(fb->drm_format),
> -						    COMPRESSION_TYPE_MEDIA);
> -
> -	if (BLT_TARGET_MC(blt->dst))
> -		igt_assert_f(0, "Destination compression not supported on mc ccs\n");
> -
> -	igt_assert_f(0, "unknown compression\n");
> +	return get_compression_return_value(igt_reduce_format(fb->drm_format),
> +					    obj->compression_type);
>   }
>   
>   static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *ctx,
> @@ -2996,6 +2979,10 @@ static void do_block_copy(const struct igt_fb *src_fb,
>   
>   	igt_assert(src && dst);
>   
> +	igt_assert_f(blt.dst.compression == COMPRESSION_DISABLED ||
> +		     blt.dst.compression_type !=  COMPRESSION_TYPE_MEDIA,
> +		     "Destination compression not supported on mc ccs\n");
> +
>   	blt_copy_init(src_fb->fd, &blt);
>   	blt.color_depth = blt_get_bpp(src_fb, i);
>   	blt_set_copy_object(&blt.src, src);
> @@ -3003,12 +2990,12 @@ static void do_block_copy(const struct igt_fb *src_fb,
>   
>   	if (blt_uses_extended_block_copy(src_fb->fd)) {
>   		blt_set_object_ext(&ext.src,
> -				   blt_compression_format(&blt, src_fb),
> +				   blt_compression_format(&blt.src, src_fb),
>   				   src_fb->plane_width[i], src_fb->plane_height[i],
>   				   SURFACE_TYPE_2D);
>   
>   		blt_set_object_ext(&ext.dst,
> -				   blt_compression_format(&blt, dst_fb),
> +				   blt_compression_format(&blt.dst, dst_fb),
>   				   dst_fb->plane_width[i], dst_fb->plane_height[i],
>   				   SURFACE_TYPE_2D);
>   		pext = &ext;


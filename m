Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBC2CE7B0A
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 13:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6825310E9A4;
	Fri,  6 Sep 2024 13:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mODxfpkz";
	dkim-atps=neutral
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D0710E9A4
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 13:09:10 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53653ff0251so2101027e87.0
 for <igt-dev@lists.freedesktop.org>; Fri, 06 Sep 2024 06:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725628149; x=1726232949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qh3mSYarAeH+SP6A6AOc1ClZ+vOHYHj7IYRNgajj9Lw=;
 b=mODxfpkzI9ZBFwi1VgdLYJRNBV5bQkIwF/aa7GLVrYtb3ujrpls9pD3Z5JiInMnYvd
 4St8L8ZwcTOY70dkcF/2Cpai+BApAOnUH6mVRqmAs22Zk6CkiMsO3/y4EE9lN0JakN76
 lmbSqCOo3EOaYzkvAo0h/sjW5mXRh57fHa+O0Q8uAdfnYE0v48LvJU6oL/sxVssYrCVw
 lmS1VxxwMkwTfgUwciXZd8fGU/pQbPR3lHLeRxGp1tZX7c0FjjCtS6+iBUHk/kGPYtcK
 +692mRtwkeQniyafKIMxjJFhfWTEtrHxbkwwiO8ofPKCJLJrt0D2NFmi3AomI+GaqCEx
 ui8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725628149; x=1726232949;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qh3mSYarAeH+SP6A6AOc1ClZ+vOHYHj7IYRNgajj9Lw=;
 b=li0BDZlOacG/GZQF6WjG0TwVU6K+/GfxW2hCLl3RoD/RuQc2cWRjzQ4k+pIsBc+3YN
 +M8XpSuOCAcanuqcwwhHBMsuRZjfPnp3sv3NejC6faQK1z9I6xRFNKglcfL9JOxqC1G0
 zynb8YZ8GOprvd4R8Jjm8MZQh/vdwbyXU251Qy5J9Oqe/y1WgNTHNpxXI037kuYt4szB
 2o3E5q7dOeaQYtIBIFuGGu/TCImpazYbplxS9IzoWJ0HUBe5CQ/Zru6/B/ElWblgVAR2
 FQp6iHDuntlcEkfCM5ArhuRXGaMT7fMO+lHgNudSpNYj5h7okgSEuMbkPuIdQpLKracA
 pI3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgxIxyxOSnCoO/9D9KM+XgAVV690/LP0xIPCG9TcaHvOXwDFLzOtd7pbaa3CH1bT5YhpfTWRD9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHnw/oSNw/FGqWx6BlrBLwXvMFadI7+9KIn54TUtrpT9WrvQwY
 kaA2iFP1fhfYq4tqqrlb3ZY1zP7oNT8yS2eemIgwQyP+5sufbfNu
X-Google-Smtp-Source: AGHT+IFf5dUjCDMaIiW/YVGSn8bhjX1UWaFrB6po6qF93fPTrN0h9vsE1Rtyf5crtL3ul+WApyoXKQ==
X-Received: by 2002:a05:6512:398f:b0:535:6942:29ea with SMTP id
 2adb3069b0e04-536587a7700mr1605004e87.11.1725628148129; 
 Fri, 06 Sep 2024 06:09:08 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a8a61fbaf5bsm272871866b.23.2024.09.06.06.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 06:09:07 -0700 (PDT)
Message-ID: <924618d6-0d42-4d42-8119-2442b0e540d8@gmail.com>
Date: Fri, 6 Sep 2024 16:09:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 07/23] lib/rendercopy: Fix fastclear scaling
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
 <20240902143758.21036-8-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240902143758.21036-8-ville.syrjala@linux.intel.com>
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

On 2.9.2024 17.37, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The hardcoded 64x16 fastclear coordinate scaling
> factors assume 32bpp+Y-tile. Determine the correct
> scaling factors for other tilings and bpps.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/rendercopy_gen9.c | 105 +++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 99 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 57b64dad1b1d..42a227916f15 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -346,6 +346,95 @@ gen8_fill_ps(struct intel_bb *ibb,
>   	return intel_bb_copy_data(ibb, kernel, size, 64);
>   }
>   
> +static void fast_clear_scale(const struct intel_buf *buf,
> +			     int *x_scale, int *y_scale)
> +{
> +	switch (buf->tiling) {
> +	case I915_TILING_4:
> +		*x_scale = 1024 * 8 / buf->bpp;
> +		*y_scale = 16;
> +		break;
> +	case I915_TILING_64:
> +		switch (buf->bpp) {
> +		case 8:
> +			*x_scale = 128;
> +			*y_scale = 128;
> +			break;
> +		case 16:
> +			*x_scale = 128;
> +			*y_scale = 64;
> +			break;
> +		case 32:
> +			*x_scale = 64;
> +			*y_scale = 64;
> +			break;
> +		case 64:
> +			*x_scale = 64;
> +			*y_scale = 32;
> +			break;
> +		case 128:
> +			*x_scale = 32;
> +			*y_scale = 32;
> +			break;
> +		}
> +		break;
> +	case I915_TILING_Y:
> +		*x_scale = 256 * 8 / buf->bpp;
> +		*y_scale = 16;
> +		break;
> +	case I915_TILING_Yf:
> +		switch (buf->bpp) {
> +		case 8:
> +			*x_scale = 128;
> +			*y_scale = 32;
> +			break;
> +		case 16:
> +			*x_scale = 128;
> +			*y_scale = 16;
> +			break;
> +		case 32:
> +			*x_scale = 64;
> +			*y_scale = 16;
> +			break;
> +		case 64:
> +			*x_scale = 64;
> +			*y_scale = 8;
> +			break;
> +		case 128:
> +			*x_scale = 32;
> +			*y_scale = 8;
> +			break;
> +		}
> +		break;
> +	case I915_TILING_Ys:
> +		switch (buf->bpp) {
> +		case 8:
> +			*x_scale = 64;
> +			*y_scale = 64;
> +			break;
> +		case 16:
> +			*x_scale = 64;
> +			*y_scale = 32;
> +			break;
> +		case 32:
> +			*x_scale = 32;
> +			*y_scale = 32;
> +			break;
> +		case 64:
> +			*x_scale = 32;
> +			*y_scale = 16;
> +			break;
> +		case 128:
> +			*x_scale = 16;
> +			*y_scale = 16;
> +			break;
> +		}
> +		break;
> +	default:
> +		igt_assert(0);
> +	}
> +}
> +
>   /*
>    * gen7_fill_vertex_buffer_data populate vertex buffer with data.
>    *
> @@ -360,6 +449,7 @@ static uint32_t
>   gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
>   			     const struct intel_buf *src,
>   			     uint32_t src_x, uint32_t src_y,
> +			     const struct intel_buf *dst,
>   			     uint32_t dst_x, uint32_t dst_y,
>   			     uint32_t width, uint32_t height)
>   {
> @@ -384,17 +474,21 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
>   		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
>   		emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
>   	} else {
> -		emit_vertex_2s(ibb, DIV_ROUND_UP(dst_x + width, 64), DIV_ROUND_UP(dst_y + height, 16));
> +		int x_scale, y_scale;
> +
> +		fast_clear_scale(dst, &x_scale, &y_scale);
> +
> +		emit_vertex_2s(ibb, DIV_ROUND_UP(dst_x + width, x_scale), DIV_ROUND_UP(dst_y + height, y_scale));
>   
>   		emit_vertex_normalized(ibb, 0, 0);
>   		emit_vertex_normalized(ibb, 0, 0);
>   
> -		emit_vertex_2s(ibb, dst_x/64, DIV_ROUND_UP(dst_y + height, 16));
> +		emit_vertex_2s(ibb, dst_x/x_scale, DIV_ROUND_UP(dst_y + height, y_scale));
>   
>   		emit_vertex_normalized(ibb, 0, 0);
>   		emit_vertex_normalized(ibb, 0, 0);
>   
> -		emit_vertex_2s(ibb, dst_x/64, dst_y/16);
> +		emit_vertex_2s(ibb, dst_x/x_scale, dst_y/y_scale);
>   
>   		emit_vertex_normalized(ibb, 0, 0);
>   		emit_vertex_normalized(ibb, 0, 0);
> @@ -1108,9 +1202,8 @@ void _gen9_render_op(struct intel_bb *ibb,
>   	ps_binding_table  = gen8_bind_surfaces(ibb, src, dst);
>   	ps_sampler_state  = gen8_create_sampler(ibb);
>   	ps_kernel_off = gen8_fill_ps(ibb, ps_kernel, ps_kernel_size);
> -	vertex_buffer = gen7_fill_vertex_buffer_data(ibb, src,
> -						     src_x, src_y,
> -						     dst_x, dst_y,
> +	vertex_buffer = gen7_fill_vertex_buffer_data(ibb, src, src_x, src_y,
> +						     dst, dst_x, dst_y,
>   						     width, height);
>   	cc.cc_state = gen6_create_cc_state(ibb);
>   	cc.blend_state = gen8_create_blend_state(ibb);


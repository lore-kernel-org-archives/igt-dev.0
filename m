Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D06C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 15:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DB810E34D;
	Tue, 27 Aug 2024 15:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hXc3Vnya";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434CC10E34D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 15:17:41 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37198a6da58so3956441f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724771860; x=1725376660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=of/aKA04YyDJXM9ujWP7Sz+xkG51xgPKJtmmPzSQPyw=;
 b=hXc3VnyaFuWZPG8y+SVFB8/HqTj8LWWpTbR0s12oiHIj92X4YqfLPSe54e397FiWFv
 W/HfU/g7zbUseBMPNThM8sqyMrEAFVVN7PflQR8VjIn1Rwumh7RbRnrFqUr85B6x2zj1
 0SASpdLHbHn5W0vh5WExjpaFOfXNhOyChmANCwej/Ue334TOKLgMAarZdxW77cRPkJ/i
 juv0R/CrxwGPY4UZLQgsBq8uB/XIU6MHEhFDUwDyivjdmseoq7bAMhVdza2Pn9qTN6VG
 cClqWJEdVX/mf5bJJ/H5iORVb68dDfSj9GVFCvvEnS+SFtSSn490lxTwlimxCNnwzFF6
 wKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724771860; x=1725376660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=of/aKA04YyDJXM9ujWP7Sz+xkG51xgPKJtmmPzSQPyw=;
 b=IEmBGtk7CAScrGsLS89Z87ikQzr5Vp93V9wb7Ets2hj2kQ7EWzza+MEaEY2biIJKJO
 1dZjuT6SFbUo+kNIaNars6AfyXS+ue5y1IwzER/1W30FkhGg6j7fK5sgVbg3Sg1Hrb2n
 gikaBLM50bui1/mikRoPJsMdwRcksYjG2lXPejX1gLdeWM+Ngfb82J7sYFhi4dY1TfmS
 PRlo0B0c6CgE5FWyyasvuVJbkwFAHiv6/N98kJSZCi2+sB6UXGyP5Q3vij/gtqHtrcZu
 qiK9dI6QkiU/dNrTn+1yHXMkkscvqtjDKiT72Zf6S6CgylIIRIPxuSHpXFQetBDgnoep
 nAcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzOANLysAe1h5qca+ThRCszr8epGxiH2zDFT5S5cLxjtoofODsfW0XhwjPqXtELMJ7EuPAcWWD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/4OKavqnNGFhPGOh+xqH/Jf4+wsNWXivgsOJSIzN+bq8b+CV3
 uhzE4nbtYAHd1dZVQpVVt9Qurn7Wg98kSHOq+o9nx0eDlpH8UhoV
X-Google-Smtp-Source: AGHT+IFN05ugTqHNy2Z68YN6SNZ3xgaEU9n++Ji4hKOZAr2MloeLpQ0MGI4BCQjfSM5FlDuvHa2SaA==
X-Received: by 2002:adf:facc:0:b0:371:72b3:643e with SMTP id
 ffacd0b85a97d-373118c80damr11182615f8f.42.1724771859349; 
 Tue, 27 Aug 2024 08:17:39 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-37308110014sm13360495f8f.19.2024.08.27.08.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:17:38 -0700 (PDT)
Message-ID: <548a76d8-dd30-4a3b-a37a-47daec6b4475@gmail.com>
Date: Tue, 27 Aug 2024 18:17:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 08/37] lib/rendercopy: Fix fastclear scaling
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-9-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-9-ville.syrjala@linux.intel.com>
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

I was trying to figure where 1024 is coming from but fell short, maybe 
some comment could be added for this magic. Otherwise patch look ok.

/Juha-Pekka

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


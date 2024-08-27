Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D4DC5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B70310E3AA;
	Tue, 27 Aug 2024 16:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OMo7/zH6";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AAC10E3AA
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:50:23 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso51655725e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724777422; x=1725382222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=w104vaeayomK8iu8QnaX9l76xB1WiBcV89ghOIy/hmw=;
 b=OMo7/zH6wH1qrF1NzaHlBFrIUGjxZWXgXMumXEdtX0wGBEDqKMzLQaQKIIXnQUI02j
 GScZStpchibPsXG6CJ/RBQjkhQnAki+OO1NtJw2Ap7DLwxFj/fa82kAY1TgsX0Q5Ua7H
 sCCIwhr8Po+4MiVBiQHIEFo9snjY+1HyUQgBZXtOpfD0PudCgVLWy/DaU1cx4TFnDuCC
 hdu6ijhpdJ2YcjQFLH9Gq5zy77FblgfM8Y/j6VBFcCtWOFZzk48MBJbpscXDYMfyA4xh
 ym3C17kWqp2+AcpKtRYIM1gBbNfgqNbhGVNxe374bzYnrz+wTP7/wVyjdGFzJvXgJj52
 38QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724777422; x=1725382222;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w104vaeayomK8iu8QnaX9l76xB1WiBcV89ghOIy/hmw=;
 b=j93wJTLHbTxlM2FcHETM7SlrUTTh5DEb9uBkXNCHzISraHAp3sMivFLfbK6ahiDiL8
 4QkI8QHsEAMmOUvzBkqvuA1BPDIgdwp4EDFqHGqX1SOCOfaOhdjcRCct54n5eJS0Vk0K
 EJumRwJQHXN2o54ZLua9Fe7pq+HwsD8Dli6Ozh8WHLrML9h7AemBhJXvAG/fX1o/AVy3
 7uxeHU+vHC4Lp72eQeA+ax+lcSb2XV20pC32vGpZaRL1x0ZBwVAk+GAPEnnFv4Nv4BpC
 6B4+CIOPP5zwzshjtxxos3JzicAR9GezTmq0wyW8q8TAscIaEADizgloqMZbvpTtQK8u
 a6jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOU8TwFUfzDlYrRZqfXWfGSAdENvJIHpyXJ+94C8vb5ZT0lgffimYKRmeGrfLhwPaIjDpkHjyY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfKvY7X/VET4RyPYmJLZyKtnWr4ajd1lXFuaVmbjNZ4mNJM+gg
 glo7/FuYvCvIMjepKygHKMsqBMAN0I60W5hx/e6f4yn1WCJz/f4KG4U/Te5TLPM=
X-Google-Smtp-Source: AGHT+IGq5Vp6NGQNzBewi9W3y3gQveNaWKKUQLWU/c6wQ1c67Xp1b+YLibKCsenXsrVb+PonMcAogg==
X-Received: by 2002:a05:600c:492f:b0:426:6822:861 with SMTP id
 5b1f17b1804b1-42b9ae3f3f6mr20186135e9.36.1724777421864; 
 Tue, 27 Aug 2024 09:50:21 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42abed8b8c4sm229355035e9.3.2024.08.27.09.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:50:21 -0700 (PDT)
Message-ID: <51d4925c-10d5-46f2-8b8a-5ec05358e9bd@gmail.com>
Date: Tue, 27 Aug 2024 19:50:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 20/37] lib/igt_fb: Adjust how we pick the blitter
 compression format
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-21-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-21-ville.syrjala@linux.intel.com>
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
> Instead doing this bpp vs. format thing based on the compression
> type, let's stick with the format. In order to avoid having to
> populate the table with all the different swizzles we'll pass
> the format through igt_reduce_format().
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 4ef1945e4333..fd115f833bc5 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2875,23 +2875,22 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
>   			  x.compression_type == COMPRESSION_TYPE_MEDIA)
>   
>   const struct {
> -	uint32_t key;
> +	uint32_t format;
>   	enum blt_compression_type type;
>   	uint32_t return_value;
>   } compression_mappings[] = {
> -	{ CD_32bit, COMPRESSION_TYPE_3D, 8 },
> +	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_3D, 0x8 },
>   	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },
>   	{ DRM_FORMAT_XYUV8888, COMPRESSION_TYPE_MEDIA, 9 },
>   	{ DRM_FORMAT_NV12, COMPRESSION_TYPE_MEDIA, 9 },
>   	{ DRM_FORMAT_P010, COMPRESSION_TYPE_MEDIA, 8 },
> -	{ DRM_FORMAT_P012, COMPRESSION_TYPE_MEDIA, 8 },
> -	{ DRM_FORMAT_P016, COMPRESSION_TYPE_MEDIA, 8 },
>   };
>   
> -static uint32_t get_compression_return_value(uint32_t key, enum  blt_compression_type type)
> +static uint32_t get_compression_return_value(uint32_t format,
> +					     enum  blt_compression_type type)
>   {
>   	for (int i = 0; i < ARRAY_SIZE(compression_mappings); i++) {
> -		if (compression_mappings[i].key == key &&
> +		if (compression_mappings[i].format == format &&
>   		    compression_mappings[i].type == type) {
>   			return compression_mappings[i].return_value;
>   		}
> @@ -2908,11 +2907,11 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
>   		return 0;
>   
>   	if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst))
> -		return get_compression_return_value(blt->color_depth,
> +		return get_compression_return_value(igt_reduce_format(fb->drm_format),
>   						    COMPRESSION_TYPE_3D);
>   
>   	if (BLT_TARGET_MC(blt->src))
> -		return get_compression_return_value(fb->drm_format,
> +		return get_compression_return_value(igt_reduce_format(fb->drm_format),
>   						    COMPRESSION_TYPE_MEDIA);
>   
>   	if (BLT_TARGET_MC(blt->dst))


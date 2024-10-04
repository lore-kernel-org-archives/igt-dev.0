Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB26DCFA763
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 11:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD7B10E14A;
	Fri,  4 Oct 2024 11:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HA2Av4F/";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C7210E14A
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 11:00:54 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-37cdac05af9so1896029f8f.0
 for <igt-dev@lists.freedesktop.org>; Fri, 04 Oct 2024 04:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728039652; x=1728644452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=CimjKv+/qrNe/oytqMkHPv0VRT8A+LAvewggYA+XVk0=;
 b=HA2Av4F/9q/RnDSMU5tkI43cxpd41pyTOg0FRPYutnrG/4JtIs9tHHbvjTPwlsf4Ib
 B3fvCugU+26IWqBP4yJlkGxTXHXjdzMl0lT/hG9dzCzy6LYAYydorH2mAkwzZ9hOCWTp
 E78W75pCgIuk7UUsBb5vHJokdQd7UxoWMS3k8q/d8qbpbRnMad4a+G0KrcwAYpakpYHq
 zk7Qk0OGMkN8RV4Em132nYqlVwUMRGgBPP0IvORqKXqxoMLgefTNVs6dChy0l5lh/Rdz
 cxKY8anQP+L4i/DALm5+ggPxd/k03Kkl8hNRI0QayUaDZl/snzB+hWbn0DdJLYdzNFUA
 dgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728039652; x=1728644452;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CimjKv+/qrNe/oytqMkHPv0VRT8A+LAvewggYA+XVk0=;
 b=MJWszFoS6ctoIY3M5JskK1hFC0bhM2KBVOGSOx7poZLWnq57nFjBQBt9b8xtiLmavu
 C64qBlyBUffKltjR9+xJG9EF1GlIA588K7GoxZiwXjVBHUSlKzFyBzEAT7klHkrFpiiF
 SAPuzgnmegVO2j5o4eAAu0n2QpTD2FzmgLXYWgJsP8ek7OZDXn0u/IxBoiMj2yn1sSBY
 tTKQ/foHMPEjhiRrh6TdXUY4DBcgWqcFP/pxzqCb0fIcFNC2dNxrQfYp72jU/YeEloAf
 LXB2xHFjU/V/5AJ5hYuciI2mOGNdxvN7YY0g/krDQ5E9m84pTJ4bEaFF1ZHa1Vwy/J+2
 Y4rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLSpF2/57IiKcMe4P8pE4x+/c2eGsrQHk+S8SCXoc+2PzVsVLD9mqz11o1uNWzkkoX5jjxL1sz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziTjVhqrsFCuWZKMTEhQznmTsFHxZkqEmVupPIm/wreG3yfz4P
 gkLr7F0j+4oB5h3kMWW6n1mg3pJbSByd3r+H9sz7hChaXYjZufqBXbuE0LdDL84=
X-Google-Smtp-Source: AGHT+IHnvhMjJV+hYADKxYEPHanoOawZ0wCB9intL0huVRh9ZOB4ocyar88NdqihJFPett8F+PZmwA==
X-Received: by 2002:a5d:66c9:0:b0:37c:cc05:7a56 with SMTP id
 ffacd0b85a97d-37d0e6ead0emr1934883f8f.10.1728039651896; 
 Fri, 04 Oct 2024 04:00:51 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-37d082a68cbsm3036538f8f.76.2024.10.04.04.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 04:00:51 -0700 (PDT)
Message-ID: <d8013d78-0fa7-4ede-aba9-30a6e90f27b4@gmail.com>
Date: Fri, 4 Oct 2024 14:00:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_fb: Fix intel_buf surface init
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240923213620.12369-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240923213620.12369-1-ville.syrjala@linux.intel.com>
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

For flat ccs case I don't think buf->ccs[] would become filled because 
it should later cause gpu fault if aux stuff is present in render batch 
w/ flat ccs.

Anyway the change look good
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 24.9.2024 0.36, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The current coed is populating buf->ccs[] and buf->surface[]
> in a rather inconsistent way.
> 
> It looks like for flat CCS platforms:
> - we populate buf->ccs[] with some nonsense even though
>    we shouldn't since the AUX stuff is completely hidden by
>    the hardware
> - we seem to stick data about the clear color into both
>    both buf->ccs[] and buf->surfaces[] when it should be in neither
> 
> For non-flat CCS platforms the code seems more reasonable,
> except it only manages to skip the clear color fumble by
> the fact that num_planes is always odd with clear color
> and thus the /2 will truncate it away.
> 
> Anyways, let's make the code make actual sense for all platforms
> by properly calculating how many main surfaces and ccs surfaces
> there should be.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 42 +++++++++++++++++++++++++++++++++++-------
>   1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index b8ffd7cfb261..6deb2a221df6 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2636,6 +2636,35 @@ static int yuv_semiplanar_bpp(uint32_t drm_format)
>   	}
>   }
>   
> +static int intel_num_surfaces(const struct igt_fb *fb)
> +{
> +	int num_surfaces;
> +
> +	if (!igt_fb_is_ccs_modifier(fb->modifier))
> +		return fb->num_planes;
> +
> +	num_surfaces = fb->num_planes;
> +
> +	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
> +		num_surfaces--;
> +
> +	if (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
> +		num_surfaces /= 2;
> +
> +	return num_surfaces;
> +}
> +
> +static int intel_num_ccs_surfaces(const struct igt_fb *fb)
> +{
> +	if (!igt_fb_is_ccs_modifier(fb->modifier))
> +		return 0;
> +
> +	if (HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
> +		return 0;
> +
> +	return intel_num_surfaces(fb);
> +}
> +
>   struct intel_buf *
>   igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>                           const struct igt_fb *fb,
> @@ -2705,13 +2734,12 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>   	if (buf->format_is_yuv_semiplanar)
>   		buf->yuv_semiplanar_bpp = yuv_semiplanar_bpp(fb->drm_format);
>   
> -	if (igt_fb_is_ccs_modifier(fb->modifier)) {
> -		num_surfaces = fb->num_planes / (HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ? 1 : 2);
> -		for (i = 0; i < num_surfaces; i++)
> -			init_buf_ccs(buf, i,
> -				     fb->offsets[num_surfaces + i],
> -				     fb->strides[num_surfaces + i]);
> -	}
> +	num_surfaces = intel_num_surfaces(fb);
> +
> +	for (i = 0; i < intel_num_ccs_surfaces(fb); i++)
> +		init_buf_ccs(buf, i,
> +			     fb->offsets[num_surfaces + i],
> +			     fb->strides[num_surfaces + i]);
>   
>   	igt_assert(fb->offsets[0] == 0);
>   	for (i = 0; i < num_surfaces; i++) {


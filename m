Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D9BC54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1E010E386;
	Tue, 27 Aug 2024 16:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Puc2S6wZ";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F63510E386
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:34:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-371b97cfd6fso3666665f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724776454; x=1725381254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Fdd5E8daWX9R2OKo6nH8szNSyedqmYdQp9TWLKfAsiE=;
 b=Puc2S6wZ1N/CDl4l6j1dfLfIriYPEo/8OIDcjrGhSM42WweQ9+is5PQHnCd8qDe/Dh
 9KQry7XJIF4KQ4JzFuBV9rw8ClXXM2viamvTfu1+kktpNaYOxD8PE9DKp3OiPPQ1B3TQ
 duczZ4MezdyZ6L9Ea9mA/uu5L1F0xIGSlUma/084qeIu6pSA3V9oCQNo2mve6o3H1lf6
 tmNLJnzx28GD3w1/32X1WUUQbZvCP2S2uSH165E3/o36EReLD/m3oTVR5Bb/Eu4Rh91/
 rQ5/+TH3xUrypkPMt6fxGMqJTtL5UAEEODt7oFbDum2I1UeF680SpG+jt/HMG1PUGfOZ
 Gj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724776454; x=1725381254;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fdd5E8daWX9R2OKo6nH8szNSyedqmYdQp9TWLKfAsiE=;
 b=UMAoO0XJe0VtCjO9aM8ZR71FwBR7luoWKi75WTRnLHBfhh2XtDT5cf+c4mRUIzZTzX
 OSRJV2WkyOoD5MfZen9wXKK2i5r3eQnVAccA3oz5NGJ+G+4P68Zj6MBmw1ppMhqTKGw4
 VnAyRB2333tdieiuwxH4gPVmWE47qJV/BGjPUmBm2P9ehuq+Rs1b/8FWsZPHPc2Nt7EQ
 ImfUH3LcKVPlBX4JCdyW1PstONHUUpqigZXqOVMdFBzrc0Thw0H028qeMPQ3KacFDCe6
 P1Zfu9gN+8oSebgG28qc8YKN3PGYQNST8FeIplbnowPYJgF0yJ9gbijPGEvvk9ySZcdr
 lmdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8/NkLOn9bnlz1zkOQDLOWQhQ+dQbzGzE6SuFuOMLPRa521uNK5HG+3rjS1MVJCHxbrn83HJmh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWI+KeXj2UbhBFfVz2tR+NlTVbz2ZknOxKZ5DbaAvsWEae8SrC
 W/JdbdaW9oHMjHoP8phxMQSFwuOBg0mu//yTEKSaTVgcE1JI5UCC
X-Google-Smtp-Source: AGHT+IFcSL2VRLFBy+ocvNGbICdpvSKHYLeZ4WBpt1Bdv+MY310p6wLF/9nsjOUcu+T1CC5rRAuSxA==
X-Received: by 2002:a5d:4fce:0:b0:368:41e0:16c0 with SMTP id
 ffacd0b85a97d-3748c7cf611mr2522559f8f.22.1724776453676; 
 Tue, 27 Aug 2024 09:34:13 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3730817ae1fsm13581159f8f.65.2024.08.27.09.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:34:13 -0700 (PDT)
Message-ID: <7d4997f0-591e-4db4-8f5a-69097e80c96e@gmail.com>
Date: Tue, 27 Aug 2024 19:34:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 15/37] lib/igt_fb: Extract ccs_needs_enginecopy()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-16-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-16-ville.syrjala@linux.intel.com>
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
> We have two copies of the code to determine if CCS needs to
> use enginecopy. Extract the code to a helper.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 29 +++++++++++++++++++++--------
>   1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index c48a61b5f148..6c9b4b7f3107 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2494,17 +2494,29 @@ static bool block_copy_ok(const struct igt_fb *fb)
>   					       fb_tile_to_blt_tile(fb->modifier));
>   }
>   
> +static bool ccs_needs_enginecopy(const struct igt_fb *fb)
> +{
> +	if (is_gen12_mc_ccs_modifier(fb->modifier))
> +		return true;
> +
> +	if (is_ccs_modifier(fb->modifier) &&
> +	    !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
> +		return true;
> +
> +	return false;
> +}
> +
>   static bool blitter_ok(const struct igt_fb *fb)
>   {
>   	if (!is_intel_device(fb->fd))
>   		return false;
>   
> -	if ((!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) &&
> -	    is_ccs_modifier(fb->modifier)) ||
> -	    is_gen12_mc_ccs_modifier(fb->modifier) ||
> -	    (!blt_uses_extended_block_copy(fb->fd) &&
> +	if (ccs_needs_enginecopy(fb))
> +		return false;
> +
> +	if (!blt_uses_extended_block_copy(fb->fd) &&
>   	    fb->modifier == I915_FORMAT_MOD_X_TILED &&
> -	    is_xe_device(fb->fd)))
> +	    is_xe_device(fb->fd))
>   		return false;
>   
>   	if (is_xe_device(fb->fd))
> @@ -2544,10 +2556,11 @@ static bool use_enginecopy(const struct igt_fb *fb)
>   	if (blitter_ok(fb))
>   		return false;
>   
> +	if (ccs_needs_enginecopy(fb))
> +		return true;
> +
>   	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
> -	       fb->modifier == I915_FORMAT_MOD_X_TILED ||
> -	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
> -	       is_gen12_mc_ccs_modifier(fb->modifier);
> +		fb->modifier == I915_FORMAT_MOD_X_TILED;
>   }
>   
>   static bool use_blitter(const struct igt_fb *fb)


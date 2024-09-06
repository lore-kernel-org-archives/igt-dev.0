Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8D1CE7B0A
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 13:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CC410EA4F;
	Fri,  6 Sep 2024 13:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LafLrCYD";
	dkim-atps=neutral
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5A510EA4F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 13:09:27 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5becfd14353so1988511a12.1
 for <igt-dev@lists.freedesktop.org>; Fri, 06 Sep 2024 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725628166; x=1726232966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=iONwjrDoEywNwiaJ2XkFEYY9wuaDVBuOwYP9wpT813o=;
 b=LafLrCYD4iz6i9SEXaHd69QLbpM88dzJ6NdqKC0IllQtQ6OwqA0cKCkEa505YF34pm
 +eUKyGVjsqzCs8kjPm7fk2j18fEEYYnMxACyL3Gs5jO4TpDP+Er7Twi0+cIzITISLiIo
 X+II4YxTvmI+yzHja8typiVs5uduNOe58Bjc8fziXQE4lUQFSMLji3nKVF2usQ+xtHd0
 w1JHYv5n6fTPhMUuVG1/85CtgGn9YVFk+SKxPmpMYN4PaChCxWcGb26BhKU0EPNb/egT
 lisbyP8YHwh++baKbvj1NWOFRfzc3G+Mf4aOR8kxoEcK/IriokA4GNXoY1ZqZAfxufUa
 XXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725628166; x=1726232966;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iONwjrDoEywNwiaJ2XkFEYY9wuaDVBuOwYP9wpT813o=;
 b=L3+eECiY0wVNAzFxFEo2ERXAqE9ECHn6/ExSwj8GEDGpg0u8wgs65WRMB7i3nTsLC/
 /B6KUnCwNf4dSUZSVOGqvsTw33ZaeyPKmR1jAXVEQZxNr4d+BxyIq6OE1/oW2jHfci91
 CoIpmhaJ54PnCGuKFRuDnseeJX1mzmURpWupabXQET+Rv763f5daKoSvpvajMRRYekv1
 HUqf/058YaQo2kz9s2AK6YA/Gu6K7Nx99cKZ9d3khH/rX/9uqY3kkdSLoY0GmWcD2cqR
 1+7NHqzOCHwNKGh0EiqrMPkEosyIpBIIsfMOT2qfjfgmrtORLLw6SXbynFXKfijIsC78
 JEuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNKvokXi9sh8TEPtjIleqqk3tdDviv7kdCfL1E2uGSoqZe0HwURooj7DqSAREdiYGAREbyxRf1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBhww2ee39evnVdyqabEihZiQuM59pcKDCGDtkF/zx+OsFt2Qa
 EAVyaTSGalqogVLXXaKgeq0b/SlRRjY1XCzsst41srtmGsDn9zBz
X-Google-Smtp-Source: AGHT+IE8gJg+VGWIg/5hn1ugn+wJXUjtMjEMFLicWhlz0sbpjDYixxJplAtj2cLpDi4IMUq/KkyMEQ==
X-Received: by 2002:a05:6402:34d2:b0:5be:fe37:41cb with SMTP id
 4fb4d7f45d1cf-5c21ed9f538mr18662027a12.33.1725628165399; 
 Fri, 06 Sep 2024 06:09:25 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc528d5dsm2443651a12.9.2024.09.06.06.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 06:09:24 -0700 (PDT)
Message-ID: <d08eeda6-a8e9-4ab9-8dc2-4860e97a2307@gmail.com>
Date: Fri, 6 Sep 2024 16:09:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 05/23] lib/rendercopy: Always setup clear color for
 TGL
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
 <20240902143758.21036-6-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240902143758.21036-6-ville.syrjala@linux.intel.com>
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

On 2.9.2024 17.37, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> TGL apparently automagically converts regular output to fast
> clears when the output matches the configured clear color.
> And if we don't enable the clear color packet at all then we
> just get some rainbow gibberish on all black parts of the
> output.
> 
> To avoid always set up the clear color packet when using
> using a non-clear color modifier. We'll just stick a bunch
> of NaNs into the clear value so it'll never match any
> legitimate output, and thus automagic fast clear should not
> happen.
> 
> TODO: Hide this better inside rendercopy_gen9.c without
>        requring extra allocation in the FB BO
> TODO: Figure out if other platforms need this sort stuff
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c          | 24 ++++++++++++++++++++++++
>   lib/intel_bufops.h    |  1 +
>   lib/rendercopy_gen9.c | 14 +++++++++++---
>   3 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 21c56a454c5a..0eb3897d0f8b 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -965,6 +965,16 @@ void igt_calc_fb_size(struct igt_fb *fb)
>   		size += calc_plane_size(fb, plane);
>   	}
>   
> +	/*
> +	 * We always need a clear color on TGL, make some extra
> +	 * room for one it if it's not explicit in the modifier.
> +	 *
> +	 * TODO: probably better to allocate this as part of the
> +	 * batch instead so the fb size doesn't need to change...
> +	 */
> +	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS)
> +		size = ALIGN(size + 64, 64);
> +
>   	if (is_xe_device(fb->fd)) {
>   		size = ALIGN(size, xe_get_default_alignment(fb->fd));
>   		if (fb->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS)
> @@ -2670,6 +2680,20 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>   	if (fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
>   		buf->cc.offset = fb->offsets[1];
>   
> +	/*
> +	 * TGL appears to do automagic fast clear when rendering
> +	 * black and the clear color isn't specified, or when the
> +	 * output matches the specified clear color. Force a
> +	 * non-sensical clear color to prevent it from doing this
> +	 * when using a non-clear color modifier.
> +	 *
> +	 * TODO: figure out if other platforms are affected...
> +	 */
> +	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS) {

What about adlp on this? I believe it will now get same treatment as tgl 
and ci doesn't seem to have adlp on shards so there's no good results(?)

/Juha-Pekka

> +		buf->cc.disable = true;
> +		buf->cc.offset = fb->size - 64;
> +	}
> +
>   	return buf;
>   }
>   
> diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
> index 84e71d41a2c2..06e72ba4ba93 100644
> --- a/lib/intel_bufops.h
> +++ b/lib/intel_bufops.h
> @@ -38,6 +38,7 @@ struct intel_buf {
>   	} ccs[2];
>   	struct {
>   		uint32_t offset;
> +		bool disable;
>   	} cc;
>   	struct {
>   		uint64_t offset;
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 5ee4c89f5cdb..f0757a8e6b78 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -1133,15 +1133,23 @@ void _gen9_render_op(struct intel_bb *ibb,
>   
>   	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, true);
>   
> -	if (fast_clear) {
> +	if (fast_clear || dst->cc.disable) {
>   		for (int i = 0; i < 4; i++) {
>   			intel_bb_out(ibb, MI_STORE_DWORD_IMM_GEN4);
>   			intel_bb_emit_reloc(ibb, dst->handle,
>   					    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
>                                               dst->cc.offset + i*sizeof(float),
>   					    dst->addr.offset);
> -			intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
> -               }
> +			if (fast_clear) {
> +				intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
> +			} else {
> +				/*
> +				 * Emit NaN so it'll match nothing and thus prevent
> +				 * TGL from doing its automagic fast clear tricks.
> +				 */
> +				intel_bb_out(ibb, 0xffffffff);
> +			}
> +		}
>          }
>   
>   


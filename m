Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5053CC54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E881110E379;
	Tue, 27 Aug 2024 16:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jg3ej891";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2852610E379
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:26:43 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-371a13c7c80so3895045f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724776001; x=1725380801; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9lKIBKu3m9Ku35Ai2O9HpuM7oCyqHQS38WzI2gUQUM=;
 b=jg3ej891CtTEeEIAsrwdhp2DmYMi22YKpusK4c+f9+qcRtH73Q/RaeQfYmpx1FX+3B
 nhdAOEG86owP77y+JMShhDMLs6pqyFrfKY3bhwxM2b4nleEIYVucamGT6H0LVZISDhRT
 TBDovIrw+nL5iYYYDuZSKd9C7oLxh0QexBC9HWdFEN+E5Wu6mIpLtGQaBAflWDV4KJyi
 ObNHcsVp8E51sfJBP7gDXzPY8Qm/aYkF4wqqIA5CvT0C5e6TKeDsBwMA7p71Wa1LsqOS
 A9upH12HGbkV/KMbP4GxAaky7XUbNR2hMRcmlSaNe/p1C+ADn74OwCidXFfkqFhSPAU+
 bIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724776001; x=1725380801;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q9lKIBKu3m9Ku35Ai2O9HpuM7oCyqHQS38WzI2gUQUM=;
 b=Bfna/1+W2x15PkHRXrXxoM+eWby5YlAKRZ2dJD2VF/fnW8x9MEvxF6q36c4Nakz+mh
 NLRU0O0rwRkEo1DawijTDCDg2WD9IM45C7/PozvziYjVWOI3knvof5WU/AvBKhw6rHRh
 NQbkXmAuT+fmXdZ6ZwwMazFnndtyEQDvHUxxnRGtBHsRUivoSZ3Zng/swWqHrg+fsXHm
 nwphFHPNsD5JF1TN6LCwEk6oR2u0vfP0o4yFbITxwXg9lpWXcZntzFIi+vlkzf9RwBf5
 bpkH8KxP9BOZApIaP6Rgz7947Ndb46u4iQuIwrM5y/T8Q3Zv6/4K9sSmuHVhWbjMpb80
 T//g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/7UHeoip6EW/pigbMSIa9VsngNLbmjQkhz/dQw2CXWkgEbfur5fLhEI5KEyQt6cS+qnUQ5EqC@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy/X0l6YztB9hbYuYs4HfBtV0KEZV31x2bNdXroWGQo5BJeD0O
 i5t+c9ecOwMA42baX/WSqQO3JYtbErem6LDYbi4RsvVQRsLxEhB4
X-Google-Smtp-Source: AGHT+IHqRmm/4Ic4+IrQv4UCwlx85wSbDZYa7hH35KybT/G8vay0Xu2pmUm8L+9Py1oxgLRXUjDxWA==
X-Received: by 2002:adf:e30e:0:b0:367:895f:619e with SMTP id
 ffacd0b85a97d-3748c8442a7mr2104142f8f.11.1724776001211; 
 Tue, 27 Aug 2024 09:26:41 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac514e088sm196788985e9.8.2024.08.27.09.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:26:40 -0700 (PDT)
Message-ID: <eb64f3e6-c60d-466d-8f7c-55656dd11632@gmail.com>
Date: Tue, 27 Aug 2024 19:26:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 14/37] lib/igt_fb: Extract
 is_gen12_rc_ccs_cc_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-15-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-15-ville.syrjala@linux.intel.com>
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
> Extract a helper to identify the clear color compressed modifiers.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 857ffb6547a3..c48a61b5f148 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -594,15 +594,20 @@ static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
>   		modifier == I915_FORMAT_MOD_4_TILED_MTL_MC_CCS;
>   }
>   
> +static bool is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
> +{
> +	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
> +		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
> +		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC;
> +}
> +
>   static bool is_gen12_ccs_modifier(uint64_t modifier)
>   {
>   	return is_gen12_mc_ccs_modifier(modifier) ||
> +		is_gen12_rc_ccs_cc_modifier(modifier) ||
>   		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
> -		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
>   		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
> -		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
> -		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS ||
> -		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC;
> +		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS;
>   }
>   
>   static bool is_ccs_modifier(uint64_t modifier)


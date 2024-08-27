Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D726EC54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E9910E3A3;
	Tue, 27 Aug 2024 16:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LAM2+MhM";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A90210E3A8
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:45:19 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-428243f928fso63809875e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724777118; x=1725381918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kbmdLIEABAlWRNMl3uIfSnpUPao2t6rRkiZpQOFTlrs=;
 b=LAM2+MhMc289rx4Rlve8w08FnZDlylx97tqdTZrOs8+72Gu6ZdXQi1gC5LdDE45YFr
 cFxEBV+Qn7SS3njsaosS0oL2vhbxHdX7ALSPNnr1n3ZgbbfCgQguSREwZgLXJvVDfORN
 uqw7vc/YR8ci2HBP8nd4kEg7REVLcImihn3QJqqEE7SLaxs0k4B5DzeApSrc2NHsvXTi
 k+hLh2/enxOn4zrVjl1NAjIrQ7i57m1N5kk89bJMhpEJUekobqkMoT3VKcHTYak8Nf+Q
 dVm4vbr/UAcEXQ5D2PHP9VTP0C+G661M3wYJTckI3lw65UpxEtIhY0soowv02l4Sz8P1
 LQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724777118; x=1725381918;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kbmdLIEABAlWRNMl3uIfSnpUPao2t6rRkiZpQOFTlrs=;
 b=u4j1OMm0dIogwyGY+x6XqcpLkamXw1XjuZm01qYb2r8vl51TCCjAJdEq1KlF40E7Nt
 NHm2GxaNNtnZtQ3BSGavpKNN2x5gRYlYSfXIlQ5rWEsnWf4efPxHX/Fgf5s5Jix3eqAE
 xru21PngjdwU9ft8h1AmLFnKTnCeWdL9Kq9l/2962SYTZXeIgDcosQU/HhH92noU+8tP
 bSz6l7uTbTplt5gUP9y8NEHKvnlLaf2RwoL9k/kRWYOqS03MSYTtT1pkYu74b1OmJQNN
 z+916+wqNM0k6Dq6d574KfYr9ZVHySDsAQlwP+Wh9fiHZjMoFyu1V+Bs+qCKGp5LYiJf
 9IwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVePHD1z8nnVwS9P3rcQK8ttc9SP+gAj7JpLH4wlabZOiQk+NaGAAWrCLwnqG7E+vxCwyCAitmO@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8rDvJ2jMM6ZyiuJQVwldQcZ4ntWZjp6i8RrCIVhO8LbBZAOiD
 9xwcy3+z7LwYmFNOHu3pf7Ec28rm867aZkA+oQyGsea8qIPwhJP9
X-Google-Smtp-Source: AGHT+IERVdPzbH4EuuCzwXX9+jzuratfwyk2N/nJhmxHOyK7lC/X0w3UZu8NKGJ/GsG5OoyWO2xrZg==
X-Received: by 2002:a05:600c:4f51:b0:426:545b:ec00 with SMTP id
 5b1f17b1804b1-42acd57d3bemr115116885e9.19.1724777117532; 
 Tue, 27 Aug 2024 09:45:17 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac517f9basm190169675e9.39.2024.08.27.09.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:45:17 -0700 (PDT)
Message-ID: <9fd0ef8c-e7c3-4be7-9130-07e8adfe886d@gmail.com>
Date: Tue, 27 Aug 2024 19:45:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 18/37] lib/igt_fb: Expose
 igt_fb_is_gen12_rc_ccs_cc_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-19-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-19-ville.syrjala@linux.intel.com>
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
> I'm going to need is_gen12_rc_ccs_cc_modifier() outside of
> igt_fb.c. Rename it to igt_fb_is_gen12_rc_ccs_cc_modifier()
> and expose it to everyone.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 10 ++++------
>   lib/igt_fb.h |  1 +
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index bcb418e0f7be..b95dc3278f23 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -594,7 +594,7 @@ static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
>   		modifier == I915_FORMAT_MOD_4_TILED_MTL_MC_CCS;
>   }
>   
> -static bool is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
> +bool igt_fb_is_gen12_rc_ccs_cc_modifier(uint64_t modifier)

As with patch 17, with small comment block added

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>   {
>   	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
>   		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
> @@ -604,7 +604,7 @@ static bool is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
>   static bool is_gen12_ccs_modifier(uint64_t modifier)
>   {
>   	return is_gen12_mc_ccs_modifier(modifier) ||
> -		is_gen12_rc_ccs_cc_modifier(modifier) ||
> +		igt_fb_is_gen12_rc_ccs_cc_modifier(modifier) ||
>   		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
>   		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
>   		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS;
> @@ -734,9 +734,7 @@ static int fb_num_planes(const struct igt_fb *fb)
>   	    !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
>   		num_planes *= 2;
>   
> -	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
> -	    fb->modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC ||
> -	    fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
> +	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
>   		num_planes++;
>   
>   	return num_planes;
> @@ -2498,7 +2496,7 @@ static bool block_copy_ok(const struct igt_fb *fb)
>   
>   static bool ccs_needs_enginecopy(const struct igt_fb *fb)
>   {
> -	if (is_gen12_rc_ccs_cc_modifier(fb->modifier))
> +	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
>   		return true;
>   
>   	if (is_gen12_mc_ccs_modifier(fb->modifier))
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index b1b40b858610..12c9574827f2 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -182,6 +182,7 @@ uint64_t igt_fb_mod_to_tiling(uint64_t modifier);
>   uint64_t igt_fb_tiling_to_mod(uint64_t tiling);
>   
>   bool igt_fb_is_ccs_modifier(uint64_t modifier);
> +bool igt_fb_is_gen12_rc_ccs_cc_modifier(uint64_t modifier);
>   bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane);
>   bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane);
>   int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int ccs_plane);


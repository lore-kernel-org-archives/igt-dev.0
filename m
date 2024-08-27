Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD45C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AAC10E3A8;
	Tue, 27 Aug 2024 16:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gMeSjz1P";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1CD10E3A8
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:46:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42ab99fb45dso63745115e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724777170; x=1725381970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1Cg3Mv1zgOosv7RYjst9U5ATKwhH3g4V1jZq5MwWt+o=;
 b=gMeSjz1PwqyQvcWKmXqQY2tqQZZVnr0vo0ocghzL59MrXfm8dw3uyV+h+QasfX7a/d
 n0FNmzS7m8JZaZwU86oy3n7Lu7tmSou8rKcXYAYXNR/0SJTKyFPL9cuvGzGlc8dleNns
 pTXzf80YEO4W8dVJm2H7IyLBcIZDi7lJJOuMvachgws6TrlTFgGIgFnFhh8OxR/iDeW2
 M1NYUewMct4ifoFPAyI6StITvr5lohgXWW8OtMcBJmeMeScjQOS5CxPTCyuIA2qAYdae
 dztmf61GYdWQXeyRUB+pyanjQkUCBeLdsFIBvVU8TGhcLHGk1ppcAfpw4vFq9NrtyFNv
 zvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724777170; x=1725381970;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Cg3Mv1zgOosv7RYjst9U5ATKwhH3g4V1jZq5MwWt+o=;
 b=uE+fjn8Z+jjZHadilgQ2SHRnnsT4i9pYVD7CuALR5kL2ZEkqyGDYcd6+4blt2jQgh3
 hbJE4KxQUWT7sX2au0J2il9Rx0JHIcFJJF7UbzcluD4sZOXDu+RopwQMg2WNTBK+peFN
 m2efHJnVnsom7W8c0ALVVotAZpiZR62BeYJLAJ1s/dlNDSHfR3YH27DKndfc8T2OfCoU
 LE0vuB3a71X1VjFuZjhvPLaGLb7Skzwyi2T2GJNaiT0BRu8p0StUXvKIEJf3tm8ymt0Y
 bAChXNQFqsEies1XeQGqNO7nlJa3Uggo47W/j9P8hPmEgjHqIFp4gdCL0a+ZFitIp25J
 Nd+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUxItlO4dxUO/DBPPpquN7UhSoXi9O860+FfiWi3aitGsjtItHs6jQU6fCm1Q4Av2sNmh219YD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3jY0I+EatY4oSxLj8Ix/wYnJgR3rtMoBYHbBqwGVLSqTnEOil
 w5KDwhNScKNjLxPWpA5cauPUtfRQb8j2HgUu34t8ljzCwxBdUCNeX2Va8Sm1umc=
X-Google-Smtp-Source: AGHT+IHrQdqdQkTMupG3rI8MCWM31Crdf6jdY3zD5uGaYrbJ5k3ks2/LTP63I0dV25Qpg1IyvP5kaw==
X-Received: by 2002:a05:600c:4f51:b0:426:545b:ec00 with SMTP id
 5b1f17b1804b1-42acd57d3bemr115135975e9.19.1724777169292; 
 Tue, 27 Aug 2024 09:46:09 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-37308265698sm13487437f8f.106.2024.08.27.09.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:46:08 -0700 (PDT)
Message-ID: <440fb7a0-d91e-451c-b471-414b79769f61@gmail.com>
Date: Tue, 27 Aug 2024 19:46:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 19/37] lib/igt_fb: Expose
 igt_fb_is_gen12_mc_ccs_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-20-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-20-ville.syrjala@linux.intel.com>
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
> I'm going to need is_gen12_mc_ccs_modifier() outside of
> igt_fb.c. Rename it to igt_fb_is_gen12_mc_ccs_modifier()
> and expose it to everyone.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 12 ++++++------
>   lib/igt_fb.h |  1 +
>   2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index b95dc3278f23..4ef1945e4333 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -587,7 +587,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>   	}
>   }
>   
> -static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
> +bool igt_fb_is_gen12_mc_ccs_modifier(uint64_t modifier)

With comment block added

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>   {
>   	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
>   		modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS ||
> @@ -603,7 +603,7 @@ bool igt_fb_is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
>   
>   static bool is_gen12_ccs_modifier(uint64_t modifier)
>   {
> -	return is_gen12_mc_ccs_modifier(modifier) ||
> +	return igt_fb_is_gen12_mc_ccs_modifier(modifier) ||
>   		igt_fb_is_gen12_rc_ccs_cc_modifier(modifier) ||
>   		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
>   		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
> @@ -2499,7 +2499,7 @@ static bool ccs_needs_enginecopy(const struct igt_fb *fb)
>   	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
>   		return true;
>   
> -	if (is_gen12_mc_ccs_modifier(fb->modifier))
> +	if (igt_fb_is_gen12_mc_ccs_modifier(fb->modifier))
>   		return true;
>   
>   	if (igt_fb_is_ccs_modifier(fb->modifier) &&
> @@ -2631,7 +2631,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>   		} else
>   			igt_assert_eq(fb->strides[1] & 127, 0);
>   
> -		if (is_gen12_mc_ccs_modifier(fb->modifier))
> +		if (igt_fb_is_gen12_mc_ccs_modifier(fb->modifier))
>   			compression = I915_COMPRESSION_MEDIA;
>   		else
>   			compression = I915_COMPRESSION_RENDER;
> @@ -2725,7 +2725,7 @@ static bool use_vebox_copy(const struct igt_fb *src_fb,
>   			   const struct igt_fb *dst_fb)
>   {
>   
> -	return is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
> +	return igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
>   	       igt_format_is_yuv(src_fb->drm_format) ||
>   	       igt_format_is_yuv(dst_fb->drm_format);
>   }
> @@ -2800,7 +2800,7 @@ static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *
>   		       intel_get_pat_idx_uc(fb->fd),
>   		       blt_tile,
>   		       igt_fb_is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
> -		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
> +		       igt_fb_is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
>   
>   	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
>   	blt->plane_offset = fb->offsets[plane];
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 12c9574827f2..eb707cc34560 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -183,6 +183,7 @@ uint64_t igt_fb_tiling_to_mod(uint64_t tiling);
>   
>   bool igt_fb_is_ccs_modifier(uint64_t modifier);
>   bool igt_fb_is_gen12_rc_ccs_cc_modifier(uint64_t modifier);
> +bool igt_fb_is_gen12_mc_ccs_modifier(uint64_t modifier);
>   bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane);
>   bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane);
>   int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int ccs_plane);


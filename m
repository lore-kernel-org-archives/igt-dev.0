Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56A0ED7B84
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 08:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A73E10E5A0;
	Tue, 14 Apr 2026 08:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="QGCa/zYK";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6B310E433
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1776084406;
 bh=zEMXW0JD/M1s1N4vNdZ1dCWPftyRDDsKWRvDAQXixzc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=QGCa/zYKFuJCLyEWh4cCv9bm0+nh3E7SjfaJ29tIz7HweT2FbZbwGRpS9homxYCyf
 6Z9mwJzqsFKAfnwFqM6vwMYDJjHkl9P7pAxTmF/6df0PJptazhyZPPvGwOBji0AWXc
 TR4A9fozFfhwhRcwlgVAQk3cyWRigV8XpLUOdok0xqbQUhjTYYUD/bPtRNHcBNaGzN
 r6pfWCZiTY/YBRdlQqPAsK8eHM2aPRy9Dr9f0oIqGa2/pGbL7O4Z0zh4M5GIxT7ipc
 GFOQ4gZ0D5+yJ/Rjg8PHN4CuNJcl3dGJB4EmZqQLQqUdteodO3OZwNjk8RVBwF6fzl
 ezKcvoXDwBSjA==
Message-ID: <4ad759d1-78f7-4923-85fd-0f1a76ee54eb@lankhorst.se>
Date: Mon, 13 Apr 2026 14:46:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 8/8] lib/igt_fb: on Intel Xe force Vebox copy on yuv
 formats
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-9-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <20260323162911.1912755-9-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 14 Apr 2026 08:20:01 +0000
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hey,

Is this patch for testing only?

Kind regars,
~Maarten Lankhorst

Den 2026-03-23 kl. 17:29, skrev Juha-Pekka Heikkila:
> This is to test Vebox engine along with other engines. Vebox is
> forced to be used when use tile4 needing tile convert and pixel
> format is yuv.
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 36 ++++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 0f7ebc6b4..504cb6806 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2596,6 +2596,24 @@ static bool block_copy_ok(const struct igt_fb *fb)
>  					       fb_tile_to_blt_tile(fb->modifier));
>  }
>  
> +static bool use_vebox_copy(const struct igt_fb *src_fb,
> +			   const struct igt_fb *dst_fb)
> +{
> +	/* TODO:
> +	 * X-Tile will need to be fixed for Vebox engine on
> +	 * Xe2+ devices
> +	 */
> +	bool vebox_fix = (is_xe_device(src_fb->fd) &&
> +		HAS_4TILE(intel_get_drm_devid(src_fb->fd))) ?
> +		(src_fb->modifier == I915_FORMAT_MOD_4_TILED ||
> +		 dst_fb->modifier == I915_FORMAT_MOD_4_TILED) : true;
> +
> +	return (igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
> +		igt_format_is_yuv(src_fb->drm_format) ||
> +		igt_format_is_yuv(dst_fb->drm_format)) &&
> +		vebox_fix;
> +}
> +
>  static bool ccs_needs_enginecopy(const struct igt_fb *fb)
>  {
>  	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
> @@ -2624,8 +2642,9 @@ static bool blitter_ok(const struct igt_fb *fb)
>  	    is_xe_device(fb->fd))
>  		return false;
>  
> +	/* use blitter on xe device except 4tile yuv where utilize vebox */
>  	if (is_xe_device(fb->fd))
> -		return true;
> +		return !use_vebox_copy(fb, fb);
>  
>  	for (int i = 0; i < fb->num_planes; i++) {
>  		int width = fb->plane_width[i];
> @@ -2664,6 +2683,12 @@ static bool use_enginecopy(const struct igt_fb *fb)
>  	if (ccs_needs_enginecopy(fb))
>  		return true;
>  
> +	/*
> +	 * This is to utilize Vebox for testing
> +	 */
> +	if (use_vebox_copy(fb, fb))
> +		return true;
> +
>  	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>  		fb->modifier == I915_FORMAT_MOD_X_TILED;
>  }
> @@ -2874,15 +2899,6 @@ static void fini_buf(struct intel_buf *buf)
>  	intel_buf_destroy(buf);
>  }
>  
> -static bool use_vebox_copy(const struct igt_fb *src_fb,
> -			   const struct igt_fb *dst_fb)
> -{
> -
> -	return igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
> -	       igt_format_is_yuv(src_fb->drm_format) ||
> -	       igt_format_is_yuv(dst_fb->drm_format);
> -}
> -
>  /**
>   * copy_with_engine:
>   * @blit: context for the copy operation


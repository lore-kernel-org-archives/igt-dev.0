Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E117F34C51
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 12:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1190C10E427;
	Mon, 13 Apr 2026 12:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="pRbPRK9j";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9F410E427
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1776084610;
 bh=Vi1jWykvPwbOeua6QUzc8wBqK6/IUpkavnd+fg6NObM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=pRbPRK9jXQOzTfDZZwM9N+sIkEIOxI1Gn0wzm3rWu4+yQe6H0e2XuOiEegIoI+WRa
 V7UfprLPeFwcNBgHSk+78j7hnFogZ9AgsdBaLNF7urT/wPj4nhqR2O3X5ymKFS6MSe
 0eLyJeTC3bIMPpECEwPGVSQu83e9zHXzXTaDdOvxRQFhMeACO7eATisqj4YmhzrvUp
 E2HvXMMNB1B4zoLwPP2HN0x7zhec/qw5GyZn2ts7oXdsLH5G2fbTuckNen2qp4m9I2
 Z0WYSVy4YVhvuJkYrh60LpbaXj3UpWcRo2xVqJoLzT4Q3VFn0c5okH/vDpRUKVUACI
 X2eEbK1EUJbbg==
Message-ID: <b4f44499-a6bc-4484-8ba2-8c501a5a44bd@lankhorst.se>
Date: Mon, 13 Apr 2026 14:50:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 7/8] lib: Enable Vebox framebuffer copying on Intel
 Xe2
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-8-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260323162911.1912755-8-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Patches look sane, I'd be thrilled if it was possible to create a bb for a given engine instead,
but that's just nitpicking.

Den 2026-03-23 kl. 17:29, skrev Juha-Pekka Heikkila:
> Choose correct gt for Vebox and use gen12 veboxcopy
> functionality on Xe2
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c            | 17 ++++++++++++++++-
>  lib/intel_batchbuffer.c |  2 +-
>  2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index d59fe133b..0f7ebc6b4 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2560,6 +2560,7 @@ struct fb_blit_upload {
>  	struct fb_blit_linear linear;
>  	struct buf_ops *bops;
>  	struct intel_bb *ibb;
> +	uint32_t vm;
>  };
>  
>  static enum blt_tiling_type fb_tile_to_blt_tile(uint64_t tile)
> @@ -3364,10 +3365,24 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
>  	int fd = blit->fd;
>  	struct igt_fb *fb = blit->fb;
>  	struct fb_blit_linear *linear = &blit->linear;
> +	struct drm_xe_engine *engine;
> +	uint16_t class;
>  
>  	if (!igt_vc4_is_tiled(fb->modifier) && use_enginecopy(fb)) {
>  		blit->bops = buf_ops_create(fd);
> -		blit->ibb = intel_bb_create(fd, 4096);
> +
> +		if (is_xe_device(fd)) {
> +			class = use_vebox_copy(fb, fb) ? DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE :
> +							 DRM_XE_ENGINE_CLASS_RENDER;
> +
> +			engine = xe_find_engine_by_class(fd, class);
> +			blit->vm = xe_vm_create(fd, 0, 0);
> +			blit->ibb = intel_bb_create_with_gt(fd, 4096,
> +							    blit->vm,
> +							    engine->instance.gt_id);
I would recommend not storing blit->vm, as it appears to be only used in ibb.

Other than that, the series looks good, so for the series:

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
> +		} else {
> +			blit->ibb = intel_bb_create(fd, 4096);
> +		}
>  	}
>  
>  	/*
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 5c0597869..a38d6bdc0 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -699,7 +699,7 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
>  {
>  	igt_vebox_copyfunc_t copy = NULL;
>  
> -	if (IS_GEN12(devid))
> +	if (intel_gen(devid) >= 12)
>  		copy = gen12_vebox_copyfunc;
>  
>  	return copy;


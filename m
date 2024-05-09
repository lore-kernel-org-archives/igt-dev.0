Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A81C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 10:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6977810E184;
	Thu,  9 May 2024 10:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etSq3PUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D13910E184
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715250074; x=1746786074;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+chdKcKVKWXPORrYCW5Ms9i7+RyxzT95F6qLzk1qDp8=;
 b=etSq3PUexNTydZL5Hou1Euf5E0qQZJMHB46Xs4cG8apD3trPR2wRKgfH
 QhyNG6PSJbzTD0mk+z/AM8E/8IoloLwfcw9aJBhpvrqT+1eeKOYChO4kd
 24puOfxk1RTPKXc66LYeABEoD7FNAd9gA2gtuKyUDqUFys7Y5qykcNXcW
 hxjm1qRSydfZGkuFLyIT/i1nB0Azrvc311GEx8Gta7DAtZSz/7smXpy75
 e1odNrGQFmr4WyPH4VkZn+KHU4Zj5A/ZaVtvvgFgy34IH6xfp5tvuDVSG
 ajancQu3VaFkPC9HhF+j0OJivucmX23Btr+LaFf2vng73SrTfC3vG4FS7 g==;
X-CSE-ConnectionGUID: osniwxsqTGOnv6qn2huu8g==
X-CSE-MsgGUID: sB7zNSYBSoeAyUmI0TZUbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28645381"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="28645381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:21:13 -0700
X-CSE-ConnectionGUID: 1qeM1DfHQ4y1SgqZSapqgA==
X-CSE-MsgGUID: CYKhOnjjQ0y6BKZilSpOoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="33729096"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:21:10 -0700
Date: Thu, 9 May 2024 12:21:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 3/6] lib/igt_fb: Sanitize blt_fb_init
Message-ID: <20240509102108.6ikk3vvaxwyckuzv@zkempczy-mobl2>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
 <20240430162939.272990-4-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430162939.272990-4-juhapekka.heikkila@gmail.com>
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

On Tue, Apr 30, 2024 at 07:29:36PM +0300, Juha-Pekka Heikkila wrote:
> Sanitize building of Intel blitter setup
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 64 +++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 46 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 707eb0a1e..b4afcaacb 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2760,21 +2760,18 @@ static void copy_with_engine(struct fb_blit_upload *blit,
>  	fini_buf(src);
>  }
>  
> -static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
> -					   uint32_t plane, uint32_t memregion)
> +static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *fb,
> +							   uint32_t handle,
> +							   uint32_t memregion,
> +							   enum blt_tiling_type blt_tile,
> +							   uint32_t plane)
>  {
> -	uint32_t name, handle;
> -	struct blt_copy_object *blt;
> -	enum blt_tiling_type blt_tile;
>  	uint64_t stride;
> +	struct blt_copy_object *blt = malloc(sizeof(*blt));
>  
> -	blt = malloc(sizeof(*blt));
> -	igt_assert(blt);
> +	if (!blt)
> +		return NULL;

As you're touching this I would use calloc(). If blt_copy_object would be
extended it would contain uninitialized value.

>  
> -	name = gem_flink(fb->fd, fb->gem_handle);
> -	handle = gem_open(fb->fd, name);
> -
> -	blt_tile = fb_tile_to_blt_tile(fb->modifier);
>  	stride = blt_tile == T_LINEAR ? fb->strides[plane] : fb->strides[plane] / 4;
>  
>  	blt_set_object(blt, handle, fb->size, memregion,
> @@ -2785,17 +2782,48 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>  		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
>  
>  	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
> -
>  	blt->plane_offset = fb->offsets[plane];
>  
> -	igt_assert(fb->size);
> +	return blt;
> +}
>  
> -	if (is_xe_device(fb->fd))
> -		blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
> -					  PROT_READ | PROT_WRITE);
> +static void *map_buffer(int fd, uint32_t handle, size_t size)
> +{
> +	if (is_xe_device(fd))
> +		return xe_bo_mmap_ext(fd, handle, size, PROT_READ | PROT_WRITE);
>  	else
> -		blt->ptr = gem_mmap__device_coherent(fb->fd, handle, 0, fb->size,
> -						     PROT_READ | PROT_WRITE);
> +		return gem_mmap__device_coherent(fd, handle, 0, size,
> +						 PROT_READ | PROT_WRITE);
> +}
> +
> +static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
> +					   uint32_t plane, uint32_t memregion)
> +{
> +	uint32_t name, handle;
> +	enum blt_tiling_type blt_tile;
> +	struct blt_copy_object *blt;
> +
> +	if (!fb)
> +		return NULL;
> +
> +	name = gem_flink(fb->fd, fb->gem_handle);
> +	handle = gem_open(fb->fd, name);
> +
> +	if (!handle)
> +		return NULL;
> +
> +	blt_tile = fb_tile_to_blt_tile(fb->modifier);
> +	blt = allocate_and_initialize_blt(fb, handle, memregion, blt_tile, plane);
> +
> +	if (!blt)
> +		return NULL;

It will be problematic in do_block_copy() if blt is NULL. We'll get
segfault on accessing these structures.

--
Zbigniew

> +
> +	blt->ptr = map_buffer(fb->fd, handle, fb->size);
> +	if (!blt->ptr) {
> +		free(blt);
> +		return NULL;
> +	}
> +
>  	return blt;
>  }
>  
> -- 
> 2.25.1
> 

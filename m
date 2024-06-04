Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C147CC25B7E
	for <igt-dev@archiver.kernel.org>; Tue,  4 Jun 2024 08:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5700810E432;
	Tue,  4 Jun 2024 08:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOTTlW62";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F9610E432
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2024 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717488048; x=1749024048;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eiwuJq68sK4Rx7I9epfvIrnM5jOdiMC0s+Qkeg7D2ic=;
 b=bOTTlW62/SYpWVnJBBIQT5cimgYE17qCoyaL5B7Onr6TRnFulu7C59dN
 TA0x4LGf1L6pXjdzDQyb2yr2Hw/9xmauzcXZlFHtM1Yr29mTeRWKzRlRY
 HUFhy4OApOYk1OwO0Jtc6BEF0ALGn21oVrzvt7kscndEvfR6Ba6OyneFh
 TvVMMczBPbzGiwVd762EXiUp1VUNbFmIsO+lUD89y0+z1YTpkDbx1YgSN
 ulD2eGqhYgLuXRJbzri6/FsOobcAYOSbH0RsjRftc4Y89nbjAeJLlYVIl
 P1mmmhZUqIiLM9/0hL3VGd/RYJb0t5TY5EA2ZeO2bDAYBdohorDB9qNyM g==;
X-CSE-ConnectionGUID: d+e7Gv7DRvmb9ypDfiM15Q==
X-CSE-MsgGUID: D4Sjwc82Rd2Xum91k0HyMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14205871"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="14205871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:00:15 -0700
X-CSE-ConnectionGUID: L01/fXFNTz6Ro12ZrRaG1w==
X-CSE-MsgGUID: Oqxw2X1NTGi1X2QexuESmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="74653906"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:00:14 -0700
Date: Tue, 4 Jun 2024 10:00:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v4 2/5] lib/igt_fb: Sanitize blt_fb_init
Message-ID: <20240604080011.vxwxys3xicobb2gp@zkempczy-mobl2>
References: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
 <20240530142346.1511811-3-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240530142346.1511811-3-juhapekka.heikkila@gmail.com>
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

On Thu, May 30, 2024 at 05:23:43PM +0300, Juha-Pekka Heikkila wrote:
> Sanitize building of Intel blitter setup
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 64 +++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 46 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 707eb0a1e..588144579 100644
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
> +	struct blt_copy_object *blt = calloc(1, sizeof(*blt));
>  
> -	blt = malloc(sizeof(*blt));
> -	igt_assert(blt);
> +	if (!blt)
> +		return NULL;
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

Memory allocation for blt is critical here. You're handling it in
do_block_copy() but I wonder shouldn't you just assert here. I mean
if you don't plan to add fallback path we may simply assert.

Regardless of your decision, code is correct imo:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

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
> 2.43.2
> 

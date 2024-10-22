Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07540D2CDF5
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 15:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934A510E15D;
	Tue, 22 Oct 2024 15:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mpa/Dnt2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F2B10E15D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729612286; x=1761148286;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fZcg42sXrKsdJcROM8HJnTdDOLHbHr7DexBCrEYjffI=;
 b=Mpa/Dnt2wuQZugycc7guoiO3w6FOAM9z0oLyCE4S/FwMoQYrBXxv9OZG
 dJvU47JnXNKd5AiHlWCKu6ii39VnEA8aZB0iVilgABjbwAOQhpmCLk7Tu
 81BvL6OLykI1yrG2aQqpuywucgMlO4/cfk0uwgTjSqqfAR1ZXFnuCwZIv
 zp0F/8P4HIPxcpUa5iTsYku6XehXI/FNOrpErxvrcaDzRfp1lr1l2oApJ
 W6sOA3R8cUMwECEsxenLx3ngr9/wXn60fx7u1p8D3KtxIWjmDKavoBn/U
 ai8Bd/GVeQKLdv2NA63M22DX+hI4znK4Bk2w+9FtlRllZUzuMJf5p/dxD g==;
X-CSE-ConnectionGUID: NdouKwiiTHGfQNi4l+0a7A==
X-CSE-MsgGUID: LJ2ZLc30SuGfVWt3x4bchw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29318489"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29318489"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:51:19 -0700
X-CSE-ConnectionGUID: WS1vsRnfQTKDBsGGyprOjA==
X-CSE-MsgGUID: M8by9hOEQBuJn3Wy9A+MBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84703297"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:51:18 -0700
Date: Tue, 22 Oct 2024 17:51:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 10/14] lib/intel_bufops: Provide pread/pwrite based
 fallback when we don't have WC
Message-ID: <20241022155115.z2ao4very645lmtj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-11-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004104121.32750-11-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-10-04 at 13:41:17 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The linear<->tiled conversion code currently assume that we may
> be able to use either cpu or wc mmaps. That is not true on all
> systems. As a last resort provide a pread/pwrite based fallback.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  lib/intel_bufops.c | 68 ++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 56 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 619222019fd8..641f1dae91b5 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -549,10 +549,12 @@ static void __copy_ccs(struct buf_ops *bops, struct intel_buf *buf,
>  	munmap(map, size);
>  }
>  
> -static void *mmap_write(int fd, struct intel_buf *buf)
> +static void *mmap_write(int fd, const struct intel_buf *buf, bool *malloced)
>  {
>  	void *map = NULL;
>  
> +	*malloced = false;
> +
>  	if (buf->bops->driver == INTEL_DRIVER_XE)
>  		return xe_bo_map(fd, buf->handle, buf->surface[0].size);
>  
> @@ -580,7 +582,7 @@ static void *mmap_write(int fd, struct intel_buf *buf)
>  				       I915_GEM_DOMAIN_CPU);
>  	}
>  
> -	if (!map) {
> +	if (!map && gem_mmap__has_wc(fd)) {
>  		map = __gem_mmap_offset__wc(fd, buf->handle, 0, buf->surface[0].size,
>  					    PROT_READ | PROT_WRITE);
>  		if (!map)
> @@ -591,13 +593,32 @@ static void *mmap_write(int fd, struct intel_buf *buf)
>  			       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>  	}
>  
> +	if (!map) {
> +		*malloced = true;

I would move that after igt_assert.

> +
> +		map = malloc(buf->surface[0].size);
> +		igt_assert(map);
> +	}
> +
>  	return map;
>  }
>  
> -static void *mmap_read(int fd, struct intel_buf *buf)
> +static void munmap_write(void *map, int fd, const struct intel_buf *buf, bool malloced)
> +{
> +	if (malloced) {
> +		igt_assert(__gem_write(fd, buf->handle, 0, map, buf->surface[0].size) == 0);
> +		free(map);
> +	} else {
> +		munmap(map, buf->surface[0].size);
> +	}
> +}
> +
> +static void *mmap_read(int fd, struct intel_buf *buf, bool *malloced)
>  {
>  	void *map = NULL;
>  
> +	*malloced = false;
> +
>  	if (buf->bops->driver == INTEL_DRIVER_XE)
>  		return xe_bo_map(fd, buf->handle, buf->surface[0].size);
>  
> @@ -622,7 +643,7 @@ static void *mmap_read(int fd, struct intel_buf *buf)
>  			gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_CPU, 0);
>  	}
>  
> -	if (!map) {
> +	if (!map && gem_mmap__has_wc(fd)) {
>  		map = __gem_mmap_offset__wc(fd, buf->handle, 0, buf->surface[0].size,
>  					    PROT_READ);
>  		if (!map)
> @@ -632,9 +653,24 @@ static void *mmap_read(int fd, struct intel_buf *buf)
>  		gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_WC, 0);
>  	}
>  
> +	if (!map) {
> +		map = malloc(buf->surface[0].size);
> +		igt_assert(map);

Add here:
		*malloced = true;

Regards,
Kamil

> +
> +		igt_assert(__gem_read(fd, buf->handle, 0, map, buf->surface[0].size) == 0);
> +	}
> +
>  	return map;
>  }
>  
> +static void munmap_read(void *map, int fd, const struct intel_buf *buf, bool malloced)
> +{
> +	if (malloced)
> +		free(map);
> +	else
> +		munmap(map, buf->surface[0].size);
> +}
> +
>  static void __copy_linear_to(int fd, struct intel_buf *buf,
>  			     const uint32_t *linear,
>  			     int tiling, uint32_t swizzle)
> @@ -642,7 +678,10 @@ static void __copy_linear_to(int fd, struct intel_buf *buf,
>  	const tile_fn fn = __get_tile_fn_ptr(fd, tiling);
>  	int height = intel_buf_height(buf);
>  	int width = intel_buf_width(buf);
> -	void *map = mmap_write(fd, buf);
> +	bool malloced;
> +	void *map;
> +
> +	map = mmap_write(fd, buf, &malloced);
>  
>  	for (int y = 0; y < height; y++) {
>  		for (int x = 0; x < width; x++) {
> @@ -655,7 +694,7 @@ static void __copy_linear_to(int fd, struct intel_buf *buf,
>  		}
>  	}
>  
> -	munmap(map, buf->surface[0].size);
> +	munmap_write(map, fd, buf, malloced);
>  }
>  
>  static void copy_linear_to_none(struct buf_ops *bops, struct intel_buf *buf,
> @@ -706,7 +745,10 @@ static void __copy_to_linear(int fd, struct intel_buf *buf,
>  	const tile_fn fn = __get_tile_fn_ptr(fd, tiling);
>  	int height = intel_buf_height(buf);
>  	int width = intel_buf_width(buf);
> -	void *map = mmap_write(fd, buf);
> +	bool malloced;
> +	void *map;
> +
> +	map = mmap_write(fd, buf, &malloced);
>  
>  	for (int y = 0; y < height; y++) {
>  		for (int x = 0; x < width; x++) {
> @@ -719,7 +761,7 @@ static void __copy_to_linear(int fd, struct intel_buf *buf,
>  		}
>  	}
>  
> -	munmap(map, buf->surface[0].size);
> +	munmap_write(map, fd, buf, malloced);
>  }
>  
>  static void copy_none_to_linear(struct buf_ops *bops, struct intel_buf *buf,
> @@ -803,25 +845,27 @@ static void copy_gtt_to_linear(struct buf_ops *bops, struct intel_buf *buf,
>  static void copy_linear_to_wc(struct buf_ops *bops, struct intel_buf *buf,
>  			      uint32_t *linear)
>  {
> +	bool malloced;
>  	void *map;
>  
>  	DEBUGFN();
>  
> -	map = mmap_write(bops->fd, buf);
> +	map = mmap_write(bops->fd, buf, &malloced);
>  	memcpy(map, linear, buf->surface[0].size);
> -	munmap(map, buf->surface[0].size);
> +	munmap_write(map, bops->fd, buf, malloced);
>  }
>  
>  static void copy_wc_to_linear(struct buf_ops *bops, struct intel_buf *buf,
>  			      uint32_t *linear)
>  {
> +	bool malloced;
>  	void *map;
>  
>  	DEBUGFN();
>  
> -	map = mmap_read(bops->fd, buf);
> +	map = mmap_read(bops->fd, buf, &malloced);
>  	igt_memcpy_from_wc(linear, map, buf->surface[0].size);
> -	munmap(map, buf->surface[0].size);
> +	munmap_read(map, bops->fd, buf, malloced);
>  }
>  
>  void intel_buf_to_linear(struct buf_ops *bops, struct intel_buf *buf,
> -- 
> 2.45.2
> 

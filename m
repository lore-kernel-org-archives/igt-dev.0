Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D67BC54E60
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 13:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5F910FA1E;
	Tue, 19 Mar 2024 13:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVT5zOMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C17D10FA8F
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710854435; x=1742390435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BRmNsluUHTQYzF+dxwYtgV2rYyBnDCO29V8d1LZoRNI=;
 b=XVT5zOMmT1JGffLp4uKx41NQmP7mgkaK/mMmbItDtOMvmRpRWmOmvHHZ
 KW4kqmaYnlTZ8jka2A+2ScphRpeA2GvnzRyppfGWjuBhCR4I2dfouK5l/
 YFXb8NVGTCXvrxROPwLfUMryljgOebPQA1ImYDiuqAIfjxGgtqhgfTcpP
 SZP9LTrullZkXGLrG9jM7QMrpi1JIImC1/qTNm484jvs1MvJ5I4D8XrUV
 q60kIqGIrowDawtBXpzgozrVdh3L9yTdgc1tXymmuDHhh5z4rBfmZOey4
 QpGIblhm82u8Hq1n+DEvUP8fM0KZ0M4WoZB73/aNn+4Q6+K3omTa4Ce0Q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16450748"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="16450748"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:20:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13792954"
Received: from unknown (HELO localhost) ([10.245.246.227])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:20:33 -0700
Date: Tue, 19 Mar 2024 14:20:31 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: igt-dev@lists.freedesktop.org, bhanuprakash.modem@intel.com
Subject: Re: [PATCH i-g-t 1/3] lib/igt_draw: Dont mmap, if the buffer is
 already mmapped
Message-ID: <20240319132031.wax2dvkm7oo4pikx@zkempczy-mobl2>
References: <20240315061142.6591-1-vandita.kulkarni@intel.com>
 <20240315061142.6591-2-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315061142.6591-2-vandita.kulkarni@intel.com>
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

On Fri, Mar 15, 2024 at 11:41:40AM +0530, Vandita Kulkarni wrote:
> This will help add support to tests which would reuse the
> same fbs and would not want to mmap again and would just
> want to update the fbs.
> 
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  lib/igt_draw.c | 57 ++++++++++++++++++++++++++++----------------------
>  lib/igt_draw.h |  2 +-
>  2 files changed, 33 insertions(+), 26 deletions(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 2c01d7b02..d0aed2b26 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -75,6 +75,7 @@ struct buf_data {
>  	uint32_t handle;
>  	uint32_t size;
>  	uint32_t stride;
> +	void *buf_ptr;
>  	int width;
>  	int height;
>  	int bpp;
> @@ -498,29 +499,32 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
>  			      uint32_t tiling, uint32_t swizzle, uint32_t color)
>  {
>  	uint32_t *ptr;
> -

Keep this line, it's convention to use single empty line between
declaration and the code.

> -	if (is_i915_device(fd)) {
> -		gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
> -			       I915_GEM_DOMAIN_GTT);
> -
> -		/* We didn't implement suport for the older tiling methods yet. */
> -		if (tiling != I915_TILING_NONE)
> -			igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
> -
> -		if (gem_has_lmem(fd))
> -			ptr = gem_mmap_offset__fixed(fd, buf->handle, 0,
> -						     PAGE_ALIGN(buf->size),
> -						     PROT_READ | PROT_WRITE);
> -		else if (gem_has_legacy_mmap(fd))
> -			ptr = gem_mmap__wc(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
> -					   PROT_READ | PROT_WRITE);
> -		else
> -			ptr = gem_mmap_offset__wc(fd, buf->handle, 0,
> -						  PAGE_ALIGN(buf->size),
> -						  PROT_READ | PROT_WRITE);
> +	if (!buf->buf_ptr) {
> +		if (is_i915_device(fd)) {
> +			gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
> +				       I915_GEM_DOMAIN_GTT);
> +
> +			/* We didn't implement suport for the older tiling methods yet. */
> +			if (tiling != I915_TILING_NONE)
> +				igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
> +
> +			if (gem_has_lmem(fd))
> +				ptr = gem_mmap_offset__fixed(fd, buf->handle, 0,
> +							     PAGE_ALIGN(buf->size),
> +							     PROT_READ | PROT_WRITE);
> +			else if (gem_has_legacy_mmap(fd))
> +				ptr = gem_mmap__wc(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
> +						   PROT_READ | PROT_WRITE);
> +			else
> +				ptr = gem_mmap_offset__wc(fd, buf->handle, 0,
> +							  PAGE_ALIGN(buf->size),
> +							  PROT_READ | PROT_WRITE);
> +		} else {
> +			ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size,
> +					     PROT_READ | PROT_WRITE);
> +		}
>  	} else {
> -		ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size,
> -				     PROT_READ | PROT_WRITE);
> +		ptr = buf->buf_ptr;
>  	}
>  
>  	switch (tiling) {
> @@ -538,7 +542,8 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
>  		break;
>  	}
>  
> -	igt_assert(gem_munmap(ptr, buf->size) == 0);
> +	if (ptr != buf->buf_ptr)
> +		igt_assert(gem_munmap(ptr, buf->size) == 0);
>  }

I know the reason why you want to reuse pointer to the buffer
when it comes from the caller (to not mmap/munmap over and over again)
and all above is fine for me. But, you should assert in draw_rect_mmap_cpu()
and draw_rect_mmap_gtt() pointing we don't support such behavior on
those functions. I mean igt_assert_neq(buf->buf_ptr, NULL); is enought.

>  
>  static void draw_rect_pwrite_untiled(int fd, struct buf_data *buf,
> @@ -839,6 +844,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
>   * @buf_handle: the handle of the buffer where you're going to draw to
>   * @buf_size: the size of the buffer
>   * @buf_stride: the stride of the buffer
> + * @buf_ptr: Pointer to the mmapped buffer

You support this only for WC, so this should be documented here.
Above also suggests you _have_to_ provide mmaped buffer what is
not true.

Generally this code intention to not remap the buffer is fine for
me. Just fix details.

--
Zbigniew

>   * @buf_width: the width of the buffer
>   * @buf_height: the height of the buffer
>   * @tiling: the tiling of the buffer
> @@ -855,7 +861,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
>   */
>  void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>  		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
> -		   int buf_width, int buf_height,
> +		   void *buf_ptr, int buf_width, int buf_height,
>  		   uint32_t tiling, enum igt_draw_method method,
>  		   int rect_x, int rect_y, int rect_w, int rect_h,
>  		   uint32_t color, int bpp)
> @@ -870,6 +876,7 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>  		.handle = buf_handle,
>  		.size = buf_size,
>  		.stride = buf_stride,
> +		.buf_ptr = buf_ptr,
>  		.width = buf_width,
>  		.height = buf_height,
>  		.bpp = bpp,
> @@ -935,7 +942,7 @@ void igt_draw_rect_fb(int fd, struct buf_ops *bops,
>  		      int rect_w, int rect_h, uint32_t color)
>  {
>  	igt_draw_rect(fd, bops, ctx, fb->gem_handle, fb->size, fb->strides[0],
> -		      fb->width, fb->height,
> +		      fb->driver_priv, fb->width, fb->height,
>  		      igt_fb_mod_to_tiling(fb->modifier), method,
>  		      rect_x, rect_y, rect_w, rect_h, color,
>  		      igt_drm_format_to_bpp(fb->drm_format));
> diff --git a/lib/igt_draw.h b/lib/igt_draw.h
> index 1dec95e86..865641ef6 100644
> --- a/lib/igt_draw.h
> +++ b/lib/igt_draw.h
> @@ -54,7 +54,7 @@ bool igt_draw_supports_method(int fd, enum igt_draw_method method);
>  
>  void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>  		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
> -		   int buf_width, int buf_height,
> +		   void *buf_ptr, int buf_width, int buf_height,
>  		   uint32_t tiling, enum igt_draw_method method,
>  		   int rect_x, int rect_y, int rect_w, int rect_h,
>  		   uint32_t color, int bpp);
> -- 
> 2.34.1
> 

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64387C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 14:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73F410F126;
	Thu, 11 Apr 2024 14:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9nObdkP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF85110F11F
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712845914; x=1744381914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4T1WgH1fifa/mTDy8PDNyGxuIdxEnAMyt1BzsHdt2VU=;
 b=m9nObdkP6QFOXoCwTWvsZGWjsptw2lHc9GPkTHhvtcCefC+IyS+h9uJL
 2cNKc7e3BJPdNVcYehdd4mFZpBEVz9kiZ3gv5IboSsu446LUbK3uvsGWY
 8fcdRlPwjvSG5T9xS8zQ+N7/1wJ9ZYilJQ0iFXh3QCHnixvbaRbpnmChr
 qRebm2u6JBRW8QSPxRwXz7B6DTMoFUW+cpseZUdGkAwsZ1gkwtxFQ0qmd
 kE4qBq2PLTns73FdzhkGuidtXawnqt11+m2Z+J7xrHsAp+8ZGAX3wkdkF
 /Qbq+3429Lj8+GMfCzljv7UXfNQfJWIuCDHNnlcSseSwFZLYsRZat4NpL w==;
X-CSE-ConnectionGUID: WkqQEPLWQ1qXMQmozA/u0w==
X-CSE-MsgGUID: MOV39CLxSTWNfyZn11ZKnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8114701"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8114701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:31:48 -0700
X-CSE-ConnectionGUID: j6jFMT0nSPunPfVORJvMkA==
X-CSE-MsgGUID: /LraFgw2T7e4CA+zx6Q/6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="51885753"
Received: from unknown (HELO localhost) ([10.245.246.155])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:31:46 -0700
Date: Thu, 11 Apr 2024 16:31:42 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/igt_draw: Add support for writing onto
 already mmapped buffer
Message-ID: <20240411143142.t74npydf2whvtotv@zkempczy-mobl2>
References: <20240411114804.21206-1-vandita.kulkarni@intel.com>
 <20240411114804.21206-2-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411114804.21206-2-vandita.kulkarni@intel.com>
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

On Thu, Apr 11, 2024 at 05:18:03PM +0530, Vandita Kulkarni wrote:
> Provide another draw method, for supporting drawing onto
> already mmapped buffer.
> 
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  lib/igt_draw.c                         | 37 ++++++++++++++++++++++++--
>  lib/igt_draw.h                         | 11 +++++++-
>  tests/intel/kms_frontbuffer_tracking.c |  2 +-
>  3 files changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 2c01d7b02..e458238f0 100644
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
> @@ -110,6 +111,8 @@ const char *igt_draw_get_method_name(enum igt_draw_method method)
>  		return "blt";
>  	case IGT_DRAW_RENDER:
>  		return "render";
> +	case IGT_DRAW_MMAP_PTR:
> +		return "mmap-ptr";
>  	default:
>  		igt_assert(false);
>  	}
> @@ -541,6 +544,27 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
>  	igt_assert(gem_munmap(ptr, buf->size) == 0);
>  }
>  
> +static void draw_rect_mmap_ptr(int fd, struct buf_data *buf, struct rect *rect,
> +			      uint32_t tiling, uint32_t swizzle, uint32_t color)
> +{
> +	igt_assert(buf->buf_ptr != NULL);
> +
> +	switch (tiling) {
> +	case I915_TILING_NONE:
> +		draw_rect_ptr_linear(buf->buf_ptr, buf->stride, rect, color, buf->bpp);
> +		break;
> +	case I915_TILING_X:
> +	case I915_TILING_Y:
> +	case I915_TILING_4:
> +		draw_rect_ptr_tiled(buf->buf_ptr, buf->stride, tiling, swizzle, rect,
> +				    color, buf->bpp);
> +		break;
> +	default:
> +		igt_assert(false);
> +		break;
> +	}
> +}
> +
>  static void draw_rect_pwrite_untiled(int fd, struct buf_data *buf,
>  				     struct rect *rect, uint32_t color)
>  {
> @@ -839,6 +863,8 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
>   * @buf_handle: the handle of the buffer where you're going to draw to
>   * @buf_size: the size of the buffer
>   * @buf_stride: the stride of the buffer
> + * @buf_ptr: Pointer to already mmapped buffer, to be used with IGT_DRAW_MMAP_PTR,
> +	     otherwise can be left NULL.
>   * @buf_width: the width of the buffer
>   * @buf_height: the height of the buffer
>   * @tiling: the tiling of the buffer
> @@ -855,7 +881,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
>   */
>  void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>  		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
> -		   int buf_width, int buf_height,
> +		   void *buf_ptr, int buf_width, int buf_height,
>  		   uint32_t tiling, enum igt_draw_method method,
>  		   int rect_x, int rect_y, int rect_w, int rect_h,
>  		   uint32_t color, int bpp)
> @@ -870,6 +896,7 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>  		.handle = buf_handle,
>  		.size = buf_size,
>  		.stride = buf_stride,
> +		.buf_ptr = buf_ptr,
>  		.width = buf_width,
>  		.height = buf_height,
>  		.bpp = bpp,
> @@ -907,6 +934,9 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>  	case IGT_DRAW_RENDER:
>  		draw_rect_render(fd, &cmd_data, &buf, &rect, tiling, color);
>  		break;
> +	case IGT_DRAW_MMAP_PTR:
> +		draw_rect_mmap_ptr(fd, &buf, &rect, tiling, swizzle, color);
> +		break;
>  	default:
>  		igt_assert(false);
>  		break;
> @@ -935,7 +965,7 @@ void igt_draw_rect_fb(int fd, struct buf_ops *bops,
>  		      int rect_w, int rect_h, uint32_t color)
>  {
>  	igt_draw_rect(fd, bops, ctx, fb->gem_handle, fb->size, fb->strides[0],
> -		      fb->width, fb->height,
> +		      fb->driver_priv, fb->width, fb->height,

May you add 'fb_map' to igt_fb struct? It will be more clear.


>  		      igt_fb_mod_to_tiling(fb->modifier), method,
>  		      rect_x, rect_y, rect_w, rect_h, color,
>  		      igt_drm_format_to_bpp(fb->drm_format));
> @@ -971,5 +1001,8 @@ bool igt_draw_supports_method(int fd, enum igt_draw_method method)
>  	if (method == IGT_DRAW_RENDER)
>  		return !!igt_get_render_copyfunc(intel_get_drm_devid(fd));
>  
> +	if (method == IGT_DRAW_MMAP_PTR)
> +		return (is_i915_device(fd) && gem_has_mappable_ggtt(fd)) || is_xe_device(fd);
> +
>  	return true;
>  }
> diff --git a/lib/igt_draw.h b/lib/igt_draw.h
> index 1dec95e86..e6cce7295 100644
> --- a/lib/igt_draw.h
> +++ b/lib/igt_draw.h
> @@ -36,6 +36,7 @@
>   * @IGT_DRAW_PWRITE: draw using the pwrite ioctl.
>   * @IGT_DRAW_BLT: draw using the BLT ring.
>   * @IGT_DRAW_RENDER: draw using the render ring.
> + * @IGT_DRAW_MMAP_PTR: draw onto already mmapped buffer.
>   * @IGT_DRAW_METHOD_COUNT: useful for iterating through everything.
>   */
>  enum igt_draw_method {
> @@ -46,6 +47,14 @@ enum igt_draw_method {
>  	IGT_DRAW_BLT,
>  	IGT_DRAW_RENDER,
>  	IGT_DRAW_METHOD_COUNT,
> +	/*
> +	 * FIXME: This enum is placed after IGT_DRAW_METHOD_COUNT in order
> +	 * to avoid it being used by other tests which test all the DRAW methods
> +	 * Once we add support for this draw method in all those tests keep it
> +	 * outside the total count. Some examples are kms_draw_crc, kms_frontbuffer_tracking
> +	 * Similarly add support in igt_draw_get_method_name and igt_draw_supports_method
> +	 */

Instead FIXME just annotate this as 'NOTE'. I think it will stay here
without touching for a long time.

--
Zbigniew

> +	IGT_DRAW_MMAP_PTR,
>  };
>  
>  const char *igt_draw_get_method_name(enum igt_draw_method method);
> @@ -54,7 +63,7 @@ bool igt_draw_supports_method(int fd, enum igt_draw_method method);
>  
>  void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>  		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
> -		   int buf_width, int buf_height,
> +		   void *buf_ptr, int buf_width, int buf_height,
>  		   uint32_t tiling, enum igt_draw_method method,
>  		   int rect_x, int rect_y, int rect_w, int rect_h,
>  		   uint32_t color, int bpp);
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e45d17dd6..32cc50712 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2262,7 +2262,7 @@ static void *busy_thread_func(void *data)
>  {
>  	while (!busy_thread.stop)
>  		igt_draw_rect(drm.fd, drm.bops, 0, busy_thread.handle,
> -			      busy_thread.size, busy_thread.stride,
> +			      busy_thread.size, busy_thread.stride, NULL,
>  			      busy_thread.width, busy_thread.height,
>  			      busy_thread.tiling, IGT_DRAW_BLT, 0, 0,
>  			      busy_thread.width, busy_thread.height,
> -- 
> 2.43.2
> 

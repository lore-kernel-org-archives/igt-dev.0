Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1792D2CDFA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 16:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E40410E6B3;
	Tue, 22 Oct 2024 16:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESRpoHOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0F010E6B8
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729613080; x=1761149080;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+IDlCNryWHcj7qqec8iHUx1gO9njUPNUgpMtDRYOIVQ=;
 b=ESRpoHOqs7/0zZCBbH4WE/PUbRlv5j4dFDHT1F82sMx2hnWhCb2VZ7E/
 AJYjMw4Duj2/l80Ai+QCfTw+Meqy/Fc6iX1XZs8pvr/kefCqSK6ucN2uW
 1c7HIp5gtmjOiDch6BeuZ4vwUBCswN8Kvt8ZCM5ULLdDQA6nuoPIlJmq2
 VgrJQ1RnWgjLC3XtkxvY9FMQy0Q49Ikp3BkkzQd197VBxkexRx9PQAx8K
 tSKJsbk29Wd+upau5J1ezgJ0xJksqCzV2AmO2qwPniVe35xQapzXq9z49
 h+fXPZ1bYE76vtSQ84+HfyuornlAxxxVacxH1tiQwHIb21O5vYCpizy9U Q==;
X-CSE-ConnectionGUID: MITcBf/pRn2eBvpOyBqDkQ==
X-CSE-MsgGUID: 180yArshRqS6dUVeuqXLJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29265613"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="29265613"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 09:04:40 -0700
X-CSE-ConnectionGUID: I95Wrr+zT/WKtpXRhsMjzQ==
X-CSE-MsgGUID: MimHq3YISMGXVvV36O16SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84992710"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 09:04:37 -0700
Date: Tue, 22 Oct 2024 18:04:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 02/14] lib/igt_draw: Extend the API to support
 64bpp colors
Message-ID: <20241022160433.cxuz2vgpgunmkyog@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004104121.32750-3-ville.syrjala@linux.intel.com>
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
On 2024-10-04 at 13:41:09 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Pass the color as uint64_t to igt_draw in preparation
> for supporting 64bpp pixel formats.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

LGTM but please see one nit below.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_draw.c | 28 ++++++++++++++--------------
>  lib/igt_draw.h |  6 +++---
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 3ebfaad6ef31..917cc37a2175 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -363,7 +363,7 @@ static void tile4_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
>  	*y = tile_origin_y + subtile_origin_y + oword_num;
>  }
>  
> -static void set_pixel(void *_ptr, int index, uint32_t color, int bpp)
> +static void set_pixel(void *_ptr, int index, uint64_t color, int bpp)
>  {
>  	if (bpp == 16) {
>  		uint16_t *ptr = _ptr;
> @@ -403,7 +403,7 @@ static void switch_blt_tiling(struct intel_bb *ibb, uint32_t tiling, bool on)
>  }
>  
>  static void draw_rect_ptr_linear(void *ptr, uint32_t stride,
> -				 struct rect *rect, uint32_t color, int bpp)
> +				 struct rect *rect, uint64_t color, int bpp)
>  {
>  	int x, y, line_begin;
>  
> @@ -415,7 +415,7 @@ static void draw_rect_ptr_linear(void *ptr, uint32_t stride,
>  }
>  
>  static void draw_rect_ptr_tiled(void *ptr, uint32_t stride, uint32_t tiling,
> -				int swizzle, struct rect *rect, uint32_t color,
> +				int swizzle, struct rect *rect, uint64_t color,
>  				int bpp)
>  {
>  	int x, y, pos;
> @@ -444,7 +444,7 @@ static void draw_rect_ptr_tiled(void *ptr, uint32_t stride, uint32_t tiling,
>  }
>  
>  static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
> -			       uint32_t tiling, uint32_t swizzle, uint32_t color)
> +			       uint32_t tiling, uint32_t swizzle, uint64_t color)
>  {
>  	void *ptr;
>  
> @@ -479,7 +479,7 @@ static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
>  }
>  
>  static void draw_rect_mmap_gtt(int fd, struct buf_data *buf, struct rect *rect,
> -			       uint32_t color)
> +			       uint64_t color)
>  {
>  	void *ptr;
>  
> @@ -495,7 +495,7 @@ static void draw_rect_mmap_gtt(int fd, struct buf_data *buf, struct rect *rect,
>  }
>  
>  static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
> -			      uint32_t tiling, uint32_t swizzle, uint32_t color)
> +			      uint32_t tiling, uint32_t swizzle, uint64_t color)
>  {
>  	void *ptr;
>  
> @@ -542,7 +542,7 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
>  }
>  
>  static void draw_rect_pwrite_untiled(int fd, struct buf_data *buf,
> -				     struct rect *rect, uint32_t color)
> +				     struct rect *rect, uint64_t color)
>  {
>  	int i, y, offset;
>  	int pixel_size = buf->bpp / 8;
> @@ -559,7 +559,7 @@ static void draw_rect_pwrite_untiled(int fd, struct buf_data *buf,
>  
>  static void draw_rect_pwrite_tiled(int fd, struct buf_data *buf,
>  				   uint32_t tiling, struct rect *rect,
> -				   uint32_t color, uint32_t swizzle)
> +				   uint64_t color, uint32_t swizzle)

This one function have 'color, swizzle' while all others
have it 'swizzle, color'. It could be misleading. It is not
a purpose of your patch to correct this so it is not a blocker.

+Cc Zbigniew

Regards,
Kamil

>  {
>  	int i;
>  	int tiled_pos, x, y, pixel_size;
> @@ -624,7 +624,7 @@ static void draw_rect_pwrite_tiled(int fd, struct buf_data *buf,
>  
>  static void draw_rect_pwrite(int fd, struct buf_data *buf,
>  			     struct rect *rect, uint32_t tiling,
> -			     uint32_t swizzle, uint32_t color)
> +			     uint32_t swizzle, uint64_t color)
>  {
>  	switch (tiling) {
>  	case I915_TILING_NONE:
> @@ -674,7 +674,7 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
>  
>  static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  			  struct buf_data *buf, struct rect *rect,
> -			  uint32_t tiling, uint32_t color)
> +			  uint32_t tiling, uint64_t color)
>  {
>  	struct intel_bb *ibb;
>  	struct intel_buf *dst;
> @@ -785,7 +785,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  
>  static void draw_rect_render(int fd, struct cmd_data *cmd_data,
>  			     struct buf_data *buf, struct rect *rect,
> -			     uint32_t tiling, uint32_t color)
> +			     uint32_t tiling, uint64_t color)
>  {
>  	struct intel_buf *src, *dst;
>  	uint32_t devid = intel_get_drm_devid(fd);
> @@ -858,7 +858,7 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>  		   int buf_width, int buf_height,
>  		   uint32_t tiling, enum igt_draw_method method,
>  		   int rect_x, int rect_y, int rect_w, int rect_h,
> -		   uint32_t color, int bpp)
> +		   uint64_t color, int bpp)
>  {
>  	uint32_t buf_tiling, swizzle;
>  
> @@ -932,7 +932,7 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>  void igt_draw_rect_fb(int fd, struct buf_ops *bops,
>  		      uint32_t ctx, struct igt_fb *fb,
>  		      enum igt_draw_method method, int rect_x, int rect_y,
> -		      int rect_w, int rect_h, uint32_t color)
> +		      int rect_w, int rect_h, uint64_t color)
>  {
>  	igt_draw_rect(fd, bops, ctx, fb->gem_handle, fb->size, fb->strides[0],
>  		      fb->width, fb->height,
> @@ -949,7 +949,7 @@ void igt_draw_rect_fb(int fd, struct buf_ops *bops,
>   *
>   * This function just paints an igt_fb using the provided color.
>   */
> -void igt_draw_fill_fb(int fd, struct igt_fb *fb, uint32_t color)
> +void igt_draw_fill_fb(int fd, struct igt_fb *fb, uint64_t color)
>  {
>  	igt_draw_rect_fb(fd, NULL, 0, fb,
>  			 igt_draw_supports_method(fd, IGT_DRAW_MMAP_GTT) ?
> diff --git a/lib/igt_draw.h b/lib/igt_draw.h
> index 1dec95e86e0f..33763812ea4f 100644
> --- a/lib/igt_draw.h
> +++ b/lib/igt_draw.h
> @@ -57,13 +57,13 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>  		   int buf_width, int buf_height,
>  		   uint32_t tiling, enum igt_draw_method method,
>  		   int rect_x, int rect_y, int rect_w, int rect_h,
> -		   uint32_t color, int bpp);
> +		   uint64_t color, int bpp);
>  
>  void igt_draw_rect_fb(int fd, struct buf_ops *bops,
>  		      uint32_t ctx, struct igt_fb *fb,
>  		      enum igt_draw_method method, int rect_x, int rect_y,
> -		      int rect_w, int rect_h, uint32_t color);
> +		      int rect_w, int rect_h, uint64_t color);
>  
> -void igt_draw_fill_fb(int fd, struct igt_fb *fb, uint32_t color);
> +void igt_draw_fill_fb(int fd, struct igt_fb *fb, uint64_t color);
>  
>  #endif /* __IGT_DRAW_H__ */
> -- 
> 2.45.2
> 

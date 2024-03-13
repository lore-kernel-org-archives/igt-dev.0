Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FA5C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 14:04:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76D110F448;
	Wed, 13 Mar 2024 14:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJpq/heT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D407B10F448
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710338664; x=1741874664;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=frsKIl3YRU4ZTssZfHOSgspaqr9dzLVQj0IaGyNvH4M=;
 b=TJpq/heTiNIlXECXDrybGAwKTkUhkZDrWdweIL+L/8D6OsYIQ9VqAei2
 d0HFpry1aou59RLw27EHkR26Wz/sjIOLUsM+y6N0VEVAhD8ex+MuP63JM
 Dwo8yNEffRyZaB2WcaVYSlreZ+iZYV9w4EyMDFNWxuGDPUwXoZmXdwFvD
 VF1d33+tKBzsfateSK0r5QPrv7Q7afXtc6RYzO78MBxXn/jJFDn3TR1Ok
 3viu6asilnmQECDxkcsIIL8Q1b3nQx4BA/9bWer6+1NtEQcc/ExfSLReG
 Q253h2euJdmvhXGZv6aneUQxVDBIsocMKXMC3nZJadIQjgrpAzRLWEspb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27581471"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="27581471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:04:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16403427"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 07:04:02 -0700
Date: Wed, 13 Mar 2024 15:03:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Simon Ser <contact@emersion.fr>, quic_abhinavk@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t v3 4/5] tests/kms_atomic: Add solid fill plane
 subtest
Message-ID: <20240313140359.n6cwkdewpj4bgyw2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Simon Ser <contact@emersion.fr>, quic_abhinavk@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
 <20240301-solid-fill-v3-4-8dff68a8a566@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240301-solid-fill-v3-4-8dff68a8a566@quicinc.com>
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

Hi Jessica,
On 2024-03-01 at 12:47:33 -0800, Jessica Zhang wrote:
> Add a basic test for solid fill planes.
> 
> This test will first commit a single-color framebuffer plane then
> a solid fill plane with the same contents. It then validates the solid
> fill plane by comparing the resulting CRC with the CRC of the reference
> framebuffer commit.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  tests/kms_atomic.c | 209 ++++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 191 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> old mode 100644
> new mode 100755

Please do not change source file permissions into exec.

Regards,
Kamil

> index 2b6e9a8f0383..0598c5d71a85
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -43,6 +43,7 @@
>  #include <stdint.h>
>  #include <string.h>
>  #include <errno.h>
> +#include <math.h>
>  #include <xf86drmMode.h>
>  #include <cairo.h>
>  #include "drm.h"
> @@ -101,6 +102,15 @@
>   * @params-fence:     fence parameters
>   */
>  
> +/**
> + * SUBTEST: plane-%s-solid-fill
> + * Description: Test atomic modesetting on %arg[1] using solid fill property.
> + *
> + * arg[1]:
> + *
> + * @primary:        Primary plane
> + */
> +
>  #ifndef DRM_CAP_CURSOR_WIDTH
>  #define DRM_CAP_CURSOR_WIDTH 0x8
>  #endif
> @@ -122,18 +132,45 @@ typedef struct {
>  	igt_fb_t fb;
>  } data_t;
>  
> +static struct {
> +	uint32_t r, g, b;
> +} colors[8] = {
> +	/* Basic Colors */
> +	{ .r = 0x00000000, .g = 0x00000000, .b = 0x00000000 },
> +	{ .r = 0xffffffff, .g = 0x00000000, .b = 0x00000000 },
> +	{ .r = 0x00000000, .g = 0xffffffff, .b = 0x00000000 },
> +	{ .r = 0x00000000, .g = 0x00000000, .b = 0xffffffff },
> +	{ .r = 0xffffffff, .g = 0xffffffff, .b = 0xffffffff },
> +
> +	/* Mid-grays */
> +	{ .r = 0x40000000, .g = 0x40000000, .b = 0x40000000 },
> +	{ .r = 0x80000000, .g = 0x80000000, .b = 0x80000000 },
> +	{ .r = 0xcccccccc, .g = 0xcccccccc, .b = 0xcccccccc },
> +};
> +
>  enum kms_atomic_check_relax {
>  	ATOMIC_RELAX_NONE = 0,
>  	CRTC_RELAX_MODE = (1 << 0),
>  	PLANE_RELAX_FB = (1 << 1)
>  };
>  
> -static inline int damage_rect_width(struct drm_mode_rect *r)
> +/*
> + * Fixed point uint to floating point conversion based on
> + * Vulkan's UNORM conversion:
> + *
> + * https://registry.khronos.org/vulkan/specs/1.3/html/chap3.html#fundamentals-fixedconv
> + */
> +static inline double unorm_to_float(uint32_t x)
> +{
> +	return x / (pow(2, 32) - 1);
> +}
> +
> +static inline int rect_width(struct drm_mode_rect *r)
>  {
>  	return r->x2 - r->x1;
>  }
>  
> -static inline int damage_rect_height(struct drm_mode_rect *r)
> +static inline int rect_height(struct drm_mode_rect *r)
>  {
>  	return r->y2 - r->y1;
>  }
> @@ -1156,8 +1193,8 @@ static void atomic_plane_damage(data_t *data)
>  
>  	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
>  	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 1.0, 0, 0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 1.0, 0, 0);
>  	igt_put_cairo_ctx(cr_1);
>  
>  	igt_plane_set_fb(data->primary, &fb_1);
> @@ -1183,8 +1220,8 @@ static void atomic_plane_damage(data_t *data)
>  	cairo_set_source_surface(cr_2, fb_1.cairo_surface, 0, 0);
>  	cairo_paint(cr_2);
>  	igt_paint_color(cr_2, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 0, 1.0, 0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 0, 1.0, 0);
>  	igt_put_cairo_ctx(cr_1);
>  	igt_put_cairo_ctx(cr_2);
>  	igt_plane_set_fb(data->primary, &fb_2);
> @@ -1213,8 +1250,8 @@ static void atomic_plane_damage(data_t *data)
>  	cairo_set_source_surface(cr_1, fb_2.cairo_surface, 0, 0);
>  	cairo_paint(cr_1);
>  	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 0, 1.0, 0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 0, 1.0, 0);
>  	igt_put_cairo_ctx(cr_2);
>  	igt_put_cairo_ctx(cr_1);
>  	igt_plane_set_fb(data->primary, &fb_1);
> @@ -1238,8 +1275,8 @@ static void atomic_plane_damage(data_t *data)
>  
>  	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
>  	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 1.0, 1.0, 0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 1.0, 1.0, 0);
>  	igt_put_cairo_ctx(cr_1);
>  	igt_plane_set_fb(data->primary, &fb_1);
>  	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
> @@ -1266,11 +1303,11 @@ static void atomic_plane_damage(data_t *data)
>  
>  	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
>  	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 0, 1.0, 1.0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 0, 1.0, 1.0);
>  	igt_paint_color(cr_1, damage[1].x1, damage[1].y1,
> -			damage_rect_width(&damage[1]),
> -			damage_rect_height(&damage[1]), 0, 1.0, 0);
> +			rect_width(&damage[1]),
> +			rect_height(&damage[1]), 0, 1.0, 0);
>  	igt_put_cairo_ctx(cr_1);
>  	igt_plane_set_fb(data->primary, &fb_1);
>  	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
> @@ -1299,11 +1336,11 @@ static void atomic_plane_damage(data_t *data)
>  
>  	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
>  	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 1.0, 0, 0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 1.0, 0, 0);
>  	igt_paint_color(cr_1, damage[1].x1, damage[1].y1,
> -			damage_rect_width(&damage[1]),
> -			damage_rect_height(&damage[1]), 1.0, 1.0, 1.0);
> +			rect_width(&damage[1]),
> +			rect_height(&damage[1]), 1.0, 1.0, 1.0);
>  	igt_put_cairo_ctx(cr_1);
>  	igt_plane_set_fb(data->primary, &fb_1);
>  	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
> @@ -1322,6 +1359,128 @@ static void atomic_plane_damage(data_t *data)
>  	igt_remove_fb(data->drm_fd, &fb_2);
>  }
>  
> +static uint32_t to_argb(uint32_t r, uint32_t g, uint32_t b)
> +{
> +	uint32_t color = 0xff000000;
> +	uint8_t temp_r = r >> 24;
> +	uint8_t temp_g = g >> 24;
> +	uint8_t temp_b = b >> 24;
> +
> +	color |= temp_r << 16;
> +	color |= temp_g << 8;
> +	color |= temp_b;
> +
> +	return color;
> +}
> +
> +static void test_solid_fill_plane(data_t *data, igt_output_t *output, igt_plane_t *plane)
> +{
> +	drmModeModeInfo *mode = igt_output_get_mode(output);
> +	struct drm_mode_rect rect = { 0 };
> +	struct igt_fb ref_fb;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_crc_t ref_crc, new_crc;
> +	enum pipe pipe = data->pipe->pipe;
> +	int height, width, i;
> +	int ret;
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SOLID_FILL));
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_PIXEL_SOURCE));
> +
> +	rect.x1 = 0;
> +	rect.x2 = mode->hdisplay;
> +	rect.y1 = 0;
> +	rect.y2 = mode->vdisplay;
> +
> +	width = rect_width(&rect);
> +	height = rect_height(&rect);
> +
> +	igt_plane_set_position(plane, rect.x1, rect.y1);
> +	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
> +			    IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +
> +	for (i = 0; i < ARRAY_SIZE(colors); i++) {
> +		uint32_t r = colors[i].r;
> +		uint32_t g = colors[i].g;
> +		uint32_t b = colors[i].b;
> +		cairo_format_t fmt;
> +		uint32_t *fb_data;
> +
> +		struct drm_mode_create_blob c;
> +		struct drm_mode_destroy_blob d;
> +		struct drm_mode_solid_fill blob_data = {
> +			.r = r,
> +			.g = g,
> +			.b = b,
> +			.pad = 0x0,
> +		};
> +
> +		c.data = (uintptr_t) &blob_data;
> +		c.length = sizeof(blob_data);
> +
> +		igt_debug("Testing color r: 0x%x (%f), g: 0x%x (%f), b: 0x%x (%f)\n",
> +				r, unorm_to_float(r),
> +				g, unorm_to_float(g),
> +				b, unorm_to_float(b));
> +
> +		/* get reference CRC */
> +		igt_create_color_fb(data->drm_fd, width, height,
> +				    DRM_FORMAT_ABGR8888, DRM_FORMAT_MOD_LINEAR,
> +				    unorm_to_float(r),
> +				    unorm_to_float(g),
> +				    unorm_to_float(b),
> +				    &ref_fb);
> +		igt_plane_set_fb(plane, &ref_fb);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		igt_get_cairo_ctx(ref_fb.fd, &ref_fb);
> +		fb_data = (void *)cairo_image_surface_get_data(ref_fb.cairo_surface);
> +		fmt = cairo_image_surface_get_format(ref_fb.cairo_surface);
> +
> +		/*
> +		 * Check to make sure Cairo float->u8 conversion matches
> +		 * expected ARGB8888 value
> +		 */
> +		if (fmt == CAIRO_FORMAT_ARGB32 && fb_data[0] != to_argb(r, g, b)) {
> +			igt_warn("Resulting framebuffer data doesn't match color!\n");
> +			continue;
> +		}
> +
> +		igt_pipe_crc_start(pipe_crc);
> +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> +
> +		ret = drmIoctl(data->display.drm_fd, DRM_IOCTL_MODE_CREATEPROPBLOB, &c);
> +		igt_assert(ret == 0);
> +
> +		/* test solid fill plane */
> +		igt_plane_set_solid_fill(plane, &rect, c.blob_id);
> +		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "SOLID_FILL");
> +
> +		igt_display_commit_atomic(&data->display,
> +					  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					  NULL);
> +
> +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &new_crc);
> +
> +		igt_assert_crc_equal(&ref_crc, &new_crc);
> +
> +		/* Switch back to FB pixel source */
> +		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "FB");
> +
> +		d.blob_id = c.blob_id;
> +		ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_DESTROYPROPBLOB, &d);
> +		igt_assert(ret == 0);
> +	}
> +
> +	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, 0);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_pipe_crc_stop(pipe_crc);
> +	igt_pipe_crc_free(pipe_crc);
> +	igt_remove_fb(data->drm_fd, &ref_fb);
> +}
> +
>  static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
>  {
>  	drmModeModeInfo *mode;
> @@ -1634,6 +1793,20 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		}
>  	}
>  
> +	igt_describe("Test case for solid fill primary planes");
> +	igt_subtest_with_dynamic("plane-primary-solid-fill") {
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> +				atomic_setup(&data, pipe, output);
> +				test_solid_fill_plane(&data, output, data.primary);
> +				atomic_clear(&data, pipe, output);
> +			}
> +		}
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> 
> -- 
> 2.43.2
> 

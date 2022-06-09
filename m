Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E21F10E961
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jun 2022 07:46:36 +0000 (UTC)
Date: Thu, 9 Jun 2022 09:46:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YqGlWLxhJWO39/mS@kamilkon-desk1>
References: <20220608171304.22536-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220608171304.22536-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v2] tests/kms_scaling_filters: New IGT to validate
 scaling filters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Swati,

few small nits below.

On 2022-06-08 at 22:43:04 +0530, Swati Sharma wrote:
> SCALING_FILTER can be used either as plane scaler property
> or CRTC scaler property.
> The value of this property can be one of the following:
>     Default:
>              Driver's default scaling filter
>     Nearest Neighbor:
>              Nearest Neighbor scaling filter
> If NN is used for scaling, sharpness is preserved
> whereas if we use default scaling we can see blurriness
> at edges.
> 
> Four subtests are written upscale/downscale with NN and default
> scaling filters.
> 
> v2: no need to set pipe scaler filter property
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_kms.c               |  16 ++++
>  lib/igt_kms.h               |   1 +
>  tests/kms_scaling_filters.c | 180 ++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  4 files changed, 198 insertions(+)
>  create mode 100644 tests/kms_scaling_filters.c
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b70d336e..e939ed41 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -912,6 +912,22 @@ const char *kmstest_connector_status_str(int status)
>  	return find_type_name(connector_status_names, status);
>  }
>  
> +enum drm_scaling_filter {
> +	DRM_SCALING_FILTER_DEFAULT,
> +	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
> +};
> +
> +static const struct type_name drm_scaling_filter[] = {
> +	{ DRM_SCALING_FILTER_DEFAULT, "Default" },
> +	{ DRM_SCALING_FILTER_NEAREST_NEIGHBOR, "Nearest Neighbor" },
> +	{}
> +};
> +
> +const char *kmstest_scaling_filter_str(int filter)
> +{
> +	return find_type_name(drm_scaling_filter, filter);
> +}
> +
>  static const struct type_name connector_type_names[] = {
>  	{ DRM_MODE_CONNECTOR_Unknown, "Unknown" },
>  	{ DRM_MODE_CONNECTOR_VGA, "VGA" },
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a334e0cf..2abb3353 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -107,6 +107,7 @@ enum igt_custom_edid_type {
>  const char *kmstest_encoder_type_str(int type);
>  const char *kmstest_connector_status_str(int status);
>  const char *kmstest_connector_type_str(int type);
> +const char *kmstest_scaling_filter_str(int filter);
>  
>  void kmstest_dump_mode(drmModeModeInfo *mode);
>  
> diff --git a/tests/kms_scaling_filters.c b/tests/kms_scaling_filters.c
> new file mode 100644
> index 00000000..3928fafb
> --- /dev/null
> +++ b/tests/kms_scaling_filters.c
> @@ -0,0 +1,180 @@
> +/*
> + * Copyright © 2022 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.

Please use SPDX licence placeholder.

> + *
> + * Author:
> + *     Swati Sharma <swati2.sharma@intel.com>
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +IGT_TEST_DESCRIPTION("Test display scaling filters");
> +
> +enum {
> +	DRM_SCALING_FILTER_DEFAULT,
> +	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
> +};
> +
> +typedef struct data {
> +	igt_display_t display;
> +	int drm_fd;
> +} data_t;
> +
> +typedef struct {
> +	float r;
> +	float g;
> +	float b;
> +} rgb_color_t;
> +
> +static void set_color(rgb_color_t *color, float r, float g, float b)
> +{
> +	color->r = r;
> +	color->g = g;
> +	color->b = b;
> +}
> +
> +#define RGB_COLOR(color) \
> +	color.r, color.g, color.b
> +
> +static void
> +paint_squares(data_t *data, struct igt_fb *fb, float o)
> +{
> +	cairo_t *cr;
> +	unsigned int w = fb->width;
> +	unsigned int h = fb->height;
> +	rgb_color_t tl, tr, bl, br;
> +
> +	cr = igt_get_cairo_ctx(data->drm_fd, fb);
> +
> +	set_color(&tl, o, 0.0f, 0.0f);
> +	set_color(&tr, 0.0f, o, 0.0f);
> +	set_color(&br, o, o, o);
> +	set_color(&bl, 0.0f, 0.0f, o);
> +
> +	igt_paint_color(cr, 0, 0, w / 2, h / 2, RGB_COLOR(tl));
> +	igt_paint_color(cr, w / 2, 0, w / 2, h / 2, RGB_COLOR(tr));
> +	igt_paint_color(cr, 0, h / 2, w / 2, h / 2, RGB_COLOR(bl));
> +	igt_paint_color(cr, w / 2, h / 2, w / 2, h / 2, RGB_COLOR(br));
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +#define IS_FACTOR 2
> +static void test_scaling_filter_on_output(data_t *data, const enum pipe pipe,
> +					  igt_output_t *output, igt_plane_t *plane, int flags,
> +					  bool is_upscale)
> +{
> +	igt_display_t *display = &data->display;
> +	const float flip_opacity = 1;
> +	drmModeModeInfo *mode;
> +	struct igt_fb fb;
> +	int w, h, ret;
> +
> +	igt_output_set_pipe(output, pipe);
> +	mode = igt_output_get_mode(output);
> +
> +	if (is_upscale) {
> +		w = mode->hdisplay / IS_FACTOR;
> +		h = mode->vdisplay / IS_FACTOR;
> +	} else {
> +		w = mode->hdisplay;
> +		h = mode->vdisplay;
> +	}
> +
> +	igt_create_fb(display->drm_fd, w, h,
> +		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
> +	paint_squares(data, &fb, flip_opacity);
> +
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_SCALING_FILTER, kmstest_scaling_filter_str(flags));
> +
> +	igt_plane_set_fb(plane, &fb);
> +	igt_plane_set_position(plane, 0, 0);
> +
> +	if (is_upscale)
> +		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	else
> +		igt_plane_set_size(plane, mode->hdisplay * 0.75, mode->vdisplay * 0.75);
> +
> +	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_plane_set_position(plane, 0, 0);
> +	igt_remove_fb(display->drm_fd, &fb);
> +
> +	igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +		      "Unsupported scaling factor with fb size %dx%d\n", w, h);
> +	igt_assert_eq(ret, 0);
> +}
> +
> +static void test_scaling_filter(data_t *data, int flags, bool is_upscale)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	igt_plane_t *plane;
> +	enum pipe pipe;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		for_each_plane_on_pipe(display, pipe, plane) {
> +			if (!igt_plane_has_prop(plane, IGT_PLANE_SCALING_FILTER))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s-plane-%u", kmstest_pipe_name(pipe), output->name, plane->index)
> +				test_scaling_filter_on_output(data, pipe, output, plane, flags, is_upscale);
> +
> +			igt_display_reset(display);
> +		}
> +	}
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		igt_require(data.drm_fd >= 0);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Tests default scaling filter, upscale");
> +	igt_subtest_with_dynamic("scaling-filter-default-upscale")
> +		test_scaling_filter(&data, DRM_SCALING_FILTER_DEFAULT, true);

imho here should be added one empty line to imrove readability.

> +	igt_describe("Tests default scaling filter, downscale");
> +	igt_subtest_with_dynamic("scaling-filter-default-downscale")
> +		test_scaling_filter(&data, DRM_SCALING_FILTER_DEFAULT, false);

Same here.

> +	igt_describe("Tests nearest neighbor scaling filter, upscale");
> +	igt_subtest_with_dynamic("scaling-filter-nn-upscale")
> +		test_scaling_filter(&data, DRM_SCALING_FILTER_NEAREST_NEIGHBOR, true);

Same here.

> +	igt_describe("Tests nearest neighbor scaling filter, downscale");
> +	igt_subtest_with_dynamic("scaling-filter-nn-downscale")
> +		test_scaling_filter(&data, DRM_SCALING_FILTER_NEAREST_NEIGHBOR, false);
> +
> +

Remove one empty line.

> +	igt_fixture
> +		igt_display_fini(&data.display);

hmmm, what about closing data.drm_fd here ?

Regards,
Kamil

> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index fb0f1e37..dd83c068 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -52,6 +52,7 @@ test_progs = [
>  	'kms_properties',
>  	'kms_rmfb',
>  	'kms_rotation_crc',
> +	'kms_scaling_filters',
>  	'kms_scaling_modes',
>  	'kms_selftest',
>  	'kms_sequence',
> -- 
> 2.25.1
> 

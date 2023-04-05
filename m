Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A7010E951
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 12:59:24 +0000 (UTC)
Message-ID: <d295b0b5-fb31-891a-c39d-910c3cac4160@linux.intel.com>
Date: Wed, 5 Apr 2023 14:59:20 +0200
MIME-Version: 1.0
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230405053451.2878039-1-jouni.hogander@intel.com>
 <20230405053451.2878039-4-jouni.hogander@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230405053451.2878039-4-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_dirtyfb: Add new test for
 dirtyfb ioctl
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

Hey,

There's a gray area between i915 and Xe, and between lib and tests.

I think in this case, it makes a lot of sense to move those helpers into 
lib/ instead,

it will be useful outside i915 specific tests, as they will have to run 
on Xe as well.

Probably best to simply add a intel_* prefix to each function, and move 
them into igt/i915/kms_*.[ch]

Personally, I feel the existing igt/igt_psr.c belongs there too.

Also I noticed debugfs_fd, because those tests don't need to be 
optimized, it can be moved into the functions.


Cheers,

~Maarten

On 2023-04-05 07:34, Jouni Högander wrote:
> Add new test to validate dirtyfb ioctl is working properly with GPU
> frontbuffer rendering.
>
> Create big framebuffer and use only lower right corner for the
> plane. Initiate GPU drawing for a rectangle over the whole
> framebuffer and perform dirtyfb ioctl. Then wait for the drawing to
> complete and collect crc and check that it matches with expected.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   tests/i915/kms_dirtyfb.c | 309 +++++++++++++++++++++++++++++++++++++++
>   tests/meson.build        |   8 +
>   2 files changed, 317 insertions(+)
>   create mode 100644 tests/i915/kms_dirtyfb.c
>
> diff --git a/tests/i915/kms_dirtyfb.c b/tests/i915/kms_dirtyfb.c
> new file mode 100644
> index 00000000..99d4231d
> --- /dev/null
> +++ b/tests/i915/kms_dirtyfb.c
> @@ -0,0 +1,309 @@
> +/*
> + * Copyright © 2023 Intel Corporation
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
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include <sys/types.h>
> +
> +#include "igt.h"
> +#include "igt_psr.h"
> +
> +#include "kms_fbc_helper.h"
> +#include "kms_drrs_helper.h"
> +
> +IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
> +		     "its related features: FBC, PSR and DRRS");
> +
> +#ifndef PAGE_ALIGN
> +#ifndef PAGE_SIZE
> +#define PAGE_SIZE 4096
> +#endif
> +#define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)
> +#endif
> +
> +typedef struct {
> +	int drm_fd;
> +	int debugfs_fd;
> +	igt_display_t display;
> +	drmModeModeInfo *mode;
> +	igt_output_t *output;
> +	igt_pipe_crc_t *pipe_crc;
> +	enum pipe pipe;
> +
> +	struct igt_fb fbs[3];
> +
> +	igt_crc_t ref_crc;
> +
> +	struct buf_ops *bops;
> +	enum {
> +		FEATURE_NONE  = 0,
> +		FEATURE_PSR   = 1,
> +		FEATURE_FBC   = 2,
> +		FEATURE_DRRS  = 4,
> +		FEATURE_COUNT = 8,
> +		FEATURE_DEFAULT = 8,
> +	} feature;
> +} data_t;
> +
> +static const char *feature_str(int feature)
> +{
> +	switch (feature) {
> +	case FEATURE_NONE:
> +		return "nop";
> +	case FEATURE_FBC:
> +		return "fbc";
> +	case FEATURE_PSR:
> +		return "psr";
> +	case FEATURE_DRRS:
> +		return "drrs";
> +	case FEATURE_DEFAULT:
> +		return "default";
> +	default:
> +		igt_assert(false);
> +	}
> +}
> +
> +static bool check_support(data_t *data)
> +{
> +	switch (data->feature) {
> +	case FEATURE_NONE:
> +		return true;
> +	case FEATURE_FBC:
> +		return fbc_supported_on_chipset(data->drm_fd, data->pipe);
> +	case FEATURE_PSR:
> +		return psr_sink_support(data->drm_fd, data->debugfs_fd,
> +					PSR_MODE_1);
> +	case FEATURE_DRRS:
> +		return is_drrs_supported(data->drm_fd, data->pipe) &&
> +			output_has_drrs(data->drm_fd, data->output);
> +	case FEATURE_DEFAULT:
> +		return true;
> +	default:
> +		igt_assert(false);
> +	}
> +}
> +
> +static void enable_feature(data_t *data)
> +{
> +	switch (data->feature) {
> +	case FEATURE_NONE:
> +		break;
> +	case FEATURE_FBC:
> +		fbc_enable(data->drm_fd);
> +		break;
> +	case FEATURE_PSR:
> +		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1);
> +		break;
> +	case FEATURE_DRRS:
> +		drrs_enable(data->drm_fd, data->pipe);
> +		break;
> +	case FEATURE_DEFAULT:
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
> +}
> +
> +static void check_feature(data_t *data)
> +{
> +	switch (data->feature) {
> +	case FEATURE_NONE:
> +		break;
> +	case FEATURE_FBC:
> +		igt_assert_f(fbc_wait_until_enabled(data->drm_fd, data->pipe),
> +			     "FBC still disabled");
> +		break;
> +	case FEATURE_PSR:
> +		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1),
> +			     "PSR still disabled\n");
> +		break;
> +	case FEATURE_DRRS:
> +		igt_assert_f(is_drrs_inactive(data->drm_fd, data->pipe),
> +			     "DRRS INACTIVE\n");
> +		break;
> +	case FEATURE_DEFAULT:
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
> +}
> +
> +static void disable_features(data_t *data)
> +{
> +	fbc_disable(data->drm_fd);
> +	psr_disable(data->drm_fd, data->debugfs_fd);
> +	drrs_disable(data->drm_fd, data->pipe);
> +}
> +
> +static void prepare(data_t *data)
> +{
> +	igt_plane_t *primary;
> +	drmModeResPtr res;
> +
> +	igt_skip_on(!check_support(data));
> +
> +	data->mode = igt_output_get_mode(data->output);
> +
> +	igt_output_set_pipe(data->output, data->pipe);
> +
> +	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
> +					 IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> +			    data->mode->hdisplay, DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +			    &data->fbs[0]);
> +	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[0],
> +			 IGT_DRAW_RENDER, 0, 0, data->fbs[0].width,
> +			 data->fbs[0].height, 0xFF);
> +
> +	primary = igt_output_get_plane_type(data->output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_plane_set_fb(primary, &data->fbs[0]);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
> +
> +	res = drmModeGetResources(data->drm_fd);
> +
> +	igt_create_color_fb(data->drm_fd, res->max_width,
> +			    res->max_height, DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +			    &data->fbs[1]);
> +	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1],
> +			 IGT_DRAW_MMAP_CPU, 0, 0, data->fbs[1].width,
> +			 data->fbs[1].height, 0xFF);
> +
> +	igt_create_color_fb(data->drm_fd, res->max_width,
> +			    res->max_height, DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +			    &data->fbs[2]);
> +
> +	igt_plane_set_fb(primary, &data->fbs[2]);
> +	igt_fb_set_position(&data->fbs[2], primary,
> +			    data->fbs[2].width - data->fbs[0].width,
> +			    data->fbs[2].height - data->fbs[0].height);
> +	igt_fb_set_size(&data->fbs[2], primary, data->fbs[0].width,
> +			data->fbs[0].height);
> +
> +	enable_feature(data);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	check_feature(data);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_remove_fb(data->drm_fd, &data->fbs[0]);
> +	igt_remove_fb(data->drm_fd, &data->fbs[1]);
> +
> +	igt_pipe_crc_free(data->pipe_crc);
> +
> +	disable_features(data);
Should probably only do this if != FEATURE_DEFAULT
> +
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static void run_test(data_t *data)
> +{
> +	igt_crc_t crc;
> +	struct intel_buf *src, *dst;
> +	struct intel_bb *ibb;
> +	uint32_t devid = intel_get_drm_devid(data->drm_fd);
> +	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
> +	int r;
> +
> +	igt_skip_on(!rendercopy);
> +
> +	src = intel_buf_create_using_handle(data->bops, data->fbs[1].gem_handle,
> +					    data->fbs[1].width,
> +					    data->fbs[1].height,
> +					    igt_drm_format_to_bpp(data->fbs[1].drm_format),
> +					    0, igt_fb_mod_to_tiling(data->fbs[1].modifier), 0);
> +	dst = intel_buf_create_using_handle(data->bops, data->fbs[2].gem_handle,
> +					    data->fbs[2].width,
> +					    data->fbs[2].height,
> +					    igt_drm_format_to_bpp(data->fbs[2].drm_format),
> +					    0, igt_fb_mod_to_tiling(data->fbs[2].modifier), 0);
> +	ibb = intel_bb_create_with_context(data->drm_fd, 0, NULL, PAGE_SIZE);
> +
> +	rendercopy(ibb, src, 0, 0, data->fbs[2].width, data->fbs[2].height, dst, 0, 0);
> +
> +	/* Perfom dirtyfb right after initiating rendercopy */
> +	r = drmModeDirtyFB(data->drm_fd, data->fbs[2].fb_id, NULL, 0);
> +	igt_assert(r == 0 || r == -ENOSYS);
> +
> +	/* Ensure rendercopy is complete */
> +	intel_bb_sync(ibb);
> +
> +	intel_bb_destroy(ibb);
> +	intel_buf_destroy(src);
> +	intel_buf_destroy(dst);
> +
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
This crc should probably be collected immediately after DirtyFB 
completes, otherwise you only check that the copy worked?
> +	igt_assert_crc_equal(&crc, &data->ref_crc);
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +
> +		data.bops = buf_ops_create(data.drm_fd);
> +
> +		igt_display_reset(&data.display);
> +	}
> +
> +	igt_describe("Test dirtyFB ioctl");
> +	igt_subtest_with_dynamic("dirtyfb-ioctl") {
> +		data.pipe = PIPE_A;
> +		for_each_valid_output_on_pipe(&data.display, data.pipe,
> +					      data.output) {
> +			for (data.feature = FEATURE_DEFAULT; data.feature > 0;
> +			     data.feature = data.feature >> 1) {
> +				igt_dynamic_f("%s-%s", feature_str(data.feature),
> +					      igt_output_name(data.output)) {

Do we only care about PIPE_A here? Otherwise I would try to use each 
pipe at least once, since there are 2 fbc's on MTL, and some things may 
or may not work on different pipes.

In that case, I would run the default feature test separately and first 
on each pipe, otherwise the defaults are only tested on pipe A.

Cheers,

~Maarten

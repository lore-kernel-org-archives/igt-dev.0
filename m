Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D78810E4AA
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 16:04:28 +0000 (UTC)
Date: Fri, 30 Jun 2023 18:02:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230630160250.i75hebwk7oudhrbu@kamilkon-desk1>
References: <20230629151001.13821-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230629151001.13821-1-HaoPing.Liu@amd.com>
Subject: Re: [igt-dev] [PATCH] tests/amdgpu/amd_checksum_region: Add test
 for checksum_region
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alan Liu <HaoPing.Liu@amd.com>, Lili.Gong@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Alan,

On 2023-06-29 at 23:10:01 +0800, Alan Liu wrote:
> Introduce IGT of checksum_region. Checksum_region allows userspace to
> set a region on display and get the CRC data accordingly via CRTC
> properties: CHECKSUM_REGION and CEHCKSUM_CRC.
> This IGT provides tests to validate if region can be set correctly and
> also the corresponding CRC data is as expect.

Run your test with --describe option like:

sudo ./amd_checksum_region --describe

> 
> Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
> ---
>  include/drm-uapi/drm_mode.h        |  42 ++
------------------- ^^^^^^^^^^
Please send it as separate patch with title like:

drm-uapi/drm_mode: sync with latest uAPI changes

>  lib/igt_kms.c                      |   2 +
>  lib/igt_kms.h                      |   2 +
>  tests/amdgpu/amd_checksum_region.c | 648 +++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build           |   1 +
>  5 files changed, 695 insertions(+)
>  create mode 100644 tests/amdgpu/amd_checksum_region.c
> 
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index e4a2570a6..dec073921 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -1209,6 +1209,48 @@ struct drm_mode_rect {
>  	__s32 y2;
>  };
>  
> +/**
> + * struct drm_checksum_region - The enablement and region of checksum_region
> + * @x_start: Horizontal starting coordinate of the region.
> + * @y_start: Vertical starting coordinate of the region.
> + * @x_end: Horizontal ending coordinate of the region.
> + * @y_end: Vertical ending coordinate of the region.
> + * @checksum_region_enable: To enable or disable checksum_region.
> + *
> + * Userspace uses this structure to configure the region and enablement for
> + * checksum_region. Userspace should not submit a region out of the displayable
> + * region because there is nothing to display and need protection.
> + */
> +struct drm_checksum_region {
> +        __u32 x_start;
> +        __u32 y_start;
> +        __u32 x_end;
> +        __u32 y_end;
> +        __u8 checksum_region_enable;
> +        __u8 pad[7];
> +};
> +
> +/**
> + * struct drm_checksum_crc - The CRC value of the corresponding checksum region.
> + * @crc_r: CRC value of red color.
> + * @crc_g: CRC value of green color.
> + * @crc_b: CRC value of blue color.
> + * @frame_count: a referenced frame count to indicate which frame the CRC values
> + *  are generated at.
> + *
> + * Userspace uses this structure to retrieve the CRC values of the current
> + * checksum region. @frame_count will be reset once a new region is updated or
> + * it reaches a maximum value. Currently these CRC values are designed to
> + * be validated with pre-saved CRC values, so userspace doesn't need to concern
> + * about the algorithm used to compute the CRC.
> + */
> +struct drm_checksum_crc {
> +        __u32 crc_r;
> +        __u32 crc_g;
> +        __u32 crc_b;
> +        __u32 frame_count;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f2b0eed57..804a71e9d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -627,6 +627,8 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
>  	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
>  	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
>  	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
> +	[IGT_CRTC_CHECKSUM_REGION] = "CHECKSUM_REGION",
> +	[IGT_CRTC_CHECKSUM_CRC] = "CHECKSUM_CRC",
>  };
>  
>  const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 1b6988c17..80a5817e4 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -139,6 +139,8 @@ enum igt_atomic_crtc_properties {
>         IGT_CRTC_OUT_FENCE_PTR,
>         IGT_CRTC_VRR_ENABLED,
>         IGT_CRTC_SCALING_FILTER,
> +       IGT_CRTC_CHECKSUM_REGION,
> +       IGT_CRTC_CHECKSUM_CRC,
>         IGT_NUM_CRTC_PROPS
>  };
>  
> diff --git a/tests/amdgpu/amd_checksum_region.c b/tests/amdgpu/amd_checksum_region.c
> new file mode 100644
> index 000000000..8b97eb8e3
> --- /dev/null
> +++ b/tests/amdgpu/amd_checksum_region.c
> @@ -0,0 +1,648 @@
> +/*
> + * Copyright 2019 Advanced Micro Devices, Inc.
> + *

Use SPDX MIT licence, see other .c/.h files with SPDX.
Use checkpatch.pl script from Linux kernel.

> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"

Place igt headers after system ones (below).

> +#include <fcntl.h>
> +#include <string.h>
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +
> +typedef uint64_t u64;
> +typedef uint32_t u32;
> +typedef uint8_t u8;
> +
> +#define CRTC_SET_NUM	  2
> +int crtc_set_num = 0;
> +
> +enum roi_type {
> +	ROI_TYPE_FIRST,		// 100, 100, 130, 130
> +	ROI_TYPE_BOTTOM,	// 1060, 100, 1090, 130
> +	ROI_TYPE_RIGHT,		// 100, 130, 130, 160
> +	ROI_TYPE_RIGHT_BOTTOM,	// 1060, 130, 1090, 160
> +	ROI_TYPE_NUM,
> +};
> +
> +typedef struct drm_checksum_region roi_t;
> +typedef struct drm_checksum_crc crc_t;
> +
> +struct data_basic {
> +	struct {
> +		igt_fb_t fb;
> +		roi_t roi[ROI_TYPE_NUM];
> +	} input;
> +	struct {
> +		roi_t *roi[ROI_TYPE_NUM];
> +		crc_t *crc[ROI_TYPE_NUM];
> +		crc_t *crc_hold[ROI_TYPE_NUM];
> +	} output;
> +};
> +
> +struct data_switching {
> +	struct {
> +		igt_fb_t fb[2];
> +		roi_t roi_window;
> +		roi_t roi_full_screen;
> +	} input;
> +	struct {
> +		crc_t *crc_window[2];
> +		crc_t *crc_full_screen[2];
> +	} output;
> +};
> +
> +struct data_suspend {
> +	struct {
> +		igt_fb_t fb;
> +		roi_t roi;
> +	} input;
> +	struct {
> +		crc_t *crc[2];
> +	} output;
> +};
> +
> +typedef struct __set {
> +	u8		crtc_id;
> +	int		connector_type;
> +	igt_plane_t	*primary;
> +	igt_output_t	*output;
> +	igt_pipe_t	*pipe;
> +	igt_pipe_crc_t	*pipe_crc;
> +	enum pipe	pipe_id;
> +	void *data;
> +} set_t;
> +
> +/* global configuration */
> +typedef struct conf {
> +	struct igt_fb pattern_fb_info;
> +	int fd;
> +	igt_display_t display;
> +	bool use_virtual_connector;
> +	set_t set[CRTC_SET_NUM];
> +} conf_t;
> +
> +/* Use mode 1920x1080 */
> +static drmModeModeInfo _mode = {
> +	148500,
> +	1920, 2008, 2052, 2200, 0,
> +	1080, 1084, 1089, 1125, 0,
> +	60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC| DRM_MODE_FLAG_PIC_AR_16_9,
> +	0x40, "1920x1080"
> +};
> +
> +static void wait_vblanks(int fd, int n_vblanks)
> +{
> +	drmVBlank vblank;
> +
> +	if (!n_vblanks)
> +		return;
> +
> +	vblank.request.type = DRM_VBLANK_RELATIVE;
> +	vblank.request.sequence = n_vblanks;
> +	vblank.request.signal = 0;
> +	drmWaitVBlank(fd, &vblank);
> +}
> +
> +static void draw_color_roi(igt_fb_t *fb, roi_t *roi,
> +			int r, int g, int b)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +
> +	igt_paint_color(cr,
> +		roi->x_start, roi->y_start, roi->x_end, roi->y_end,
> +		r, g, b);
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +/* color pattern for DP */
> +static void draw_color_pattern_DP(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +
> +	igt_paint_color(cr, 0, 0, fb->width/2, fb->height, 100, 255, 0);
> +	igt_paint_color(cr, fb->width/2, 0, fb->width, fb->height, 0, 133, 204);
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +/* color pattern for HDMI */
> +static void draw_color_pattern_HDMI(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +
> +	igt_paint_color(cr, 0, 0, fb->width/2, fb->height, 0, 200, 223);
> +	igt_paint_color(cr, fb->width/2, 0, fb->width, fb->height, 223, 200, 1);
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +/* prepare conf and set */
> +static void test_init(conf_t *conf)
> +{
> +	igt_display_t *display = &conf->display;
> +	set_t *set;
> +	drmModeConnector *conn;
> +	drmModeModeInfo *mode = &_mode;
> +
> +	igt_info("board has %d outputs\n", display->n_outputs);
> +
> +	for (int i=0; i < display->n_outputs; i++) {
> +		conn = display->outputs[i].config.connector;
> +		if (conn->connection != DRM_MODE_CONNECTED)
> +			continue;
> +
> +		if (conn->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> +		    conn->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
> +			continue;
> +
> +		set = &conf->set[crtc_set_num];
> +		set->connector_type = conn->connector_type;
> +		set->crtc_id = i;
> +		set->pipe_id = i;
> +		set->pipe = &display->pipes[i];
> +		set->primary = igt_pipe_get_plane_type(set->pipe, DRM_PLANE_TYPE_PRIMARY);
> +		set->output = &display->outputs[i];
> +
> +		igt_output_set_pipe(set->output, set->pipe_id);
> +		igt_output_override_mode(set->output, mode);
> +
> +		crtc_set_num += 1;
> +		if (crtc_set_num == CRTC_SET_NUM)
> +			break;
> +	}
> +
> +	igt_assert(crtc_set_num > 0);
> +	igt_info("crtc_set_num = %d\n", crtc_set_num);
> +}
> +
> +static void print_crc(crc_t *crc)
> +{
> +	igt_info("crc: 0x%04x 0x%04x 0x%04x, %04d\n",
> +		crc->crc_r, crc->crc_g, crc->crc_b, crc->frame_count);
> +}
> +
> +static bool roi_compare(roi_t *a, roi_t *b)
> +{
> +	return (a->x_start == b->x_start &&
> +		a->y_start == b->y_start &&
> +		a->x_end == b->x_end &&
> +		a->y_end == b->y_end);
> +}
> +
> +static bool crc_compare(crc_t *a, crc_t *b)
> +{
> +	return (a->crc_r == b->crc_r &&
> +		a->crc_g == b->crc_g &&
> +		a->crc_b == b->crc_b);
> +}
> +
> +static void
> +disable_checksum_region_from_property(conf_t *conf)
> +{
> +	set_t *set;
> +	roi_t roi = {0};
> +
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		igt_require(igt_pipe_obj_has_prop(set->pipe, IGT_CRTC_CHECKSUM_REGION));
> +		igt_pipe_obj_replace_prop_blob(set->pipe, IGT_CRTC_CHECKSUM_REGION, &roi, sizeof(roi));
> +	}
> +}
> +
> +static void
> +set_roi_from_property(igt_pipe_t *pipe, roi_t *roi)
> +{
> +	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_CHECKSUM_REGION));
> +	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_CHECKSUM_REGION, roi, sizeof(roi_t));
> +}
> +
> +static void
> +set_roi(conf_t *conf, set_t *set, roi_t *roi)
> +{
> +	set_roi_from_property(set->pipe, roi);
> +	igt_info("Set roi, x_start:%d, y_start:%d, x_end:%d, y_end: %d",
> +		roi->x_start, roi->y_start, roi->x_end, roi->y_end);
> +	igt_info("\t");
> +}
> +
> +static roi_t *
> +get_roi_from_property(int fd, igt_pipe_t *pipe)
> +{
> +	drmModePropertyBlobPtr blob;
> +	u64 blob_id = igt_pipe_obj_get_prop(pipe, IGT_CRTC_CHECKSUM_REGION);
> +
> +	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_CHECKSUM_REGION));
> +
> +	blob = drmModeGetPropertyBlob(fd, blob_id);
> +	if (!blob)
> +		return NULL;
> +
> +	return (roi_t *) blob->data;
> +}
> +
> +static void
> +get_roi(conf_t *conf, set_t *set, roi_t **roi)
> +{
> +	*roi = get_roi_from_property(conf->display.drm_fd, set->pipe);
> +	if (*roi) {
> +		igt_info("get ROI from properties: ");
> +		igt_info("0x%04x 0x%04x 0x%04x, 0x%04x, %d",
> +				(*roi)->x_start, (*roi)->y_start,
> +				(*roi)->x_end,   (*roi)->y_end,
> +				(*roi)->checksum_region_enable);
> +	}
> +	igt_info("\t");
> +}
> +
> +static crc_t *
> +get_crc_from_property(int fd, igt_pipe_t *pipe)
> +{
> +	drmModePropertyBlobPtr blob;
> +	u64 blob_id = igt_pipe_obj_get_prop(pipe, IGT_CRTC_CHECKSUM_CRC);
> +
> +	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_CHECKSUM_CRC));
> +
> +	blob = drmModeGetPropertyBlob(fd, blob_id);
> +	if (!blob)
> +		return NULL;
> +
> +	return (crc_t *) blob->data;
> +}
> +
> +static void
> +get_crc(conf_t *conf, set_t *set, crc_t **crc)
> +{
> +	*crc = get_crc_from_property(conf->display.drm_fd, set->pipe);
> +	if (*crc) {
> +		igt_info("get CRC from properties: ");
> +		igt_info("0x%04x 0x%04x 0x%04x, %04d",
> +			(*crc)->crc_r, (*crc)->crc_g, (*crc)->crc_b, (*crc)->frame_count);
> +	}
> +	igt_info("\t");
> +}
> +
> +static void
> +test_basic_init(conf_t *conf, struct data_basic *_data)
> +{
> +	drmModeModeInfo *mode = &_mode;
> +	set_t *set;
> +	struct data_basic *data;
> +
> +	for (int i=0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		data = &_data[i];
> +
> +		/* init data */
> +		data->input.roi[ROI_TYPE_FIRST].x_start = 100;
> +		data->input.roi[ROI_TYPE_FIRST].y_start = 100;
> +		data->input.roi[ROI_TYPE_FIRST].x_end = 130;
> +		data->input.roi[ROI_TYPE_FIRST].y_end = 130;
> +		data->input.roi[ROI_TYPE_FIRST].checksum_region_enable= 1;
> +
> +		data->input.roi[ROI_TYPE_RIGHT].x_start = 1060;
> +		data->input.roi[ROI_TYPE_RIGHT].y_start = 100;
> +		data->input.roi[ROI_TYPE_RIGHT].x_end = 1100;
> +		data->input.roi[ROI_TYPE_RIGHT].y_end = 130;
> +		data->input.roi[ROI_TYPE_RIGHT].checksum_region_enable= 1;
> +
> +		data->input.roi[ROI_TYPE_BOTTOM].x_start = 100;
> +		data->input.roi[ROI_TYPE_BOTTOM].y_start = 130;
> +		data->input.roi[ROI_TYPE_BOTTOM].x_end = 130;
> +		data->input.roi[ROI_TYPE_BOTTOM].y_end = 160;
> +		data->input.roi[ROI_TYPE_BOTTOM].checksum_region_enable= 1;
> +
> +		data->input.roi[ROI_TYPE_RIGHT_BOTTOM].x_start = 1060;
> +		data->input.roi[ROI_TYPE_RIGHT_BOTTOM].y_start = 130;
> +		data->input.roi[ROI_TYPE_RIGHT_BOTTOM].x_end = 1100;
> +		data->input.roi[ROI_TYPE_RIGHT_BOTTOM].y_end = 160;
> +		data->input.roi[ROI_TYPE_RIGHT_BOTTOM].checksum_region_enable= 1;
> +
> +		/* paint fb */
> +		igt_create_fb(conf->fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888, 0, &data->input.fb);
> +
> +		if (set->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> +			draw_color_pattern_DP(&data->input.fb);
> +		else
> +			draw_color_pattern_HDMI(&data->input.fb);
> +
> +		igt_plane_set_fb(set->primary, &data->input.fb);
> +	}
> +}
> +
> +static void test_basic_validate(struct data_basic *_data)
> +{
> +	struct data_basic *data;
> +	roi_t *roi, *roi_return;
> +	crc_t **crc, **crc_hold;
> +
> +	igt_info("************\n");
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		data = &_data[i];
> +
> +		for (int type = 0; type < ROI_TYPE_NUM; type++) {
> +			roi = &data->input.roi[type];
> +			roi_return = data->output.roi[type];
> +			if (!roi_compare(roi, roi_return))
> +				igt_assert_f(false, "ROI values are not as expected\n");
> +		}
> +
> +		crc = data->output.crc;
> +		if (!crc_compare(crc[ROI_TYPE_FIRST], crc[ROI_TYPE_BOTTOM]) &&
> +		    !crc_compare(crc[ROI_TYPE_RIGHT], crc[ROI_TYPE_RIGHT_BOTTOM]))
> +			igt_assert_f(false, "CRC values are not as expected\n");
> +
> +		if (crc[ROI_TYPE_FIRST]->frame_count != 2 ||
> +		    crc[ROI_TYPE_BOTTOM]->frame_count != 2 ||
> +		    crc[ROI_TYPE_RIGHT]->frame_count != 2 ||
> +		    crc[ROI_TYPE_RIGHT_BOTTOM]->frame_count != 2)
> +			igt_assert_f(false, "CRC frame_count are not as expected\n");
> +
> +		crc_hold = data->output.crc_hold;
> +		if (!crc_compare(crc[ROI_TYPE_FIRST], crc_hold[ROI_TYPE_FIRST]) &&
> +		    !crc_compare(crc[ROI_TYPE_BOTTOM], crc_hold[ROI_TYPE_BOTTOM]) &&
> +		    !crc_compare(crc[ROI_TYPE_RIGHT], crc_hold[ROI_TYPE_RIGHT]) &&
> +		    !crc_compare(crc[ROI_TYPE_RIGHT_BOTTOM], crc_hold[ROI_TYPE_RIGHT_BOTTOM]))
> +			igt_assert_f(false, "CRC values are not as expected after 5 seconds\n");
> +
> +	}
> +
> +	igt_info("Test checksum_region basic passed\n");
> +}
> +
> +static void
> +test_basic_case(conf_t *conf, enum roi_type type, struct data_basic *data)
> +{
> +	set_t *set;
> +	roi_t *roi;
> +	roi_t **roi_return;
> +	crc_t **crc;
> +
> +	igt_info("\n===== start to test a crc window =====\n");
> +
> +	/* set roi for each CRTC */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		roi = &data[i].input.roi[type];
> +		set_roi(conf, set, roi);
> +	}
> +	igt_display_commit_atomic(&conf->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);	// commit new ROI
> +	igt_info("\n");
> +
> +
> +	/* get the crc for check */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		crc = &data[i].output.crc[type];
> +		get_crc(conf, set, crc);
> +	}
> +	igt_info("\n");
> +
> +
> +	/* sleep and get crc for check again*/
> +	sleep(3);
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		crc = &data[i].output.crc_hold[type];
> +		get_crc(conf, set, crc);
> +	}
> +	igt_info("\n");
> +
> +
> +	/* get roi for check */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		roi_return = &data[i].output.roi[type];
> +		get_roi(conf, set, roi_return);
> +	}
> +	igt_info("\n");
> +}
> +
> +static void test_fini(conf_t *conf)
> +{
> +	disable_checksum_region_from_property(conf);
> +	igt_display_commit_atomic(&conf->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +}
> +
> +static void
> +test_checksum_region_basic(conf_t *conf)
> +{
> +	struct data_basic data[CRTC_SET_NUM] = {0};
> +
> +	/* test basic init */
> +	test_basic_init(conf, data);
> +
> +	test_basic_case(conf, ROI_TYPE_FIRST, data);
> +	test_basic_case(conf, ROI_TYPE_RIGHT, data);
> +	test_basic_case(conf, ROI_TYPE_BOTTOM, data);
> +	test_basic_case(conf, ROI_TYPE_RIGHT_BOTTOM, data);
> +
> +	test_basic_validate(data);
> +
> +	test_fini(conf);
> +}
> +
> +static void
> +test_switching_validate(struct data_switching *data)
> +{
> +	crc_t *crc_a, *crc_b;
> +
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		crc_a = data[i].output.crc_window[0];
> +		crc_b = data[i].output.crc_window[1];
> +
> +		print_crc(crc_a);
> +		print_crc(crc_b);
> +
> +		if (!crc_compare(crc_a, crc_b))
> +			igt_assert_f(false, "Window crc values should be the same\n");
> +
> +
> +		crc_a = data[i].output.crc_full_screen[0];
> +		crc_b = data[i].output.crc_full_screen[1];
> +
> +		print_crc(crc_a);
> +		print_crc(crc_b);
> +
> +		if (crc_compare(crc_a, crc_b))
> +			igt_assert_f(false, "Full screen crc values should not be the same\n");
> +	}
> +
> +	igt_info("Test checksum_region switching passed\n");
> +}
> +
> +static void
> +test_switching_init(conf_t *conf, struct data_switching *_data)
> +{
> +	drmModeModeInfo *mode = &_mode;
> +	roi_t *roi;
> +	struct data_switching *data;
> +	struct igt_fb *fb;
> +
> +	for (int i=0; i < crtc_set_num; i++) {
> +		data = &_data[i];
> +
> +		/* crc window roi */
> +		roi = &data->input.roi_window;
> +		roi->x_start = 100;
> +		roi->y_start = 100;
> +		roi->x_end = 130;
> +		roi->y_end = 130;
> +		roi->checksum_region_enable = 1;
> +
> +		/* full screen roi */
> +		roi = &data->input.roi_full_screen;
> +		roi->x_start = 0;
> +		roi->y_start = 0;
> +		roi->x_end = mode->hdisplay;
> +		roi->y_end = mode->vdisplay;
> +		roi->checksum_region_enable = 1;
> +
> +		/* paint fb with blue background, red rect */
> +		fb = &data->input.fb[0];
> +		igt_create_fb(conf->fd, mode->hdisplay, mode->vdisplay,
> +			DRM_FORMAT_XRGB8888, 0, fb);
> +		draw_color_roi(fb, &data->input.roi_full_screen, 0, 0, 255);
> +		draw_color_roi(fb, &data->input.roi_window, 255, 0, 0);
> +
> +
> +		/* paint fb with green background, red retc */
> +		fb = &data->input.fb[1];
> +		igt_create_fb(conf->fd, mode->hdisplay, mode->vdisplay,
> +			DRM_FORMAT_XRGB8888, 0, fb);
> +		draw_color_roi(fb, &data->input.roi_full_screen, 0, 255, 0);
> +		draw_color_roi(fb, &data->input.roi_window, 255, 0, 0);
> +	}
> +}
> +
> +static void
> +test_switching_case(conf_t *conf, struct data_switching *data, bool is_window)
> +{
> +	set_t *set;
> +	igt_fb_t *fb;
> +	roi_t *roi, *roi_return;
> +	crc_t **crc;
> +
> +	/* change pattern */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		fb = &data[i].input.fb[0];
> +		igt_plane_set_fb(set->primary, fb);
> +	}
> +
> +	/* set crc window roi */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		roi = (is_window) ? &data[i].input.roi_window
> +				  : &data[i].input.roi_full_screen;
> +		set_roi(conf, set, roi);
> +	}
> +	igt_display_commit_atomic(&conf->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_info("\n");
> +
> +
> +	/* get crc window roi and print for debug */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		get_roi(conf, set, &roi_return);
> +	}
> +	igt_info("\n");
> +
> +
> +	/* get the window crc */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		crc = (is_window) ? &data[i].output.crc_window[0]
> +				  : &data[i].output.crc_full_screen[0];
> +		get_crc(conf, set, crc);
> +	}
> +	igt_info("\n");
> +
> +
> +	/* change pattern */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		fb = &data[i].input.fb[1];
> +		igt_plane_set_fb(set->primary, fb);
> +	}
> +	igt_display_commit_atomic(&conf->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	/* wait 1 frame for new crc computed */
> +	wait_vblanks(conf->fd, 1);
> +
> +	/* get the window crc */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &conf->set[i];
> +		crc = (is_window) ? &data[i].output.crc_window[1]
> +				  : &data[i].output.crc_full_screen[1];
> +		get_crc(conf, set, crc);
> +	}
> +	igt_info("\n");
> +}
> +
> +static void
> +test_checksum_region_switching(conf_t *conf)
> +{
> +	struct data_switching data[CRTC_SET_NUM] = {0};
> +
> +	/* test basic init */
> +	test_switching_init(conf, data);
> +
> +	/* crc_window */
> +	test_switching_case(conf, data, true);
> +
> +	/* full screen */
> +	test_switching_case(conf, data, false);
> +
> +	test_switching_validate(data);
> +
> +	test_fini(conf);
> +}
> +
> +igt_main
> +{
> +	conf_t conf = {0};
> +
> +	igt_skip_on_simulation();
> +
> +	igt_fixture
> +	{
> +		conf.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&conf.display, conf.fd);
> +		igt_require(conf.display.is_atomic);
> +		igt_display_require_output(&conf.display);
> +	}
> +
> +	test_init(&conf);
> +
> +	igt_describe("Test basic");
> +	igt_subtest("checksum-region-basic")
> +	test_checksum_region_basic(&conf);
> +
> +	igt_describe("Test switching");
> +	igt_subtest("checksum-region-switching")
> +	test_checksum_region_switching(&conf);
> +
> +	igt_fixture
> +	{
> +		igt_display_fini(&conf.display);
> +		close(conf.fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 7fff7602f..aa51abfa2 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -24,6 +24,7 @@ if libdrm_amdgpu.found()
>  			  'amd_psr',
>  			  'amd_plane',
>  			  'amd_ilr',
> +			  'amd_checksum_region',
------------------------------ ^
Try to keep it sorted alphabetically.

Regards,
Kamil

>  			]
>  	amdgpu_deps += libdrm_amdgpu
>  endif
> -- 
> 2.34.1
> 

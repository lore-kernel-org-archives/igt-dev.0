Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40B910E422
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 18:01:16 +0000 (UTC)
Date: Tue, 11 Jul 2023 20:01:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230711180111.5my4rp6og7njbrsb@kamilkon-desk1>
References: <20230705152606.13117-1-HaoPing.Liu@amd.com>
 <20230705152606.13117-2-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230705152606.13117-2-HaoPing.Liu@amd.com>
Subject: Re: [igt-dev] [PATCH v3 2/2] tests/amdgpu/amd_checksum_region: Add
 test for checksum_region
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

On 2023-07-05 at 23:26:06 +0800, Alan Liu wrote:
> Introduce IGT of checksum_region. Checksum_region allows userspace to
> set a region on display and get the CRC data accordingly via CRTC
> properties: CHECKSUM_REGION and CEHCKSUM_CRC.
> 
> This IGT validates checksum region feature by testing if we can set
> we can set regions successfully and check if the corresponding CRC
> values are as expected.
> 
> v2
> - Add test description
> - Separate uAPI change to another patch
> - Declare with SPDX MIT licence
> - Include igt headers after system headers
> - Add this igt into meson.build in alphabetical order
> 
> v3
> - Replace wait_vblank() by igt_wait_for_vblank_count()
> - Improve the format of print information
> 
> Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
> ---
>  lib/igt_kms.c                      |   2 +
>  lib/igt_kms.h                      |   2 +

Please split changes in lib/igt_kms.* into separate patch with
this patchseries.

Reagards,
Kamil

>  tests/amdgpu/amd_checksum_region.c | 615 +++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build           |   1 +
>  4 files changed, 620 insertions(+)
>  create mode 100644 tests/amdgpu/amd_checksum_region.c
> 
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
> index 000000000..3553363e6
> --- /dev/null
> +++ b/tests/amdgpu/amd_checksum_region.c
> @@ -0,0 +1,615 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + */
> +
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdio.h>
> +#include <unistd.h>
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +IGT_TEST_DESCRIPTION("This IGT validates checksum region feature by testing if"
> +	" we can set regions successfully and check if the corresponding CRC"
> +	" values are as expected.");
> +
> +typedef uint64_t u64;
> +typedef uint32_t u32;
> +typedef uint8_t u8;
> +
> +#define CRTC_SET_NUM	  2
> +int crtc_set_num;
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
> +typedef struct {
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
> +/* global data */
> +typedef struct data {
> +	struct igt_fb pattern_fb_info;
> +	int fd;
> +	igt_display_t display;
> +	bool use_virtual_connector;
> +	set_t set[CRTC_SET_NUM];
> +} data_t;
> +
> +/* Use mode 1920x1080 */
> +static drmModeModeInfo _mode = {
> +	148500,
> +	1920, 2008, 2052, 2200, 0,
> +	1080, 1084, 1089, 1125, 0,
> +	60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +	0x40, "1920x1080"
> +};
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
> +/* prepare data and set */
> +static void test_init(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	set_t *set;
> +	drmModeConnector *conn;
> +	drmModeModeInfo *mode = &_mode;
> +
> +	igt_info("board has %d outputs\n", display->n_outputs);
> +
> +	for (int i = 0; i < display->n_outputs; i++) {
> +		conn = display->outputs[i].config.connector;
> +		if (conn->connection != DRM_MODE_CONNECTED)
> +			continue;
> +
> +		if (conn->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> +		    conn->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
> +			continue;
> +
> +		set = &data->set[crtc_set_num];
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
> +	igt_info("crtc_set_num = %d\n", crtc_set_num);
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
> +disable_checksum_region_from_property(data_t *data)
> +{
> +	set_t *set;
> +	roi_t roi = {0};
> +
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
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
> +set_roi(data_t *data, set_t *set, roi_t *roi)
> +{
> +	set_roi_from_property(set->pipe, roi);
> +	igt_info("Set roi, x_start:%4d, y_start:%4d, x_end:%4d, y_end:%4d",
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
> +get_roi(data_t *data, set_t *set, roi_t **roi)
> +{
> +	*roi = get_roi_from_property(data->display.drm_fd, set->pipe);
> +	if (*roi) {
> +		igt_info("get ROI from properties: ");
> +		igt_info("0x%04x 0x%04x 0x%04x 0x%04x, %4d",
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
> +get_crc(data_t *data, set_t *set, crc_t **crc)
> +{
> +	*crc = get_crc_from_property(data->display.drm_fd, set->pipe);
> +	if (*crc) {
> +		igt_info("get CRC from properties: ");
> +		igt_info("0x%04x 0x%04x 0x%04x, %4d",
> +			(*crc)->crc_r, (*crc)->crc_g, (*crc)->crc_b, (*crc)->frame_count);
> +	}
> +	igt_info("\t\t");
> +}
> +
> +static void
> +test_basic_init(data_t *data, struct data_basic *_basic)
> +{
> +	drmModeModeInfo *mode = &_mode;
> +	set_t *set;
> +	struct data_basic *basic;
> +
> +	igt_info("\n");
> +
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		basic = &_basic[i];
> +
> +		/* init data */
> +		basic->input.roi[ROI_TYPE_FIRST].x_start = 100;
> +		basic->input.roi[ROI_TYPE_FIRST].y_start = 100;
> +		basic->input.roi[ROI_TYPE_FIRST].x_end = 130;
> +		basic->input.roi[ROI_TYPE_FIRST].y_end = 130;
> +		basic->input.roi[ROI_TYPE_FIRST].checksum_region_enable = 1;
> +
> +		basic->input.roi[ROI_TYPE_RIGHT].x_start = 1060;
> +		basic->input.roi[ROI_TYPE_RIGHT].y_start = 100;
> +		basic->input.roi[ROI_TYPE_RIGHT].x_end = 1100;
> +		basic->input.roi[ROI_TYPE_RIGHT].y_end = 130;
> +		basic->input.roi[ROI_TYPE_RIGHT].checksum_region_enable = 1;
> +
> +		basic->input.roi[ROI_TYPE_BOTTOM].x_start = 100;
> +		basic->input.roi[ROI_TYPE_BOTTOM].y_start = 130;
> +		basic->input.roi[ROI_TYPE_BOTTOM].x_end = 130;
> +		basic->input.roi[ROI_TYPE_BOTTOM].y_end = 160;
> +		basic->input.roi[ROI_TYPE_BOTTOM].checksum_region_enable = 1;
> +
> +		basic->input.roi[ROI_TYPE_RIGHT_BOTTOM].x_start = 1060;
> +		basic->input.roi[ROI_TYPE_RIGHT_BOTTOM].y_start = 130;
> +		basic->input.roi[ROI_TYPE_RIGHT_BOTTOM].x_end = 1100;
> +		basic->input.roi[ROI_TYPE_RIGHT_BOTTOM].y_end = 160;
> +		basic->input.roi[ROI_TYPE_RIGHT_BOTTOM].checksum_region_enable = 1;
> +
> +		/* paint fb */
> +		igt_create_fb(data->fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888, 0, &basic->input.fb);
> +
> +		if (set->connector_type == DRM_MODE_CONNECTOR_HDMIA)
> +			draw_color_pattern_HDMI(&basic->input.fb);
> +		else
> +			draw_color_pattern_DP(&basic->input.fb);
> +
> +		igt_plane_set_fb(set->primary, &basic->input.fb);
> +
> +		igt_info("Output: %s\t\t\t\t\t\t\t",
> +			(set->connector_type == DRM_MODE_CONNECTOR_HDMIA) ? "HDMI" : "DP");
> +	}
> +}
> +
> +static void test_basic_validate(struct data_basic *_basic)
> +{
> +	struct data_basic *basic;
> +	roi_t *roi, *roi_return;
> +	crc_t **crc, **crc_hold;
> +
> +	igt_info("************\n");
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		basic = &_basic[i];
> +
> +		for (int type = 0; type < ROI_TYPE_NUM; type++) {
> +			roi = &basic->input.roi[type];
> +			roi_return = basic->output.roi[type];
> +			if (!roi_compare(roi, roi_return))
> +				igt_assert_f(false, "ROI values are not as expected\n");
> +		}
> +
> +		crc = basic->output.crc;
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
> +		crc_hold = basic->output.crc_hold;
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
> +test_basic_case(data_t *data, enum roi_type type, struct data_basic *basic)
> +{
> +	set_t *set;
> +	roi_t *roi;
> +	roi_t **roi_return;
> +	crc_t **crc;
> +
> +	igt_info("\n");
> +
> +	/* set roi for each CRTC */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		roi = &basic[i].input.roi[type];
> +		set_roi(data, set, roi);
> +	}
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);	// commit new ROI
> +	igt_info("\n");
> +
> +
> +	/* get the crc for check */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		crc = &basic[i].output.crc[type];
> +		get_crc(data, set, crc);
> +	}
> +	igt_info("\n");
> +
> +
> +	/* sleep and get crc for check again*/
> +	sleep(3);
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		crc = &basic[i].output.crc_hold[type];
> +		get_crc(data, set, crc);
> +	}
> +	igt_info("\n");
> +
> +
> +	/* get roi for check */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		roi_return = &basic[i].output.roi[type];
> +		get_roi(data, set, roi_return);
> +	}
> +	igt_info("\n");
> +}
> +
> +static void test_fini(data_t *data)
> +{
> +	disable_checksum_region_from_property(data);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +}
> +
> +static void
> +test_checksum_region_basic(data_t *data)
> +{
> +	struct data_basic d_basic[CRTC_SET_NUM] = {0};
> +
> +	/* test basic init */
> +	test_basic_init(data, d_basic);
> +
> +	test_basic_case(data, ROI_TYPE_FIRST, d_basic);
> +	test_basic_case(data, ROI_TYPE_RIGHT, d_basic);
> +	test_basic_case(data, ROI_TYPE_BOTTOM, d_basic);
> +	test_basic_case(data, ROI_TYPE_RIGHT_BOTTOM, d_basic);
> +
> +	test_basic_validate(d_basic);
> +
> +	test_fini(data);
> +}
> +
> +static void
> +test_switching_validate(struct data_switching *switching)
> +{
> +	crc_t *crc_a, *crc_b;
> +
> +	igt_info("************\n");
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		crc_a = switching[i].output.crc_window[0];
> +		crc_b = switching[i].output.crc_window[1];
> +
> +		if (!crc_compare(crc_a, crc_b))
> +			igt_assert_f(false, "Window crc values should be the same\n");
> +
> +
> +		crc_a = switching[i].output.crc_full_screen[0];
> +		crc_b = switching[i].output.crc_full_screen[1];
> +
> +		if (crc_compare(crc_a, crc_b))
> +			igt_assert_f(false, "Full screen crc values should not be the same\n");
> +	}
> +
> +	igt_info("Test checksum_region switching passed\n");
> +}
> +
> +static void
> +test_switching_init(data_t *data, struct data_switching *_switching)
> +{
> +	drmModeModeInfo *mode = &_mode;
> +	roi_t *roi;
> +	set_t *set;
> +	struct data_switching *switching;
> +	struct igt_fb *fb;
> +
> +	igt_info("\n");
> +
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		switching = &_switching[i];
> +		set = &data->set[i];
> +
> +		/* crc window roi */
> +		roi = &switching->input.roi_window;
> +		roi->x_start = 100;
> +		roi->y_start = 100;
> +		roi->x_end = 130;
> +		roi->y_end = 130;
> +		roi->checksum_region_enable = 1;
> +
> +		/* full screen roi */
> +		roi = &switching->input.roi_full_screen;
> +		roi->x_start = 0;
> +		roi->y_start = 0;
> +		roi->x_end = mode->hdisplay;
> +		roi->y_end = mode->vdisplay;
> +		roi->checksum_region_enable = 1;
> +
> +		/* paint fb with blue background, red rect */
> +		fb = &switching->input.fb[0];
> +		igt_create_fb(data->fd, mode->hdisplay, mode->vdisplay,
> +			DRM_FORMAT_XRGB8888, 0, fb);
> +		draw_color_roi(fb, &switching->input.roi_full_screen, 0, 0, 255);
> +		draw_color_roi(fb, &switching->input.roi_window, 255, 0, 0);
> +
> +
> +		/* paint fb with green background, red retc */
> +		fb = &switching->input.fb[1];
> +		igt_create_fb(data->fd, mode->hdisplay, mode->vdisplay,
> +			DRM_FORMAT_XRGB8888, 0, fb);
> +		draw_color_roi(fb, &switching->input.roi_full_screen, 0, 255, 0);
> +		draw_color_roi(fb, &switching->input.roi_window, 255, 0, 0);
> +		igt_info("Output: %s\t\t\t\t\t\t\t",
> +			(set->connector_type == DRM_MODE_CONNECTOR_HDMIA) ? "HDMI" : "DP");
> +	}
> +}
> +
> +static void
> +test_switching_case(data_t *data, struct data_switching *switching, bool is_window)
> +{
> +	set_t *set;
> +	igt_fb_t *fb;
> +	roi_t *roi, *roi_return;
> +	crc_t **crc;
> +
> +	igt_info("\n");
> +
> +	/* change pattern */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		fb = &switching[i].input.fb[0];
> +		igt_plane_set_fb(set->primary, fb);
> +	}
> +
> +	/* set crc window roi */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		roi = (is_window) ? &switching[i].input.roi_window
> +				  : &switching[i].input.roi_full_screen;
> +		set_roi(data, set, roi);
> +	}
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_info("\n");
> +
> +
> +	/* get crc window roi and print for debug */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		get_roi(data, set, &roi_return);
> +	}
> +	igt_info("\n");
> +
> +
> +	/* get the window crc */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		crc = (is_window) ? &switching[i].output.crc_window[0]
> +				  : &switching[i].output.crc_full_screen[0];
> +		get_crc(data, set, crc);
> +	}
> +	igt_info("\n");
> +
> +
> +	/* change pattern */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		fb = &switching[i].input.fb[1];
> +		igt_plane_set_fb(set->primary, fb);
> +	}
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	/* wait 1 frame for new crc computed */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		igt_wait_for_vblank_count(data->fd, set->pipe->crtc_offset, 1);
> +	}
> +
> +	/* get the window crc */
> +	for (int i = 0; i < crtc_set_num; i++) {
> +		set = &data->set[i];
> +		crc = (is_window) ? &switching[i].output.crc_window[1]
> +				  : &switching[i].output.crc_full_screen[1];
> +		get_crc(data, set, crc);
> +	}
> +	igt_info("\n");
> +}
> +
> +static void
> +test_checksum_region_switching(data_t *data)
> +{
> +	struct data_switching switching[CRTC_SET_NUM] = {0};
> +
> +	/* test basic init */
> +	test_switching_init(data, switching);
> +
> +	/* crc_window */
> +	test_switching_case(data, switching, true);
> +
> +	/* full screen */
> +	test_switching_case(data, switching, false);
> +
> +	test_switching_validate(switching);
> +
> +	test_fini(data);
> +}
> +
> +igt_main
> +{
> +	data_t data = {0};
> +
> +	igt_skip_on_simulation();
> +
> +	igt_fixture
> +	{
> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +		test_init(&data);
> +	}
> +
> +
> +	igt_describe("Test basic region configuration and validate the CRC.");
> +	igt_subtest("checksum-region-basic")
> +	test_checksum_region_basic(&data);
> +
> +	igt_describe("Test switching between window region and fullscreen region and validate the CRC.");
> +	igt_subtest("checksum-region-switching")
> +	test_checksum_region_switching(&data);
> +
> +	igt_fixture
> +	{
> +		igt_display_fini(&data.display);
> +		close(data.fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 24843de73..e2f03bb49 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -7,6 +7,7 @@ if libdrm_amdgpu.found()
>  			  'amd_basic',
>  			  'amd_bo',
>  			  'amd_bypass',
> +			  'amd_checksum_region',
>  			  'amd_color',
>  			  'amd_cp_dma_misc',
>  			  'amd_cs_nop',
> -- 
> 2.34.1
> 

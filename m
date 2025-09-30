Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDECCCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 10:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7ED10E55C;
	Tue, 30 Sep 2025 10:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jtMh3Ayy";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF5110E55C
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:36:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D0CF94E40DF4;
 Tue, 30 Sep 2025 10:36:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8E4AA606E4;
 Tue, 30 Sep 2025 10:36:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C43A102F17DB; 
 Tue, 30 Sep 2025 12:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759228605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=3lb3JW258n+/LZBs8vTgEAKbQNzb4xWaS3FbLBfBN/o=;
 b=jtMh3Ayyyt49Dqt8SBnoDuPhUY58YyITIn6bHSLtM/EsgCw1uzZATCA7yfC563XayhFtDo
 7KujhUY/vazoxl0RFrnmHPsGb6b+0y/9dHSUynPB8lsEOzqZubOTYGADshqIQVqvUbfFcD
 SW8B5OKWckxhO+O1VXCpix0v4lEnl9ybVdMRrC+tZXo0A9KWMA6gdcgQuibmHHEJz/LPOZ
 2MXgFHfAP4GZG1GYIp/k3cy4Ekt914NTL3puso1/znDMiHzxSoH1W3xsKO1K5h7p2g/e1C
 j5snDscEugrVRQYx2gmsygRIr6aQwYJ7Ayhv6aZ2UqqOLhNVnc5a8cwZ3O4r5w==
Message-ID: <782d02dc-3b1c-48ca-a77c-b7f01801c14b@bootlin.com>
Date: Tue, 30 Sep 2025 12:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 09/30] tests/kms_colorop: Add kms_colorop tests
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-10-alex.hung@amd.com>
Content-Language: en-US, fr
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250815040659.3321102-10-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 15/08/2025 à 06:06, Alex Hung a écrit :
> From: Harry Wentland <harry.wentland@amd.com>
> 
> This tests the color pipeline API, exposed via the
> COLOR PIPELINE plane property and drm_colorop objects.
> 
> We introduce tests for:
>   - sRGB EOTF
>   - sRGB Inverse EOTF
>   - sRGB EOTF + sRGB Inverse EOTF
> 
> The last one is the holy grail of LUT testing. It tests that
> after applying an EOTF, followed by its inverse EOTF we arrive
> back at the original value. We can use this to test for
> precision loss in the pipeline.
> 
> All tests are tested via writeback. All transforms are done in
> SW (in floating point) and at the end the SW transformed buffer
> is compared with the KMS writeback output buffer. The two should
> match within a bracket of acceptable deviations. Since these
> deviations might look different for different KMS drivers we'll
> do this check on a driver-specific basis.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   tests/kms_colorop.c | 508 ++++++++++++++++++++++++++++++++++++++++++++
>   tests/kms_colorop.h |  88 ++++++++
>   tests/meson.build   |   1 +
>   3 files changed, 597 insertions(+)
>   create mode 100644 tests/kms_colorop.c
>   create mode 100644 tests/kms_colorop.h
> 
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> new file mode 100644
> index 000000000..e247477ec
> --- /dev/null
> +++ b/tests/kms_colorop.c
> @@ -0,0 +1,508 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
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
> +#include "igt_color.h"
> +#include "sw_sync.h"
> +#include "kms_colorop.h"
> +
> +/**
> + * TEST: kms colorop
> + * Category: Display
> + * Description: Test to validate the retrieving and setting of DRM colorops
> + *
> + * SUBTEST: plane-%s
> + * Description: Tests DRM colorop properties on a plane
> + * Driver requirement: amdgpu
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @srgb_eotf:                   sRGB EOTF
> + * @srgb_inv_eotf:               sRGB Inverse EOTF
> + * @srgb_eotf-srgb_inv_eotf:     sRGB EOTF -> sRGB Inverse EOTF
> + *
> + */
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
> +static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
> +				    drmModeModeInfo override_mode)
> +{
> +	igt_fb_t input_fb, output_fb;
> +	igt_plane_t *plane;
> +	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
> +	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
> +	int width, height, ret;
> +
> +	igt_output_override_mode(output, &override_mode);
> +
> +	width = override_mode.hdisplay;
> +	height = override_mode.vdisplay;
> +
> +	ret = igt_create_fb(display->drm_fd, width, height,
> +			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
> +	igt_assert(ret >= 0);
> +
> +	ret = igt_create_fb(display->drm_fd, width, height,
> +			    writeback_format, modifier, &output_fb);
> +	igt_assert(ret >= 0);
> +
> +	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(plane, &input_fb);
> +	igt_output_set_writeback_fb(output, &output_fb);
> +
> +	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_remove_fb(display->drm_fd, &input_fb);
> +	igt_remove_fb(display->drm_fd, &output_fb);
> +
> +	return !ret;
> +}
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
> +typedef struct {
> +	bool builtin_mode;
> +	bool custom_mode;
> +	bool list_modes;
> +	bool dump_check;
> +	int mode_index;
> +	drmModeModeInfo user_mode;
> +} data_t;
> +
> +static data_t data;
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */

Is it complex to do it in this series? I think it could be nice to avoid 
code duplication.

> +static igt_output_t *kms_writeback_get_output(igt_display_t *display)
> +{
> +	int i;
> +	enum pipe pipe;
> +
> +	drmModeModeInfo override_mode = {
> +		.clock = 25175,
> +		.hdisplay = 640,
> +		.hsync_start = 656,
> +		.hsync_end = 752,
> +		.htotal = 800,
> +		.hskew = 0,
> +		.vdisplay = 480,
> +		.vsync_start = 490,
> +		.vsync_end = 492,
> +		.vtotal = 525,
> +		.vscan = 0,
> +		.vrefresh = 60,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +		.name = {"640x480-60"},
> +	};
> +
> +	for (i = 0; i < display->n_outputs; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
> +			continue;
> +
> +		for_each_pipe(display, pipe) {
> +			igt_output_set_pipe(output, pipe);
> +
> +			if (data.custom_mode)
> +				override_mode = data.user_mode;
> +			if (data.builtin_mode)
> +				override_mode = output->config.connector->modes[data.mode_index];
> +
> +			if (check_writeback_config(display, output, override_mode)) {
> +				igt_debug("Using connector %u:%s on pipe %d\n",
> +					  output->config.connector->connector_id,
> +					  output->name, pipe);
> +				return output;
> +			}
> +		}
> +
> +		igt_debug("We found %u:%s, but this test will not be able to use it.\n",
> +			  output->config.connector->connector_id, output->name);
> +
> +		/* Restore any connectors we don't use, so we don't trip on them later */
> +		kmstest_force_connector(display->drm_fd, output->config.connector, FORCE_CONNECTOR_UNSPECIFIED);
> +	}
> +
> +	return NULL;
> +}
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
> +static uint64_t get_writeback_fb_id(igt_output_t *output)
> +{
> +	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
> +}
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
> +static void detach_crtc(igt_display_t *display, igt_output_t *output)
> +{
> +	if (get_writeback_fb_id(output) == 0)
> +		return;
> +
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +}
> +
> +static void get_and_wait_out_fence(igt_output_t *output)

There is no /*TODO*/ here, but I look useful for other tests

> +{
> +	int ret;
> +
> +	igt_assert(output->writeback_out_fence_fd >= 0);
> +
> +	ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
> +	igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(-ret));
> +	close(output->writeback_out_fence_fd);
> +	output->writeback_out_fence_fd = -1;
> +}
> +
> +static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
> +{
> +	switch (desired->type) {
> +	case KMS_COLOROP_ENUMERATED_LUT1D:
> +		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE)
> +			return true;
> +	case KMS_COLOROP_CUSTOM_LUT1D:
> +	case KMS_COLOROP_CTM:
> +	case KMS_COLOROP_LUT3D:
> +	default:
> +		return false;
> +	}
> +}
> +
> +/**
> + * Iterate color pipeline that begins with colorop and try to map
> + * colorops[] to it.
> + */
> +static bool map_to_pipeline(igt_display_t *display,
> +			    igt_colorop_t *colorop,
> +			    kms_colorop_t *colorops[])
> +{
> +	igt_colorop_t *next = colorop;
> +	kms_colorop_t *current_op;
> +	int i = 0;
> +	int prop_val = 0;
> +
> +	current_op = colorops[i++];
> +	igt_require(current_op);
> +
> +	while (next) {
> +		if (can_use_colorop(display, next, current_op)) {
> +			current_op->colorop = next;
> +			current_op = colorops[i++];
> +			if (!current_op)
> +				break;
> +		}
> +		prop_val = igt_colorop_get_prop(display, next,
> +						IGT_COLOROP_NEXT);
> +		next = igt_find_colorop(display, prop_val);
> +	}
> +
> +	if (current_op) {
> +		/* we failed to map the pipeline */
> +
> +		/* clean up colorops[i].colorop mappings */
> +		for (i = 0, current_op = colorops[0]; current_op; current_op = colorops[i++])
> +			current_op->colorop = NULL;
> +
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static igt_colorop_t *get_color_pipeline(igt_display_t *display,
> +					 igt_plane_t *plane,
> +					 kms_colorop_t *colorops[])
> +{
> +	igt_colorop_t *colorop = NULL;
> +	int i;
> +
> +	/* go through all color pipelines */
> +	for (i = 0; i < plane->num_color_pipelines; ++i) {
> +		if (map_to_pipeline(display, plane->color_pipelines[i], colorops)) {
> +			colorop = plane->color_pipelines[i];
> +			break;
> +		}
> +	}
> +
> +	return colorop;
> +}
> +
> +static void set_colorop(igt_display_t *display,
> +			kms_colorop_t *colorop)
> +{
> +	igt_assert(colorop->colorop);
> +	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
> +
> +	/* Set to desired value from kms_colorop_t */
> +	switch (colorop->type) {
> +	case KMS_COLOROP_ENUMERATED_LUT1D:
> +		switch (colorop->enumerated_lut1d_info.tf) {
> +		case KMS_COLOROP_LUT1D_SRGB_EOTF:
> +			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
> +			break;
> +		case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
> +			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
> +			break;
> +		case KMS_COLOROP_LUT1D_PQ_EOTF:
> +		case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
> +		default:
> +			igt_fail(IGT_EXIT_FAILURE);
> +		}
> +		break;
> +	case KMS_COLOROP_CUSTOM_LUT1D:
> +	case KMS_COLOROP_CTM:
> +	case KMS_COLOROP_LUT3D:
> +	default:
> +		igt_fail(IGT_EXIT_FAILURE);
> +	}
> +}
> +
> +static void set_color_pipeline(igt_display_t *display,
> +			       igt_plane_t *plane,
> +			       kms_colorop_t *colorops[],
> +			       igt_colorop_t *color_pipeline)
> +{
> +	igt_colorop_t *next;
> +	int prop_val = 0;
> +	int i;
> +
> +	igt_plane_set_color_pipeline(plane, color_pipeline);
> +
> +	for (i = 0; colorops[i]; i++)
> +		set_colorop(display, colorops[i]);
> +
> +	/* set unused ops in pipeline to bypass */
> +	next = color_pipeline;
> +	i = 0;
> +	while (next) {
> +		if (!colorops[i] || colorops[i]->colorop != next)
> +			igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
> +		else
> +			i++;
> +
> +		prop_val = igt_colorop_get_prop(display, next,
> +						IGT_COLOROP_NEXT);
> +		next = igt_find_colorop(display, prop_val);
> +	}
> +}
> +
> +static void set_color_pipeline_bypass(igt_plane_t *plane)
> +{
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
> +}
> +
> +static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
> +{
> +	if (is_vkms_device(in->fd))
> +		return igt_cmp_fb_pixels(in, out, 1, 1);

Can you add a comment explaining why vkms is an exception and how the 
[1,1] bracket was choosen?

> +
> +	/*
> +	 * By default we'll look for a [0, 0] bracket. We can then
> +	 * define it for each driver that implements support for this
> +	 * test. That way we can understand the precision of each
> +	 * driver better.
> +	 */
> +	return igt_cmp_fb_pixels(in, out, 0, 0);
> +}
> +
> +#define DUMP_FBS 1

Is it possible to toggle it at runtime? (see kms_writeback and 
igt_main_args)

> +
> +#define MAX_COLOROPS 3
> +#define NUM_COLOROP_TESTS 3
> +#define MAX_NAME_SIZE 256
> +
> +static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
> +{
> +	int i;
> +	igt_pixel_transform transforms[MAX_COLOROPS];
> +
> +	for (i = 0; colorops[i]; i++)
> +		transforms[i] = colorops[i]->transform;
> +
> +	igt_color_transform_pixels(sw_transform_fb, transforms, i);
> +}
> +
> +static void colorop_plane_test(igt_display_t *display,
> +			       kms_colorop_t *colorops[])
> +{
> +	igt_colorop_t *color_pipeline = NULL;
> +	igt_output_t *output;
> +	igt_plane_t *plane;
> +	igt_fb_t input_fb;
> +	igt_fb_t sw_transform_fb;
> +	igt_fb_t output_fb;
> +	drmModeModeInfo mode;
> +	unsigned int fb_id;
> +	igt_crc_t input_crc, output_crc;
> +
> +	output = kms_writeback_get_output(display);
> +	igt_require(output);
> +
> +	if (output->use_override_mode)
> +		memcpy(&mode, &output->override_mode, sizeof(mode));
> +	else
> +		memcpy(&mode, &output->config.default_mode, sizeof(mode));
> +
> +	/* create input fb */
> +	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(plane);
> +
> +	fb_id = igt_create_color_pattern_fb(display->drm_fd,
> +					mode.hdisplay, mode.vdisplay,
> +					DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					0.2, 0.2, 0.2, &input_fb);
> +	igt_assert(fb_id >= 0);
> +	igt_plane_set_fb(plane, &input_fb);
> +#if DUMP_FBS
> +	igt_dump_fb(display, &input_fb, ".", "input");
> +#endif
> +
> +	/* create output fb */
> +	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
> +				DRM_FORMAT_XRGB8888,
> +				igt_fb_mod_to_tiling(0),
> +				&output_fb);
> +	igt_require(fb_id > 0);
> +
> +	igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
> +
> +	/* reset color pipeline*/
> +
> +	set_color_pipeline_bypass(plane);
> +
> +	/* Commit */
> +	igt_plane_set_fb(plane, &input_fb);
> +	igt_output_set_writeback_fb(output, &output_fb);
> +
> +	igt_display_commit_atomic(output->display,
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);
> +	get_and_wait_out_fence(output);
> +
> +	/* Compare input and output buffers. They should be equal here. */
> +	igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
> +
> +	igt_assert_crc_equal(&input_crc, &output_crc);
> +
> +	/* create sw transformed buffer */
> +
> +	igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
> +	igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
> +
> +	apply_transforms(colorops, &sw_transform_fb);
> +#if DUMP_FBS
> +	igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
> +#endif
> +	/* discover and set COLOR PIPELINE */
> +
> +	/* get COLOR_PIPELINE enum */
> +	color_pipeline = get_color_pipeline(display, plane, colorops);
> +
> +	/* skip test if we can't find applicable pipeline */
> +	igt_skip_on(!color_pipeline);
> +
> +	set_color_pipeline(display, plane, colorops, color_pipeline);
> +
> +	igt_output_set_writeback_fb(output, &output_fb);
> +
> +	/* commit COLOR_PIPELINE */
> +	igt_display_commit_atomic(display,
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);
> +	get_and_wait_out_fence(output);
> +#if DUMP_FBS
> +	igt_dump_fb(display, &output_fb, ".", "output");
> +#endif
> +
> +	/* compare sw transformed and KMS transformed FBs */
> +	igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
> +
> +	/* reset color pipeline*/
> +	set_color_pipeline_bypass(plane);
> +
> +	/* Commit */
> +	igt_plane_set_fb(plane, &input_fb);
> +	igt_output_set_writeback_fb(output, &output_fb);
> +
> +	igt_display_commit_atomic(output->display,
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);
> +	get_and_wait_out_fence(output);
> +
> +	/* cleanup */
> +	detach_crtc(display, output);
> +	igt_remove_fb(display->drm_fd, &input_fb);
> +	igt_remove_fb(display->drm_fd, &output_fb);
> +}
> +
> +igt_main
> +{
> +
> +	struct {
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +		const char *name;
> +	} tests[] = {
> +		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
> +		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
> +		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" }
> +	};
> +
> +	igt_display_t display;
> +	int i, ret;
> +
> +	igt_fixture {
> +		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> +			display.is_atomic = 1;
> +
> +		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> +
> +		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
> +
> +		igt_display_require(&display, display.drm_fd);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&display, display.drm_fd);
> +
> +		igt_require(display.is_atomic);
> +
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_describe("Check color ops on a plane");
> +		igt_subtest_f("plane-%s", tests[i].name)
> +			colorop_plane_test(&display, tests[i].colorops);
> +	}
> +
> +	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
> +	igt_fixture {
> +		igt_display_fini(&display);
> +	}
> +}
> diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
> new file mode 100644
> index 000000000..f414895dd
> --- /dev/null
> +++ b/tests/kms_colorop.h
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
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
> +#ifndef __KMS_COLOROP_H__
> +#define __KMS_COLOROP_H__
> +
> +#include "igt_color.h"
> +
> +typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
> +
> +typedef int (*transform_fb)(igt_fb_t *in);
> +
> +typedef int (*transform_pixel)(igt_pixel_t *pixel);
> +
> +/* Test version definitions */
> +typedef enum kms_colorop_type {
> +	KMS_COLOROP_ENUMERATED_LUT1D,
> +	KMS_COLOROP_CUSTOM_LUT1D,
> +	KMS_COLOROP_CTM,
> +	KMS_COLOROP_LUT3D
> +} kms_colorop_type_t;
> +
> +typedef enum kms_colorop_lut1d_tf {
> +	KMS_COLOROP_LUT1D_SRGB_EOTF,
> +	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
> +	KMS_COLOROP_LUT1D_PQ_EOTF,
> +	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
> +} kms_colorop_lut1d_tf_t;
> +
> +typedef struct kms_colorop_enumerated_lut1d_info {
> +	kms_colorop_lut1d_tf_t tf;
> +} kms_colorop_enumerated_lut1d_info_t;
> +
> +typedef struct kms_colorop {
> +	kms_colorop_type_t type;
> +
> +	union {
> +		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
> +	};
> +
> +	const char *name;
> +
> +	igt_pixel_transform transform;
> +
> +	/* Mapped colorop */
> +	igt_colorop_t *colorop;
> +
> +} kms_colorop_t;
> +
> +kms_colorop_t kms_colorop_srgb_eotf = {
> +	.type = KMS_COLOROP_ENUMERATED_LUT1D,
> +	.enumerated_lut1d_info = {
> +		.tf = KMS_COLOROP_LUT1D_SRGB_EOTF
> +	},
> +	.name = "srgb_eotf",
> +	.transform = &igt_color_srgb_eotf
> +};
> +
> +kms_colorop_t kms_colorop_srgb_inv_eotf = {
> +	.type = KMS_COLOROP_ENUMERATED_LUT1D,
> +	.enumerated_lut1d_info = {
> +		.tf = KMS_COLOROP_LUT1D_SRGB_INV_EOTF
> +	},
> +	.name = "srgb_inv_eotf",
> +	.transform = &igt_color_srgb_inv_eotf
> +};
> +
> +#endif /* __KMS_COLOROP_H__ */
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..e612e1a05 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -26,6 +26,7 @@ test_progs = [
>   	'kms_bw',
>   	'kms_color',
>   	'kms_concurrent',
> +	'kms_colorop',
>   	'kms_content_protection',
>   	'kms_cursor_crc',
>   	'kms_cursor_edge_walk',

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA65C54E5D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 17:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8001610FC29;
	Thu, 14 Mar 2024 17:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQsFDUe4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A6910FC29
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710436027; x=1741972027;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RTgNGccDQw1QK7JYBBa6U1jaOqNUw/njzR26eZ0VAoE=;
 b=MQsFDUe4FCSbhd4NZoDe+WIzFmv5yiokvJFSaEnLQAcIlp9C7/Zoj7pZ
 wrk3cn8yGu3F0o2lXiqkfpOvK8cZChdB5EtVKAKnUuUKTboKIg9fsHUgl
 gt2zy7qG3pybqjU1uYas5ijFFqCow14FJ8nMMf4FHHRru2L4/0Mz1Fg6y
 fqxfwuPTTJmligEg/eOzVmjINFJo8oGcyJAChOxS2pV1SM9FmyqWEnEDT
 OMM5OqkoMdAVDNxN9on36vBi6tlfBqxRJ8+94hlngLNX4cehsZVxAtiee
 TNkfpS1bZmTOnMogkYUykUP+Nju548sKB80RseMFDuiEXIgT32fPiqe+f Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5140105"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5140105"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:07:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12428474"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 10:07:04 -0700
Date: Thu, 14 Mar 2024 18:06:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, miquel.raynal@bootlin.com,
 jeremie.dautheribes@bootlin.com, thomas.petazzoni@bootlin.com,
 arthurgrillo@riseup.net,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 3/4] tests/kms_rotation: Add extensive rotation
 test
Message-ID: <20240314170643.77vzqqoie2otyu4w@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com,
 thomas.petazzoni@bootlin.com, arthurgrillo@riseup.net,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
 <20240313-new_rotation-v2-3-6230fd5cae59@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313-new_rotation-v2-3-6230fd5cae59@bootlin.com>
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

Hi Louis,
On 2024-03-13 at 18:09:42 +0100, Louis Chauvet wrote:
> The actual kms_rotation_crc test does not tes all the rotation with all
> the formats. Create the test kms_rotation, which only test "full plane
> rotation", but for all formats, planes and rotations.
> 
> This allow the detection of issues like in [1], where the YUV rotation is
> not working for specific rotations.
> 
> [1]: https://lore.kernel.org/dri-devel/20240304-yuv-v4-11-76beac8e9793@bootlin.com/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  tests/kms_rotation.c | 444 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 445 insertions(+)
> 
> diff --git a/tests/kms_rotation.c b/tests/kms_rotation.c
> new file mode 100644
> index 000000000000..333485619541
> --- /dev/null
> +++ b/tests/kms_rotation.c
> @@ -0,0 +1,444 @@

Please add here SPDX MIT licence.

> +#include "igt.h"
> +
> +/**
> + * TEST: kms_rotation
> + * Category: Display
> + * Description: Tests all rotations for all planes and formats.
> + * Driver requirement: none
------------------------- ^
It is better to not have 'none' as a driver, just drop this line.
+cc Mauro.

Please use checkpatch.pl script from Linux kernel,
it can spot some code style problems (line too long can
be sometimes ignored).

Regards,
Kamil

> + * Functionality: plane, rotation
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +/**
> + * SUBTEST: rotations
> + * Description: Test for all rotations, planes and formats.
> + */
> +
> +/**
> + * struct data_t - Stores the test configuration
> + *
> + * @fd: file descriptor for the current drm device
> + * @display: display used for the tests
> + * @width, @height: Size of the CRTC used for this test
> + */
> +struct data_t {
> +	int fd;
> +	igt_display_t display;
> +	uint32_t width;
> +	uint32_t height;
> +};
> +
> +/**
> + * colors - List of colors used to put things on the plane
> + *
> + * Those colors are used to create a color pattern on the plane, which is not invariant by rotation or reflexion.
> + *
> + * At least black and white must be in this list to properly test black and white formats.
> + */
> +static const struct igt_vec4 colors[] = {
> +	{{1.0f, 0.0f, 0.0f, 0.0f}},
> +	{{1.0f, 1.0f, 1.0f, 0.0f}},
> +	{{0.0f, 0.0f, 0.0f, 0.0f}},
> +	{{0.0f, 1.0f, 1.0f, 0.0f}},
> +	{{0.0f, 0.0f, 0.0f, 0.0f}},
> +};
> +
> +/**
> + * tested_rotation - List of all tested rotation configuration
> + */
> +static uint32_t tested_rotation[] = {
> +	IGT_ROTATION_0,
> +	IGT_ROTATION_0 | IGT_REFLECT_X,
> +	IGT_ROTATION_0 | IGT_REFLECT_Y,
> +	IGT_ROTATION_0 | IGT_REFLECT_X | IGT_REFLECT_Y,
> +	IGT_ROTATION_90,
> +	IGT_ROTATION_90 | IGT_REFLECT_X,
> +	IGT_ROTATION_90 | IGT_REFLECT_Y,
> +	IGT_ROTATION_90 | IGT_REFLECT_X | IGT_REFLECT_Y,
> +	IGT_ROTATION_180,
> +	IGT_ROTATION_180 | IGT_REFLECT_X,
> +	IGT_ROTATION_180 | IGT_REFLECT_Y,
> +	IGT_ROTATION_180 | IGT_REFLECT_X | IGT_REFLECT_Y,
> +	IGT_ROTATION_270,
> +	IGT_ROTATION_270 | IGT_REFLECT_X,
> +	IGT_ROTATION_270 | IGT_REFLECT_Y,
> +	IGT_ROTATION_270 | IGT_REFLECT_X | IGT_REFLECT_Y,
> +};
> +
> +/**
> + * non_equals_crc() - Check if at least one CRC is different
> + *
> + * Check if at least one CRC is different, so we can verify that the rendering is working.
> + *
> + * @crcs: List of all tested crcs
> + * @crc_count: Number of crcs in the list
> + */
> +static bool non_equals_crc(igt_crc_t crcs[], int crc_count)
> +{
> +	if (!crc_count) {
> +		return true;
> +	}
> +	for (int i = 0; i < crc_count; i++)
> +		if (!igt_check_crc_equal(&crcs[i], &crcs[0]))
> +			return true;
> +	return false;
> +}
> +
> +/**
> + * create_fb() - Create a framebuffer
> + *
> + * This create a framebuffer and fill it with a pattern. This pattern is not invariant by rotation and reflection.
> + *
> + * The @width and @height parameters are automaticaly inverted according to @rotation if needed. If the requested plane
> + * is 1024*768 with IGT_ROTATION_90, the returned plane will have the size 768*1024.
> + *
> + * @data: Current test configuration
> + * @rotation: Rotation to apply to the pattern
> + * @format: Format of the requested plane
> + * @modifier: Modifier for the requested plane
> + * @width, @height: Size of the plane to use (without rotation)
> + * @width: Width of the requested plane
> + * @height: Height of the requested plane
> + * @fb: Place to store the created framebuffer
> + */
> +static void create_fb(struct data_t *data, igt_rotation_t rotation, uint32_t format, uint64_t modifier, int width,
> +		      int height, igt_fb_t *fb)
> +{
> +	int step_x, step_y, color_index, current_n, current_m;
> +	int offset_x, offset_y;
> +	cairo_t *cr;
> +
> +	switch (rotation & IGT_ROTATION_MASK) {
> +		case IGT_ROTATION_90:
> +		case IGT_ROTATION_270:
> +			igt_swap(width, height);
> +			break;
> +		case IGT_ROTATION_0:
> +		case IGT_ROTATION_180:
> +		default:
> +			break;
> +	}
> +
> +	igt_create_fb(data->fd, width, height, format, modifier, fb);
> +	cr = igt_get_cairo_ctx(data->fd, fb);
> +
> +	step_x = (width) / ARRAY_SIZE(colors);
> +	step_y = (height) / ARRAY_SIZE(colors);
> +
> +	/*
> +	 * This pair of offset is used to ensure that a software rotated plane is the same as a hardware rotated plane.
> +	 */
> +	switch ((int)rotation) {
> +		case IGT_ROTATION_0:
> +		case IGT_ROTATION_0 | IGT_REFLECT_Y:
> +		case IGT_ROTATION_90:
> +		case IGT_ROTATION_90 | IGT_REFLECT_X:
> +		case IGT_ROTATION_180 | IGT_REFLECT_X | IGT_REFLECT_Y:
> +		case IGT_ROTATION_180 | IGT_REFLECT_X:
> +		case IGT_ROTATION_270 | IGT_REFLECT_Y:
> +		case IGT_ROTATION_270 | IGT_REFLECT_X | IGT_REFLECT_Y:
> +			offset_x = 0;
> +			break;
> +		case IGT_ROTATION_0 | IGT_REFLECT_X:
> +		case IGT_ROTATION_0 | IGT_REFLECT_X | IGT_REFLECT_Y:
> +		case IGT_ROTATION_90 | IGT_REFLECT_Y:
> +		case IGT_ROTATION_90 | IGT_REFLECT_X | IGT_REFLECT_Y:
> +		case IGT_ROTATION_180:
> +		case IGT_ROTATION_180 | IGT_REFLECT_Y:
> +		case IGT_ROTATION_270:
> +		case IGT_ROTATION_270 | IGT_REFLECT_X:
> +			offset_x = width % step_x;
> +			break;
> +	}
> +	switch ((int)rotation) {
> +		case IGT_ROTATION_0:
> +		case IGT_ROTATION_0 | IGT_REFLECT_X:
> +		case IGT_ROTATION_90 | IGT_REFLECT_X:
> +		case IGT_ROTATION_90 | IGT_REFLECT_X | IGT_REFLECT_Y:
> +		case IGT_ROTATION_180 | IGT_REFLECT_Y:
> +		case IGT_ROTATION_180 | IGT_REFLECT_X | IGT_REFLECT_Y:
> +		case IGT_ROTATION_270:
> +		case IGT_ROTATION_270 | IGT_REFLECT_Y:
> +			offset_y = 0;
> +			break;
> +		case IGT_ROTATION_0 | IGT_REFLECT_Y:
> +		case IGT_ROTATION_0 | IGT_REFLECT_X | IGT_REFLECT_Y:
> +		case IGT_ROTATION_90:
> +		case IGT_ROTATION_90 | IGT_REFLECT_Y:
> +		case IGT_ROTATION_180:
> +		case IGT_ROTATION_180 | IGT_REFLECT_X:
> +		case IGT_ROTATION_270 | IGT_REFLECT_X:
> +		case IGT_ROTATION_270 | IGT_REFLECT_X | IGT_REFLECT_Y:
> +			offset_y = height % step_y;
> +			break;
> +	}
> +
> +	/* Iterate over all colors in x and y direction. The pattern is a colored chessboard */
> +	for (int n = 0; n < ARRAY_SIZE(colors); n++) {
> +		for (int m = 0; m < ARRAY_SIZE(colors); m++) {
> +			color_index = (n + m) % ARRAY_SIZE(colors);
> +			current_n = n;
> +			current_m = m;
> +
> +			/*
> +			 * If a reflexion and a rotation is requested, apply this to the pattern rendering
> +			 * If a reflexion is given, it must be applied before the rotation.
> +			 */
> +			switch (rotation & IGT_REFLECT_MASK) {
> +				case IGT_REFLECT_X:
> +					current_n = ARRAY_SIZE(colors) - 1 - current_n;
> +					break;
> +				case IGT_REFLECT_Y:
> +					current_m = ARRAY_SIZE(colors) - 1 - current_m;
> +					break;
> +				case IGT_REFLECT_X | IGT_REFLECT_Y:
> +					current_n = ARRAY_SIZE(colors) - 1 - current_n;
> +					current_m = ARRAY_SIZE(colors) - 1 - current_m;
> +					break;
> +			}
> +			switch (rotation & IGT_ROTATION_MASK) {
> +				case IGT_ROTATION_0:
> +					break;
> +				case IGT_ROTATION_90:
> +					igt_swap(current_n, current_m);
> +					current_m = ARRAY_SIZE(colors) - 1 - current_m;
> +					break;
> +				case IGT_ROTATION_180:
> +					current_n = ARRAY_SIZE(colors) - 1 - current_n;
> +					current_m = ARRAY_SIZE(colors) - 1 - current_m;
> +					break;
> +				case IGT_ROTATION_270:
> +					igt_swap(current_n, current_m);
> +					current_n = ARRAY_SIZE(colors) - 1 - current_n;
> +					break;
> +			}
> +
> +			igt_paint_color(cr,
> +					offset_x + current_n * step_x,
> +					offset_y + current_m * step_y,
> +					step_x,
> +					step_y,
> +					colors[color_index].d[0],
> +					colors[color_index].d[1],
> +					colors[color_index].d[2]);
> +		}
> +	}
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +/**
> + * get_ref_crcs() - Compute the reference CRC for a specific format
> + *
> + * The rotation are done by create_fb in software.
> + *
> + * @data: Test configuration
> + * @output, @pipe, @plane: Plane to use for the test
> + * @width, @height: Size of the plane to use (without rotation)
> + * @format, @modifier: Format description to test
> + * @ref_crc: Array to store the resulting CRC. Its size must be at least ARRAY_SIZE(tested_rotation).
> + */
> +static void get_ref_crcs(struct data_t *data, igt_output_t *output, enum pipe pipe, igt_plane_t *plane, int width,
> +			 int height, uint32_t format, uint64_t modifier, igt_crc_t ref_crc[ARRAY_SIZE(tested_rotation)])
> +{
> +	drmModeModeInfo *mode;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_fb_t fb;
> +
> +	igt_display_reset(&data->display);
> +	igt_output_set_pipe(output, pipe);
> +
> +
> +	for (int r = 0; r < ARRAY_SIZE(tested_rotation); r++) {
> +		int rotation = tested_rotation[r];
> +		igt_debug("Computing reference CRC for rotation-%s-reflect-%s\n", igt_plane_rotation_name(rotation),
> +			  igt_plane_reflect_name(rotation));
> +		/* Configure the pipe for reference frame */
> +		igt_display_reset(&data->display);
> +
> +		mode = igt_output_get_mode(output);
> +		mode->hdisplay = width;
> +		mode->vdisplay = height;
> +		igt_output_override_mode(output, mode);
> +		mode = igt_output_get_mode(output);
> +
> +		igt_output_set_pipe(output, pipe);
> +		igt_plane_set_rotation(plane, IGT_ROTATION_0);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		/* Start the CRC */
> +		pipe_crc = igt_pipe_crc_new(data->fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_start(pipe_crc);
> +
> +		create_fb(data, rotation, format, modifier, mode->vdisplay, mode->hdisplay, &fb);
> +		igt_plane_set_fb(plane, &fb);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		igt_pipe_crc_get_current(
> +			data->display.drm_fd, pipe_crc,
> +			&ref_crc[r]);
> +
> +		igt_pipe_crc_stop(pipe_crc);
> +		igt_pipe_crc_free(pipe_crc);
> +		igt_remove_fb(data->fd, &fb);
> +	}
> +}
> +
> +/**
> + * get_crcs() - Compute the CRC for a specific format
> + *
> + * @data: Test configuration
> + * @output, @pipe, @plane: Plane to use for the test
> + * @width, @height: Size of the plane to use (without rotation)
> + * @format, @modifier: Format description to test
> + * @crc: Array to store the resulting CRC. Its size must be at least ARRAY_SIZE(tested_rotation).
> + */
> +static void get_crcs(struct data_t *data, igt_output_t *output, enum pipe pipe, igt_plane_t *plane, int width,
> +		     int height, uint32_t format, uint64_t modifier, igt_crc_t crc[ARRAY_SIZE(tested_rotation)])
> +{
> +	drmModeModeInfo *mode;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_fb_t fb;
> +
> +	igt_display_reset(&data->display);
> +	igt_output_set_pipe(output, pipe);
> +
> +	for (int r = 0; r < ARRAY_SIZE(tested_rotation); r++) {
> +		int rotation = tested_rotation[r];
> +		igt_debug("Computing CRC for rotation-%s-reflect-%s\n", igt_plane_rotation_name(rotation),
> +			  igt_plane_reflect_name(rotation));
> +		/* Configure the pipe for reference frame */
> +		igt_display_reset(&data->display);
> +
> +		mode = igt_output_get_mode(output);
> +		mode->hdisplay = width;
> +		mode->vdisplay = height;
> +		igt_output_override_mode(output, mode);
> +		mode = igt_output_get_mode(output);
> +
> +		igt_output_set_pipe(output, pipe);
> +		igt_plane_set_rotation(plane, rotation);
> +
> +		if (!igt_plane_has_rotation(plane, rotation))
> +			continue;
> +
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		/* Start the CRC */
> +		pipe_crc = igt_pipe_crc_new(data->fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_start(pipe_crc);
> +
> +		create_fb(data, IGT_ROTATION_0, format, modifier, mode->vdisplay, mode->hdisplay, &fb);
> +		igt_plane_set_fb(plane, &fb);
> +		if (igt_rotation_90_or_270(rotation))
> +			igt_plane_set_size(plane, fb.height, fb.width);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		igt_pipe_crc_get_current(
> +			data->display.drm_fd, pipe_crc,
> +			&crc[r]);
> +
> +		igt_pipe_crc_stop(pipe_crc);
> +		igt_pipe_crc_free(pipe_crc);
> +		igt_remove_fb(data->fd, &fb);
> +	}
> +}
> +
> +/**
> + * run_test() - Run the subtests for a specific plane
> + *
> + * @data: Test configuration
> + * @output, @pipe, @plane: Plane to use for the test
> + * @format, @modifier: Format description to test
> + */
> +static void run_test(struct data_t *data, igt_output_t *output, enum pipe pipe, igt_plane_t *plane, uint32_t format,
> +		     uint64_t modifier)
> +{
> +	int width, height;
> +	const struct format_desc_struct *format_description;
> +	igt_crc_t ref_crc[ARRAY_SIZE(tested_rotation)];
> +	igt_crc_t crc[ARRAY_SIZE(tested_rotation)];
> +
> +	igt_display_reset(&data->display);
> +	igt_output_set_pipe(output, pipe);
> +	/* Check that the rotation is supported */
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
> +	format_description = lookup_drm_format(format);
> +	width = ARRAY_SIZE(colors) * format_description->hsub * format_description->vsub * 6;
> +	height = ARRAY_SIZE(colors) * format_description->hsub * format_description->vsub * 6;
> +
> +	/* Generate reference CRC with software rotation */
> +	get_ref_crcs(data, output, pipe, plane, width, height, format, modifier, ref_crc);
> +	igt_assert_f(non_equals_crc(ref_crc, ARRAY_SIZE(tested_rotation)), "All the reference CRC are equals.");
> +
> +	/* Generate CRC with hardware rotation */
> +	get_crcs(data, output, pipe, plane, width, height, format, modifier, crc);
> +
> +	for (int c = 0; c < ARRAY_SIZE(tested_rotation); c++) {
> +		int rotation = tested_rotation[c];
> +		igt_dynamic_f("pipe-%s-format-%s-modifier-%s-rotation-%s-reflect-%s", kmstest_pipe_name(pipe),
> +			      igt_format_str(format),
> +			      igt_fb_modifier_name(modifier), igt_plane_rotation_name(rotation),
> +			      igt_plane_reflect_name(rotation)) {
> +			igt_assert_crc_equal(&ref_crc[c], &crc[c]);
> +		}
> +	}
> +}
> +
> +/**
> + * test_all_formats() - Run all the tests for all planes
> + *
> + * @data: Test configuration
> + */
> +static void test_all_formats(struct data_t *data)
> +{
> +	enum pipe pipe;
> +	struct igt_plane *plane;
> +	igt_output_t *output;
> +	for_each_pipe_with_single_output(&data->display, pipe, output) {
> +		for_each_plane_on_pipe(&data->display, pipe, plane) {
> +			for (int f = 0; f < plane->format_mod_count; f++) {
> +				uint32_t format = plane->formats[f];
> +				uint32_t modifier = plane->modifiers[f];
> +
> +				if (!igt_fb_supported_format(format))
> +					continue;
> +				run_test(data, output, pipe, plane, format, modifier);
> +			}
> +		}
> +	}
> +}
> +
> +static int opt_handler(int opt, int opt_index, void *void_data)
> +{
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{}
> +};
> +
> +static const char help_str[] = "";
> +
> +static struct data_t global_data;
> +
> +igt_main_args("", long_opts, help_str, opt_handler, &global_data)
> +{
> +	igt_fixture {
> +		global_data.fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&global_data.display, global_data.fd);
> +		igt_require(global_data.display.is_atomic);
> +		igt_display_require_output(&global_data.display);
> +		igt_display_reset(&global_data.display);
> +	}
> +
> +	igt_describe("Testing different rotation and reflexions for different formats");
> +	igt_subtest_with_dynamic_f("rotations") {
> +		test_all_formats(&global_data);
> +	}
> +
> +}
> \ No newline at end of file
> diff --git a/tests/meson.build b/tests/meson.build
> index a856510fcea7..71b628b86e96 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -82,6 +82,7 @@ test_progs = [
>  	'tools_test',
>  	'vgem_basic',
>  	'vgem_slow',
> +	'kms_rotation',
>  ]
>  
>  intel_i915_xe_progs = [
> 
> -- 
> 2.43.0
> 

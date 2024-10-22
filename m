Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9D6D2C543
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 12:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4401B10E31F;
	Tue, 22 Oct 2024 12:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bc6iwtQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B580410E31F
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729599623; x=1761135623;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ojTZUPhTpJCsHiJ3cPWVWkV42lGlnRjsKCLZiiekdgQ=;
 b=bc6iwtQyfRkpGArRZrDO7r0igWhV7iGOflwRXv+n2W4jZeYv/2MZyfhH
 wvNJel0ugRRpOOprvmpIs4TO4Ydd3rlo0oz70at9mk337kbgAcVVPG0Qg
 fQHZdE9lXdkKBVyF6WJVKXNceE7JUrplXB/551qxumw/Wg9x0iWVpJwYp
 JKDnezoP6IA6nZaB1Ajw+J1JbpmANlX62tbPfsiwGBBaLxkRqI7z58twP
 GLBARvfoGs+BDv1a+fsMWnU9zinFEVRzrIk3RnUzGETrdkubvEFytODYU
 fnnCeGsfOgd3oWzzcsi2lvZbYy+xoyuplOct1OWFaF75Tso4V6CpWQmpi g==;
X-CSE-ConnectionGUID: v/VpkQObRzGSpr21qckUfg==
X-CSE-MsgGUID: gZMzhSr/S5a0JlyJcJL5Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="40508276"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="40508276"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 05:20:23 -0700
X-CSE-ConnectionGUID: ZqfpfUpFTjyIaO+aicuC1Q==
X-CSE-MsgGUID: bz4NbGS2QsWgNOi0v063/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79864442"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 05:20:22 -0700
Date: Tue, 22 Oct 2024 14:20:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t 4/4]
 tests/chamelium/kms_chamelium_sharpness_filter: Add adaptive sharpness
 chamelium filter test
Message-ID: <20241022122009.ot4suhltpsu7getb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20241018190627.1367970-1-swati2.sharma@intel.com>
 <20241018190627.1367970-5-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241018190627.1367970-5-swati2.sharma@intel.com>
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

Hi Swati,
On 2024-10-19 at 00:36:27 +0530, Swati Sharma wrote:

imho you could simplify subject:

tests/chamelium/kms_chamelium_sharpness_filter: Add basic test

> Add new chamelium based sharpness test. Basic test is added where
> we have tried comparing frame dump of unsharped and sharped image.
> After, sharpness filter is applied its expected both frame dumps
s/,//

> will be different.

Adding Louis on Cc: Louis Chauvet <louis.chauvet@bootlin.com>

Regards,
Kamil

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  .../kms_chamelium_sharpness_filter.c          | 250 ++++++++++++++++++
>  tests/meson.build                             |   2 +
>  2 files changed, 252 insertions(+)
>  create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
> 
> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
> new file mode 100644
> index 000000000..a60d22b63
> --- /dev/null
> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms chamelium sharpness filter
> + * Category: Display
> + * Description: Test to validate content adaptive sharpness filter using Chamelium
> + * Driver requirement: xe
> + * Functionality: chamelium, casf
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +/**
> + * SUBTEST: filter-basic
> + * Description: Verify basic content adaptive sharpness filter.
> + */
> +
> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter using Chamelium");
> +
> +#define DISABLE_FILTER			0
> +#define MIN_FILTER_STRENGTH		1
> +#define MID_FILTER_STRENGTH		128
> +#define MAX_FILTER_STRENGTH		255
> +
> +typedef struct {
> +	int drm_fd;
> +	enum pipe pipe_id;
> +	struct igt_fb fb, fb_ref;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	struct chamelium *chamelium;
> +	struct chamelium_port **ports;
> +	int port_count;
> +} data_t;
> +
> +static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
> +{
> +	bool ret = true;
> +
> +	igt_output_set_pipe(data->output, pipe);
> +		if (!intel_pipe_output_combo_valid(&data->display))
> +			ret = false;
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +
> +	return ret;
> +}
> +
> +static void disable_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				DISABLE_FILTER);
> +}
> +
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static void paint_image(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	int img_x, img_y, img_w, img_h;
> +	const char *file = "1080p-left.png";
> +
> +	img_x = img_y = 0;
> +	img_w = fb->width;
> +	img_h = fb->height;
> +
> +	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(int fd, int width, int height, uint32_t format,
> +		     uint64_t modifier, struct igt_fb *fb)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(fb);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +	igt_remove_fb(data->drm_fd, &data->fb_ref);
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_override_mode(data->output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +
> +static bool test_t(data_t *data, igt_plane_t *primary,
> +		   struct chamelium_port *port)
> +{
> +	igt_output_t *output = data->output;
> +	drmModeModeInfo *mode = data->mode;
> +	struct chamelium_frame_dump *dump;
> +	int height = mode->hdisplay;
> +	int width =  mode->vdisplay;
> +	bool ret = false;
> +
> +	igt_output_set_pipe(output, data->pipe_id);
> +
> +	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb_ref);
> +	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
> +
> +	igt_plane_set_fb(data->primary, &data->fb_ref);
> +	disable_filter_strength_on_pipe(data);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_plane_set_fb(data->primary, &data->fb);
> +	set_filter_strength_on_pipe(data);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_debug("Reading frame dumps from Chamelium...\n");
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	dump = chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	ret = chamelium_frame_match_or_dump(data->chamelium, port,
> +					    dump, &data->fb_ref,
> +					    CHAMELIUM_CHECK_ANALOG);
> +	chamelium_destroy_frame_dump(dump);
> +	cleanup(data);
> +
> +	return ret;
> +}
> +
> +static int test_setup(data_t *data, enum pipe p)
> +{
> +	igt_pipe_t *pipe;
> +	int i = 0;
> +
> +	igt_display_reset(&data->display);
> +	igt_modeset_disable_all_outputs(&data->display);
> +	chamelium_reset_state(&data->display, data->chamelium, NULL,
> +			      data->ports, data->port_count);
> +
> +	pipe = &data->display.pipes[p];
> +	igt_require(pipe->n_planes >= 0);
> +
> +	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(data->primary);
> +
> +	/*
> +	 * Prefer to run this test on HDMI connector if its connected, since on DP we
> +	 * sometimes face DP FSM issue
> +	 */
> +        for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +                for (i = 0; i < data->port_count; i++) {
> +                        if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +			    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
> +			    strcmp(data->output->name, chamelium_port_get_name(data->ports[i])) == 0)
> +                                return i;
> +                }
> +        }
> +
> +	for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +		for (i = 0; i < data->port_count; i++) {
> +			if (strcmp(data->output->name,
> +				   chamelium_port_get_name(data->ports[i])) == 0)
> +				return i;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +static void test_sharpness_filter(data_t *data,  enum pipe p)
> +{
> +	int port_idx = test_setup(data, p);
> +
> +	igt_require(port_idx >= 0);
> +	igt_require(igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_SHARPNESS_STRENGTH));
> +
> +	if (!pipe_output_combo_valid(data, p))
> +		return;
> +
> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
> +		igt_assert_f(test_t(data, data->primary, data->ports[port_idx]) == 0, "No sharpness observed.\n");
> +}
> +
> +static void
> +run_sharpness_filter_test(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	enum pipe pipe;
> +
> +	igt_describe("Verify basic content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-basic") {
> +		for_each_pipe(display, pipe) {
> +			data->filter_strength = MID_FILTER_STRENGTH;
> +			test_sharpness_filter(data, pipe);
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
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +
> +		igt_chamelium_allow_fsm_handling = false;
> +
> +		/* we need to initalize chamelium after igt_display_require */
> +		data.chamelium = chamelium_init(data.drm_fd, &data.display);
> +		igt_require(data.chamelium);
> +
> +		data.ports = chamelium_get_ports(data.chamelium,
> +						 &data.port_count);
> +
> +		if (!data.port_count)
> +			igt_skip("No ports connected\n");
> +		/*
> +		 * We don't cause any harm by plugging
> +		 * discovered ports, just incase they are not plugged
> +		 * we currently skip in test_setup
> +		 */
> +		for(int i = 0; i < data.port_count; i++)
> +			chamelium_plug(data.chamelium, data.ports[i]);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	run_sharpness_filter_test(&data);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 7f5bc68d3..1fa47d09d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -335,6 +335,7 @@ chamelium_progs = [
>  	'kms_chamelium_edid',
>  	'kms_chamelium_frames',
>  	'kms_chamelium_hpd',
> +	'kms_chamelium_sharpness_filter',
>  ]
>  
>  test_deps = [ igt_deps ]
> @@ -360,6 +361,7 @@ extra_sources = {
>  	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>  	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>  	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>  }
> -- 
> 2.25.1
> 

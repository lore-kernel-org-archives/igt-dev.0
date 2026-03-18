Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A6A10854DB
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 09:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2A410E792;
	Wed, 18 Mar 2026 09:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkPE/U0E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B428F10E792
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773827579; x=1805363579;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GL6pey45JWHjujHmk45/Ztz+Bx4hsAvzWZhtEza9FQA=;
 b=hkPE/U0E5FjGxYCSw2LvO7My6tKYnctv3th8n8jRwXEeAF8235snP8Lp
 +RvKQRacPJIrICS6ZZ6XyQb+tydnX7md8dRzmrIV2k0lnFWffqGULxF3m
 ICUkP8RJe4VvzY0uBYAWNp7+nexGrYQ05xBM0u/dMD8CYeCT+u4QCYy0b
 Pt5WqPx8CbG2ujSl33rdcRs8JSK/6QdFdlRwrjmThBoVmu37abFyd9kTX
 okq7OGZBDj7zB0RZy56M1En+JxE95qi4C5CQIaNtFyShsVPdbGOP7Jla1
 PMhCSJXrVlG4FgYEmeybBjnvDXLpeRj+JG0Xzm4wQjuIQAk5+drYTJw5I w==;
X-CSE-ConnectionGUID: vNbWzHyMRFG8rb0PGcqRWw==
X-CSE-MsgGUID: 1tlPSqYzQyyCgDW3KZTGBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="75058433"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="75058433"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:52:58 -0700
X-CSE-ConnectionGUID: lpgYAiP7RMqSq3qdDEejLQ==
X-CSE-MsgGUID: LUHQU+o3Qe+ZbjQ124NnRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="216784387"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:52:56 -0700
Date: Wed, 18 Mar 2026 10:52:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, wayne.lin@amd.com,
 Mark.Broadworth@amd.com, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH 2/3] tools: Add amd_hdr_visual for manual HDR verification
Message-ID: <20260318095254.djw4zv52ppxvl6ny@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 wayne.lin@amd.com, Mark.Broadworth@amd.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260317175136.3754576-1-alex.hung@amd.com>
 <20260317175136.3754576-2-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317175136.3754576-2-alex.hung@amd.com>
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

Hi Alex,
On 2026-03-17 at 11:51:31 -0600, Alex Hung wrote:
> From: Wayne Lin <wayne.lin@amd.com>
> 
> Add a visual verification tool for AMD HDR display output. This tool
> displays HDR test patterns with different metadata types and waits for
> user confirmation, enabling manual inspection of HDR output quality.
> 
> Subtests:
> - static-swap-smpte2084: Display with SMPTE ST2084 (PQ) HDR metadata
> - static-swap-traditional-sdr: Display with traditional SDR gamma metadata
> 
> Co-developed-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> ---
>  tools/amd_hdr_visual.c | 372 +++++++++++++++++++++++++++++++++++++++++
>  tools/meson.build      |   5 +
>  2 files changed, 377 insertions(+)
>  create mode 100644 tools/amd_hdr_visual.c
> 
> diff --git a/tools/amd_hdr_visual.c b/tools/amd_hdr_visual.c
> new file mode 100644
> index 000000000..58decb356
> --- /dev/null
> +++ b/tools/amd_hdr_visual.c
> @@ -0,0 +1,372 @@
> +/*

Add SPDX here, look into other C files and use Linux script
checkpatch.pl for verifing.

> + * Copyright 2026 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Remove this text, it is replaced by SPDX.

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

Why igt.h here? It should be after system headers but also
try to decouple it from big test libs. Tools should at least 
try to be tools, not tests.

> +#include <fcntl.h>
> +#include <termios.h>
> +#include <unistd.h>

Add newline here.

> +#include "igt_edid.h"
> +#include "igt_hdr.h"
> +
> +IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");

Not needed in tools, remove it. Or did you mean a test, not a tool?
+cc Vitaly
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Regards,
Kamil

> +
> +/* Test flags. */
> +enum {
> +	TEST_NONE = 1 << 0,
> +	TEST_DPMS = 1 << 1,
> +	TEST_SUSPEND = 1 << 2,
> +	TEST_SWAP = 1 << 3,
> +};
> +
> +/* BPC connector state. */
> +typedef struct output_bpc {
> +	unsigned int current;
> +	unsigned int maximum;
> +} output_bpc_t;
> +
> +/* Common test data. */
> +typedef struct data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_crtc_t *pipe;
> +	igt_pipe_crc_t *pipe_crc;
> +	drmModeModeInfo *mode;
> +	enum pipe pipe_id;
> +	int fd;
> +	int w;
> +	int h;
> +} data_t;
> +
> +/* Common test cleanup. */
> +static void test_fini(data_t *data)
> +{
> +	igt_pipe_crc_free(data->pipe_crc);
> +	igt_display_reset(&data->display);
> +}
> +
> +static void test_cycle_flags(data_t *data, uint32_t test_flags)
> +{
> +	if (test_flags & TEST_DPMS) {
> +		kmstest_set_connector_dpms(data->fd,
> +					   data->output->config.connector,
> +					   DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->fd,
> +					   data->output->config.connector,
> +					   DRM_MODE_DPMS_ON);
> +	}
> +
> +	if (test_flags & TEST_SUSPEND)
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +					      SUSPEND_TEST_NONE);
> +}
> +
> +/* Returns the current and maximum bpc from the connector debugfs. */
> +static output_bpc_t get_output_bpc(data_t *data)
> +{
> +	char buf[256];
> +	char *start_loc;
> +	int fd, res;
> +	output_bpc_t info;
> +
> +	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +
> +	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
> +
> +	igt_require(res > 0);
> +
> +	close(fd);
> +
> +	igt_assert(start_loc = strstr(buf, "Current: "));
> +	igt_assert_eq(sscanf(start_loc, "Current: %u", &info.current), 1);
> +
> +	igt_assert(start_loc = strstr(buf, "Maximum: "));
> +	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &info.maximum), 1);
> +
> +	return info;
> +}
> +
> +/* Verifies that connector has the correct output bpc. */
> +static void assert_output_bpc(data_t *data, unsigned int bpc)
> +{
> +	output_bpc_t info = get_output_bpc(data);
> +
> +	igt_require_f(info.maximum >= bpc,
> +		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
> +		      info.maximum);
> +
> +	igt_assert_eq(info.current, bpc);
> +}
> +
> +/* Fills the FB with a test HDR pattern. */
> +static void draw_hdr_pattern(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +
> +	igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
> +	igt_paint_test_pattern(cr, fb->width, fb->height);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +/* Prepare test data. */
> +static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	data->pipe_id = pipe;
> +	data->pipe = &data->display.crtcs[data->pipe_id];
> +	igt_assert(data->pipe);
> +
> +	igt_display_reset(display);
> +
> +	data->output = output;
> +	igt_assert(data->output);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_assert(data->mode);
> +
> +	data->primary =
> +		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
> +					  IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +	igt_output_set_crtc(data->output, igt_crtc_for_pipe(display, data->pipe_id));
> +
> +	data->w = data->mode->hdisplay;
> +	data->h = data->mode->vdisplay;
> +}
> +
> +static bool igt_crtc_is_free(igt_display_t *display, igt_crtc_t *crtc)
> +{
> +	int i;
> +
> +	for (i = 0; i < display->n_outputs; i++)
> +		if (display->outputs[i].pending_crtc == crtc)
> +			return false;
> +
> +	return true;
> +}
> +
> +/* Returns true if an output supports max bpc property. */
> +static bool has_max_bpc(igt_output_t *output)
> +{
> +	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
> +	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
> +}
> +
> +
> +
> +/* Sets the HDR output metadata prop. */
> +static void set_hdr_output_metadata(data_t *data,
> +				    struct hdr_output_metadata const *meta)
> +{
> +	igt_output_replace_prop_blob(data->output,
> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
> +				     meta ? sizeof(*meta) : 0);
> +}
> +
> +
> +
> +static void test_static_toggle(data_t *data, igt_output_t *output,
> +			       uint32_t flags)
> +{
> +	igt_display_t *display = &data->display;
> +	struct hdr_output_metadata hdr;
> +	igt_crc_t ref_crc, new_crc;
> +	igt_crtc_t *crtc;
> +	igt_fb_t afb;
> +	int afb_id;
> +
> +	for_each_crtc(display, crtc) {
> +		if (!igt_crtc_connector_valid(crtc, output))
> +			continue;
> +
> +		if (!igt_crtc_is_free(display, crtc))
> +			continue;
> +
> +		prepare_test(data, output, crtc->pipe);
> +
> +		/* 10-bit formats are slow, so limit the size. */
> +		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
> +		igt_assert(afb_id);
> +
> +		draw_hdr_pattern(&afb);
> +
> +		igt_hdr_fill_output_metadata_st2084(&hdr);
> +
> +		/* Start with no metadata. */
> +		igt_plane_set_fb(data->primary, &afb);
> +		igt_plane_set_size(data->primary, data->w, data->h);
> +		set_hdr_output_metadata(data, NULL);
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		if (is_amdgpu_device(data->fd))
> +			assert_output_bpc(data, 8);
> +
> +		/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
> +		set_hdr_output_metadata(data, &hdr);
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		if (is_amdgpu_device(data->fd))
> +			assert_output_bpc(data, 10);
> +
> +		/* Verify that the CRC are equal after DPMS or suspend. */
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
> +		test_cycle_flags(data, flags);
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
> +
> +		/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
> +		set_hdr_output_metadata(data, NULL);
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		if (is_amdgpu_device(data->fd))
> +			assert_output_bpc(data, 8);
> +
> +		igt_assert_crc_equal(&ref_crc, &new_crc);
> +
> +		test_fini(data);
> +		igt_remove_fb(data->fd, &afb);
> +
> +		break;
> +	}
> +}
> +
> +static void test_static_swap(data_t *data, igt_output_t *output,
> +			     void (*fill_metadata)(struct hdr_output_metadata *),
> +			     const char *mode_name)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_crtc_t *crtc;
> +	igt_fb_t afb;
> +	int afb_id;
> +	struct hdr_output_metadata hdr;
> +
> +	for_each_crtc(display, crtc) {
> +		if (!igt_crtc_connector_valid(crtc, output))
> +			continue;
> +
> +		if (!igt_crtc_is_free(display, crtc))
> +			continue;
> +
> +		prepare_test(data, output, crtc->pipe);
> +
> +		/* 10-bit formats are slow, so limit the size. */
> +		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
> +		igt_assert(afb_id);
> +
> +		draw_hdr_pattern(&afb);
> +
> +		/* Start in the specified HDR mode. */
> +		igt_plane_set_fb(data->primary, &afb);
> +		igt_plane_set_size(data->primary, data->w, data->h);
> +		fill_metadata(&hdr);
> +		set_hdr_output_metadata(data, &hdr);
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		igt_info("wait %s!\n", mode_name);
> +		igt_debug_wait_for_keypress(mode_name);
> +
> +		/* Exit HDR mode and enter 8bpc, cleanup. */
> +		set_hdr_output_metadata(data, NULL);
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		test_fini(data);
> +		igt_remove_fb(data->fd, &afb);
> +
> +		break;
> +	}
> +}
> +
> +/* Returns true if an output supports HDR metadata property. */
> +static bool has_hdr(igt_output_t *output)
> +{
> +	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
> +}
> +
> +static void test_hdr(data_t *data, const char *test_name, uint32_t flags,
> +		    void (*fill_metadata)(struct hdr_output_metadata *),
> +		    const char *mode_name)
> +{
> +	igt_output_t *output;
> +	int valid_tests = 0;
> +
> +	for_each_connected_output(&data->display, output) {
> +		/* To test HDR, 10 bpc is required, so we need to
> +		 * set MAX_BPC property to 10bpc prior to setting
> +		 * HDR metadata property. Therefore, checking.
> +		 */
> +		if (!has_max_bpc(output) || !has_hdr(output)) {
> +			igt_info("%s connector not found with HDR metadata/max_bpc connector property\n", output->name);
> +			continue;
> +		}
> +
> +		if (!igt_hdr_is_panel_hdr(data->fd, output->id)) {
> +			igt_info("Panel attached via %s connector is non-HDR\n", output->name);
> +			continue;
> +		}
> +
> +		igt_info("HDR %s test execution on %s\n", test_name, output->name);
> +		if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
> +			test_static_toggle(data, output, flags);
> +		if (flags & TEST_SWAP)
> +			test_static_swap(data, output, fill_metadata, mode_name);
> +
> +		valid_tests++;
> +	}
> +
> +	igt_require_f(valid_tests, "No connector found with HDR metadata/max_bpc connector property (or) panel is non-HDR\n");
> +}
> +
> +int igt_main()
> +{
> +	data_t data = { 0 };
> +
> +	igt_fixture() {
> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(data.display.is_atomic);
> +
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Tests swapping to SMPTE ST2084 HDR metadata");
> +	igt_subtest("static-swap-smpte2084")
> +		test_hdr(&data, "static-swap-smpte2084", TEST_SWAP,
> +			 igt_hdr_fill_output_metadata_st2084, "smpte2084");
> +
> +	igt_describe("Tests swapping to traditional SDR gamma HDR metadata");
> +	igt_subtest("static-swap-traditional-sdr")
> +		test_hdr(&data, "static-swap-traditional-sdr", TEST_SWAP,
> +			 igt_hdr_fill_output_metadata_sdr, "traditional-sdr");
> +
> +	igt_fixture() {
> +		igt_display_fini(&data.display);
> +	}
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..9612acd83 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -104,6 +104,11 @@ executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('amd_hdr_visual', 'amd_hdr_visual.c',
> +	   dependencies : [tool_deps],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	msm_dp_compliance_src = [
>  		'msm_dp_compliance.c',
> -- 
> 2.43.0
> 

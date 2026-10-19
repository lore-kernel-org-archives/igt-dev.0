Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EACCCF2E3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 11:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D587210EC79;
	Mon, 19 Oct 2026 11:45:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085A610EC75
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792410289; x=1823946289;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=M5C8sJXvUGQHN+nseafYDOHkHGpv5uadXYUSldDHe9I=;
 b=bZb0sDCHvAyBe2G4a4rEzuHncyz1abaD6oycYXh6aF+k6tn43Yc6iZG+
 qPt/vqBmVUiOEw3H1qn3kpkvNgWsQGb/hvCjB9sIbQP2EF1PGTyeHHu75
 5GIEsm2Ygknlo2oLdrT8SPugUJqx6x2PaYfkaee5JtsNKbrqNCOHrrf87
 P0veGmPWfMmKJ/sGbQhttzRmM95QwyDbKI89hq0LCqCGcxGrIVD84x3/N
 JZidf4VIe9AhfDPmaXBk9I3uClMvv0tTidJQcq2t9oCwpk7/zzjR59gzf
 hGVzy00wF36/ZxQyf+iqrpy4rqi+QI8sSfphYO5U2dAhG+pK6v8E4FQBH w==;
X-CSE-ConnectionGUID: pFRQ8eHEQR2zQ2JgKgvA3g==
X-CSE-MsgGUID: 9uiFAIUCSs253NFk1hDf0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="969702"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="969702"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 04:44:48 -0700
X-CSE-ConnectionGUID: xcHhDZY6SxCPB8rnR8jazw==
X-CSE-MsgGUID: prmwyR/3TP6lnLOV7Wuj7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4272665"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 04:44:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/intel/kms_link_m_n: Add DisplayPort Link
 M/N ratio validation tests
In-Reply-To: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
Date: Mon, 19 Oct 2026 14:44:44 +0300
Message-ID: <b99129c2fe863cf6cace44b1b00d805a53e3e43c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 16 Oct 2026, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrote:
> Add a DisplayPort Link M/N validation test based on pipe CRC
> comparison.
>
> The test exercises a range of Link M/N integer ratios across supported
> link configurations and verifies that the generated output remains
> unchanged. CRC mismatches indicate potential link timing, transmission,
> or sink synchronization issues.
>
> Subtests are generated dynamically for each display pipeline, while
> unsupported configurations are skipped automatically.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_link_m_n.c | 434 +++++++++++++++++++++++++++++++++++++
>  tests/meson.build          |   3 +
>  2 files changed, 437 insertions(+)
>  create mode 100644 tests/intel/kms_link_m_n.c
>
> diff --git a/tests/intel/kms_link_m_n.c b/tests/intel/kms_link_m_n.c
> new file mode 100644
> index 000000000..17dd58cd5
> --- /dev/null
> +++ b/tests/intel/kms_link_m_n.c
> @@ -0,0 +1,434 @@
> +// SPDX-License-Identifier: MIT
> +/**
> + * TEST: kms link M/N
> + * Category: Display
> + * Description: Validate video Link M/N integer ratios from zero through ten
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + */
> +
> +/**
> + * SUBTEST: link_m_n_ratio_int0
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 0.
> + *
> + * SUBTEST: link_m_n_ratio_int1
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 1.
> + *
> + * SUBTEST: link_m_n_ratio_int2
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 2.
> + *
> + * SUBTEST: link_m_n_ratio_int3
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 3.
> + *
> + * SUBTEST: link_m_n_ratio_int4
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 4.
> + *
> + * SUBTEST: link_m_n_ratio_int5
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 5.
> + *
> + * SUBTEST: link_m_n_ratio_int6
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 6.
> + *
> + * SUBTEST: link_m_n_ratio_int7
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 7.
> + *
> + * SUBTEST: link_m_n_ratio_int8
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 8.
> + *
> + * SUBTEST: link_m_n_ratio_int9
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 9.
> + *
> + * SUBTEST: link_m_n_ratio_int10
> + * Description: Compare pipe CRCs for configurations with integer M/N ratio 10.
> + */

What's the point?

> +
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include "i915/i915_dp.h"
> +#include "igt.h"
> +#include "kms_joiner_helper.h"
> +
> +#define LINK_N 0x80000ULL
> +#define MAX_LINK_CONFIGS 32
> +
> +struct test_data {
> +	int drm_fd;
> +	igt_display_t display;
> +};
> +
> +static uint64_t link_symbol_clock_khz(int link_rate)
> +{
> +	uint64_t symbol_size = i915_dp_is_uhbr_rate(link_rate) ? 32 : 10;
> +
> +	return (uint64_t)link_rate * 10 / symbol_size;
> +}
> +
> +static uint64_t link_m_value(const drmModeModeInfo *mode, int link_rate)
> +{
> +	uint64_t clock = link_symbol_clock_khz(link_rate);
> +
> +	return ((uint64_t)mode->clock * LINK_N + clock / 2) / clock;
> +}
> +
> +static uint32_t link_m_n_integer(const drmModeModeInfo *mode, int link_rate)
> +{
> +	return link_m_value(mode, link_rate) / LINK_N;
> +}
> +
> +static bool wait_for_retrain(struct test_data *data, igt_output_t *output)
> +{
> +	struct timespec start, now;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	for (;;) {
> +		if (!i915_dp_get_pending_retrain(data->drm_fd, output))
> +			return true;
> +
> +		clock_gettime(CLOCK_MONOTONIC, &now);
> +		if ((now.tv_sec - start.tv_sec) +
> +		    (now.tv_nsec - start.tv_nsec) / 1e9 > 20.0)
> +			return false;
> +		usleep(100000);
> +	}
> +}
> +
> +static bool same_pixel_clock(const drmModeModeInfo *modes, int index)
> +{
> +	int i;
> +
> +	for (i = 0; i < index; i++)
> +		if (modes[i].clock == modes[index].clock)
> +			return true;
> +	return false;
> +}
> +
> +static void force_link(struct test_data *data, igt_output_t *output,
> +		       const struct i915_dp_link_config *config)
> +{
> +	char rate[32], lanes[32];
> +
> +	snprintf(rate, sizeof(rate), "%d", config->link_rate);
> +	snprintf(lanes, sizeof(lanes), "%d", config->lane_count);
> +	i915_dp_set_link_params(data->drm_fd, output, rate, lanes);
> +}
> +
> +static bool commit_mode(struct test_data *data, igt_output_t *output,
> +			igt_crtc_t *crtc, drmModeModeInfo *mode,
> +			struct igt_fb *fb,
> +			const struct i915_dp_link_config *config)
> +{
> +	igt_plane_t *primary;
> +	int ret;
> +
> +	/* Force link first: redetection invalidates connector mode pointers. */
> +	force_link(data, output, config);
> +	igt_display_reset(&data->display);
> +	igt_output_set_crtc(output, crtc);
> +	igt_output_override_mode(output, mode);
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, fb);
> +
> +	if (!igt_fit_modes_in_bw(&data->display)) {
> +		igt_info("Skipping %s at %d/%d: insufficient bandwidth\n",
> +			 mode->name, config->lane_count, config->link_rate);
> +		return false;
> +	}
> +
> +	/*
> +	 * DSC-required configurations fail atomic check with -EINVAL when DSC
> +	 * is unavailable. Treat that as an unsupported mode/link combination,
> +	 * not as a failure of the M/N test.
> +	 */
> +	ret = igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					    NULL);
> +	if (ret) {
> +		igt_info("Skipping %s at %d/%d: atomic check failed (%d), likely DSC required\n",
> +			 mode->name, config->lane_count, config->link_rate, ret);
> +		return false;
> +	}
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	i915_dp_force_link_retrain(data->drm_fd, output, 1);
> +	if (!wait_for_retrain(data, output)) {
> +		igt_info("Skipping %s at %d/%d: link retrain timed out\n",
> +			 mode->name, config->lane_count, config->link_rate);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static int fixed_lane_count(const struct i915_dp_link_config *configs,
> +			    int num_configs)
> +{
> +	int i, lanes = 0;
> +
> +	for (i = 0; i < num_configs; i++)
> +		if (configs[i].lane_count > lanes)
> +			lanes = configs[i].lane_count;
> +
> +	return lanes;
> +}
> +
> +static bool has_ratio(int drm_fd, const drmModeConnector *connector,
> +		      const struct i915_dp_link_config *configs,
> +		      int num_configs, int fixed_lanes,
> +		      uint32_t target_ratio)
> +{
> +	int mode, config;
> +
> +	for (mode = 0; mode < connector->count_modes; mode++) {
> +		if (same_pixel_clock(connector->modes, mode) ||
> +		    intel_mode_needs_joiner(drm_fd, &connector->modes[mode]))
> +			continue;
> +		for (config = 0; config < num_configs; config++)
> +			if (configs[config].lane_count == fixed_lanes &&
> +			    link_m_n_integer(&connector->modes[mode],
> +					     configs[config].link_rate) == target_ratio)
> +				return true;
> +	}
> +	return false;
> +}
> +
> +static void test_ratio_for_output(struct test_data *data,
> +				  igt_output_t *output,
> +				  igt_crtc_t *crtc,
> +				  uint32_t target_ratio)
> +{
> +	struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
> +	struct i915_dp_link_config max_config = { 0 };
> +	drmModeConnector *connector;
> +	drmModeModeInfo *modes;
> +	int fixed_lanes;
> +	int num_configs, mode, config;
> +
> +	i915_dp_reset_link_params(data->drm_fd, output);
> +	num_configs = i915_dp_get_allowed_link_configs(data->drm_fd, output,
> +						       configs, ARRAY_SIZE(configs));
> +	igt_require_f(num_configs > 0, "No allowed link configs for %s\n",
> +		      igt_output_name(output));
> +	connector = output->config.connector;
> +	fixed_lanes = fixed_lane_count(configs, num_configs);
> +
> +	/* Select the highest available rate while keeping one fixed lane count. */
> +	for (config = 0; config < num_configs; config++)
> +		if (configs[config].lane_count == fixed_lanes &&
> +		    configs[config].link_rate > max_config.link_rate)
> +			max_config = configs[config];
> +
> +	modes = calloc(connector->count_modes, sizeof(*modes));
> +	igt_assert(modes);
> +	memcpy(modes, connector->modes,
> +	       connector->count_modes * sizeof(*modes));
> +
> +	for (mode = 0; mode < connector->count_modes; mode++) {
> +		struct igt_fb fb;
> +		igt_pipe_crc_t *pipe_crc;
> +		igt_crc_t reference, current;
> +		igt_plane_t *primary = NULL;
> +		bool mode_has_ratio = false;
> +
> +		if (same_pixel_clock(modes, mode)) {
> +			igt_info("Skipping %s on %s: duplicate pixel clock\n",
> +				 modes[mode].name, igt_crtc_name(crtc));
> +			continue;
> +		}
> +
> +		if (intel_mode_needs_joiner(data->drm_fd, &modes[mode])) {
> +			igt_info("Skipping %s on %s: joiner required\n",
> +				 modes[mode].name, igt_crtc_name(crtc));
> +			continue;
> +		}
> +
> +		for (config = 0; config < num_configs; config++)
> +			if (configs[config].lane_count == fixed_lanes &&
> +			    link_m_n_integer(&modes[mode], configs[config].link_rate) ==
> +			    target_ratio) {
> +				mode_has_ratio = true;
> +				break;
> +			}
> +
> +		if (!mode_has_ratio) {
> +			igt_info("Skipping %s on %s: no link rate gives integer ratio %u at %d lanes\n",
> +				 modes[mode].name, igt_crtc_name(crtc),
> +				 target_ratio, fixed_lanes);
> +			continue;
> +		}
> +
> +		igt_create_color_fb(data->drm_fd, modes[mode].hdisplay,
> +				    modes[mode].vdisplay, DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0, &fb);
> +
> +		/* Capture one reference CRC at the maximum supported link rate. */
> +		if (!commit_mode(data, output, crtc, &modes[mode], &fb,
> +				 &max_config)) {
> +			igt_remove_fb(data->drm_fd, &fb);
> +			continue;
> +		}
> +
> +		pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_start(pipe_crc);
> +		igt_pipe_crc_collect_crc(pipe_crc, &reference);
> +		primary = igt_output_get_plane_type(output,
> +						    DRM_PLANE_TYPE_PRIMARY);
> +
> +		/* Reuse the reference for every matching ratio configuration. */
> +		for (config = 0; config < num_configs; config++) {
> +			unsigned int ratio;
> +
> +			if (configs[config].lane_count != fixed_lanes)
> +				continue;
> +			ratio = link_m_n_integer(&modes[mode],
> +						 configs[config].link_rate);
> +
> +			if (ratio != target_ratio)
> +				continue;
> +
> +			igt_info("Testing %s@%u: M=%llu N=%llu ratio=%u at %d/%d\n",
> +				 modes[mode].name, modes[mode].vrefresh,
> +				 (unsigned long long)link_m_value(&modes[mode],
> +								  configs[config].link_rate),
> +				 (unsigned long long)LINK_N, ratio,
> +				 configs[config].lane_count, configs[config].link_rate);
> +
> +			if (!commit_mode(data, output, crtc, &modes[mode], &fb,
> +					 &configs[config]))
> +				continue;
> +			primary = igt_output_get_plane_type(output,
> +							    DRM_PLANE_TYPE_PRIMARY);
> +			igt_plane_set_fb(primary, &fb);
> +			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +			igt_pipe_crc_drain(pipe_crc);
> +			igt_pipe_crc_collect_crc(pipe_crc, &current);
> +
> +			igt_assert_f(igt_check_crc_equal(&reference, &current),
> +				     "CRC mismatch for %s: max %d/%d, ratio %d/%d\n",
> +				     modes[mode].name,
> +				     max_config.lane_count, max_config.link_rate,
> +				     configs[config].lane_count, configs[config].link_rate);
> +		}
> +
> +		igt_pipe_crc_free(pipe_crc);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(data->drm_fd, &fb);
> +	}
> +
> +	free(modes);
> +}
> +
> +static bool run_ratio_test(struct test_data *data, uint32_t target_ratio)
> +{
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +	bool ran = false;
> +
> +	for_each_crtc_with_single_output(&data->display, crtc, output) {
> +		struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
> +		int num_configs, fixed_lanes;
> +
> +		if (output->config.connector->connector_type !=
> +		    DRM_MODE_CONNECTOR_DisplayPort ||
> +		    igt_check_output_is_dp_mst(output))
> +			continue;
> +
> +		i915_dp_reset_link_params(data->drm_fd, output);
> +		num_configs = i915_dp_get_allowed_link_configs(data->drm_fd, output,
> +							       configs, ARRAY_SIZE(configs));
> +		igt_require_f(num_configs > 0, "No allowed link configs for %s\n",
> +			      igt_output_name(output));
> +		fixed_lanes = fixed_lane_count(configs, num_configs);
> +		if (!has_ratio(data->drm_fd, output->config.connector, configs, num_configs,
> +			       fixed_lanes, target_ratio))
> +			continue;
> +
> +		igt_dynamic_f("%s-%s", igt_output_name(output), igt_crtc_name(crtc)) {
> +			test_ratio_for_output(data, output, crtc, target_ratio);
> +		}
> +		ran = true;
> +	}
> +
> +	return ran;
> +}
> +
> +IGT_TEST_DESCRIPTION("Validate video Link M/N integer ratios from zero through ten");
> +
> +int igt_main()
> +{
> +	struct test_data data = {};
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +		igt_require_pipe_crc(data.drm_fd);
> +	}
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 0.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int0")
> +		igt_require_f(run_ratio_test(&data, 0),
> +			      "No DP mode/link configuration has integer M/N ratio 0\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 1.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int1")
> +		igt_require_f(run_ratio_test(&data, 1),
> +			      "No DP mode/link configuration has integer M/N ratio 1\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 2.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int2")
> +		igt_require_f(run_ratio_test(&data, 2),
> +			      "No DP mode/link configuration has integer M/N ratio 2\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 3.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int3")
> +		igt_require_f(run_ratio_test(&data, 3),
> +			      "No DP mode/link configuration has integer M/N ratio 3\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 4.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int4")
> +		igt_require_f(run_ratio_test(&data, 4),
> +			      "No DP mode/link configuration has integer M/N ratio 4\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 5.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int5")
> +		igt_require_f(run_ratio_test(&data, 5),
> +			      "No DP mode/link configuration has integer M/N ratio 5\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 6.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int6")
> +		igt_require_f(run_ratio_test(&data, 6),
> +			      "No DP mode/link configuration has integer M/N ratio 6\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 7.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int7")
> +		igt_require_f(run_ratio_test(&data, 7),
> +			      "No DP mode/link configuration has integer M/N ratio 7\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 8.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int8")
> +		igt_require_f(run_ratio_test(&data, 8),
> +			      "No DP mode/link configuration has integer M/N ratio 8\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 9.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int9")
> +		igt_require_f(run_ratio_test(&data, 9),
> +			      "No DP mode/link configuration has integer M/N ratio 9\n");
> +
> +	igt_describe("Compare pipe CRCs for configurations with integer M/N ratio 10.");
> +	igt_subtest_with_dynamic("link_m_n_ratio_int10")
> +		igt_require_f(run_ratio_test(&data, 10),
> +			      "No DP mode/link configuration has integer M/N ratio 10\n");

The whole thing looks like a missing for loop to me.


> +
> +	igt_fixture() {
> +		igt_reset_connectors();
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 519a9e727..1f82ba868 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -253,6 +253,7 @@ intel_kms_progs = [
>  	'kms_cdclk',
>  	'kms_dirtyfb',
>  	'kms_dp_link_training',
> +	'kms_link_m_n',
>          'kms_dp_linktrain_fallback',
>  	'kms_draw_crc',
>  	'kms_dsc',
> @@ -403,6 +404,8 @@ extra_sources = {
>  	'kms_dp_link_training': [
>            join_paths ('intel', 'kms_mst_helper.c'),
>            join_paths ('intel', 'kms_joiner_helper.c') ],
> +	'kms_link_m_n': [
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>  	'kms_dsc': [
>            join_paths ('intel', 'kms_dsc_helper.c'),
>            join_paths ('intel', 'kms_joiner_helper.c') ],

-- 
Jani Nikula, Intel

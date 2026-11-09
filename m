Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76539606A31C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e53oWxiB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D10F10F26D;
	Mon,  9 Nov 2026 12:52:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC3410F26C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794228698; x=1825764698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QuCa0FZQ/yiHMHPFHWGv4UQSBpyyRc4lpQiAw3NDsic=;
 b=e53oWxiBXjN2I/swiwpMhrBAsB4Yp0Lhq2965iI5XSZo7tZaGIObxshV
 Jvg2MHrDkkwkj29jh055nRGJMOnP2cz3QtBSaK/5X3j4HPvCvkpbJcReK
 cepRS6qeYK87J1dz4t5xzT9tpzif1fpGsggVKWd+TfXpH1S7bcIxXpTGD
 1E3CLW3Hd+9Pzjob8Fxm5ggWZU8bG4ZW94MkMGWHLweS9iAsU5Ee5HIhz
 1kTvgd4k2f6SbBmJxgQuXliGBWqj0kYNaoEEHULK2Tinh+1EI5fLY5tcb
 JEfR5RcjcYOQsXv8XVYIuYdKVY+IQbrJnMXJOnHtqp4nRi2UPZjsJdQr/ w==;
X-CSE-ConnectionGUID: aece9MznTBKPLHDeRugCog==
X-CSE-MsgGUID: sCEsRvJsTOuPwwQfSr+0qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2848476"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2848476"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:51:37 -0800
X-CSE-ConnectionGUID: AelWwiHFSk+taH+57PuO9Q==
X-CSE-MsgGUID: 8AxsWONGTLCAnMtpJVrB4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7867892"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:51:36 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, kamil.konieczny@intel.com, jani.nikula@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_link_m_n: Add DisplayPort Link M/N
 ratio validation tests
Date: Mon,  9 Nov 2026 18:21:25 +0530
Message-ID: <20261109125125.4047454-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
References: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a DisplayPort Link M/N validation test based on pipe CRC
comparison.

The test exercises a range of Link M/N integer ratios across supported
link configurations and verifies that the generated output remains
unchanged. CRC mismatches indicate potential link timing, transmission,
or sink synchronization issues.

Subtests are generated dynamically for each display pipeline, while
unsupported configurations are skipped automatically.

v2: Address below code review comments:
    - Move kms_dp_link_ratio to the correct alphabetical position.
      (Kamil)
    - Rename the test to kms_dp_link_ratio. (Kamil)
    - Prefix subtests with dp_link_m_n_ratio. (Kamil)
    - Refactor subtests to use a loop. (Jani, Nikula)
    - Update subtest count to 22 as per the BSpec. (Suraj)

    Add the following new changes to eliminate unrelated errors:
    - Validate sink-side DPCD link status after retraining.
    - Skip failed configurations before selecting a CRC reference.

Bspec: 68922
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_dp_link_ratio.c | 453 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   3 +
 2 files changed, 456 insertions(+)
 create mode 100644 tests/intel/kms_dp_link_ratio.c

diff --git a/tests/intel/kms_dp_link_ratio.c b/tests/intel/kms_dp_link_ratio.c
new file mode 100644
index 000000000..edc8b8b10
--- /dev/null
+++ b/tests/intel/kms_dp_link_ratio.c
@@ -0,0 +1,453 @@
+// SPDX-License-Identifier: MIT
+/**
+ * TEST: kms link M/N
+ * Category: Display
+ * Description: Validate video Link M/N integer ratios up to the platform limit
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ */
+
+/**
+ * SUBTEST: dp_link_m_n_ratio_int%s
+ * Description: Compare pipe CRCs for configurations with integer M/N ratio %arg[1].
+ *
+ * arg[1]:
+ * @0: Integer M/N ratio 0
+ * @1: Integer M/N ratio 1
+ * @2: Integer M/N ratio 2
+ * @3: Integer M/N ratio 3
+ * @4: Integer M/N ratio 4
+ * @5: Integer M/N ratio 5
+ * @6: Integer M/N ratio 6
+ * @7: Integer M/N ratio 7
+ * @8: Integer M/N ratio 8
+ * @9: Integer M/N ratio 9
+ * @10: Integer M/N ratio 10
+ * @11: Integer M/N ratio 11
+ * @12: Integer M/N ratio 12
+ * @13: Integer M/N ratio 13
+ * @14: Integer M/N ratio 14
+ * @15: Integer M/N ratio 15
+ * @16: Integer M/N ratio 16
+ * @17: Integer M/N ratio 17
+ * @18: Integer M/N ratio 18
+ * @19: Integer M/N ratio 19
+ * @20: Integer M/N ratio 20
+ * @21: Integer M/N ratio 21
+ * @22: Integer M/N ratio 22
+ */
+
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "i915/i915_dp.h"
+#include "igt.h"
+#include "igt_dp.h"
+#include "intel_chipset.h"
+#include "kms_joiner_helper.h"
+
+#define LINK_N 0x80000ULL
+#define MAX_LINK_CONFIGS 32
+#define MAX_LINK_M_N_RATIO 22
+#define MAX_LEGACY_LINK_M_N_RATIO 10
+
+struct test_data {
+	int drm_fd;
+	int aux_fd;
+	igt_display_t display;
+};
+
+static uint64_t link_symbol_clock_khz(int link_rate)
+{
+	uint64_t symbol_size = i915_dp_is_uhbr_rate(link_rate) ? 32 : 10;
+
+	return (uint64_t)link_rate * 10 / symbol_size;
+}
+
+static uint64_t link_m_value(const drmModeModeInfo *mode, int link_rate)
+{
+	uint64_t clock = link_symbol_clock_khz(link_rate);
+
+	return ((uint64_t)mode->clock * LINK_N + clock / 2) / clock;
+}
+
+static uint32_t link_m_n_integer(const drmModeModeInfo *mode, int link_rate)
+{
+	return link_m_value(mode, link_rate) / LINK_N;
+}
+
+/* Avoid sending bandwidth-impossible modes to atomic check/link training. */
+static bool link_config_fits_mode(const drmModeModeInfo *mode,
+				  const struct i915_dp_link_config *config)
+{
+	uint64_t payload, required;
+
+	if (i915_dp_is_uhbr_rate(config->link_rate))
+		payload = (uint64_t)config->link_rate * config->lane_count * 1280 / 132;
+	else
+		payload = (uint64_t)config->link_rate * config->lane_count * 8;
+
+	required = (uint64_t)mode->clock * 24;
+	return payload >= required;
+}
+
+static bool wait_for_retrain(struct test_data *data, igt_output_t *output)
+{
+	struct timespec start, now;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	for (;;) {
+		if (!i915_dp_get_pending_retrain(data->drm_fd, output))
+			return true;
+
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		if ((now.tv_sec - start.tv_sec) +
+		    (now.tv_nsec - start.tv_nsec) / 1e9 > 20.0)
+			return false;
+		usleep(100000);
+	}
+}
+
+static bool same_pixel_clock(const drmModeModeInfo *modes, int index)
+{
+	int i;
+
+	for (i = 0; i < index; i++)
+		if (modes[i].clock == modes[index].clock)
+			return true;
+	return false;
+}
+
+static void force_link(struct test_data *data, igt_output_t *output,
+		       const struct i915_dp_link_config *config)
+{
+	char rate[32], lanes[32];
+
+	snprintf(rate, sizeof(rate), "%d", config->link_rate);
+	snprintf(lanes, sizeof(lanes), "%d", config->lane_count);
+	i915_dp_set_link_params(data->drm_fd, output, rate, lanes);
+}
+
+static bool link_status_good(struct test_data *data, igt_output_t *output)
+{
+	uint64_t status;
+
+	if (!kmstest_get_property(data->drm_fd,
+				  output->config.connector->connector_id,
+				  DRM_MODE_OBJECT_CONNECTOR, "link-status", NULL,
+				  &status, NULL))
+		return false;
+
+	return status == DRM_MODE_LINK_STATUS_GOOD;
+}
+
+static bool commit_mode(struct test_data *data, igt_output_t *output,
+			igt_crtc_t *crtc, drmModeModeInfo *mode,
+			struct igt_fb *fb,
+			const struct i915_dp_link_config *config)
+{
+	igt_plane_t *primary;
+	int ret;
+
+	/* Force link first: redetection invalidates connector mode pointers. */
+	force_link(data, output, config);
+	igt_display_reset(&data->display);
+	igt_output_set_crtc(output, crtc);
+	igt_output_override_mode(output, mode);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, fb);
+	/* link-status is latched BAD after failed training; clear it per attempt. */
+	igt_output_set_prop_value(output, IGT_CONNECTOR_LINK_STATUS,
+				  DRM_MODE_LINK_STATUS_GOOD);
+
+	if (!igt_fit_modes_in_bw(&data->display)) {
+		igt_info("Skipping %s at %d/%d: insufficient bandwidth\n",
+			 mode->name, config->lane_count, config->link_rate);
+		return false;
+	}
+
+	/*
+	 * DSC-required configurations fail atomic check with -EINVAL when DSC
+	 * is unavailable. Treat that as an unsupported mode/link combination,
+	 * not as a failure of the M/N test.
+	 */
+	ret = igt_display_try_commit_atomic(&data->display,
+					    DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET,
+					    NULL);
+	if (ret) {
+		igt_info("Skipping %s at %d/%d: atomic check failed (%d), likely DSC required\n",
+			 mode->name, config->lane_count, config->link_rate, ret);
+		return false;
+	}
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	i915_dp_force_link_retrain(data->drm_fd, output, 1);
+	if (!wait_for_retrain(data, output)) {
+		igt_info("Skipping %s at %d/%d: link retrain timed out\n",
+			 mode->name, config->lane_count, config->link_rate);
+		return false;
+	}
+
+	if (!link_status_good(data, output)) {
+		igt_info("Skipping %s at %d/%d: link training failed\n",
+			 mode->name, config->lane_count, config->link_rate);
+		return false;
+	}
+
+	/* DRM link-status can remain GOOD after a failed sink retrain. */
+	if (data->aux_fd >= 0) {
+		bool uhbr = i915_dp_is_uhbr_rate(config->link_rate);
+
+		ret = igt_dp_link_status_ok(data->aux_fd, config->lane_count, uhbr);
+		if (ret <= 0) {
+			igt_info("Skipping %s at %d/%d: sink link status is %s\n",
+				 mode->name, config->lane_count, config->link_rate,
+				 ret < 0 ? "unreadable" : "bad");
+			return false;
+		}
+	}
+
+	return true;
+}
+
+static bool has_ratio(int drm_fd, const drmModeConnector *connector,
+		      const struct i915_dp_link_config *configs,
+		      int num_configs, uint32_t target_ratio)
+{
+	int mode, config;
+
+	for (mode = 0; mode < connector->count_modes; mode++) {
+		if (same_pixel_clock(connector->modes, mode) ||
+		    intel_mode_needs_joiner(drm_fd, &connector->modes[mode]))
+			continue;
+		for (config = 0; config < num_configs; config++)
+			if (link_config_fits_mode(&connector->modes[mode], &configs[config]) &&
+			    link_m_n_integer(&connector->modes[mode],
+					     configs[config].link_rate) == target_ratio)
+				return true;
+	}
+	return false;
+}
+
+static void test_ratio_for_output(struct test_data *data,
+				  igt_output_t *output,
+				  igt_crtc_t *crtc,
+				  uint32_t target_ratio)
+{
+	struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
+	drmModeConnector *connector;
+	drmModeModeInfo *modes;
+	int num_configs, mode, config;
+
+	i915_dp_reset_link_params(data->drm_fd, output);
+	data->aux_fd = igt_dp_aux_open(data->drm_fd, output);
+	if (data->aux_fd < 0)
+		igt_info("%s: no AUX device, sink-side link checks are skipped\n",
+			 igt_output_name(output));
+
+	num_configs = i915_dp_get_allowed_link_configs(data->drm_fd, output,
+						       configs, ARRAY_SIZE(configs));
+	igt_require_f(num_configs > 0, "No allowed link configs for %s\n",
+		      igt_output_name(output));
+	connector = output->config.connector;
+
+	modes = calloc(connector->count_modes, sizeof(*modes));
+	igt_assert(modes);
+	memcpy(modes, connector->modes,
+	       connector->count_modes * sizeof(*modes));
+
+	for (mode = 0; mode < connector->count_modes; mode++) {
+		struct i915_dp_link_config usable[MAX_LINK_CONFIGS];
+		struct i915_dp_link_config max_config = { 0 };
+		struct igt_fb fb;
+		igt_pipe_crc_t *pipe_crc;
+		igt_crc_t reference, current;
+		igt_plane_t *primary = NULL;
+		bool mode_has_ratio = false;
+		bool reference_ready = false;
+		int num_usable = 0;
+		int reference_config = -1;
+		int pass;
+
+		if (same_pixel_clock(modes, mode)) {
+			igt_info("Skipping %s on %s: duplicate pixel clock\n",
+				 modes[mode].name, igt_crtc_name(crtc));
+			continue;
+		}
+
+		if (intel_mode_needs_joiner(data->drm_fd, &modes[mode])) {
+			igt_info("Skipping %s on %s: joiner required\n",
+				 modes[mode].name, igt_crtc_name(crtc));
+			continue;
+		}
+
+		for (config = 0; config < num_configs; config++)
+			if (link_config_fits_mode(&modes[mode], &configs[config]) &&
+			    link_m_n_integer(&modes[mode], configs[config].link_rate) ==
+			    target_ratio) {
+				usable[num_usable++] = configs[config];
+				mode_has_ratio = true;
+			}
+
+		if (!mode_has_ratio) {
+			igt_info("Skipping %s on %s: no link rate gives integer ratio %u\n",
+				 modes[mode].name, igt_crtc_name(crtc),
+				 target_ratio);
+			continue;
+		}
+
+		for (config = 0; config < num_usable; config++)
+			if (usable[config].link_rate > max_config.link_rate)
+				max_config = usable[config];
+
+		igt_create_color_fb(data->drm_fd, modes[mode].hdisplay,
+				    modes[mode].vdisplay, DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0, &fb);
+
+		/* Capture a reference CRC from the fastest configuration that trains. */
+
+		for (pass = 0; pass < 2 && !reference_ready; pass++) {
+			for (config = 0; config < num_usable; config++) {
+				bool max_rate = usable[config].link_rate == max_config.link_rate;
+
+				if ((pass == 0 && !max_rate) || (pass == 1 && max_rate))
+					continue;
+				if (commit_mode(data, output, crtc, &modes[mode], &fb,
+						&usable[config])) {
+					reference_ready = true;
+					reference_config = config;
+					break;
+				}
+			}
+		}
+
+		if (!reference_ready) {
+			igt_remove_fb(data->drm_fd, &fb);
+			continue;
+		}
+
+		pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_start(pipe_crc);
+		igt_pipe_crc_collect_crc(pipe_crc, &reference);
+		primary = igt_output_get_plane_type(output,
+						    DRM_PLANE_TYPE_PRIMARY);
+
+		/* Reuse the reference for every matching ratio configuration. */
+		for (config = 0; config < num_usable; config++) {
+			unsigned int ratio;
+
+			ratio = link_m_n_integer(&modes[mode], usable[config].link_rate);
+
+			if (ratio != target_ratio)
+				continue;
+			if (config == reference_config)
+				continue;
+
+			igt_info("Testing %s@%u: clock=%d kHz, M=%llu N=%llu ratio=%u at %d/%d\n",
+				 modes[mode].name, modes[mode].vrefresh, modes[mode].clock,
+				 (unsigned long long)link_m_value(&modes[mode],
+								  usable[config].link_rate),
+				 (unsigned long long)LINK_N, ratio,
+				 usable[config].lane_count, usable[config].link_rate);
+
+			if (!commit_mode(data, output, crtc, &modes[mode], &fb,
+					 &usable[config]))
+				continue;
+			primary = igt_output_get_plane_type(output,
+							    DRM_PLANE_TYPE_PRIMARY);
+			igt_plane_set_fb(primary, &fb);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+			igt_pipe_crc_drain(pipe_crc);
+			igt_pipe_crc_collect_crc(pipe_crc, &current);
+
+			igt_assert_f(igt_check_crc_equal(&reference, &current),
+				     "CRC mismatch for %s: max %d/%d, ratio %d/%d\n",
+				     modes[mode].name,
+				     usable[reference_config].lane_count,
+				     usable[reference_config].link_rate,
+				     usable[config].lane_count, usable[config].link_rate);
+		}
+
+		igt_pipe_crc_free(pipe_crc);
+		igt_plane_set_fb(primary, NULL);
+		igt_remove_fb(data->drm_fd, &fb);
+	}
+
+	if (data->aux_fd >= 0) {
+		close(data->aux_fd);
+		data->aux_fd = -1;
+	}
+	free(modes);
+}
+
+static bool run_ratio_test(struct test_data *data, uint32_t target_ratio)
+{
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+	bool ran = false;
+
+	for_each_crtc_with_single_output(&data->display, crtc, output) {
+		struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
+		int num_configs;
+
+		if (output->config.connector->connector_type !=
+		    DRM_MODE_CONNECTOR_DisplayPort ||
+		    igt_check_output_is_dp_mst(output))
+			continue;
+
+		i915_dp_reset_link_params(data->drm_fd, output);
+		num_configs = i915_dp_get_allowed_link_configs(data->drm_fd, output,
+							       configs, ARRAY_SIZE(configs));
+		igt_require_f(num_configs > 0, "No allowed link configs for %s\n",
+			      igt_output_name(output));
+		if (!has_ratio(data->drm_fd, output->config.connector, configs, num_configs,
+			       target_ratio))
+			continue;
+
+		igt_dynamic_f("%s-%s", igt_output_name(output), igt_crtc_name(crtc)) {
+			test_ratio_for_output(data, output, crtc, target_ratio);
+		}
+		ran = true;
+	}
+
+	return ran;
+}
+
+IGT_TEST_DESCRIPTION("Validate video Link M/N integer ratios from zero through twenty-two");
+
+int igt_main()
+{
+	struct test_data data = { .aux_fd = -1 };
+
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+		igt_require_pipe_crc(data.drm_fd);
+	}
+
+	for (int ratio = 0; ratio <= MAX_LINK_M_N_RATIO; ratio++) {
+		igt_describe_f("Compare pipe CRCs for configurations with integer M/N ratio %d.",
+			       ratio);
+		igt_subtest_with_dynamic_f("dp_link_m_n_ratio_int%d", ratio) {
+			igt_require_f(ratio <= MAX_LEGACY_LINK_M_N_RATIO ||
+				      intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 30,
+				      "Ratios above 10 require NVL or newer\n");
+			igt_require_f(run_ratio_test(&data, ratio),
+				      "No DP mode/link configuration has integer M/N ratio %d\n",
+				      ratio);
+		}
+	}
+
+	igt_fixture() {
+		igt_reset_connectors();
+		igt_display_fini(&data.display);
+		close(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index bb8bef0f9..532d1fa51 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -252,6 +252,7 @@ intel_kms_progs = [
 	'kms_cdclk',
 	'kms_color_pipeline',
 	'kms_dirtyfb',
+	'kms_dp_link_ratio',
 	'kms_dp_link_training',
         'kms_dp_linktrain_fallback',
 	'kms_draw_crc',
@@ -396,6 +397,8 @@ extra_sources = {
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_dp_link_ratio': [
+          join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_dp_linktrain_fallback': [
           join_paths ('intel', 'kms_mst_helper.c'),
           join_paths ('intel', 'kms_dsc_helper.c'),
-- 
2.43.0


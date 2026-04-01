Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE25E10F6FD6
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634A910EE0B;
	Wed,  1 Apr 2026 15:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQFqnMOI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3070510E5BD
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775058319; x=1806594319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1pM9cAdO/fEbhTYwONu/hz5vwO3W3gI99nBo8P+vVtE=;
 b=UQFqnMOITVlQHGT1M9jNv1xZyRFxS+G9R7TqjkNtLFTiteqMR+zx9LL0
 FbvyehEDeKVbOGRf+6A9HK6A1uzN+FB/lv4NiJhJkhF2TU7bPFfUfdRTz
 7DAhD9osrtnqL2vQDI5A9Sxn+t8+JUtKu3FR5O/M9gv0MYXO1VRyooLUR
 jY+symoe5EPfiN+hFUbTv7CAVXh2AEJsRuTQmEKE844iXt0J4qZnnp188
 BvcygpMxoYKbRd0tXI/1SYkaELuXzu6AftdOFsIE+Ayw6EMtBM4MZBOA4
 wByCKV0knJTjBOQI/iW0atQ5SX8t9NOWmXNXCFNZeGaDTwh7Z1PrF+Z0n w==;
X-CSE-ConnectionGUID: J4y9yMKHRpaXb6xnW3ja+w==
X-CSE-MsgGUID: QtWi6t80TtKsjmniiHNLKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79988990"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79988990"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:45:19 -0700
X-CSE-ConnectionGUID: 37NPKA4QRyKgs8MzcAljEQ==
X-CSE-MsgGUID: gfY792UTT3miwK3icgvpaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226960147"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:45:18 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 7/7] tests/intel/kms_mst: Add MST suspend-resume test
Date: Wed,  1 Apr 2026 21:36:27 +0530
Message-Id: <20260401160627.1338526-8-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401160627.1338526-1-kunal1.joshi@intel.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add a new subtest mst-suspend-read-crc that verifies MST outputs
preserve display content (via CRC comparison) across S3 suspend/resume.

The test enumerates all connected DP MST topologies, and for each root
connector exercises all non-empty subsets of the discovered MST outputs.
For each subset it:
 - Assigns pipes and selects non-joiner modes
 - Fits modes within bandwidth constraints
 - Creates green FBs, commits, and collects pre-suspend CRCs
 - Suspends to memory and resumes
 - Collects post-suspend CRCs and asserts they match

v2:
- Add error handling for igt_pipe_crc_new (Thasleem)
- Improve log format with index for clarity (Thasleem)
- Order declarations in decreasing line length (Thasleem)
- Add print message when no MST found (Thasleem)
- Add bounds check for idx in subset loop (Thasleem)
- Use igt_crtc_crc_new() instead of igt_pipe_crc_new() (Ville)

v3:
- framebuffers missing in commit (Bilal)

v4:
- Drop cleanup framework

v5:
- Use igt_debug instead of igt_info for CRC logging (Thasleem)
- Remove  comments (Suraj)
- Remove double vblank waits before/after suspend (Suraj)
- Rename variable (Thasleem)
- Two-pass approach (Suraj)

v6:
- Create seperate test (Ville)
- Move to tests/intel/ (Jani)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_mst.c | 349 ++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build     |   4 +
 2 files changed, 353 insertions(+)
 create mode 100644 tests/intel/kms_mst.c

diff --git a/tests/intel/kms_mst.c b/tests/intel/kms_mst.c
new file mode 100644
index 000000000..6e0ddce09
--- /dev/null
+++ b/tests/intel/kms_mst.c
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: kms mst
+ * Category: Display
+ * Description: Tests for DP MST (Multi-Stream Transport)
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ */
+
+#include "igt.h"
+#include "igt_sysfs.h"
+#include "kms_mst_helper.h"
+#include "kms_joiner_helper.h"
+#include <limits.h>
+
+/**
+ * SUBTEST: mst-suspend-read-crc
+ * Description: MST suspend test that verifies display content is preserved
+ *              across S3 suspend/resume using pipe CRC comparison.
+ */
+
+#define MAX_MST_OUTPUT	3
+
+struct mst_root_info {
+	int root_id;
+	igt_output_t *mst_outputs[IGT_MAX_PIPES];
+	int num_mst;
+};
+
+static void collect_single_crc(igt_crtc_t *crtc, igt_crc_t *crc)
+{
+	igt_pipe_crc_t *pipe_crc;
+
+	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
+	igt_assert(pipe_crc);
+	igt_pipe_crc_collect_crc(pipe_crc, crc);
+	igt_pipe_crc_free(pipe_crc);
+}
+
+static void collect_crc_for_active_outputs(igt_output_t **outputs,
+					   int num_outputs,
+					   igt_crc_t *crcs,
+					   bool post_suspend)
+{
+	int i;
+
+	for (i = 0; i < num_outputs; i++) {
+		igt_output_t *output = outputs[i];
+		igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
+
+		if (post_suspend)
+			igt_require_f(crtc,
+				      "POST-SUSPEND: no driving CRTC for %s (topology changed?)\n",
+				      output->name);
+		else
+			igt_assert_f(crtc,
+				     "PRE-SUSPEND: no driving CRTC for %s (bad pipe assignment?)\n",
+				     output->name);
+
+		collect_single_crc(crtc, &crcs[i]);
+	}
+}
+
+static void wait_for_vblanks(igt_output_t **outputs, int num_outputs,
+			     bool post_suspend)
+{
+	int i;
+
+	for (i = 0; i < num_outputs; i++) {
+		igt_crtc_t *crtc = igt_output_get_driving_crtc(outputs[i]);
+
+		if (post_suspend)
+			igt_require_f(crtc,
+				      "POST-SUSPEND: no driving CRTC for %s during vblank wait (topology changed?)\n",
+				      outputs[i]->name);
+		else
+			igt_assert_f(crtc,
+				     "PRE-SUSPEND: no driving CRTC for %s during vblank wait (bad pipe assignment?)\n",
+				     outputs[i]->name);
+
+		igt_wait_for_vblank(crtc);
+	}
+}
+
+static void log_crc_for_outputs(igt_output_t **outputs, int num_outputs,
+				igt_crc_t *crcs, const char *stage)
+{
+	int i;
+
+	for (i = 0; i < num_outputs; i++) {
+		igt_output_t *o = outputs[i];
+		drmModeModeInfo *m = igt_output_get_mode(o);
+		char *s = igt_crc_to_string(&crcs[i]);
+		igt_crtc_t *crtc = igt_output_get_driving_crtc(o);
+
+		igt_debug("[%d] %s: output %s -> crtc %s, CRC %s, mode %dx%d@%d\n",
+			  i, stage, o->name,
+			  igt_crtc_name(crtc),
+			  s,
+			  m ? m->hdisplay : -1,
+			  m ? m->vdisplay : -1,
+			  m ? m->vrefresh : 0);
+		free(s);
+	}
+}
+
+static void select_non_joiner_modes(int drm_fd, igt_output_t **outputs,
+				    int num_outputs)
+{
+	int max_dotclock = igt_get_max_dotclock(drm_fd);
+	int i;
+
+	if (max_dotclock <= 0)
+		max_dotclock = INT_MAX;
+
+	for (i = 0; i < num_outputs; i++) {
+		igt_output_t *output = outputs[i];
+		drmModeModeInfo non_joiner_mode;
+
+		igt_require_f(max_non_joiner_mode_found(drm_fd,
+							output->config.connector,
+							max_dotclock,
+							&non_joiner_mode),
+			      "No non-joiner mode found for %s\n",
+			      output->name);
+		igt_output_override_mode(output, &non_joiner_mode);
+	}
+}
+
+static void create_fbs_for_outputs(int drm_fd, igt_output_t **outputs,
+				   int num_outputs, struct igt_fb *fbs)
+{
+	int i;
+
+	for (i = 0; i < num_outputs; i++) {
+		igt_output_t *output = outputs[i];
+		drmModeModeInfo *mode = igt_output_get_mode(output);
+		igt_plane_t *primary;
+
+		igt_require_f(mode, "No mode available for output %s\n", output->name);
+
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		igt_create_color_fb(drm_fd,
+				    mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR,
+				    0.0, 1.0, 0.0,
+				    &fbs[i]);
+		igt_plane_set_fb(primary, &fbs[i]);
+	}
+}
+
+static void run_mst_subset_and_verify(igt_display_t *display,
+				      igt_output_t **active_outputs,
+				      int num_active,
+				      int n_crtcs,
+				      uint32_t master_pipes_mask,
+				      uint32_t valid_pipes_mask)
+{
+	igt_crc_t pre_crcs[MAX_MST_OUTPUT];
+	igt_crc_t post_crcs[MAX_MST_OUTPUT];
+	struct igt_fb fbs[MAX_MST_OUTPUT];
+	uint32_t used_pipes_mask = 0;
+	enum igt_suspend_test stest = SUSPEND_TEST_NONE;
+	int drm_fd = display->drm_fd;
+	int i;
+
+	igt_require_f(num_active <= n_crtcs,
+		      "Not enough crtcs for MST subset\n");
+
+	igt_require(igt_assign_pipes_for_outputs(drm_fd,
+						 active_outputs,
+						 num_active,
+						 n_crtcs,
+						 &used_pipes_mask,
+						 master_pipes_mask,
+						 valid_pipes_mask));
+
+	select_non_joiner_modes(drm_fd, active_outputs, num_active);
+
+	igt_require_f(igt_fit_modes_in_bw(display),
+		      "Unable to fit modes in bw\n");
+
+	create_fbs_for_outputs(drm_fd, active_outputs, num_active, fbs);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	/* rtcwake cmd is not supported on MTK devices */
+	if (is_mtk_device(drm_fd))
+		stest = SUSPEND_TEST_DEVICES;
+
+	igt_info("MST subset: %d outputs, n_crtcs=%d\n",
+		 num_active, n_crtcs);
+
+	wait_for_vblanks(active_outputs, num_active, false);
+	collect_crc_for_active_outputs(active_outputs,
+				       num_active,
+				       pre_crcs, false);
+	log_crc_for_outputs(active_outputs, num_active, pre_crcs, "PRE-SUSPEND");
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
+	wait_for_vblanks(active_outputs, num_active, true);
+	collect_crc_for_active_outputs(active_outputs,
+				       num_active,
+				       post_crcs, true);
+	log_crc_for_outputs(active_outputs, num_active, post_crcs, "POST-SUSPEND");
+
+	for (i = 0; i < num_active; i++)
+		igt_assert_crc_equal(&pre_crcs[i], &post_crcs[i]);
+
+	/* Detach FBs from planes and remove them to leave a clean state */
+	for (i = 0; i < num_active; i++) {
+		igt_plane_t *primary =
+			igt_output_get_plane_type(active_outputs[i],
+						  DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary, NULL);
+		igt_remove_fb(drm_fd, &fbs[i]);
+	}
+}
+
+static int discover_mst_roots(igt_display_t *display,
+			      struct mst_root_info *roots)
+{
+	igt_output_t *output;
+	int drm_fd = display->drm_fd;
+	int num_roots = 0;
+	int ret, i;
+
+	for_each_connected_output(display, output) {
+		bool root_seen = false;
+		int root_id;
+
+		root_id = igt_get_dp_mst_connector_id(output);
+		if (root_id < 0)
+			continue;
+
+		for (i = 0; i < num_roots; i++)
+			if (roots[i].root_id == root_id)
+				root_seen = true;
+
+		if (root_seen)
+			continue;
+
+		if (num_roots >= IGT_MAX_PIPES)
+			break;
+
+		roots[num_roots].root_id = root_id;
+		roots[num_roots].num_mst = 0;
+		ret = igt_find_all_mst_output_in_topology(drm_fd,
+							  display, output,
+							  roots[num_roots].mst_outputs,
+							  &roots[num_roots].num_mst);
+		igt_require(ret == 0);
+
+		if (roots[num_roots].num_mst == 0)
+			continue;
+
+		if (roots[num_roots].num_mst > MAX_MST_OUTPUT)
+			roots[num_roots].num_mst = MAX_MST_OUTPUT;
+
+		num_roots++;
+	}
+
+	return num_roots;
+}
+
+static void mst_suspend_read_crc(igt_display_t *display)
+{
+	struct mst_root_info roots[IGT_MAX_PIPES];
+	igt_output_t *active_outputs[MAX_MST_OUTPUT];
+	uint32_t valid_pipes_mask = 0;
+	uint32_t master_pipes_mask;
+	int n_crtcs = igt_display_n_crtcs(display);
+	int num_roots, num_active, i;
+	igt_crtc_t *crtc;
+
+	for_each_crtc(display, crtc)
+		valid_pipes_mask |= BIT(crtc->pipe);
+
+	igt_set_all_master_pipes_for_platform(display, &master_pipes_mask);
+
+	num_roots = discover_mst_roots(display, roots);
+	igt_require_f(num_roots > 0, "No MST roots found\n");
+
+	for (i = 0; i < num_roots; i++) {
+		igt_dynamic_f("mst-root-%d", roots[i].root_id) {
+			int mask;
+
+			for (mask = 1; mask < (1 << roots[i].num_mst); mask++) {
+				int bit, idx = 0;
+
+				for (bit = 0; bit < roots[i].num_mst; bit++) {
+					if (!(mask & (1 << bit)))
+						continue;
+
+					if (idx >= MAX_MST_OUTPUT)
+						break;
+
+					active_outputs[idx++] =
+						roots[i].mst_outputs[bit];
+				}
+
+				num_active = idx;
+				if (!num_active)
+					continue;
+
+				igt_display_reset(display);
+
+				run_mst_subset_and_verify(display,
+							  active_outputs,
+							  num_active,
+							  n_crtcs,
+							  master_pipes_mask,
+							  valid_pipes_mask);
+			}
+		}
+	}
+}
+
+int igt_main()
+{
+	igt_display_t display;
+	int drm_fd;
+
+	igt_fixture() {
+		drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		kmstest_set_vt_graphics_mode();
+		igt_require_pipe_crc(drm_fd);
+		igt_display_require(&display, drm_fd);
+		igt_display_require_output(&display);
+	}
+
+	igt_describe("MST suspend test that verifies display content is preserved "
+		     "across S3 suspend/resume using pipe CRC comparison.");
+	igt_subtest_with_dynamic("mst-suspend-read-crc") {
+		igt_require(igt_display_has_mst_output(&display));
+		mst_suspend_read_crc(&display);
+	}
+
+	igt_fixture() {
+		igt_display_fini(&display);
+		drm_close_driver(drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 26d9345ec..7272d68c6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -265,6 +265,7 @@ intel_kms_progs = [
 	'kms_joiner',
 	'kms_legacy_colorkey',
 	'kms_mmap_write_crc',
+	'kms_mst',
 	'kms_pipe_b_c_ivb',
 	'kms_pipe_stress',
 	'kms_pm_backlight',
@@ -403,6 +404,9 @@ extra_sources = {
            join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
+	'kms_mst': [
+           join_paths ('intel', 'kms_mst_helper.c'),
+           join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.25.1


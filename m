Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5CAC56205
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FC810E806;
	Fri, 20 Feb 2026 15:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVmeQoHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF0810E7FF
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599686; x=1803135686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=us6VdsAxTk06XAzNzWzTwsqncswyVvY9RLwbBpDFAaY=;
 b=VVmeQoHFZoAoMLGrQ4ri5o1Jt76Zx7K01YsK8oBKwR+wFRxwfvKfoCDh
 9rJIHbC3/lAG/HTYK3zr8Nj2pCpNCRohjyqGO/U+8mvCXBxmDJbtYeXHH
 oTIQmgOYUe/3Kz767xCrQNRQ1AGwta/gAdz9z5n+77lgs/a1dlf5IWska
 p5zIgXXYWAv+AJMmEckUnZTzPA+kj9JVLgrX820DU1P3Bpox3KozWwD0W
 Z5QZj1dN21MD3WGQzTWSjy3Ye5IcOEeffiTNCiGoFKd+Fq47BSTkeZ8Cm
 Cg4BpoB4j4oTa1u9jtZdVW11i8BVaf7bVFWmzaH+qDILjItj8GmkJn9E+ w==;
X-CSE-ConnectionGUID: zM+pOQ/wQhejxy2V/tjN6Q==
X-CSE-MsgGUID: /tqRrmQxTgixfRw76SRF4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72592309"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72592309"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:26 -0800
X-CSE-ConnectionGUID: SoCai1qfRua/3TuH2+bssA==
X-CSE-MsgGUID: +fk6NdtiSteMSRaHkYWYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="219411177"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 07:01:24 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST suspend-resume
 test
Date: Fri, 20 Feb 2026 20:52:39 +0530
Message-Id: <20260220152239.276034-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260220152239.276034-1-kunal1.joshi@intel.com>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_pipe_crc_basic.c | 314 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   3 +
 2 files changed, 317 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index f7b6ec293..59a44e92e 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -32,7 +32,10 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "intel/kms_mst_helper.h"
+#include "intel/kms_joiner_helper.h"
 #include <errno.h>
+#include <limits.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
@@ -77,6 +80,11 @@
  *              CRTC does not cause issues.
  */
 
+/**
+ * SUBTEST: mst-suspend-read-crc
+ * Description: MST suspend test for pipe CRC reads.
+ */
+
 static bool extended;
 static enum pipe active_pipes[IGT_MAX_PIPES];
 static uint32_t last_pipe;
@@ -96,6 +104,306 @@ static struct {
 	{ .r = 0.0, .g = 1.0, .b = 1.0 },
 };
 
+#define MAX_MST_OUTPUT 3
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
+		igt_info("[%d] %s: output %s -> crtc %s, CRC %s, mode %dx%d@%d\n",
+			 i, stage, o->name,
+			 igt_crtc_name(crtc),
+			 s,
+			 m ? m->hdisplay : -1,
+			 m ? m->vdisplay : -1,
+			 m ? m->vrefresh : 0);
+		free(s);
+	}
+}
+
+/*
+ * Select non-joiner modes for all outputs to ensure CRC collection works.
+ * Joiner configurations consume multiple pipes and are not yet validated here.
+ * Must be called before igt_fit_modes_in_bw() so that bandwidth fitting uses
+ * the correct (non-joiner) modes.
+ */
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
+				    0.0, 1.0, 0.0,  /* Green color */
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
+	int a;
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
+	wait_for_vblanks(active_outputs, num_active, false);
+
+	collect_crc_for_active_outputs(active_outputs,
+				       num_active,
+				       pre_crcs, false);
+
+	log_crc_for_outputs(active_outputs, num_active, pre_crcs, "PRE-SUSPEND");
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
+
+	wait_for_vblanks(active_outputs, num_active, true);
+	wait_for_vblanks(active_outputs, num_active, true);
+
+	collect_crc_for_active_outputs(active_outputs,
+				       num_active,
+				       post_crcs, true);
+
+	log_crc_for_outputs(active_outputs, num_active, post_crcs, "POST-SUSPEND");
+
+	for (a = 0; a < num_active; a++)
+		igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]);
+
+	/* Detach FBs from planes and remove them to leave a clean state */
+	for (a = 0; a < num_active; a++) {
+		igt_plane_t *primary =
+			igt_output_get_plane_type(active_outputs[a],
+						 DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary, NULL);
+		igt_remove_fb(drm_fd, &fbs[a]);
+	}
+}
+
+static void mst_suspend_read_crc(igt_display_t *display)
+{
+	int n_crtcs = igt_display_n_crtcs(display);
+	igt_output_t *active_outputs[MAX_MST_OUTPUT];
+	/*
+	 * igt_find_all_mst_output_in_topology() internally caps
+	 * discovery at IGT_MAX_PIPES entries, so this is the
+	 * correct upper bound for the buffer.
+	 */
+	igt_output_t *mst_outputs[IGT_MAX_PIPES];
+	/* Fixed upper bound for tracking traversed root connectors. */
+	int traversed_roots[IGT_MAX_PIPES] = { 0 };
+	int drm_fd = display->drm_fd;
+	uint32_t valid_pipes_mask = 0;
+	int num_mst, i, num_active;
+	uint32_t master_pipes_mask;
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+	int num_roots = 0;
+
+	for_each_crtc(display, crtc)
+		valid_pipes_mask |= BIT(crtc->pipe);
+
+	igt_set_all_master_pipes_for_platform(display, &master_pipes_mask);
+
+	for_each_connected_output(display, output) {
+		int root_id;
+		bool root_seen = false;
+
+		root_id = igt_get_dp_mst_connector_id(output);
+		if (root_id < 0) {
+			igt_info("Skipping non-mst output %s\n", output->name);
+			continue;
+		}
+
+		for (i = 0; i < num_roots; i++)
+			if (traversed_roots[i] == root_id)
+				root_seen = true;
+
+		if (root_seen)
+			continue;
+
+		num_mst = 0;
+		igt_require(igt_find_all_mst_output_in_topology(drm_fd, display,
+							output, mst_outputs,
+							&num_mst) == 0);
+		igt_assert_f(num_mst <= IGT_MAX_PIPES,
+			     "MST topology discovery overflow: num_mst=%d > IGT_MAX_PIPES=%d\n",
+			     num_mst, IGT_MAX_PIPES);
+		if (num_mst == 0) {
+			igt_info("No MST outputs found in topology for output %s\n",
+				 output->name);
+			igt_skip("No MST outputs found in topology\n");
+		}
+
+		if (num_roots < IGT_MAX_PIPES)
+			traversed_roots[num_roots++] = root_id;
+
+		if (num_mst > MAX_MST_OUTPUT)
+			num_mst = MAX_MST_OUTPUT;
+
+		igt_dynamic_f("mst-root-%d", root_id) {
+			int mask;
+
+			for (mask = 1; mask < (1 << num_mst); mask++) {
+				int bit, idx = 0;
+
+				/* build subset for this bitmask */
+				for (bit = 0; bit < num_mst; bit++) {
+					if (!(mask & (1 << bit)))
+						continue;
+
+					if (idx >= MAX_MST_OUTPUT)
+						break;
+
+					active_outputs[idx++] = mst_outputs[bit];
+				}
+
+				num_active = idx;
+				if (!num_active)
+					continue;
+
+				igt_display_reset(display);
+
+				run_mst_subset_and_verify(display, active_outputs,
+							  num_active, n_crtcs,
+							  master_pipes_mask,
+							  valid_pipes_mask);
+			}
+		}
+	}
+}
+
 static bool simulation_constraint(igt_crtc_t *crtc)
 {
 	if (igt_run_in_simulation() && !extended &&
@@ -525,6 +833,12 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_describe("MST suspend test for pipe CRC reads.");
+	igt_subtest_with_dynamic("mst-suspend-read-crc") {
+		igt_require(igt_display_has_mst_output(&data.display));
+		mst_suspend_read_crc(&data.display);
+	}
+
 	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
diff --git a/tests/meson.build b/tests/meson.build
index 7f356de9b..06c0d8e98 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -399,6 +399,9 @@ extra_sources = {
            join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
+	'kms_pipe_crc_basic': [
+		join_paths ('intel', 'kms_mst_helper.c'),
+		join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.43.0


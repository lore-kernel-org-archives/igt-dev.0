Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8FFE73144
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 08:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D303010E39F;
	Mon,  2 Feb 2026 08:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="creKks8m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABE710E2DD
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770020683; x=1801556683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u2yxa8CtAbW61Sx84+xmUpjdp9jDAK18TmmfbYFE5fU=;
 b=creKks8mEnpaJy3rj37ntXzkLeP/6tSjDGuEbGKSADDrCtu86Xbdcv0V
 aAKDHXIwp6wR3Rbb3wh9yNtbcgPB5uDL2p7okFbgyfe4oTD6WY8MoTxw/
 BItmsFKgUuumwX6j3gNDvnIWObgzE+SvXprgPdT7nvVYpXM0hBI/YQobA
 VOsxzOBWXML4mdXVZGgJDkVs2kWH7C/L+dXWtZXTYU9hnadrDkkgJY81C
 BSzL3VbSdYdXbfxEg8xGgL35icerGXhaSIUloxZPnavRGGpxBTOLEmTeA
 NKrRLVPX/ndXBpR6IK8vU30XOB0lXAMdc9sZDngnTXoFixb5NLT9x2pax w==;
X-CSE-ConnectionGUID: kGz1DtvXRjqXJ7sYeLbt4g==
X-CSE-MsgGUID: Td5RFk4uQbyh1Du8FSMUpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58756447"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58756447"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:24:42 -0800
X-CSE-ConnectionGUID: M8wGBCoETGqOj/2oAX7vgw==
X-CSE-MsgGUID: z9Zr7NniQ4+SXL4r3vJgGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209455122"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 00:24:32 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 6/6] tests/kms_pipe_crc_basic: Add MST suspend-resume
 test
Date: Mon,  2 Feb 2026 14:15:39 +0530
Message-Id: <20260202084539.2524306-7-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202084539.2524306-1-kunal1.joshi@intel.com>
References: <20260202084539.2524306-1-kunal1.joshi@intel.com>
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

Add mst-suspend-read-crc subtest that:
- Validates CRCs across MST topology outputs
- Tests CRC consistency before and after system suspend
- Iterates through MST output subsets for comprehensive testing

v2:
- Add error handling for igt_pipe_crc_new (Thasleem)
- Improve log format with index for clarity (Thasleem)
- Order declarations in decreasing line length (Thasleem)
- Add print message when no MST found (Thasleem)
- Add bounds check for idx in subset loop (Thasleem)
- Use igt_crtc_crc_new() instead of igt_pipe_crc_new() (Ville)

v3:
- framebuffers missing in commit (Bilal)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_pipe_crc_basic.c | 246 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   3 +
 2 files changed, 249 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index f1deaf081..005960dfd 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -33,6 +33,8 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_cleanup.h"
+#include "intel/kms_mst_helper.h"
+#include "intel/kms_joiner_helper.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -78,6 +80,11 @@
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
@@ -97,6 +104,239 @@ static struct {
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
+static void collect_crc_for_active_outputs(igt_display_t *display,
+					   igt_output_t **outputs,
+					   int num_outputs,
+					   igt_crc_t *crcs)
+{
+	int i;
+
+	for (i = 0; i < num_outputs; i++) {
+		igt_output_t *output = outputs[i];
+		igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
+
+		igt_assert(crtc != NULL);
+		collect_single_crc(crtc, &crcs[i]);
+	}
+}
+
+static void wait_for_vblanks(igt_output_t **outputs, int num_outputs)
+{
+	int i;
+
+	for (i = 0; i < num_outputs; i++) {
+		igt_crtc_t *crtc = igt_output_get_driving_crtc(outputs[i]);
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
+static void create_fbs_for_outputs(int drm_fd, igt_output_t **outputs,
+				   int num_outputs, struct igt_fb *fbs)
+{
+	int i;
+
+	for (i = 0; i < num_outputs; i++) {
+		igt_output_t *output = outputs[i];
+		drmModeModeInfo *mode = igt_output_get_mode(output);
+		igt_plane_t *primary = igt_output_get_plane_type(output,
+								 DRM_PLANE_TYPE_PRIMARY);
+
+		igt_create_color_fb(drm_fd,
+				    mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR,
+				    0.0, 1.0, 0.0,  /* Green color */
+				    &fbs[i]);
+		igt_cleanup_register_fb(drm_fd, &fbs[i]);
+		igt_plane_set_fb(primary, &fbs[i]);
+	}
+}
+
+/*FIXME: crc for joiners*/
+static void run_mst_subset_and_verify(igt_display_t *display,
+				      igt_output_t **active_outputs,
+				      int num_active,
+				      int n_crtcs,
+				      uint32_t master_pipes_mask,
+				      uint32_t valid_pipes_mask)
+{
+	igt_crc_t pre_crcs[IGT_MAX_PIPES];
+	igt_crc_t post_crcs[IGT_MAX_PIPES];
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
+	wait_for_vblanks(active_outputs, num_active);
+
+	collect_crc_for_active_outputs(display,
+				       active_outputs,
+				       num_active,
+				       pre_crcs);
+
+	log_crc_for_outputs(active_outputs, num_active, pre_crcs, "PRE-SUSPEND");
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
+
+	wait_for_vblanks(active_outputs, num_active);
+
+	collect_crc_for_active_outputs(display,
+				       active_outputs,
+				       num_active,
+				       post_crcs);
+
+	log_crc_for_outputs(active_outputs, num_active, post_crcs, "POST-SUSPEND");
+
+	for (a = 0; a < num_active; a++)
+		igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]);
+}
+
+static void mst_suspend_read_crc(igt_display_t *display)
+{
+	int n_crtcs = igt_display_n_crtcs(display);
+	igt_output_t *active_outputs[MAX_MST_OUTPUT];
+	igt_output_t *mst_outputs[MAX_MST_OUTPUT];
+	int traversed_roots[IGT_MAX_PIPES];
+	int drm_fd = display->drm_fd;
+	uint32_t valid_pipes_mask = 0;
+	int num_mst, i, num_active;
+	uint32_t master_pipes_mask;
+	igt_output_t *output;
+	int num_roots = 0;
+
+	for (i = 0; i < IGT_MAX_PIPES; i++) {
+		if (display->crtcs[i].valid)
+			valid_pipes_mask |= BIT(i);
+	}
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
+								output, mst_outputs,
+								&num_mst) == 0);
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
+		/* In future if we can print name of MST hub will be great */
+		igt_dynamic_f("mst-topo-%d", num_roots) {
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
 static bool simulation_constraint(enum pipe pipe)
 {
 	if (igt_run_in_simulation() && !extended &&
@@ -502,6 +742,12 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
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
 	}
diff --git a/tests/meson.build b/tests/meson.build
index ef4edaa0d..ab70948bc 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -398,6 +398,9 @@ extra_sources = {
            join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
+	'kms_pipe_crc_basic': [
+           join_paths ('intel', 'kms_mst_helper.c'),
+           join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.43.0


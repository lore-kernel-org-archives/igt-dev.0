Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E886BD10390
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 09:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECB510E54C;
	Wed, 26 Nov 2025 09:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9BnIBz5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE42C10E54C
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 09:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764148100; x=1795684100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jCcbuJtGBEo+hVKrfa6KJ4RKVu/ASsExkPdA8vHtY4o=;
 b=D9BnIBz5jqJCD4KmecR/CcS5WZFbq7Qvy16ELo+JzYH/INPXzYsX9HaL
 x9QrMXJjYTj2SqtJ2XUyWRGzh5JdE8tq6sY+SDQifBy1tSyC2Q7CZGVg/
 d7xbpLtgfNiCELjI/L++8tHLmumMFUGkK24WC0gRwktGFk2vj2PPHW7nz
 S9RZPXuZ7p+EleTCONq37k9vSsVftJI8uYqY9LLN1LiRVGrzWRcouCqEr
 6/WCc9eNre8ILMwaR3HjQXQl3nQMrSGA6AUP8tgvTZTon1KTGiEBPleGH
 UN5RRBmunDgG18NpkpsQdAIIXIPIZW74ahAFjPIl9/Y46g6FV94kdK4Xs Q==;
X-CSE-ConnectionGUID: r67OhOP5QjSSRiTZPzQJvA==
X-CSE-MsgGUID: gio71YeuQZKzcA9v9E6wtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="88826977"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="88826977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:08:19 -0800
X-CSE-ConnectionGUID: nGPJ8CQQQN2KTM8m0E4JaA==
X-CSE-MsgGUID: 5DLmIDmHRQ+SZe7Xct0cGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="223850075"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:08:17 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t] tests/kms_pipe_crc_basic: add mst suspend-resume test
Date: Wed, 26 Nov 2025 14:54:12 +0530
Message-Id: <20251126092412.739982-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Extend kms_pipe_crc_basic with an MST-specific
suspend-resume subtest.

mst-suspend-read-crc subtest does below:
-> Enumerates MST topologies using the PATH-based helpers.
-> Builds all non-empty subsets of up to MAX_MST_OUTPUT
   outputs per topology.
-> Assigns pipes in a joiner-aware way and enforces
   link bandwidth limits.
-> Asserts that pre and post-suspend CRCs match for each
   tested subset.

Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
---
 tests/kms_pipe_crc_basic.c | 206 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   3 +
 2 files changed, 209 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 9750d014c..3a8cd3251 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -32,6 +32,8 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "intel/kms_mst_helper.h"
+#include "intel/kms_joiner_helper.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -77,6 +79,11 @@
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
@@ -96,6 +103,194 @@ static struct {
 	{ .r = 0.0, .g = 1.0, .b = 1.0 },
 };
 
+#define MAX_MST_OUTPUT 3
+
+static void collect_single_crc(int drm_fd, enum pipe pipe, igt_crc_t *crc)
+{
+	igt_pipe_crc_t *pipe_crc;
+
+	pipe_crc = igt_pipe_crc_new(drm_fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
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
+		enum pipe pipe = output->pending_pipe;
+
+		igt_assert(pipe >= 0 && pipe < IGT_MAX_PIPES);
+		collect_single_crc(display->drm_fd, pipe, &crcs[i]);
+	}
+}
+
+static void run_mst_subset_and_verify(igt_display_t *display,
+				      igt_output_t **active_outputs,
+				      int num_active,
+				      int n_pipes,
+				      uint32_t master_pipes_mask,
+				      uint32_t valid_pipes_mask)
+{
+	int a;
+	igt_crc_t pre_crcs[IGT_MAX_PIPES];
+	igt_crc_t post_crcs[IGT_MAX_PIPES];
+	uint32_t used_pipes_mask = 0;
+	enum igt_suspend_test stest = SUSPEND_TEST_NONE;
+	int drm_fd = display->drm_fd;
+
+	igt_require_f(num_active <= n_pipes,
+		      "Not enough pipes for MST subset\n");
+
+	igt_require(igt_assign_pipes_for_outputs(drm_fd,
+						 active_outputs,
+						 num_active,
+						 n_pipes,
+						 &used_pipes_mask,
+						 master_pipes_mask,
+						 valid_pipes_mask));
+
+	igt_require_f(igt_fit_modes_in_bw(display),
+		      "Unable to fit modes in bw\n");
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_info("MST subset: %d outputs, n_pipes=%d\n",
+		 num_active, n_pipes);
+	for (a = 0; a < num_active; a++) {
+		igt_output_t *o = active_outputs[a];
+		drmModeModeInfo *m = igt_output_get_mode(o);
+
+		igt_info(" pre: output %s pipe %s mode %dx%d@%d\n",
+			 o->name,
+			 kmstest_pipe_name(o->pending_pipe),
+			 m ? m->hdisplay : -1,
+			 m ? m->vdisplay : -1,
+			 m ? m->vrefresh : 0);
+	}
+
+	collect_crc_for_active_outputs(display,
+				       active_outputs,
+				       num_active,
+				       pre_crcs);
+
+	for (a = 0; a < num_active; a++) {
+		char *s = igt_crc_to_string(&pre_crcs[a]);
+
+		igt_info(" pre: output %s CRC %s\n",
+			 active_outputs[a]->name, s);
+		free(s);
+	}
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
+
+	collect_crc_for_active_outputs(display,
+				       active_outputs,
+				       num_active,
+				       post_crcs);
+
+	for (a = 0; a < num_active; a++) {
+		igt_output_t *o = active_outputs[a];
+		drmModeModeInfo *m = igt_output_get_mode(o);
+		char *s_post = igt_crc_to_string(&post_crcs[a]);
+
+		igt_info(" post: output %s CRC %s mode %dx%d@%d\n",
+			 o->name,
+			 s_post,
+			 m ? m->hdisplay : -1,
+			 m ? m->vdisplay : -1,
+			 m ? m->vrefresh : 0);
+		free(s_post);
+	}
+
+	for (a = 0; a < num_active; a++)
+		igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]);
+}
+
+static void mst_suspend_read_crc(igt_display_t *display)
+{
+	igt_output_t *output;
+	igt_output_t *mst_outputs[MAX_MST_OUTPUT];
+	igt_output_t *active_outputs[MAX_MST_OUTPUT];
+	int num_mst, i, num_active;
+	int traversed_roots[IGT_MAX_PIPES];
+	int num_roots = 0;
+	uint32_t valid_pipes_mask = 0;
+	uint32_t master_pipes_mask;
+	int n_pipes = igt_display_get_n_pipes(display);
+	int drm_fd = display->drm_fd;
+
+	for (i = 0; i < IGT_MAX_PIPES; i++) {
+		if (display->pipes[i].valid)
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
+		igt_require(num_mst > 0);
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
+							  num_active, n_pipes,
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
@@ -456,6 +651,17 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_describe("MST suspend test for pipe CRC reads.");
+	igt_subtest_with_dynamic("mst-suspend-read-crc") {
+		bool found_mst_output = false;
+
+		for_each_connected_output(&data.display, output)
+			found_mst_output = found_mst_output |
+					   igt_check_output_is_dp_mst(output);
+		igt_require_f(found_mst_output, "Need at least 1 MST output\n");
+		mst_suspend_read_crc(&data.display);
+	}
+
 	igt_describe("Check that disabling CRCs on a CRTC after having disabled the CRTC "
 		     "does not cause issues.");
 	igt_subtest_with_dynamic("disable-crc-after-crtc") {
diff --git a/tests/meson.build b/tests/meson.build
index da70c5014..59dc52492 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -392,6 +392,9 @@ extra_sources = {
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
+        'kms_pipe_crc_basic': [
+           join_paths ('intel', 'kms_mst_helper.c'),
+           join_paths ('intel', 'kms_joiner_helper.c') ],
 }
 
 # Extra dependencies used on core and Intel drivers
-- 
2.25.1


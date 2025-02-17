Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAACBC021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 06:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A29C10E369;
	Mon, 17 Feb 2025 06:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aG3/htGr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3B610E369
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 06:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739773624; x=1771309624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wezcs8A9lZp9yArt144HvVbAP1wFaxvyzbax3v/vxjQ=;
 b=aG3/htGruxsk4tlid+KISUNGPKmAB1cedofkFu4RwlCD+CA7ULz0+nB2
 drg7plu5+r2MEB6wqz0OaERLcc0bkqn9vgQgVz2UsLt4bS+fjCDYJsQSI
 erT/I73gcm8+nhTBjHhdrfCZBCsyHM+CvQoP0I/ec9rX7Yxnvq+jAP2Jn
 bHKQj6FjvG1Fn+7JWP9rC4ZiGzORIqvAz2J/47l+0/z2JGeq/OWIwR7pL
 GFwynebBTfMxEYHpjbZvBioSo5IozQN0hjKIg8hGkZBBDQ2nwkncV1biy
 7zzlGx0fFSWPIS8m9q6x9N8gk+njqOvnKYUvQddhmmcn0dNxdmofiL3fn g==;
X-CSE-ConnectionGUID: a54x2jNNQeWcIK2KPT5Sdw==
X-CSE-MsgGUID: qJNtsuXSSve67TGeAKZ8TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40149654"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40149654"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 22:27:04 -0800
X-CSE-ConnectionGUID: 9NaTa+F0TEqGEdMUh4zLiA==
X-CSE-MsgGUID: 1zqmnOnsRgGlttptt8U5wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="114661959"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 22:27:03 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/kms_joiner_helper: add helper for
 joiner-related functions
Date: Mon, 17 Feb 2025 12:12:37 +0530
Message-Id: <20250217064239.2019316-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217064239.2019316-1-kunal1.joshi@intel.com>
References: <20250217064239.2019316-1-kunal1.joshi@intel.com>
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

Add helper to handle Big Joiner and Ultra Joiner
logic in a centralized manner. Add utility functions
to set and manage master pipes, as well as to assign
consecutive pipes for multi-pipe configurations.

v2: fix commit and subject (Swati)
    split patch (Swati)
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_joiner.c        |  15 +--
 tests/intel/kms_joiner_helper.c | 181 ++++++++++++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h |  20 ++++
 tests/meson.build               |   1 +
 4 files changed, 204 insertions(+), 13 deletions(-)
 create mode 100644 tests/intel/kms_joiner_helper.c
 create mode 100644 tests/intel/kms_joiner_helper.h

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 080e8ff52..771c9b8b3 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -37,6 +37,7 @@
 #include "igt.h"
 #include "xe/xe_query.h"
 #include "kms_dsc_helper.c"
+#include "kms_joiner_helper.h"
 
 /**
  * SUBTEST: invalid-modeset-big-joiner
@@ -106,18 +107,6 @@ typedef struct {
 
 static int max_dotclock;
 
-static void set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *master_pipes)
-{
-	enum pipe pipe;
-
-	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
-		if (display->pipes[pipe].enabled && display->pipes[pipe + 1].enabled) {
-			*master_pipes |= BIT(pipe);
-			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
-		}
-	}
-}
-
 static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
 {
 	bool status;
@@ -561,7 +550,7 @@ igt_main
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
-		set_all_master_pipes_for_platform(&data.display, &data.master_pipes);
+		igt_set_all_master_pipes_for_platform(&data.display, &data.master_pipes);
 		igt_require(data.display.is_atomic);
 		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 
diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
new file mode 100644
index 000000000..17a22d34a
--- /dev/null
+++ b/tests/intel/kms_joiner_helper.c
@@ -0,0 +1,181 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "kms_joiner_helper.h"
+#include "igt.h"
+#include "igt_kms.h"
+#include "intel_chipset.h"
+
+/*
+ * Detect if the output needs 1, 2, or 4 pipes (non-joiner, big joiner, ultra).
+ */
+static int get_required_pipes(int drm_fd, igt_output_t *output)
+{
+	bool is_big = false, is_ultra = false;
+	int max_dotclock;
+	drmModeModeInfo mode;
+
+	if (!is_intel_device(drm_fd))
+		return -1;
+
+	max_dotclock = igt_get_max_dotclock(drm_fd);
+
+	is_ultra = ultrajoiner_mode_found(drm_fd,
+			output->config.connector,
+			max_dotclock,
+			&mode);
+	is_big = bigjoiner_mode_found(drm_fd,
+			output->config.connector,
+			max_dotclock,
+			&mode);
+
+	if (is_ultra)
+		return 4;
+	if (is_big)
+		return 2;
+
+	return 1;
+}
+
+/*
+ * Internal helper to find a block of consecutive free pipes
+ * in available_pipes_mask. If count > 1, the first pipe must also
+ * be in master_pipes_mask.
+ *
+ * Returns the starting pipe index or -1 if not found.
+ */
+static int find_consecutive_pipes(int n_pipes,
+				  uint32_t available_pipes_mask,
+				  uint32_t master_pipes_mask,
+				  int count)
+{
+	int i = 0, pipe_idx = 0;
+	bool can_use;
+
+	for (int start = 0; start < n_pipes; start++) {
+		if (((start + count) - 1) >= n_pipes)
+			break;
+
+		if ((count > 1) && (!(BIT(start) & master_pipes_mask)))
+			continue;
+
+		can_use = true;
+		for (i = 0; i < count; i++) {
+			pipe_idx = start + i;
+			if (!(BIT(pipe_idx) & available_pipes_mask)) {
+				can_use = false;
+				break;
+			}
+		}
+		if (can_use)
+			return start;
+	}
+	return -1;
+}
+
+static enum pipe get_next_master_pipe(uint32_t pipe_mask)
+{
+	int i;
+
+	if (!pipe_mask)
+		return PIPE_NONE;
+
+	i = ffs(pipe_mask) - 1;
+
+	if (i < 0)
+		return PIPE_NONE;
+
+	return i;
+}
+
+/**
+ * igt_set_all_master_pipes_for_platform:
+ * @master_pipes: Pointer to the variable to store the master pipes bitmask.
+ * @display: The display structure containing pipe information.
+ *
+ * This function sets the master pipes for the platform by checking if consecutive
+ * pipes are enabled. If both pipe and the next pipe are enabled, the pipe is
+ * considered a master pipe.
+ */
+void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *master_pipes)
+{
+	enum pipe pipe;
+
+	*master_pipes = 0;
+	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
+		if (display->pipes[pipe].enabled && display->pipes[pipe + 1].enabled) {
+			*master_pipes |= BIT(pipe);
+			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
+		}
+	}
+}
+
+/*
+ * @drm_fd: DRM file descriptor
+ * @outputs: array of pointers to igt_output_t
+ * @num_outputs: how many outputs in the array
+ * @n_pipes: total number of pipes available
+ * @used_pipes_mask: pointer to a bitmask (in/out) of already-used pipes
+ * @master_pipes_mask: bitmask of valid "master" pipes
+ * @valid_pipes_mask: bitmask of valid (non-fused) pipes
+ *
+ * Assign pipes to outputs based on the number of required pipes.
+ * This function will assign 1, 2, or 4 consecutive pipes to each output.
+ * It will also mark the used pipes in the bitmask.
+ *
+ * Returns: true if all outputs can be assigned successfully; false otherwise.
+ */
+bool igt_assign_pipes_for_outputs(int drm_fd,
+				  igt_output_t **outputs,
+				  int num_outputs,
+				  int n_pipes,
+				  uint32_t *used_pipes_mask,
+				  uint32_t master_pipes_mask,
+				  uint32_t valid_pipes_mask)
+{
+	int i = 0, idx  = 0, needed = 0, start = 0;
+	uint32_t available_pipes_mask = 0;
+	enum pipe mp = PIPE_NONE;
+	igt_output_t *out;
+
+	for (idx = 0; idx < num_outputs; idx++) {
+		out = outputs[idx];
+		needed = get_required_pipes(drm_fd, out);
+		if (needed < 0)
+			return false;
+
+		available_pipes_mask = (~(*used_pipes_mask)) & valid_pipes_mask;
+		start = find_consecutive_pipes(n_pipes, available_pipes_mask,
+				master_pipes_mask, needed);
+
+		if (start < 0) {
+			igt_debug("Cannot allocate %d consecutive pipes for output %s\n",
+					needed, out->name);
+			return false;
+		}
+
+		igt_info("Assigning %d pipes [start=%s..%s] to output %s\n",
+				needed, kmstest_pipe_name(start),
+				kmstest_pipe_name(start + needed - 1), out->name);
+
+		if (needed > 1) {
+			mp = get_next_master_pipe(BIT(start));
+
+			if (mp == PIPE_NONE) {
+				igt_debug("Failed to confirm master pipe for %s\n",
+						out->name);
+				return false;
+			}
+			igt_output_set_pipe(out, start);
+			igt_debug("Using pipe %s as master.\n",
+					kmstest_pipe_name(start));
+		} else
+			igt_output_set_pipe(out, start);
+
+		for (i = 0; i < needed; i++)
+			*used_pipes_mask |= BIT(start + i);
+	}
+	return true;
+}
diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
new file mode 100644
index 000000000..8a6f8e5ad
--- /dev/null
+++ b/tests/intel/kms_joiner_helper.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef KMS_JOINER_HELPER_H
+#define KMS_JOINER_HELPER_H
+
+#include "igt_kms.h"
+
+void igt_set_all_master_pipes_for_platform(igt_display_t *display,
+					   uint32_t *master_pipes);
+bool igt_assign_pipes_for_outputs(int drm_fd,
+				  igt_output_t **outputs,
+				  int num_outputs,
+				  int n_pipes,
+				  uint32_t *used_pipes_mask,
+				  uint32_t master_pipes_mask,
+				  uint32_t valid_pipes_mask);
+#endif
diff --git a/tests/meson.build b/tests/meson.build
index 1a731fc73..dea2cb02b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -370,6 +370,7 @@ extra_sources = {
            join_paths ('intel', 'kms_mst_helper.c'),
            join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
+	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.25.1


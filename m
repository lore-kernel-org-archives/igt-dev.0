Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FB0C02195
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 07:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C5310E3F4;
	Mon,  3 Feb 2025 07:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/mi8mOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF68110E3F4
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738569431; x=1770105431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GuHcwodQz+bBNnkZtuoTqEdgT+90qSZYJvIaz769gJs=;
 b=a/mi8mOCgp7taq0gB9pX4b77cWRyfxoLVZ+OCfaK++iRnRJLg25to86/
 2zPCBBDZxIdo6Zibi+0W1qHLeYQUomW3M2V8wAfHgRE5aLWvleX5sjrj0
 a17I6oPFEoxSLlmKghRQAvMt5uXi/k5xZQRWVeeBHr5cdjX6h+3kGp1GN
 9PqImZVRYG2y62TQ92IJYTtg6+LYOxXr+2YVY3JU5zoy7npooA0QUyXop
 iyxkth7oeVU8rJSed8qDH42+kEK2DM8a7p7c6e+7dAW3D3z1uYijCqDJ8
 Lojgulw3DwDR48jGdAQBV/nd2+2cvukvxboocAnuZ+3OLYX7Gp+xmWC3K A==;
X-CSE-ConnectionGUID: jYVRCZzVTamyAm0fzMMoGw==
X-CSE-MsgGUID: c0U7cJVsR5CbnecqGuIChQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49652712"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49652712"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 23:57:11 -0800
X-CSE-ConnectionGUID: 6u6k2p0mQ4C0F4R0p3YkoA==
X-CSE-MsgGUID: 7Vf3+BSFTsGrnZZNoN2M+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110786375"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 23:57:09 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/5] tests/intel/kms_mst_helper: add helper for
 MST-related functions
Date: Mon,  3 Feb 2025 13:42:38 +0530
Message-Id: <20250203081241.659139-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250203081241.659139-1-kunal1.joshi@intel.com>
References: <20250203081241.659139-1-kunal1.joshi@intel.com>
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

Add helper to centralize commonly used MST-related logic.
igt_find_all_mst_output_in_topology() enumerates MST outputs
that share the same root connector id.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 28 +++------------
 tests/intel/kms_mst_helper.c            | 48 +++++++++++++++++++++++++
 tests/intel/kms_mst_helper.h            | 10 ++++++
 tests/meson.build                       |  1 +
 4 files changed, 63 insertions(+), 24 deletions(-)
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 415005774..bcfb2f0a0 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -16,6 +16,7 @@
 #include <sys/types.h>
 #include "igt_sysfs.h"
 #include "igt.h"
+#include "kms_mst_helper.h"
 
 /**
  * SUBTEST: dp-fallback
@@ -47,28 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
 
 IGT_TEST_DESCRIPTION("Test link training fallback");
 
-static void find_mst_outputs(int drm_fd, data_t *data,
-			     igt_output_t *output,
-			     igt_output_t *mst_outputs[],
-			     int *num_mst_outputs)
-{
-	int output_root_id, root_id;
-	igt_output_t *connector_output;
-
-	output_root_id = igt_get_dp_mst_connector_id(output);
-	/*
-	 * If output is MST check all other connected output which shares
-	 * same path and fill mst_outputs and num_mst_outputs
-	 */
-	for_each_connected_output(&data->display, connector_output) {
-		if (!igt_check_output_is_dp_mst(connector_output))
-			continue;
-		root_id = igt_get_dp_mst_connector_id(connector_output);
-		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
-			mst_outputs[(*num_mst_outputs)++] = connector_output;
-	}
-}
-
 static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
 			      int *output_count)
 {
@@ -83,8 +62,9 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
 		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
 			return false;
 
-	find_mst_outputs(data->drm_fd, data, data->output,
-			 mst_output, output_count);
+       igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &data->display, data->output,
+							mst_output, output_count),
+		    "Unable to find mst outputs\n");
 
 	for (i = 0; i < *output_count; i++) {
 		output = mst_output[i];
diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
new file mode 100644
index 000000000..9d52068f7
--- /dev/null
+++ b/tests/intel/kms_mst_helper.c
@@ -0,0 +1,48 @@
+#include "kms_mst_helper.h"
+
+/*
+ * @drm_fd: DRM file descriptor
+ * @display: pointer to an #igt_display_t structure
+ * @output: target output
+ * @mst_outputs: filled with mst output of same toplogy as @output
+ * @num_mst_outputs: filled with count of mst outputs found in topology
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
+bool igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
+					 igt_output_t *output,
+					 igt_output_t *mst_outputs[],
+					 int *num_mst_outputs)
+{
+	int output_root_id, root_id;
+	igt_output_t *connector_output;
+
+	if (!igt_check_output_is_dp_mst(output))
+		return false;
+
+	output_root_id = igt_get_dp_mst_connector_id(output);
+	if (output_root_id == -EINVAL)
+		return false;
+
+	/*
+	 * If output is MST, check all other connected output which shares
+	 * same path and fill mst_outputs and num_mst_outputs
+	 */
+	for_each_connected_output(display, connector_output) {
+		if (!igt_check_output_is_dp_mst(connector_output))
+			continue;
+
+		root_id = igt_get_dp_mst_connector_id(connector_output);
+		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
+			mst_outputs[(*num_mst_outputs)++] = connector_output;
+	}
+	return true;
+}
diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
new file mode 100644
index 000000000..291fcebfe
--- /dev/null
+++ b/tests/intel/kms_mst_helper.h
@@ -0,0 +1,10 @@
+#ifndef KMS_MST_HELPER_H
+#define KMS_MST_HELPER_H
+
+#include "igt.h"
+
+bool igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
+					 igt_output_t *output,
+					 igt_output_t *mst_outputs[],
+					 int *num_mst_outputs);
+#endif
diff --git a/tests/meson.build b/tests/meson.build
index b2a7d7760..b9dd162cc 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -367,6 +367,7 @@ extra_sources = {
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
+        'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
-- 
2.25.1


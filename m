Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C673C021A2
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 17:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DD010E254;
	Tue, 11 Feb 2025 17:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuybJSEb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F9E10E73E
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739296208; x=1770832208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nZzCgs9fCRNhxT02kTyJJ/nA2H9pN4O7AbOtCeSkZs4=;
 b=SuybJSEbEwBUBmFirp3pxRWc+jGlxRs/fmrxCaNvEiCs1mvZXgsuYBlN
 2hz9QCJr4+m9HE/JXKga3aoC8EX+qIGaH3SLR/yOTEK0atUvIUGvTdPuG
 d8hRZe6GJN/ZIpCLBiFMOr+Rs/AVrasfyNFO2K3Mn1hmqK1Czb2q8bGC7
 KWxDUbjnHE8ZlD4Rb3fxEn4pgH5kas/ccBNe+OWcPWqXSSfsX/MSygMfl
 VGMbxU6V4XhZ86jB2l3MZZvDkBFdCiEi+9BtOQcLtG5KTAMVKuEdNvFR1
 DjfbXOYbHiAbgqVuK7NlzKe1TA72iIj6P2sJY7E15K77yksmVcXvANsKh A==;
X-CSE-ConnectionGUID: vFubOde8RfSSG9YYj9JX/g==
X-CSE-MsgGUID: HK9NA6uVQ7af8uin8tB1WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57339098"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="57339098"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:08 -0800
X-CSE-ConnectionGUID: 2BDfN0ypT9u1ZZqKGFZylw==
X-CSE-MsgGUID: 52QqfJj0QVGOJfjNU3v3GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149767485"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:07 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/7] tests/intel/kms_mst_helper: add helper for
 MST-related functions
Date: Tue, 11 Feb 2025 23:35:37 +0530
Message-Id: <20250211180542.1430676-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250211180542.1430676-1-kunal1.joshi@intel.com>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
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

Add helper to centralize commonly used MST-related logic.
Move find_mst_outputs to lib.

v2: fix docs (Ankit)
    split patch (Ankit)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 38 +++-----------------
 tests/intel/kms_mst_helper.c            | 48 +++++++++++++++++++++++++
 tests/intel/kms_mst_helper.h            | 15 ++++++++
 tests/meson.build                       |  1 +
 4 files changed, 69 insertions(+), 33 deletions(-)
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index edf9409b6..145bf2fc5 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -16,6 +16,7 @@
 #include <sys/types.h>
 #include "igt_sysfs.h"
 #include "igt.h"
+#include "kms_mst_helper.h"
 
 /**
  * SUBTEST: dp-fallback
@@ -47,35 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
 
 IGT_TEST_DESCRIPTION("Test link training fallback");
 
-static int find_mst_outputs(int drm_fd, igt_display_t *display,
-			    igt_output_t *output,
-			    igt_output_t *mst_outputs[],
-			    int *num_mst_outputs)
-{
-	int output_root_id, root_id;
-	igt_output_t *connector_output;
-
-	if (!igt_check_output_is_dp_mst(output))
-		return -EINVAL;
-
-	output_root_id = igt_get_dp_mst_connector_id(output);
-	if (output_root_id == -EINVAL)
-		return -EINVAL;
-	/*
-	 * If output is MST check all other connected output which shares
-	 * same path and fill mst_outputs and num_mst_outputs
-	 */
-	for_each_connected_output(display, connector_output) {
-		if (!igt_check_output_is_dp_mst(connector_output))
-			continue;
-
-		root_id = igt_get_dp_mst_connector_id(connector_output);
-		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
-			mst_outputs[(*num_mst_outputs)++] = connector_output;
-	}
-	return 0;
-}
-
 static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
 			      int *output_count)
 {
@@ -90,10 +62,10 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
 		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
 			return false;
 
-	igt_assert_f(find_mst_outputs(data->drm_fd, &data->display,
-				      data->output, mst_output,
-				      output_count) == 0,
-				      "Unable to find mst outputs or given optput is not mst\n");
+	igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &data->display,
+							 data->output, mst_output,
+							 output_count) == 0,
+							 "Unable to find mst outputs or given optput is not mst\n");
 
 	for (i = 0; i < *output_count; i++) {
 		output = mst_output[i];
diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
new file mode 100644
index 000000000..c12bf0703
--- /dev/null
+++ b/tests/intel/kms_mst_helper.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "kms_mst_helper.h"
+
+/*
+ * @drm_fd: DRM file descriptor
+ * @display: pointer to #igt_display_t structure
+ * @output: target output
+ * @mst_outputs: filled with mst output of same toplogy as @output
+ * @num_mst_outputs: filled with count of mst outputs found in topology
+ *
+ * Iterates over all connected outputs and adds each DP MST
+ * output that shares the same MST connector ID as @output
+ * into @mst_outputs.
+ *
+ * Returns: 0 on success, -error on failure
+ */
+int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
+					igt_output_t *output,
+					igt_output_t *mst_outputs[],
+					int *num_mst_outputs)
+{
+        int output_root_id, root_id;
+        igt_output_t *connector_output;
+
+        if (!igt_check_output_is_dp_mst(output))
+                return -EINVAL;
+
+        output_root_id = igt_get_dp_mst_connector_id(output);
+        if (output_root_id == -EINVAL)
+                return -EINVAL;
+        /*
+         * If output is MST check all other connected output which shares
+         * same path and fill mst_outputs and num_mst_outputs
+         */
+        for_each_connected_output(display, connector_output) {
+                if (!igt_check_output_is_dp_mst(connector_output))
+                        continue;
+
+                root_id = igt_get_dp_mst_connector_id(connector_output);
+                if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
+                        mst_outputs[(*num_mst_outputs)++] = connector_output;
+        }
+        return 0;
+}
diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
new file mode 100644
index 000000000..5b62b979b
--- /dev/null
+++ b/tests/intel/kms_mst_helper.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef KMS_MST_HELPER_H
+#define KMS_MST_HELPER_H
+
+#include "igt.h"
+
+int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
+                                        igt_output_t *output,
+                                        igt_output_t *mst_outputs[],
+                                        int *num_mst_outputs);
+#endif
diff --git a/tests/meson.build b/tests/meson.build
index 33dffad31..a6f6ad560 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -366,6 +366,7 @@ extra_sources = {
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
-- 
2.25.1


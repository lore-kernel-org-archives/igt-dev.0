Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400A8E77194
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 13:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2E310E2A4;
	Tue, 31 Dec 2024 13:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwTMELc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B14C10E204
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735653587; x=1767189587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ex64Ki/+R53Wm/pNmY8cnKjfARPP1u74jsH5JNE1Is8=;
 b=YwTMELc4BBfZ8awc0Wa4KfifOG2KPc6zD9ZuxoRY+ol5PlXiAhg8vetw
 cfZoV3vT6lRdvct+++EErKENRMMz6JEdxzguFuv0cwmln72ewZiIrEcoM
 ENGgsTOcQ/ItFPuUQPrLtCWyI+xU5EioZYZ7NM+XA6vaGoHLj5NhQq/Si
 ETZMH/DL9AyJS9KglOvFutRYA76LB+gok1Cupfw/Gd4V9dKrRK5s4cA/m
 rDiSe2ZCguS9JBldx0sZoAgOBH2ey2UFPcon2HCE0+wOGXmkaGBnjo61j
 ga7GNEKj4jlNf8ukcQbsnTUwyFCXhd32W7kBe14lXe0RjJEJvi4HuvNwg g==;
X-CSE-ConnectionGUID: CWqie40EQxe8bjG+Sj8x2w==
X-CSE-MsgGUID: rs7Auda4Q+WDNYxe4+WfRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36047311"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="36047311"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 05:59:47 -0800
X-CSE-ConnectionGUID: dJkpGZ5pQKm2uSphKEjwdA==
X-CSE-MsgGUID: Br4COayPQlGH3drZSP12Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="100820137"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 05:59:45 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/kms_mst_helper: Add helper for
 MST-related functions
Date: Tue, 31 Dec 2024 19:45:16 +0530
Message-Id: <20241231141518.765212-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231141518.765212-1-kunal1.joshi@intel.com>
References: <20241231141518.765212-1-kunal1.joshi@intel.com>
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

This patch introduces kms_mst_helper.c and kms_mst_helper.h
to centralize commonly used MST-related logic.
The new function igt_find_all_mst_output_in_topology()
enumerates MST outputs that share the same root connector,
simplifying code reuse across tests needing outputs on
same MST topology. The existing MST-related code in
kms_dp_linktrain_fallback.c is updated to use the new helper,
removing duplication. Additionally, meson.build is modified
to include kms_mst_helper.c in the build process.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 28 +++------------
 tests/intel/kms_mst_helper.c            | 48 +++++++++++++++++++++++++
 tests/intel/kms_mst_helper.h            | 10 ++++++
 tests/meson.build                       |  1 +
 4 files changed, 63 insertions(+), 24 deletions(-)
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index a05e2015f..b10946781 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -16,6 +16,7 @@
 #include <sys/types.h>
 
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
index 4bc68d659..ffbe1211e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -367,6 +367,7 @@ extra_sources = {
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [join_paths ('intel', 'kms_joiner_helper.c')],
+	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.25.1


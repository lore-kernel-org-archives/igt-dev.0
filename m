Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E391C021A3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48D210E5F0;
	Mon, 10 Feb 2025 18:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfIU9N/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2B110E5F0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739212834; x=1770748834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q1lvPIoXGcOyFyyW370833fl26MbRptxDd2ZopRaeNE=;
 b=mfIU9N/dubHal4cHs6vH717jQP3cjuyEhkiFuK4HGgtbaOZ5kuPMd65W
 zYdv4iKRqfbvsd6y2BjH7XePuRg8yb6oFbXGnlYNB4LtjbcB/cHcskLS+
 ZdjjRm6ob5+/oj45+ltJ0PRcTV9JpdZ1OBNLlRLzze6jrdeaDe3JvfSGS
 huES0LTXqvsVCm1zCqbhGLofHdBFaMIge3nSRnrNCS1H7oelZ0J+9hggS
 0WUVqsmsjqc1AC3jPmTVZ3OF3MUiNyTvHjo8wBM3H7+azHAkg+l04URR7
 dVMJf8Pi+1LTHJfjVQ8FbZzK8wfcihfLGHQRHCupWdx3ps9c/DTyihfcf w==;
X-CSE-ConnectionGUID: d4vdgRagS/qGnUEcTJe0HA==
X-CSE-MsgGUID: zFwpKK2LQHOtRBPhkfCiTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39497486"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39497486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:40:33 -0800
X-CSE-ConnectionGUID: XBLTjvZpSgCfePUKLoo0Ew==
X-CSE-MsgGUID: 6ma0DDFdSi21kfFERiQ9EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112229440"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:40:32 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 3/6] tests/intel/kms_dp_linktrain_fallback: refactor
 dp-fallback subtest
Date: Tue, 11 Feb 2025 00:26:03 +0530
Message-Id: <20250210185606.1327892-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210185606.1327892-1-kunal1.joshi@intel.com>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
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

Extract some of the logic into below function for better reuse.
  - force_failure_and_wait()
  - wait_for_hotplug_and_check_bad()
  - fix_link_status_and_recommit()

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 160 +++++++++++++++++++-----
 1 file changed, 130 insertions(+), 30 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 95aa7eee4..284e6b9aa 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -238,16 +238,124 @@ static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
 	}
 }
 
+/*
+ * Force a link training failure followed by link retrain, then
+ * block until the driver has no further pending retrain/failure.
+ * Returns false if we time out waiting.
+ */
+static bool force_failure_and_wait(data_t *data,
+                                   igt_output_t *output,
+                                   int failure_type,
+                                   int retrain_count,
+                                   double interval,
+                                   double timeout)
+{
+        igt_force_lt_failure(data->drm_fd, output, failure_type);
+        igt_force_link_retrain(data->drm_fd, output, retrain_count);
+
+        /* Wait until there's no pending retrain */
+        if (check_condition_with_timeout(data->drm_fd, output,
+                                         igt_get_dp_pending_retrain,
+                                         interval, timeout)) {
+                igt_info("Timed out waiting for pending retrain.\n");
+                return false;
+        }
+
+        /* Wait until there's no pending LT failures */
+        if (check_condition_with_timeout(data->drm_fd, output,
+                                         igt_get_dp_pending_lt_failures,
+                                         interval, timeout)) {
+                igt_info("Timed out waiting for pending LT failures.\n");
+                return false;
+        }
+
+        return true;
+}
+
+/*
+ * Waits for a hotplug event, then checks that the link-status is BAD.
+ * Returns false if the link-status isn't BAD or no hotplug arrives in time.
+ */
+static bool wait_for_hotplug_and_check_bad(int drm_fd,
+                                           data_t *data,
+                                           igt_output_t *output,
+                                           struct udev_monitor *mon,
+                                           double hotplug_timeout)
+{
+        uint32_t link_status_prop_id;
+        uint64_t link_status_value;
+        drmModePropertyPtr link_status_prop;
+
+        if (!igt_hotplug_detected(mon, hotplug_timeout)) {
+                igt_info("No hotplug event within %.2f seconds.\n", hotplug_timeout);
+                return false;
+        }
+
+        kmstest_get_property(drm_fd,
+                             output->config.connector->connector_id,
+                             DRM_MODE_OBJECT_CONNECTOR,
+                             "link-status",
+                             &link_status_prop_id, &link_status_value,
+                             &link_status_prop);
+
+        if (link_status_value != DRM_MODE_LINK_STATUS_BAD) {
+                igt_info("Expected link-status=BAD but got %" PRIu64 "\n",
+                         link_status_value);
+                return false;
+        }
+
+        return true;
+}
+
+/*
+ * Sets link status=GOOD for the specified outputs, then calls
+ * validate_modeset_for_outputs() to re-commit. Returns false
+ * if the re-commit fails.
+ */
+static bool fix_link_status_and_recommit(data_t *data,
+                                         igt_output_t *outputs[],
+                                         int *output_count,
+                                         drmModeModeInfo * modes[],
+                                         struct igt_fb fbs[],
+                                         struct igt_plane *primarys[])
+{
+        int i;
+        igt_output_t *out;
+
+        /* Set link-status=GOOD on each tested output */
+        for_each_connected_output(&data->display, out) {
+                for (i = 0; i < *output_count; i++) {
+                        if (out->id == outputs[i]->id) {
+                                igt_output_set_prop_value(
+                                        out, IGT_CONNECTOR_LINK_STATUS,
+                                        DRM_MODE_LINK_STATUS_GOOD);
+                        }
+                }
+        }
+
+        if (!validate_modeset_for_outputs(data, outputs, output_count,
+                                          modes, fbs, primarys)) {
+                igt_info("Modeset validation failed after forcing link-status=GOOD.\n");
+                return false;
+        }
+
+        if (igt_display_try_commit_atomic(&data->display,
+                                          DRM_MODE_ATOMIC_ALLOW_MODESET,
+                                          NULL) != 0) {
+                igt_info("Commit failed after restoring link-status=GOOD.\n");
+                return false;
+        }
+
+        return true;
+}
+
 static void test_fallback(data_t *data, bool is_mst)
 {
 	int output_count, retries;
 	int max_link_rate, curr_link_rate, prev_link_rate;
 	int max_lane_count, curr_lane_count, prev_lane_count;
 	igt_output_t *outputs[IGT_MAX_PIPES];
-	uint32_t link_status_prop_id;
-	uint64_t link_status_value;
-	drmModeModeInfo *modes[IGT_MAX_PIPES];
-	drmModePropertyPtr link_status_prop;
+	drmModeModeInfo * modes[IGT_MAX_PIPES];
 	struct igt_fb fbs[IGT_MAX_PIPES];
 	struct igt_plane *primarys[IGT_MAX_PIPES];
 	struct udev_monitor *mon;
@@ -274,19 +382,16 @@ static void test_fallback(data_t *data, bool is_mst)
 			 prev_link_rate,
 			 prev_lane_count);
 		mon = igt_watch_uevents();
-		igt_force_lt_failure(data->drm_fd, data->output,
-				     LT_FAILURE_REDUCED_CAPS);
-		igt_force_link_retrain(data->drm_fd, data->output,
-				       RETRAIN_COUNT);
-
-		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
-							   data->output,
-							   igt_get_dp_pending_retrain,
-							   1.0, 20.0), 0);
-		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
-							   data->output,
-							   igt_get_dp_pending_lt_failures,
-							   1.0, 20.0), 0);
+
+		/*
+		 * Force link failure and retrain also wait for
+		 * force_lf_failure/retrain status to be cleared
+		 */
+		igt_assert_f(force_failure_and_wait(data, data->output,
+						    LT_FAILURE_REDUCED_CAPS,
+						    RETRAIN_COUNT,
+						    1.0, 20.0),
+						    "Link training failure steps timed out\n");
 
 		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
 						     data->output)) {
@@ -294,26 +399,21 @@ static void test_fallback(data_t *data, bool is_mst)
 			return;
 		}
 
-		igt_assert_f(igt_hotplug_detected(mon, 20),
-			     "Didn't get hotplug for force link training failure\n");
+		/* Wait for hotplug and check link status is BAD */
+		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
+							    data,
+							    data->output,
+							    mon,
+							    20.0), "Didn't get hotplug or link status != BAD\n");
 
-		kmstest_get_property(data->drm_fd,
-				data->output->config.connector->connector_id,
-				DRM_MODE_OBJECT_CONNECTOR, "link-status",
-				&link_status_prop_id, &link_status_value,
-				&link_status_prop);
-		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_BAD);
 		igt_flush_uevents(mon);
 		set_connector_link_status_good(data, outputs, &output_count);
-		igt_assert_f(validate_modeset_for_outputs(data,
+		igt_assert_f(fix_link_status_and_recommit(data,
 							  outputs,
 							  &output_count,
 							  modes,
 							  fbs,
-							  primarys),
-			     "modeset failed\n");
-		igt_display_commit2(&data->display, COMMIT_ATOMIC);
-
+							  primarys), "modeset failed\n");
 		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
 		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
 		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
-- 
2.25.1


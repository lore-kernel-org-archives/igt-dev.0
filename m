Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A667C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 17:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC34B10E73C;
	Tue, 11 Feb 2025 17:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnrlUFBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7270010E740
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739296210; x=1770832210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fBQZGnLr2f96KL9Ejq1+Dpixl4kpPlPgJfZn3eS99to=;
 b=AnrlUFBsNly/q/emWdhhu9FvmIkmnHnEj4iwitwmP3JRtBitn/bUiMJT
 nLLYemlVTGnkSB8/ES/5r7sIr1rlWwh7WfJ4eAI8JDGsvpUnwJ989vwNl
 NmtN6MSJCKwZx2BdpCub6Hlb37gVaeTEOjW2n7u95vIcmnrvkIO7s4oxR
 +AVFq3bmfi+B9vR1P9/8rovMB2ipqK4yi2hr3MdxK0lMCtgcQyjHffV20
 ajSxwkVfO8o/3HAIpHIZ/LzhWNF4XXMj2TBWOtJx8VngCCuXse6G+x51h
 Lgo6t8Ht/dNx6kMtts0DKgB2aGQd0LQIbsLFE1q/TCjWpN+X3NXhWt64/ w==;
X-CSE-ConnectionGUID: h1gh6jEDQge297xmiueuYw==
X-CSE-MsgGUID: MMTnKDDWSeqoWK/nKRysmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57339099"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="57339099"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:10 -0800
X-CSE-ConnectionGUID: 0fv6Xjj/SeqByqGTh0ap+g==
X-CSE-MsgGUID: q8ekMZB6Qa+SxLjfhUWQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149767502"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:09 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 3/7] tests/intel/kms_dp_linktrain_fallback: refactor
 dp-fallback subtest
Date: Tue, 11 Feb 2025 23:35:38 +0530
Message-Id: <20250211180542.1430676-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250211180542.1430676-1-kunal1.joshi@intel.com>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
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

v2: remove . in debug messages (Ankit)
    %s/primarys/primaries (Ankit)
    remove additional comments (Ankit)

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 155 +++++++++++++++++++-----
 1 file changed, 125 insertions(+), 30 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 145bf2fc5..55a71e35b 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -239,16 +239,124 @@ static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
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
+                                         struct igt_plane *primaries[])
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
+                                          modes, fbs, primaries)) {
+                igt_info("Modeset validation failed after forcing link-status=GOOD\n");
+                return false;
+        }
+
+        if (igt_display_try_commit_atomic(&data->display,
+                                          DRM_MODE_ATOMIC_ALLOW_MODESET,
+                                          NULL) != 0) {
+                igt_info("Commit failed after restoring link-status=GOOD\n");
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
@@ -275,19 +383,12 @@ static void test_fallback(data_t *data, bool is_mst)
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
+		igt_assert_f(force_failure_and_wait(data, data->output,
+						    LT_FAILURE_REDUCED_CAPS,
+						    RETRAIN_COUNT,
+						    1.0, 20.0),
+						    "Link training failure steps timed out\n");
 
 		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
 						     data->output)) {
@@ -295,26 +396,20 @@ static void test_fallback(data_t *data, bool is_mst)
 			return;
 		}
 
-		igt_assert_f(igt_hotplug_detected(mon, 20),
-			     "Didn't get hotplug for force link training failure\n");
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


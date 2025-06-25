Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA50C7EE32
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 12:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BA010E701;
	Wed, 25 Jun 2025 12:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoJPtbK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5319A10E6FD
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750853906; x=1782389906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ajj7EOJAhU6pc0RqwB3yyjUxu44Z5Le1tUJ6L5zlVs0=;
 b=QoJPtbK6Rz9qQ3vVd2MQk8KAIBpWRAVHLxlWhKc8bbUQbz6eDl7JSZ6m
 RhxXoMNpvDq7/PHRgV742we8/ejLCSoMVy/P2FbTmd1RBJQd460HUxJUC
 4Q5Qcu5+yKBDjpRb7lyNZn8LwsPaY8uNM7nFxI5a6f1ZOvC8STs9tskcE
 AfzjKA9QG7SQzTgQ1aaXFYH5urHoqvIQ+D4TWUnq4+rZ6nOGmYmQzhVnd
 Bd4mJgL58UY6PY5Kn/QdJ+91YWUKhuYWCRkjkFOWyuEos30/0EL4IaquT
 30YlYDDrEFUMdzrV05JfG7Yri2a/VGhwkWxdRcw/PayV8IY3Fqr3Ur8BS A==;
X-CSE-ConnectionGUID: tlUM1SOGTLad1PHFdi6ifQ==
X-CSE-MsgGUID: ruyHYGN+Qe+g4pl4RoVgrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53260758"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53260758"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:18:26 -0700
X-CSE-ConnectionGUID: CLOCmLSVQoiU2n1uGYCTdg==
X-CSE-MsgGUID: jA4SL5JjQNqEUjWDMdfJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151714819"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:18:24 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 4/5] tests/intel/kms_linktrain_fallback: extend test for eDP
 connector
Date: Wed, 25 Jun 2025 18:04:01 +0530
Message-Id: <20250625123402.3929358-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250625123402.3929358-1-kunal1.joshi@intel.com>
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
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

Rename dp-fallback subtest name to lt-fallback and
add additional logic in test_fallback to handle eDP fallback.

In eDP fallback on the initial link training failure expectation is to retry
with max link rate and max lane count that is supported,
Further failures leads to reduction in either link rate or lane count.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_linktrain_fallback.c | 43 +++++++++++++++++++---------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/tests/intel/kms_linktrain_fallback.c b/tests/intel/kms_linktrain_fallback.c
index f8ef0cac4..8ac36a86c 100644
--- a/tests/intel/kms_linktrain_fallback.c
+++ b/tests/intel/kms_linktrain_fallback.c
@@ -18,8 +18,8 @@
 #include "kms_dsc_helper.h"
 
 /**
- * SUBTEST: dp-fallback
- * Description: Test fallback on DP connectors
+ * SUBTEST: lt-fallback
+ * Description: Test Link Training fallback on DP/eDP connectors
  *
  * SUBTEST: dsc-fallback
  * Description: Test fallback to DSC when BW isn't sufficient
@@ -336,11 +336,12 @@ static bool fix_link_status_and_recommit(data_t *data,
 	return true;
 }
 
-static void test_fallback(data_t *data, bool is_mst)
+static void test_fallback(data_t *data, bool is_mst, bool is_edp)
 {
 	int output_count, retries;
 	int max_link_rate, curr_link_rate, prev_link_rate;
 	int max_lane_count, curr_lane_count, prev_lane_count;
+	int iter = 0;
 	igt_output_t *outputs[IGT_MAX_PIPES];
 	drmModeModeInfo * modes[IGT_MAX_PIPES];
 	struct igt_fb fbs[IGT_MAX_PIPES];
@@ -365,6 +366,7 @@ static void test_fallback(data_t *data, bool is_mst)
 
 	while (!igt_get_dp_link_retrain_disabled(data->drm_fd,
 						 data->output)) {
+		iter++;
 		igt_info("Current link rate: %d, Current lane count: %d\n",
 			 prev_link_rate,
 			 prev_lane_count);
@@ -400,10 +402,19 @@ static void test_fallback(data_t *data, bool is_mst)
 		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
 		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
 
-		igt_assert_f((curr_link_rate < prev_link_rate ||
-			     curr_lane_count < prev_lane_count) ||
-			     ((curr_link_rate == max_link_rate && curr_lane_count == max_lane_count) && --retries),
-			     "Fallback unsuccessful\n");
+		if (is_edp && iter == 1) {
+			/* eDP first retry must stay at max, no reduction */
+			igt_assert_eq(curr_link_rate,  prev_link_rate);
+			igt_assert_eq(curr_lane_count, prev_lane_count);
+		} else {
+			/* Otherwise DP‐style fallback: either shrink or allow spurious retry */
+			igt_assert_f((curr_link_rate  < prev_link_rate ||
+				     curr_lane_count < prev_lane_count) ||
+				     ((curr_link_rate  == max_link_rate &&
+				     curr_lane_count == max_lane_count) &&
+				     --retries),
+				    "Fallback unsuccessful\n");
+		}
 
 		prev_link_rate = curr_link_rate;
 		prev_lane_count = curr_lane_count;
@@ -413,10 +424,14 @@ static void test_fallback(data_t *data, bool is_mst)
 static bool run_lt_fallback_test(data_t *data)
 {
 	bool ran = false;
+	bool is_edp = false;
+	bool is_dp = false;
 	igt_output_t *output;
 
 	for_each_connected_output(&data->display, output) {
 		data->output = output;
+		is_edp = output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP;
+		is_dp = output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort;
 
 		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
 								 data->output)) {
@@ -425,8 +440,8 @@ static bool run_lt_fallback_test(data_t *data)
 			continue;
 		}
 
-		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
-			igt_info("Skipping output %s as it's not DP\n", output->name);
+		if (!(is_edp || is_dp)) {
+			igt_info("Skipping output %s as it's not DP/eDP\n", output->name);
 				continue;
 		}
 
@@ -438,11 +453,12 @@ static bool run_lt_fallback_test(data_t *data)
 		if (igt_check_output_is_dp_mst(data->output)) {
 			igt_info("Testing MST output %s\n",
 				 igt_output_name(data->output));
-			test_fallback(data, true);
+			test_fallback(data, true, false);
 		} else {
-			igt_info("Testing DP output %s\n",
+			igt_info("Testing %s output %s\n",
+				 is_edp ? "eDP" : "DP",
 				 igt_output_name(data->output));
-			test_fallback(data, false);
+			test_fallback(data, false, is_edp);
 		}
 	}
 	return ran;
@@ -511,7 +527,6 @@ static void test_dsc_sst_fallback(data_t *data)
 	/* Repeatedly force link failure until DSC is required (or link is disabled) */
 	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
 		mon = igt_watch_uevents();
-
 		igt_assert_f(force_failure_and_wait(data, data->output,
 						    LT_FAILURE_REDUCED_CAPS,
 						    RETRAIN_COUNT, 1.0, 20.0),
@@ -621,7 +636,7 @@ igt_main
 			     "Unable to disable ignore long hpd\n");
 	}
 
-	igt_subtest("dp-fallback") {
+	igt_subtest("lt-fallback") {
 		igt_require_f(run_lt_fallback_test(&data),
 			      "Skipping test as no output found or none supports fallback\n");
 	}
-- 
2.25.1


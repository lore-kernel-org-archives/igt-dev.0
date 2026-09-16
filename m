Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F150C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176DC10E03E;
	Wed, 16 Sep 2026 04:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOn7rr3W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D5C10E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532796; x=1821068796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aaxTcJZG0bhG1zZl0qrTCg7FRdRP9YNvSFT3GU1fZfI=;
 b=VOn7rr3WY6w2eXHNXlKy3Yz/npay7OKli34/YfhPTS6Pi1lSrcL3m9RS
 yyA2jOOapu29L81+UjXFsPkSYvQ+22mVUZpqDhAOVSJvXAD7beRpbvqXt
 2PAMCONW9W3Wp7ms4qhxBIAMQmg2b1qeM5Qog8/MiCnsAiVPPNVYBQrV5
 XaWYSYvSmBBRWs7+qv8EhQJkgqkd+P7fFwAKPwUm+s3jpx7hK62ovppLI
 SJKaPADIgS/4FCn3ou/5Yo4jxcc51HtvseuEy4MqvoQZb1O0NcahYI01Z
 af10lQ30OVo38dFfzwY274cIfEl3ojWGGpsbCM3MwiQmIS0rJZhqK2O8g g==;
X-CSE-ConnectionGUID: VLKZCde7S5WV37Bkn0+WaQ==
X-CSE-MsgGUID: l2AGV9QuQqO23WCvY4pPzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503241"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:36 -0700
X-CSE-ConnectionGUID: 1olhuwbVQYmOEoSOXP/KyQ==
X-CSE-MsgGUID: RC/50QUqRFS4df198dCGFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765033"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:36 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 03/13] tests/intel/kms_dp_link_training: Extract
 train_link_config()
Date: Wed, 16 Sep 2026 10:17:51 +0530
Message-Id: <20260916044801.1279102-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260916044801.1279102-1-kunal1.joshi@intel.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
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

The force and retrain sequence is written inline in
run_link_rate_test(), which makes it impossible to run for more than
one configuration.

Extract it into train_link_config(), taking the configuration to train
as a struct i915_dp_link_config. Prep for training more than the
maximum.

While here, stop passing a drmModePropertyPtr to kmstest_get_property()
in assert_link_status_good(). That function returns whether it found the
property and allocates the out parameter on success; the existing call
ignores the return value, asserts on a possibly uninitialised value and
leaks the property on every call. Pass NULL and check the return. That
also lets the SST and MST branches share one loop.

The trailing UHBR assertion goes away with the move. It could not fire:
the rate is asserted to equal the forced rate, and the forced rate was
already classified as UHBR or not a few lines above.

There should be no functional changes here.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 97 +++++++++++++++---------------
 1 file changed, 48 insertions(+), 49 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 2d5241246..595d78d98 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -72,9 +72,7 @@ static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
 static void assert_link_status_good(data_t *data, bool mst)
 {
 	igt_output_t *outputs[IGT_MAX_PIPES];
-	uint32_t link_status_prop_id;
 	uint64_t link_status_value;
-	drmModePropertyPtr link_status_prop;
 	int count = 0;
 	int i;
 
@@ -83,32 +81,54 @@ static void assert_link_status_good(data_t *data, bool mst)
 								 &data->display, data->output,
 								 outputs, &count) == 0,
 								 "Unable to find MST outputs\n");
-
-		for (i = 0; i < count; i++) {
-			kmstest_get_property(data->drm_fd,
-					     outputs[i]->config.connector->connector_id,
-					     DRM_MODE_OBJECT_CONNECTOR,
-					     "link-status",
-					     &link_status_prop_id,
-					     &link_status_value,
-					     &link_status_prop);
-
-			igt_assert_eq(link_status_value,
-				      DRM_MODE_LINK_STATUS_GOOD);
-		}
 	} else {
-		kmstest_get_property(data->drm_fd,
-				     data->output->config.connector->connector_id,
-				     DRM_MODE_OBJECT_CONNECTOR,
-				     "link-status",
-				     &link_status_prop_id,
-				     &link_status_value,
-				     &link_status_prop);
+		outputs[0] = data->output;
+		count = 1;
+	}
+
+	for (i = 0; i < count; i++) {
+		igt_assert_f(kmstest_get_property(data->drm_fd,
+						  outputs[i]->config.connector->connector_id,
+						  DRM_MODE_OBJECT_CONNECTOR,
+						  "link-status", NULL,
+						  &link_status_value, NULL),
+			     "No link-status property on %s\n",
+			     igt_output_name(outputs[i]));
 
 		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_GOOD);
 	}
 }
 
+/*
+ * train_link_config - Force one link configuration, re-establish the link and
+ * check that the configuration took effect.
+ */
+static void train_link_config(data_t *data, bool mst,
+			      const struct i915_dp_link_config *config)
+{
+	int current_link_rate;
+	char rate_str[32];
+	char lane_str[32];
+
+	snprintf(rate_str, sizeof(rate_str), "%d", config->link_rate);
+	snprintf(lane_str, sizeof(lane_str), "%d", config->lane_count);
+	igt_info("Training %s at %d lanes, rate %d\n",
+		 igt_output_name(data->output), config->lane_count,
+		 config->link_rate);
+
+	i915_dp_set_link_params(data->drm_fd, data->output, rate_str, lane_str);
+	i915_dp_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
+	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
+						   i915_dp_get_pending_retrain,
+						   1.0, 20.0), 0);
+	assert_link_status_good(data, mst);
+
+	current_link_rate = i915_dp_get_current_link_rate(data->drm_fd, data->output);
+	igt_info("Current link rate is %d\n", current_link_rate);
+	igt_assert_f(current_link_rate == config->link_rate,
+		     "Link training did not succeed at the forced link rate.\n");
+}
+
 /*
  * setup_planes_fbs - Create solid-color FBs and attach them to the primary plane.
  */
@@ -188,12 +208,8 @@ static void do_modeset(data_t *data, bool mst)
  */
 static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 {
-	int max_link_rate;
-	int max_lane_count;
-	int current_link_rate;
+	struct i915_dp_link_config config;
 	bool is_uhbr_output;
-	char rate_str[32];
-	char lane_str[32];
 
 	igt_display_reset(&data->display);
 	i915_dp_reset_link_params(data->drm_fd, data->output);
@@ -208,12 +224,12 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 
 	/* FIXME : Driver may lie max link rate or max lane count */
 	/* Read max_link_rate and max_lane_count */
-	max_link_rate = i915_dp_get_max_link_rate(data->drm_fd, data->output);
-	max_lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
+	config.link_rate = i915_dp_get_max_link_rate(data->drm_fd, data->output);
+	config.lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
 
 	/* Check sink supports uhbr or not */
-	is_uhbr_output = i915_dp_is_uhbr_rate(max_link_rate);
-	if ((uhbr && !is_uhbr_output) || (!uhbr && is_uhbr_output)) {
+	is_uhbr_output = i915_dp_is_uhbr_rate(config.link_rate);
+	if (uhbr != is_uhbr_output) {
 		igt_info("Test expects %s, but output %s is %s.\n",
 			 uhbr ? "UHBR" : "NON-UHBR",
 			 data->output->name,
@@ -222,26 +238,9 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 		return false;
 	}
 
-	snprintf(rate_str, sizeof(rate_str), "%d", max_link_rate);
-	snprintf(lane_str, sizeof(lane_str), "%d", max_lane_count);
-	igt_info("Max link rate for %s is %s, lane count = %d\n",
-		 data->output->name, rate_str, max_lane_count);
-
 	/* Force retrain at max link params */
-	i915_dp_set_link_params(data->drm_fd, data->output, rate_str, lane_str);
-	i915_dp_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
-	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
-						   i915_dp_get_pending_retrain,
-						   1.0, 20.0), 0);
-	assert_link_status_good(data, mst);
+	train_link_config(data, mst, &config);
 
-	current_link_rate = i915_dp_get_current_link_rate(data->drm_fd, data->output);
-	igt_info("Current link rate is %d\n", current_link_rate);
-	igt_assert_f(current_link_rate == max_link_rate,
-		     "Link training did not succeed at max link rate.\n");
-	igt_assert_f(i915_dp_is_uhbr_rate(current_link_rate) == is_uhbr_output,
-		     is_uhbr_output ? "Link training didn't happen at uhbr rates" :
-		     "Link training didn't happen at non-uhbr rates");
 	igt_info("----------------------------------------------------\n");
 	return true;
 }
-- 
2.25.1


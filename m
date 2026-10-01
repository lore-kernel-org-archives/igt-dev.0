Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36849CA5FC5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F3210E1E1;
	Thu,  1 Oct 2026 07:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8WjKpum";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6441D10F598
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838997; x=1822374997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3nKetelRM1ve5gGZSGXML32zOmOMXXd/qsBUlTSkCr8=;
 b=O8WjKpumzwFnRkyNKzyNG2gxWEYuSYt662Z+wssDFtqf1SFuvszKz0P6
 TAN0jI2k5Cq5zVXAXLXKC0EdFhvD8Nqu96KhP7WfnBfTmyLOw+6+QNbby
 dbUBaixcEDwqa2Zj7Kst6h8/LLQy8GYUatuQZDJdMUFv5M2+BmMRdHVoC
 VcZ65eA82S7uv1/8VAMEM8tBYMTJ+URZdwlCBRpiL63g3U57lu0CSPBfD
 Xv4Pu8D0rARRSaaV4sF/51AvfMjhTqM6gxGhDV3ZPxn319YciUJil7i3l
 6me486TaWKp4U0gKJ2NUoeEXbVMRak4ad+55l1Cz7G303Ym2j5l3r00QX A==;
X-CSE-ConnectionGUID: QmREViUrRT2vngmYBh0RvQ==
X-CSE-MsgGUID: 4scjEJvWRkipgkj0LZtmfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605987"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91605987"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:15:47 -0700
X-CSE-ConnectionGUID: +dIwYiLoToqHfpSNmOi6Iw==
X-CSE-MsgGUID: YdX8gEPDSzyiY8SeI9otkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138310"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:15:46 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 03/13] tests/intel/kms_dp_link_training: extract
 train_link_config()
Date: Thu,  1 Oct 2026 13:06:53 +0530
Message-Id: <20261001073703.5067-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001073703.5067-1-kunal1.joshi@intel.com>
References: <20261001073703.5067-1-kunal1.joshi@intel.com>
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

Move the force and retrain sequence to train_link_config(), taking the
config to train as struct i915_dp_link_config. This prepares for
training other configs than just the max.

While at it, check the kmstest_get_property() return value in
assert_link_status_good(), and stop leaking the property. This also
lets SST and MST share the loop.

Drop the UHBR check after training. It can't fail, as the rate has
already been checked against the forced rate.

Other than that, there should be no functional changes.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
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


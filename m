Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACEEC88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BB710E03E;
	Wed, 16 Sep 2026 04:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcdHB7ca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913CC10E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532802; x=1821068802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZ7Ur9gA576lIa3e4Om8Fn0nLSMtknvjSIuLaF/NK9c=;
 b=UcdHB7catbGp4J2qIqCzU9JKTRiw35Pd6pTC0p7ZQqbum/xKgniJAyvi
 Yji9lrQVtEiBo9CJ0fgAIfVl9BJ0bRQo06g3QGvX8PVTTuBxYQHGkqbO2
 WrKnvFt5MHZVgcyYAPoIsRT4c2Zwg99Ja/ODqcMSa/blZERgKjuLpWECJ
 L2FW92EUZEqlikyorUaWpZG7Ym66Wo9yVqMCy3zaS/XzhSJqxe4dZTMM0
 W02do7JRmiCbztFyt6QuZhWPeg3Anp4ZsuBn0p+hv48pr0oCt1yguR/3/
 LLFCtHSuVSXzNHwvBuqNRcvv0MOvgd/LxYiBoCNZjuFMFYmvQ1alvJ0U3 Q==;
X-CSE-ConnectionGUID: g29qenxuTXWq3FZpewYtbw==
X-CSE-MsgGUID: 33Y7WrjOR3SzQmBtIMr5ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503247"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503247"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:42 -0700
X-CSE-ConnectionGUID: DpblAQjTSTqzzaCnpUcvMg==
X-CSE-MsgGUID: kFzzcx7KQ/GlOD5X9yswdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765055"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:42 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 08/13] tests/intel/kms_dp_link_training: Log the DP link
 inventory in the fixture
Date: Wed, 16 Sep 2026 10:17:56 +0530
Message-Id: <20260916044801.1279102-9-kunal1.joshi@intel.com>
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

The test logs which rate it trained at, but nothing about the link it
trained on: whether the connector is SST or MST, whether it is tunneled
over USB4/Thunderbolt, and which configurations the driver would pick
from. When a subtest skips there is no way to tell a missing monitor
from a missing dock without re-running by hand.

Print one line per connected DP output in the fixture, giving the
protocol, the connector mode, pin assignment and max lanes, followed by
the allowed configuration set:

	DP-2: MST, tbt-alt, pin assignment D, TC max lanes 4
	DP-2: allowed configs: 4x2000000 4x1000000 4x810000 2x810000

Read the allowed set with the forced parameters reset, or the set being
enumerated is the forced one rather than the real one.

No subtest behaviour changes; this is log output only.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 68 ++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 71531e8dc..812c4b6bc 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -288,6 +288,71 @@ static void train_link_config(data_t *data, bool mst,
 	assert_link_recovery_idle(data, config);
 }
 
+/*
+ * log_link_inventory - Describe every connected DP link once.
+ *
+ * With the configuration in the subtest name, most subtests skip on any one
+ * machine. This is what tells a missing monitor apart from a monitor behind a
+ * dock that offers no UHBR configuration, without having to re-run by hand.
+ */
+static void log_link_inventory(data_t *data)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
+		enum i915_dp_tc_mode tc_mode;
+		char configs_str[512];
+		char pin_assignment;
+		int tc_max_lanes;
+		int num_configs;
+		int len = 0;
+		int i;
+
+		if (output->config.connector->connector_type !=
+		    DRM_MODE_CONNECTOR_DisplayPort)
+			continue;
+
+		tc_mode = i915_dp_get_tc_mode(data->drm_fd, output,
+					      &pin_assignment, &tc_max_lanes);
+
+		if (tc_mode == I915_DP_TC_NONE)
+			igt_info("%s: %s, %s\n", igt_output_name(output),
+				 igt_check_output_is_dp_mst(output) ? "MST" : "SST",
+				 i915_dp_tc_mode_name(tc_mode));
+		else
+			igt_info("%s: %s, %s, pin assignment %c, TC max lanes %d\n",
+				 igt_output_name(output),
+				 igt_check_output_is_dp_mst(output) ? "MST" : "SST",
+				 i915_dp_tc_mode_name(tc_mode),
+				 pin_assignment, tc_max_lanes);
+
+		if (!i915_dp_has_allowed_link_configs_debugfs(data->drm_fd, output)) {
+			igt_info("%s: no allowed link configs debugfs\n",
+				 igt_output_name(output));
+			continue;
+		}
+
+		/*
+		 * Enumerate with the forced parameters reset, or the set read
+		 * back is the forced one rather than the real one.
+		 */
+		i915_dp_reset_link_params(data->drm_fd, output);
+
+		num_configs = i915_dp_get_allowed_link_configs(data->drm_fd, output,
+							       configs,
+							       ARRAY_SIZE(configs));
+
+		for (i = 0; i < num_configs && len < (int)sizeof(configs_str); i++)
+			len += snprintf(configs_str + len, sizeof(configs_str) - len,
+					" %dx%d", configs[i].lane_count,
+					configs[i].link_rate);
+
+		igt_info("%s: allowed configs:%s\n", igt_output_name(output),
+			 num_configs ? configs_str : " none");
+	}
+}
+
 /*
  * override_lowest_mode - Drive the mode with the lowest pixel clock, so that
  * the largest number of link configurations can carry it.
@@ -524,6 +589,9 @@ int igt_main()
 		 */
 		igt_assert_f(igt_ignore_long_hpd(data.drm_fd, false),
 			     "Unable to disable ignore long hpd\n");
+
+		if (is_intel_device(data.drm_fd))
+			log_link_inventory(&data);
 	}
 
 	igt_describe("Test we can drive UHBR rates over SST");
-- 
2.25.1


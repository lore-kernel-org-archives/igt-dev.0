Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359E9CFD313
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 18:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA8610E31E;
	Mon, 24 Nov 2025 18:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQh8citr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981A10E320
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 18:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764008918; x=1795544918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VO6jqLi70DvDW/altsfRuoJFpOFAO77Ce+N/uZjxifU=;
 b=QQh8citrzhCGUczHK58TMBabYta4Oa72ZC4XSpw42LrJWTo6ghofeU+x
 h8FUF72B6VkMQTNFJe/sg+TVRbyzD96lXZp8uOL68rpsrTo+fnnT/bTVo
 vH4zwtLwIHpfPIJs/jqOK8neZdBQujjaYGvsvA78SR6g1/nrcnd6gHq43
 q7doziyIC8ctjLPHGoBRpbIBaXqA/je7Ym9kIsKVM7PRTSYxbW2wTMNWZ
 1+zY+a06KrQEfGTandFkP07njH2GvwEtJSqkiojQGuBTWjgS+pab6ou0C
 O/TDnPBqhJZNeVxj53yZCInVjIHSZB9CGQ2tzdVBRSbz37GRyoN08zf40 A==;
X-CSE-ConnectionGUID: 8VTn82iVSfOaDhSBacMhKg==
X-CSE-MsgGUID: irn1uyeVQXSceEH2yVagKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66055398"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66055398"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 10:28:38 -0800
X-CSE-ConnectionGUID: blWNdPuvQnWsZGr5ZQr45A==
X-CSE-MsgGUID: sSTjSks+S/aBfut09EcPjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="215747220"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:28:37 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, suraj.kandpal@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 6/6] RFC: tests/intel/kms_link_training: Add
 edp-data-override subtest
Date: Mon, 24 Nov 2025 23:57:56 +0530
Message-ID: <20251124182804.2095722-7-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124182804.2095722-1-jeevan.b@intel.com>
References: <20251124182804.2095722-1-jeevan.b@intel.com>
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

Add test for eDP data override for 2.43 and 6.75 Gbps which has
some issues. eDP should overide to 2.7 and 8.1 Gbps when supported
by panel.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Link: https://lore.kernel.org/r/20250821042653.269227-3-suraj.kandpal@intel.com
---
 tests/intel/kms_link_training.c | 185 ++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/tests/intel/kms_link_training.c b/tests/intel/kms_link_training.c
index 4ddbd72f8..22c4c9fd3 100644
--- a/tests/intel/kms_link_training.c
+++ b/tests/intel/kms_link_training.c
@@ -19,6 +19,9 @@
  *
  * SUBTEST: non-uhbr-mst
  * Description: Test we can drive non-UHBR rates over MST.
+ *
+ * SUBTEST: edp-data-override
+ * Description: Test eDP data override rates.
  */
 
 #include "igt.h"
@@ -293,6 +296,180 @@ static bool test_link_rate(data_t *data, bool mst, bool uhbr)
 	return ran_any_output;
 }
 
+static bool test_link_override(data_t *data, int target_rate, const char *rate_name,
+		    bool expect_success, int timeout_sec)
+{
+	char rate_str[32];
+	char lane_str[32];
+	int current_rate;
+	bool training_completed;
+
+	igt_info("Testing %s (%d kHz) - expect %s...\n",
+		 rate_name, target_rate, expect_success ? "SUCCESS" : "BLOCK/FAIL");
+
+	igt_display_reset(&data->display);
+	igt_reset_link_params(data->drm_fd, data->output);
+	do_modeset(data, false);
+
+	snprintf(rate_str, sizeof(rate_str), "%d", target_rate);
+	snprintf(lane_str, sizeof(lane_str), "4");
+	igt_set_link_params(data->drm_fd, data->output, rate_str, lane_str);
+	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
+
+	training_completed = (check_condition_with_timeout(data->drm_fd, data->output,
+							   igt_get_dp_pending_retrain,
+							   1.0, timeout_sec) == 0);
+
+	if (training_completed) {
+		current_rate = igt_get_current_link_rate(data->drm_fd, data->output);
+		assert_link_status_good(data, false);
+
+		if (expect_success) {
+			if (current_rate == target_rate) {
+				igt_info("%s succeeded at %d kHz\n", rate_name, current_rate);
+				return true;
+			} else {
+				igt_info("%s failed: requested %d kHz, got %d kHz\n",
+					 rate_name, target_rate, current_rate);
+				return false;
+			}
+		} else {
+			if (current_rate != target_rate) {
+				igt_info("%s blocked: requested %d kHz, fell back to %d kHz\n",
+					 rate_name, target_rate, current_rate);
+				return true;
+			} else {
+				igt_info("%s was NOT blocked: got requested %d kHz\n",
+					  rate_name, current_rate);
+				return false;
+			}
+		}
+	} else {
+		if (expect_success) {
+			igt_info("%s failed with timeout\n", rate_name);
+			return false;
+		} else {
+			igt_info("%s completely rejected (timeout)\n", rate_name);
+			return true;
+		}
+	}
+}
+
+static void analyze_supported_rates(int *rates, int num_rates,
+				   bool *found_243, bool *found_675,
+				   bool *found_270, bool *found_810)
+{
+	int i;
+
+	*found_243 = false;
+	*found_675 = false;
+	*found_270 = false;
+	*found_810 = false;
+
+	for (i = 0; i < num_rates; i++) {
+		igt_info("  %d kHz (%.2f Gbps)",
+			 rates[i], rates[i] / 100000.0);
+
+		switch (rates[i]) {
+			case 243000:
+				*found_243 = true;
+				igt_info("Unsupported!");
+				break;
+			case 675000:
+				*found_675 = true;
+				igt_info("Unsupported!");
+				break;
+			case 270000:
+				*found_270 = true;
+				igt_info("Supported");
+				break;
+			case 810000:
+				*found_810 = true;
+				igt_info("Supported");
+				break;
+                }
+		igt_info("\n");
+	}
+}
+
+static bool test_edp_data_override(data_t *data)
+{
+	igt_output_t *edp_output = NULL;
+	int supported_rates[16];
+	int num_rates = 0;
+	bool found_243, found_675, found_270, found_810;
+	bool test_results[4] = {false};
+	bool data_override_works, safe_rates_available;
+	bool all_tests_passed;
+
+	igt_skip_on_f(!is_intel_device(data->drm_fd),
+		      "Test supported only on Intel platforms.\n");
+
+	for_each_connected_output(&data->display, edp_output) {
+		if (igt_output_is_dp_family(edp_output) &&
+		    strstr(edp_output->name, "eDP")) {
+			data->output = edp_output;
+			break;
+		}
+	}
+
+	igt_require_f(data->output != NULL, "No eDP output found\n");
+	igt_info("Testing eDP data override on: %s\n", data->output->name);
+
+	num_rates = igt_get_supported_link_rates(data->drm_fd, data->output->name,
+						 supported_rates, 16);
+	igt_assert_f(num_rates >= 2 && num_rates <= 10,
+		     "Unexpected number of rates (%d), data override might be broken\n", num_rates);
+
+	analyze_supported_rates(supported_rates, num_rates,
+				&found_243, &found_675, &found_270, &found_810);
+
+	igt_info("PHASE 1: Testing Unsupported rates (expect override/blocking)\n");
+
+	if (found_243)
+		test_results[0] = test_link_override(data, 243000, "2.43 Gbps Override rate",
+						     false, 10);
+
+	if (found_675)
+		test_results[1] = test_link_override(data, 675000, "6.75 Gbps Override rate",
+						 false, 10);
+
+	igt_info("PHASE 2: Testing Supported rates\n");
+
+	if (found_270) {
+		test_results[2] = test_link_override(data, 270000, "2.7 Gbps data rate",
+						 true, 10);
+	} else {
+		igt_info("Skipping 2.7 Gbps test - not available\n");
+		test_results[2] = true;
+	}
+
+	if (found_810) {
+		test_results[3] = test_link_override(data, 810000, "8.1 Gbps data rate",
+						 true, 10);
+	} else {
+		igt_info("Skipping 8.1 Gbps test - not available\n");
+		test_results[3] = true;
+	}
+
+	igt_reset_link_params(data->drm_fd, data->output);
+
+	data_override_works = (!found_243 && !found_675);
+	safe_rates_available = (found_270 || found_810);
+	all_tests_passed = (test_results[0] && test_results[1] &&
+				 test_results[2] && test_results[3]);
+
+	igt_info("====================================================\n");
+	igt_info("eDP data override working: %s\n", data_override_works ? "YES" : "NO");
+	igt_info("Safe override rates available: %s\n", safe_rates_available ? "YES" : "NO");
+	igt_info("All rate tests passed: %s\n", all_tests_passed ? "YES" : "NO");
+	igt_info("Overall test result: %s\n",
+		 (data_override_works && safe_rates_available && all_tests_passed) ?
+		 "SUCCESS" : "FAIL");
+
+	return (data_override_works && safe_rates_available && all_tests_passed);
+}
+
 IGT_TEST_DESCRIPTION("Test to validate link training on SST/MST with "
 		     "UHBR/NON_UHBR rates");
 
@@ -342,6 +519,14 @@ igt_main
 			      "Didn't find any MST output with NON-UHBR rates.\n");
 	}
 
+	igt_describe("Test eDP data override correctly");
+	igt_subtest("edp-data-override") {
+		igt_require_f(intel_display_ver(data.devid) > 35,
+			      "eDP override not supported on platform\n");
+		igt_require_f(test_edp_data_override(&data),
+			      "eDP data override test failed\n");
+	}
+
 	igt_fixture {
 		igt_reset_connectors();
 		igt_display_fini(&data.display);
-- 
2.43.0


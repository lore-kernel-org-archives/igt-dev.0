Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3F7C54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 08:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D57110F445;
	Thu, 28 Mar 2024 08:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NunC2sMI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3FE10F442
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 08:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711614540; x=1743150540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZ9Q+FAbcUXEzdIq9wNXqzChCKqsri/StW3/Y2NNBXo=;
 b=NunC2sMIEnI1Nxilj7SfXBjAGcG0ZZ3pKjA1nSHNhd0N79kgdcWa+w9O
 htzRh4XMdWoIEks+TBAcI+3QVp8AD71WPgwO7xf4x+GyFfP2o+BJxpQHW
 znsxG2bNAYJhOSDd/l53vQMEzpr3uDRiqtUuRsDCZftScXxuymwrtcp4L
 2o0R3zwNhVh9ZGsbAdVPWS5qvIMeUHg41nwHon6u+IEeiY4UKLEMriXuF
 fyHsG1oEVZiOi82DQy716Q9/LeerrFcV2zN0w/g8MTOxlVeYbj0joIUDk
 2lYKszZ18UDRBECmyCgEQSTRNUIQP8z7gQptbk4qiuC1w0yzQtHHUm4aH w==;
X-CSE-ConnectionGUID: ZKuSGlthSIyTm37ZAGo0Dg==
X-CSE-MsgGUID: LTAnmtqIQ32czRmpgDPIgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="32157708"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="32157708"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 01:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="47553192"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 01:28:58 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/kms_big_joiner: add tests for force
 joiner
Date: Thu, 28 Mar 2024 14:09:39 +0530
Message-Id: <20240328083939.1361225-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328083939.1361225-1-kunal1.joshi@intel.com>
References: <20240328083939.1361225-1-kunal1.joshi@intel.com>
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

add tests for force joiner

v2: check status after forcing (Ankit)
    take out commoon code (Ankit)
    fix missing force_joiner (Ankit)

v3: add doc (Ankit)

Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_big_joiner.c | 109 +++++++++++++++++++++++++++++------
 1 file changed, 92 insertions(+), 17 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index bc4facead..86378101a 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -44,9 +44,20 @@
  * SUBTEST: basic
  * Description: Verify the basic modeset on big joiner mode on all pipes
  *
+ * SUBTEST: invalid-modeset-force-joiner
+ * Description: Verify if the modeset on the adjoining pipe is rejected when
+ *              the pipe is active with a force joiner modeset
+ *              force joiner is to used to force bigjoiner functionality on
+ *              non bigjoiner outputs, hence test will run only on non bigjoiner
+ *              outputs
+ *
+ * SUBTEST: basic-force-joiner
+ * Description: Verify the basic modeset on force joiner mode on all pipes
+ *              force joiner is to used to force bigjoiner functionality on
+ *              non bigjoiner outputs, hence test will run only on non bigjoiner
+ *              outputs
  */
-
-IGT_TEST_DESCRIPTION("Test big joiner");
+IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
 
 #define INVALID_TEST_OUTPUT 2
 
@@ -79,6 +90,19 @@ static void set_all_master_pipes_for_platform(data_t *data)
 	}
 }
 
+static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool toggle)
+{
+	bool status;
+	igt_output_t *output;
+	int i;
+
+	for (i = 0; i < data->non_big_joiner_output_count; i++) {
+		output = data->non_big_joiner_output[i];
+		status = igt_force_and_check_bigjoiner_status(data->drm_fd, output->name, toggle);
+		igt_assert_f(status, "Failed to toggle force joiner\n");
+	}
+}
+
 static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
 {
 	if ((data->master_pipes & available_pipe_mask) == 0)
@@ -105,7 +129,7 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 	return master_pipe;
 }
 
-static void test_single_joiner(data_t *data, int output_count)
+static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i;
 	enum pipe pipe, master_pipe;
@@ -116,7 +140,7 @@ static void test_single_joiner(data_t *data, int output_count)
 	igt_fb_t fb;
 	drmModeModeInfo *mode;
 
-	outputs = data->big_joiner_output;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	for (i = 0; i < output_count; i++) {
 		output = outputs[i];
@@ -137,7 +161,7 @@ static void test_single_joiner(data_t *data, int output_count)
 	}
 }
 
-static void test_multi_joiner(data_t *data, int output_count)
+static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i;
 	uint32_t available_pipe_mask;
@@ -149,7 +173,7 @@ static void test_multi_joiner(data_t *data, int output_count)
 	drmModeModeInfo *mode;
 
 	available_pipe_mask = BIT(data->n_pipes) - 1;
-	outputs = data->big_joiner_output;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	igt_display_reset(&data->display);
 	for (i = 0; i < output_count; i++) {
@@ -177,7 +201,7 @@ static void test_multi_joiner(data_t *data, int output_count)
 }
 
 static void test_invalid_modeset_two_joiner(data_t *data,
-					    bool mixed)
+					    bool mixed, bool force_joiner)
 {
 	int i, j, ret;
 	uint32_t available_pipe_mask;
@@ -190,7 +214,8 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 	drmModeModeInfo *mode;
 
 	available_pipe_mask = BIT(data->n_pipes) - 1;
-	outputs = mixed ? data->mixed_output : data->big_joiner_output;
+	outputs = force_joiner ? data->non_big_joiner_output :
+		  mixed ? data->mixed_output : data->big_joiner_output;
 
 	for (i = 0; i < data->n_pipes - 1; i++) {
 		igt_display_reset(&data->display);
@@ -223,7 +248,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 	}
 }
 
-static void test_big_joiner_on_last_pipe(data_t *data)
+static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 {
 	int i, len, ret;
 	igt_output_t **outputs;
@@ -232,8 +257,8 @@ static void test_big_joiner_on_last_pipe(data_t *data)
 	igt_fb_t fb;
 	drmModeModeInfo *mode;
 
-	len = data->big_joiner_output_count;
-	outputs = data->big_joiner_output;
+	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	for (i = 0; i < len; i++) {
 		igt_display_reset(&data->display);
@@ -257,12 +282,14 @@ static void test_big_joiner_on_last_pipe(data_t *data)
 
 igt_main
 {
+	bool force_joiner_supported;
 	int i, j;
 	igt_output_t *output;
 	drmModeModeInfo mode;
 	data_t data;
 
 	igt_fixture {
+		force_joiner_supported = false;
 		data.big_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
 		data.mixed_output_count = 0;
@@ -290,7 +317,10 @@ igt_main
 				data.big_joiner_output[data.big_joiner_output_count++] = output;
 				igt_output_override_mode(output, &mode);
 			} else {
-				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
+				if (igt_has_force_joiner_debugfs(data.drm_fd, output)) {
+					force_joiner_supported = true;
+					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
+				}
 			}
 			data.output_count++;
 		}
@@ -316,10 +346,10 @@ igt_main
 			igt_require_f(data.n_pipes > 1,
 				      "Minimum 2 pipes required\n");
 			igt_dynamic_f("single-joiner")
-				test_single_joiner(&data, data.big_joiner_output_count);
+				test_single_joiner(&data, data.big_joiner_output_count, false);
 			if (data.big_joiner_output_count > 1)
 				igt_dynamic_f("multi-joiner")
-					test_multi_joiner(&data, data.big_joiner_output_count);
+					test_multi_joiner(&data, data.big_joiner_output_count, false);
 	}
 
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
@@ -329,13 +359,58 @@ igt_main
 		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
 		if (data.big_joiner_output_count >= 1)
 			igt_dynamic_f("big_joiner_on_last_pipe")
-				test_big_joiner_on_last_pipe(&data);
+				test_joiner_on_last_pipe(&data, false);
 		if (data.big_joiner_output_count > 1)
 			igt_dynamic_f("invalid_combinations")
-				test_invalid_modeset_two_joiner(&data, false);
+				test_invalid_modeset_two_joiner(&data, false, false);
 		if (data.mixed_output_count)
 			igt_dynamic_f("mixed_output")
-				test_invalid_modeset_two_joiner(&data, true);
+				test_invalid_modeset_two_joiner(&data, true, false);
+	}
+
+	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-force-joiner") {
+		igt_require_f(force_joiner_supported,
+			      "force joiner not supported on this platform or none of the connected output supports it\n");
+		igt_require_f(data.non_big_joiner_output_count > 0,
+			      "No non big joiner output found\n");
+		igt_require_f(data.n_pipes > 1,
+			      "Minimum 2 pipes required\n");
+		igt_dynamic_f("single") {
+			toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+			test_single_joiner(&data, data.non_big_joiner_output_count, true);
+			toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+		}
+		if (data.non_big_joiner_output_count > 1) {
+			igt_dynamic_f("multi") {
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
+		igt_require_f(force_joiner_supported,
+			      "force joiner not supported on this platform or none of the connected output supports it\n");
+		igt_require_f(data.non_big_joiner_output_count > 0,
+			      "Non big joiner output not found\n");
+		igt_require_f(data.n_pipes > 1,
+			      "Minimum of 2 pipes are required\n");
+		if (data.non_big_joiner_output_count >= 1) {
+			igt_dynamic_f("big_joiner_on_last_pipe") {
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				test_joiner_on_last_pipe(&data, true);
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+			}
+		}
+		if (data.non_big_joiner_output_count > 1) {
+			igt_dynamic_f("invalid_combinations") {
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				test_invalid_modeset_two_joiner(&data, false, true);
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1


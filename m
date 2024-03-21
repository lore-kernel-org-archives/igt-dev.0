Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F908C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 18:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D3510F823;
	Thu, 21 Mar 2024 18:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aso1rOrQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729B910F812
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711045079; x=1742581079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nJ/ZmOid1zPWVuQfmO3KEbQv7YE0SpBS2Ow/ba+H/eM=;
 b=aso1rOrQNZ45PrKp2IVjYnbp/BB69JAY+MHi4/Quotj2+fISf8YHVv+e
 g78neyoS1kujVRKLuUwzhWAslt3/pJJvthmdfSiDug70o08y072tw46Gz
 e4v1JrnrrrHpoAIizT2j9gjSkCctlaOLQU1RuArcLAsD1JIMwJzLyOO1N
 tnHNeuv/qG75ughTAlVzktB3Ydwd0OshBhWsAhynmqfwFRvi2PT1xaAUU
 Ai0Xky5/ziP4OchzrZ42b+jijQto9T1NadGF3iiRS3niG467lKKXLdjI5
 Jk0qT482nWMlAG5Jgamqk3pFeqzgcJMcRdCmsnzjSmQfFFBSRWnAHA9P+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5894123"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5894123"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 11:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14512664"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 11:17:56 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/kms_big_joiner: add tests for force
 joiner
Date: Thu, 21 Mar 2024 23:58:31 +0530
Message-Id: <20240321182831.1143175-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321182831.1143175-1-kunal1.joshi@intel.com>
References: <20240321182831.1143175-1-kunal1.joshi@intel.com>
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

Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 102 +++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 17 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index eba74cddf..8c3945e15 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -44,9 +44,14 @@
  * SUBTEST: basic
  * Description: Verify the basic modeset on big joiner mode on all pipes
  *
+ * SUBTEST: invalid-modeset-force-joiner
+ * Description: Verify if the modeset on the adjoining pipe is rejected when
+ *              the pipe is active with a force joiner modeset
+ *
+ * SUBTEST: basic-force-joiner
+ * Description: Verify the basic modeset on force joiner mode on all pipes
  */
-
-IGT_TEST_DESCRIPTION("Test big joiner");
+IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
 
 #define INVALID_TEST_OUTPUT 2
 
@@ -96,6 +101,19 @@ static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t id)
 	return NULL;
 }
 
+static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool toggle)
+{
+	bool status;
+	igt_output_t *output;
+	int i;
+
+	for (i = 0; i < data->non_big_joiner_output_count; i++) {
+		output = get_output_by_id_or_assert(data, data->non_big_joiner_output[i]);
+		status = igt_force_and_check_bigjoiner_status(data->drm_fd, output->name, toggle);
+		igt_assert_f(status, "Failed to toggle force joiner\n");
+	}
+}
+
 static enum pipe get_next_master_pipe(data_t *data, unsigned int available_pipe_mask)
 {
 	if ((data->master_pipes & available_pipe_mask) == 0)
@@ -122,7 +140,7 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 	return master_pipe;
 }
 
-static void test_single_joiner(data_t *data, int output_count)
+static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i;
 	enum pipe pipe, master_pipe;
@@ -133,7 +151,7 @@ static void test_single_joiner(data_t *data, int output_count)
 	igt_fb_t fb;
 	drmModeModeInfo *mode;
 
-	outputs = data->big_joiner_output;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	for (i = 0; i < output_count; i++) {
 		output = get_output_by_id_or_assert(data, outputs[i]);
@@ -154,7 +172,7 @@ static void test_single_joiner(data_t *data, int output_count)
 	}
 }
 
-static void test_multi_joiner(data_t *data, int output_count)
+static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i;
 	unsigned int available_pipe_mask;
@@ -166,7 +184,7 @@ static void test_multi_joiner(data_t *data, int output_count)
 	drmModeModeInfo *mode;
 
 	available_pipe_mask = BIT(data->n_pipes) - 1;
-	outputs = data->big_joiner_output;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	igt_display_reset(&data->display);
 	for (i = 0; i < output_count; i++) {
@@ -194,7 +212,7 @@ static void test_multi_joiner(data_t *data, int output_count)
 }
 
 static void test_invalid_modeset_two_joiner(data_t *data,
-					    bool combined)
+					    bool combined, bool force_joiner)
 {
 	int i, j, ret;
 	unsigned int available_pipe_mask;
@@ -207,7 +225,8 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 	drmModeModeInfo *mode;
 
 	available_pipe_mask = BIT(data->n_pipes) - 1;
-	outputs = combined ? data->combined_output : data->big_joiner_output;
+	outputs = force_joiner ? data->non_big_joiner_output :
+			  combined ? data->combined_output : data->big_joiner_output;
 
 	for (i = 0; i < data->n_pipes-1; i++) {
 		igt_display_reset(&data->display);
@@ -240,7 +259,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 	}
 }
 
-static void test_big_joiner_on_last_pipe(data_t *data)
+static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 {
 	int i, len, ret;
 	uint64_t *outputs;
@@ -249,8 +268,8 @@ static void test_big_joiner_on_last_pipe(data_t *data)
 	igt_fb_t fb;
 	drmModeModeInfo *mode;
 
-	len = data->big_joiner_output_count;
-	outputs = data->big_joiner_output;
+	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	for (i = 0; i < len; i++) {
 		igt_display_reset(&data->display);
@@ -274,12 +293,14 @@ static void test_big_joiner_on_last_pipe(data_t *data)
 
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
 		data.combined_output_count = 0;
@@ -307,7 +328,10 @@ igt_main
 				data.big_joiner_output[data.big_joiner_output_count++] = output->config.connector->connector_id;
 				igt_output_override_mode(output, &mode);
 			} else {
-				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output->config.connector->connector_id;
+				if (igt_has_force_joiner_debugfs(data.drm_fd, output)) {
+					force_joiner_supported = true;
+					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output->config.connector->connector_id;
+				}
 			}
 			data.output_count++;
 		}
@@ -330,10 +354,10 @@ igt_main
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
 
 	igt_subtest_with_dynamic("invalid-modeset") {
@@ -341,13 +365,57 @@ igt_main
 		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
 		if (data.big_joiner_output_count >= 1)
 			igt_dynamic_f("big_joiner_on_last_pipe")
-				test_big_joiner_on_last_pipe(&data);
+				test_joiner_on_last_pipe(&data, false);
 		if (data.big_joiner_output_count > 1)
 			igt_dynamic_f("invalid_combinations")
-				test_invalid_modeset_two_joiner(&data, false);
+				test_invalid_modeset_two_joiner(&data, false, false);
 		if (data.combined_output_count)
 			igt_dynamic_f("combined_output")
-				test_invalid_modeset_two_joiner(&data, true);
+				test_invalid_modeset_two_joiner(&data, true, false);
+	}
+
+	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-force-joiner") {
+			igt_require_f(force_joiner_supported,
+						 "force joiner not supported on this platform or none of the connected output supports it\n");
+			igt_require_f(data.non_big_joiner_output_count > 0,
+				      "No non big joiner output found\n");
+			igt_require_f(data.n_pipes > 1,
+				      "Minimum 2 pipes required\n");
+			igt_dynamic_f("single") {
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				test_single_joiner(&data, data.non_big_joiner_output_count, true);
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+			}
+			if (data.non_big_joiner_output_count > 1) {
+				igt_dynamic_f("multi") {
+					toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+					test_multi_joiner(&data, data.non_big_joiner_output_count, true);
+					toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+				}
+			}
+	}
+
+	igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
+			igt_require_f(force_joiner_supported,
+						 "force joiner not supported on this platform or none of the connected output supports it\n");
+		igt_require_f(data.non_big_joiner_output_count > 0, "Non big joiner output not found\n");
+		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
+
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
2.34.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCA4C54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 14:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DB6112457;
	Thu, 28 Mar 2024 14:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3wtUzkg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E63112450
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711636518; x=1743172518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YSwt1l7lzDbjiPyl3PLtLTn2zRnT1ditGKfXu26J+oY=;
 b=G3wtUzkguHMrQKAde+I3Zgmix/iR/HZEHRuD6iGrYp/R9/VyTe4h1ItL
 eTtb1clQW84mQ+GCGXsHOPw0VksgDT7aIHKfwSYbd3aS9eOvgE5VIIAcF
 D8EPTOXPJvtGK0MzLnJ1OwW/WYRB2x4uftilbhTkhxfBkeEYp17HyGW0l
 an0M1WQKt+u0Palv1n7psjMLINLaSPEA0cPh9SVhnT1UiQaclQTpe71Hs
 mKFXMAtWkYCNWIQE9ECTHOVSp3OyMEv2/wfD+rQmO9evvksJR5Y2hWdRn
 DtesFgIHhzelzmB2MTcdZoH0kuItOosCDrkyvWRxML3gZ6HoC8TECB5Ps g==;
X-CSE-ConnectionGUID: FH1AiJyAQQuWxZKTEA29vQ==
X-CSE-MsgGUID: EGsdXIDET+Oo5BorC8rzGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10602452"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="10602452"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 07:35:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17114927"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 07:35:15 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/kms_big_joiner: add tests for force
 joiner
Date: Thu, 28 Mar 2024 20:15:53 +0530
Message-Id: <20240328144554.1371727-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328144554.1371727-1-kunal1.joshi@intel.com>
References: <20240328144554.1371727-1-kunal1.joshi@intel.com>
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
 tests/intel/kms_big_joiner.c | 119 +++++++++++++++++++++++++++++------
 1 file changed, 100 insertions(+), 19 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index c13d58bcc..7daf47cda 100644
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
@@ -116,12 +140,13 @@ static void test_single_joiner(data_t *data, int output_count)
 	igt_fb_t fb;
 	drmModeModeInfo *mode;
 
-	outputs = data->big_joiner_output;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	for (i = 0; i < output_count; i++) {
 		output = outputs[i];
 		for (pipe = 0; pipe < data->n_pipes - 1; pipe++) {
-			igt_display_reset(&data->display);
 			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
 			if (master_pipe == PIPE_NONE)
 				continue;
@@ -131,13 +156,14 @@ static void test_single_joiner(data_t *data, int output_count)
 					      DRM_FORMAT_MOD_LINEAR, &fb);
 			igt_plane_set_fb(primary, &fb);
 			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+			igt_display_reset(&data->display);
 			igt_plane_set_fb(primary, NULL);
 			igt_remove_fb(data->drm_fd, &fb);
 		}
 	}
 }
 
-static void test_multi_joiner(data_t *data, int output_count)
+static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i;
 	uint32_t available_pipe_mask;
@@ -149,9 +175,11 @@ static void test_multi_joiner(data_t *data, int output_count)
 	drmModeModeInfo *mode;
 
 	available_pipe_mask = BIT(data->n_pipes) - 1;
-	outputs = data->big_joiner_output;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
 	for (i = 0; i < output_count; i++) {
 		output = outputs[i];
 		for (pipe = 0; pipe < data->n_pipes; pipe++) {
@@ -177,7 +205,7 @@ static void test_multi_joiner(data_t *data, int output_count)
 }
 
 static void test_invalid_modeset_two_joiner(data_t *data,
-					    bool mixed)
+					    bool mixed, bool force_joiner)
 {
 	int i, j, ret;
 	uint32_t available_pipe_mask;
@@ -190,10 +218,12 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 	drmModeModeInfo *mode;
 
 	available_pipe_mask = BIT(data->n_pipes) - 1;
-	outputs = mixed ? data->mixed_output : data->big_joiner_output;
+	outputs = force_joiner ? data->non_big_joiner_output :
+		  mixed ? data->mixed_output : data->big_joiner_output;
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	for (i = 0; i < data->n_pipes - 1; i++) {
-		igt_display_reset(&data->display);
 		attempt_mask = BIT(data->pipe_seq[i]);
 		master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
 
@@ -215,6 +245,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 			igt_plane_set_fb(primary[j], &fb[j]);
 		}
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+		igt_display_reset(&data->display);
 		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
 			igt_plane_set_fb(primary[j], NULL);
 			igt_remove_fb(data->drm_fd, &fb[j]);
@@ -223,7 +254,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 	}
 }
 
-static void test_big_joiner_on_last_pipe(data_t *data)
+static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 {
 	int i, len, ret;
 	igt_output_t **outputs;
@@ -232,8 +263,8 @@ static void test_big_joiner_on_last_pipe(data_t *data)
 	igt_fb_t fb;
 	drmModeModeInfo *mode;
 
-	len = data->big_joiner_output_count;
-	outputs = data->big_joiner_output;
+	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	for (i = 0; i < len; i++) {
 		igt_display_reset(&data->display);
@@ -257,12 +288,14 @@ static void test_big_joiner_on_last_pipe(data_t *data)
 
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
@@ -290,7 +323,10 @@ igt_main
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
@@ -316,10 +352,10 @@ igt_main
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
@@ -329,13 +365,58 @@ igt_main
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


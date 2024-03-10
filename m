Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3389C54E58
	for <igt-dev@archiver.kernel.org>; Sun, 10 Mar 2024 14:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8EA10E0A9;
	Sun, 10 Mar 2024 14:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glD2G/bT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A7110E09D
 for <igt-dev@lists.freedesktop.org>; Sun, 10 Mar 2024 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710080223; x=1741616223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bflBegpqNV/TSMq59/oVzq2jpgYaKdbzfFHJOYJ+0wM=;
 b=glD2G/bTpgq/SsUAzxc0E0k186j1fHCw3dCB47WBfLi5QawiUMNq50g8
 fuYhOqRHekZqOgsJti9OQRNyPRY7FK3bhjQflC9i2Vd3PiXocJTQBbY6j
 5omaaV3ijegtbyu4bHkVlISwiAovsFFvNJg/VX9xN7vH6x/PixDL+Xi4R
 WqwrAz9WfEG8nNd5XnZqji+Hlk5MS8opEYm+E5Kpl6KrzgMKf+vD8l4e+
 9sHdX5h2+Q2ZmPXFqhVczq1UJU64GrASiM3Uqddu42lG2GtRjgrFTfCe9
 oNjtJ0gxT+yVinDHyrAigeT57JfHXL9c2ZKkQRIKVEpewwAkPhBcA5+AT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4916455"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="4916455"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 07:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; d="scan'208";a="11324264"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 07:17:00 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/kms_big_joiner: add tests for force
 joiner
Date: Sun, 10 Mar 2024 19:57:21 +0530
Message-Id: <20240310142721.874315-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240310142721.874315-1-kunal1.joshi@intel.com>
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
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

Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 101 +++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 16 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index d4b0d1100..6017b30cd 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -44,13 +44,20 @@
  * SUBTEST: basic-bigjoiner
  * Description: Verify the basic modeset on big joiner mode on all pipes
  *
+ * SUBTEST: invalid-modeset-force-joiner
+ * Description: Verify if the modeset on the adjoining pipe is rejected when
+ *              the pipe is active with a force joiner modeset
+ *
+ * SUBTEST: basic-force-joiner
+ * Description: Verify the basic modeset on force joiner mode on all pipes
  */
 
-IGT_TEST_DESCRIPTION("Test big joiner");
+IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
 
 #define INVALID_TEST_OUTPUT 2
 
 typedef struct {
+	bool force_joiner_supported;
 	int drm_fd;
 	int big_joiner_output_count;
 	int non_big_joiner_output_count;
@@ -90,6 +97,17 @@ static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t id)
 	return NULL;
 }
 
+static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool toggle)
+{
+	int i;
+	igt_output_t *output;
+
+	for (i = 0; i < data->non_big_joiner_output_count; i++) {
+		output = get_output_by_id_or_assert(data, data->non_big_joiner_output[i]);
+		igt_force_bigjoiner_enable(data->drm_fd, output->name, toggle);
+	}
+}
+
 static enum pipe get_next_master_pipe(data_t *data, unsigned int available_pipe_mask)
 {
 	if ((data->master_pipes & available_pipe_mask) == 0)
@@ -98,7 +116,7 @@ static enum pipe get_next_master_pipe(data_t *data, unsigned int available_pipe_
 	return ffs(data->master_pipes & available_pipe_mask) - 1;
 }
 
-static void test_single_joiner(data_t *data, int output_count)
+static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i, ret;
 	enum pipe pipe, master_pipe;
@@ -110,7 +128,7 @@ static void test_single_joiner(data_t *data, int output_count)
 	igt_fb_t fb;
 	drmModeModeInfo *mode;
 
-	outputs = data->big_joiner_output;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	for (i = 0; i < output_count; i++) {
 		output = get_output_by_id_or_assert(data, outputs[i]);
@@ -121,7 +139,8 @@ static void test_single_joiner(data_t *data, int output_count)
 			master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
 			if (master_pipe == PIPE_NONE)
 				continue;
-			igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe), kmstest_pipe_name(pipe + 1), output->name);
+			igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe),
+					 kmstest_pipe_name(pipe + 1), output->name);
 			igt_output_set_pipe(output, pipe);
 			mode = igt_output_get_mode(output);
 			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -134,7 +153,7 @@ static void test_single_joiner(data_t *data, int output_count)
 	}
 }
 
-static void test_multi_joiner(data_t *data, int output_count)
+static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i, ret;
 	unsigned int available_pipe_mask;
@@ -158,7 +177,8 @@ static void test_multi_joiner(data_t *data, int output_count)
 			if (master_pipe == PIPE_NONE)
 				continue;
 
-			igt_info("Using pipe %s as master %s slave for %s\n", kmstest_pipe_name(pipe), kmstest_pipe_name(pipe + 1), output->name);
+			igt_info("Using pipe %s as master %s slave for %s\n", kmstest_pipe_name(pipe),
+					 kmstest_pipe_name(pipe + 1), output->name);
 			igt_output_set_pipe(output, pipe);
 			mode = igt_output_get_mode(output);
 			primary[i] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -176,7 +196,7 @@ static void test_multi_joiner(data_t *data, int output_count)
 }
 
 static void test_invalid_modeset_two_joiner(data_t *data,
-					    bool combined)
+					    bool combined,  bool force_joiner)
 {
 	int i, j, ret;
 	uint64_t *outputs;
@@ -209,7 +229,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 	}
 }
 
-static void tets_big_joiner_on_last_pipe(data_t *data)
+static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 {
 	int i, len, ret;
 	uint64_t *outputs;
@@ -218,8 +238,8 @@ static void tets_big_joiner_on_last_pipe(data_t *data)
 	igt_fb_t fb;
 	drmModeModeInfo *mode;
 
-	len = data->big_joiner_output_count;
-	outputs = data->big_joiner_output;
+	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 
 	for (i = 0; i < len; i++) {
 		igt_display_reset(&data->display);
@@ -247,6 +267,7 @@ igt_main
 	data_t data;
 
 	igt_fixture {
+		data.force_joiner_supported = false;
 		data.big_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
 		data.combined_output_count = 0;
@@ -274,7 +295,10 @@ igt_main
 				data.big_joiner_output[data.big_joiner_output_count++] = output->config.connector->connector_id;
 				igt_output_override_mode(output, &connector->modes[0]);
 			} else {
-				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output->config.connector->connector_id;
+				if (has_force_joiner_debugfs(data.drm_fd, output)) {
+					data.force_joiner_supported = true;
+					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output->config.connector->connector_id;
+				}
 			}
 			data.output_count++;
 		}
@@ -297,10 +321,10 @@ igt_main
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
 
@@ -309,13 +333,58 @@ igt_main
 		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
 		if (data.big_joiner_output_count >= 1)
 			igt_dynamic_f("big_joiner_on_last_pipe")
-				tets_big_joiner_on_last_pipe(&data);
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
+			igt_require_f(data.force_joiner_supported,
+						 "force joiner not supported on this platform or none of the connected output supports it\n");
+			igt_require_f(data.non_big_joiner_output_count > 0,
+				      "No non big joiner output found\n");
+			igt_require_f(data.n_pipes > 1,
+				      "Minimum 2 pipes required\n");
+			igt_dynamic_f("single") {
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				test_single_joiner(&data, data.non_big_joiner_output_count, true);
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+
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
+			igt_require_f(data.force_joiner_supported,
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
+				test_invalid_modeset_two_joiner(&data, true, false);
+				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.34.1


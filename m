Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CEAEE0211
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 07:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EF910E806;
	Wed, 11 Sep 2024 07:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3ErlnGL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8247F10E806
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726039457; x=1757575457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTKFdSbgvGeCtvNv1AnJOwWl9mGypPh/v3uaiaH0tSQ=;
 b=I3ErlnGLzl33V1Vvj3bF84JytgGsAhHclWGx3cpVogExZyJbX8UrLA40
 CXo6fALhIcQLT9I3tOVbNBeLwxf83py4SWSbsd2/MI7sLKyI44ycwULGa
 t0tUKVRXcfGLg1QLFYvEJHk7QblG2hmHrXd9K4iCK8FL67Aa9i/B3LxPR
 4jY+d1/1EK84i2PhAsxHArUcUiIGjIraWf70kHfOU7zBBAcA36KOBupTQ
 KG1+xskonuckVr9XTH9WcY6cvBQQrVvOw4xcKVYw1D1yV6YNz7Cz7HLaa
 V2kluDi9S3ETzu0KLsUOf2KnfeYHzYqqHiUxqBXRQ1OW4w4z0DsRPPUsd g==;
X-CSE-ConnectionGUID: yHHCbEY0SBOMPLI+LRlrDQ==
X-CSE-MsgGUID: xj6czrr/QeWudtWyBQkx+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="13468085"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="13468085"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 00:24:17 -0700
X-CSE-ConnectionGUID: VF4A/2zBSOyJo8u81sqe5w==
X-CSE-MsgGUID: lQrHgLTXTo+I/G0vZyXxew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67116442"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 00:24:15 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, bhanuprakash.modem@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/kms_joiner: Add subtests for force ultra
 joiner validation
Date: Wed, 11 Sep 2024 12:52:04 +0530
Message-Id: <20240911072204.22825-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240911072204.22825-1-karthik.b.s@intel.com>
References: <20240911072204.22825-1-karthik.b.s@intel.com>
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

Extend the ultrajoiner subtests to validate ultrajoiner on a non
ultrajoiner supported display using force joiner.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_joiner.c | 105 +++++++++++++++++++++++++++++++++------
 1 file changed, 89 insertions(+), 16 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 13863d5e1..07b49fb08 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -51,15 +51,24 @@
  * SUBTEST: basic-ultra-joiner
  * Description: Verify the basic modeset on ultra joiner mode on all pipes
  *
- * SUBTEST: invalid-modeset-force-joiner
- * Description: Verify if modeset on adjacent pipe is declined when force joiner modeset is active.
- *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs,
+ * SUBTEST: invalid-modeset-force-big-joiner
+ * Description: Verify if modeset on adjacent pipe is declined when force big joiner modeset is active.
+ *		Force big joiner applies bigjoiner functionality to non-bigjoiner outputs,
  *		so test exclusively targets non-bigjoiner outputs.
  *
- * SUBTEST: basic-force-joiner
- * Description: Verify basic modeset in force joiner mode across all pipes.
+ * SUBTEST: basic-force-big-joiner
+ * Description: Verify basic big joiner modeset in force joiner mode across all pipes.
  *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
  *		the test exclusively targets non-bigjoiner outputs.
+ *
+ * SUBTEST: basic-force-ultra-joiner
+ * Description: Verify basic ultra joiner modeset in force joiner mode across all pipes.
+ *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
+ *		the test exclusively targets non-bigjoiner outputs.
+ *
+ * SUBTEST: invalid-modeset-force-ultra-joiner
+ * Description: Verify if the modeset on the other pipes are rejected when
+ *              the pipe A is active with force ultra joiner modeset.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -111,6 +120,19 @@ static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
 	}
 }
 
+static void enable_force_joiner_on_all_non_ultra_joiner_outputs(data_t *data)
+{
+	bool status;
+	igt_output_t *output;
+	int i;
+
+	for (i = 0; i < data->non_ultra_joiner_output_count; i++) {
+		output = data->non_ultra_joiner_output[i];
+		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, 4);
+		igt_assert_f(status, "Failed to toggle force joiner\n");
+	}
+}
+
 static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
 {
 	if ((data->master_pipes & available_pipe_mask) == 0)
@@ -297,23 +319,36 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 	}
 }
 
-static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display)
+static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display, bool force_joiner)
 {
-	int i, j, k, ret;
+	int i, j, k, ret, count;
 	igt_output_t *output, *non_ultra_joiner_output;
 	igt_plane_t *primary;
 	igt_output_t **outputs;
 	igt_fb_t fb;
 	drmModeModeInfo mode;
 
-	outputs = data->ultra_joiner_output;
+	if (force_joiner) {
+		outputs = data->non_ultra_joiner_output;
+		count = data->non_ultra_joiner_output_count;
+	} else {
+		outputs = data->ultra_joiner_output;
+		count = data->ultra_joiner_output_count;
+	}
+
 	igt_display_reset(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	for (i = 0; i < data->ultra_joiner_output_count; i++) {
+	for (i = 0; i < count; i++) {
 		output = outputs[i];
-		igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
-		igt_output_override_mode(output, &mode);
+
+		if (!force_joiner) {
+			igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
+			igt_output_override_mode(output, &mode);
+		} else {
+			mode = *igt_output_get_mode(output);
+		}
+
 		for (j = 0; j < data->n_pipes; j++) {
 			/* Ultra joiner is only valid on PIPE_A */
 			if (invalid_pipe && j == PIPE_A)
@@ -461,7 +496,7 @@ igt_main
 			igt_require_f(data.n_pipes > 3,
 				      "Minimum 4 pipes required\n");
 			igt_dynamic_f("single-joiner")
-				test_ultra_joiner(&data, false, false);
+				test_ultra_joiner(&data, false, false, false);
 	}
 
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
@@ -487,15 +522,15 @@ igt_main
 		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
 
 		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
-			test_ultra_joiner(&data, true, false);
+			test_ultra_joiner(&data, true, false, false);
 		if (data.non_ultra_joiner_output_count > 0) {
 			igt_dynamic_f("2x")
-				test_ultra_joiner(&data, false, true);
+				test_ultra_joiner(&data, false, true, false);
 		}
 	}
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
-	igt_subtest_with_dynamic("basic-force-joiner") {
+	igt_subtest_with_dynamic("basic-force-big-joiner") {
 		igt_require_f(force_joiner_supported,
 			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(data.non_big_joiner_output_count > 0,
@@ -516,7 +551,7 @@ igt_main
 		}
 	}
 
-	igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
+	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
 		igt_require_f(force_joiner_supported,
 			      "force joiner not supported on this platform or none of the connected output supports it\n");
 		igt_require_f(data.non_big_joiner_output_count > 0,
@@ -539,6 +574,44 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
+		igt_require_f(force_joiner_supported,
+			      "force joiner not supported on this platform or none of the connected output supports it\n");
+		igt_require_f(data.non_ultra_joiner_output_count > 0,
+			      "No non ultra joiner output found\n");
+		igt_require_f(data.n_pipes > 3,
+			      "Minimum 4 pipes required\n");
+		igt_dynamic_f("single") {
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, false, false, true);
+			igt_reset_connectors();
+		}
+	}
+
+	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
+		igt_require_f(force_joiner_supported,
+			      "force joiner not supported on this platform or none of the connected output supports it\n");
+		igt_require_f(data.non_ultra_joiner_output_count > 0,
+			      "Non ultra joiner output not found\n");
+		igt_require_f(data.n_pipes > 3,
+			      "Minimum of 3 pipes are required\n");
+
+		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, true, false, true);
+			igt_reset_connectors();
+		}
+
+		if (data.non_ultra_joiner_output_count > 1) {
+			igt_dynamic_f("2x") {
+				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+				test_ultra_joiner(&data, false, true, true);
+				igt_reset_connectors();
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.39.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124FCC52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 04:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC41510E0A2;
	Mon, 12 Aug 2024 04:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="diycAN9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5A810E09D
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 04:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723438173; x=1754974173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zfnBhk1F2d26WtXOlwdCUtc9MrOUbqkfums41nPk10w=;
 b=diycAN9WHJ7F1YX3d5o9TXjElOdv/db8vxwlo9vOVW0Ny6/OAiNYxPpi
 YnAvxrV9am+EmtmuUSavjnEdifAqNmslJ2DKG3kK5cQV4xkoRsc/pl0n5
 AUK5xFN65Qi83R4i+kLKI1W8zz7S7QGPLSXjUzE5JMIeTLDBFRAY9jc8Y
 7JoA454NC0Xar8xq1aON7V08uKz85ZsmAsLR2/Sp4K5JNqEUqitX31BmQ
 SyqUYNiVZO8X5qG/Pv1m/6loBc1hzoecJX6np2XmTtcNugw5M3JyR21ht
 bTh+WLxKAmaHAug8kc7MY9aIiQRjJfK3OgGkSEZbaBYnG2MUx4MpE7LeA Q==;
X-CSE-ConnectionGUID: XRqu7GLyQuKnwlFgA/ZyMA==
X-CSE-MsgGUID: U50nWsSwSCe7SR7aO5+KPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="38980944"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="38980944"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 21:49:33 -0700
X-CSE-ConnectionGUID: 273YGMftS8uFnUlmQugYAw==
X-CSE-MsgGUID: SirbNqnTRTi3fRFk09kXhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="88782539"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 21:49:31 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_joiner: Add subtests for force ultra
 joiner validation
Date: Mon, 12 Aug 2024 10:17:39 +0530
Message-Id: <20240812044739.5630-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240812044739.5630-1-karthik.b.s@intel.com>
References: <20240812044739.5630-1-karthik.b.s@intel.com>
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
 lib/igt_kms.c            |  16 +++---
 lib/igt_kms.h            |   2 +-
 tests/intel/kms_joiner.c | 107 ++++++++++++++++++++++++++++++++-------
 3 files changed, 99 insertions(+), 26 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 08b628f1a..3b252b00b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1720,34 +1720,34 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
 	return true;
 }
 
-static bool force_connector_bigjoiner(int drm_fd,
+static bool force_connector_joiner(int drm_fd,
 				      drmModeConnector *connector,
 				      const char *value)
 {
 	return connector_attr_set_debugfs(drm_fd, connector,
-					  "i915_bigjoiner_force_enable",
+					  "i915_joiner_force_enable",
 					  value, "0");
 }
 
 /**
- * kmstest_force_connector_bigjoiner:
+ * kmstest_force_connector_joiner:
  * @fd: drm file descriptor
  * @connector: connector
  *
- * Enable force bigjoiner state on the specified connector
+ * Enable force joiner state on the specified connector
  * and install exit handler for resetting
  *
  * Returns: True on success
  */
-bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector)
+bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, bool ultrajoiner)
 {
-	const char *value = "1";
+	const char *value = ultrajoiner ? "4" : "2";
 	drmModeConnector *temp;
 
 	if (!is_intel_device(drm_fd))
 		return false;
 
-	if (!force_connector_bigjoiner(drm_fd, connector, value))
+	if (!force_connector_joiner(drm_fd, connector, value))
 		return false;
 
 	dump_connector_attrs();
@@ -6420,7 +6420,7 @@ bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
 	if (debugfs_fd < 0)
 		return false;
 
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
 	close(debugfs_fd);
 
 	return ret >= 0;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c8e89b076..8d154ec47 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -262,7 +262,7 @@ struct edid;
 
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
-bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
+bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, bool ultrajoiner);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
 
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 633bf51c7..a1510fae0 100644
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
 
@@ -106,7 +115,20 @@ static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
 
 	for (i = 0; i < data->non_big_joiner_output_count; i++) {
 		output = data->non_big_joiner_output[i];
-		status = kmstest_force_connector_bigjoiner(data->drm_fd, output->config.connector);
+		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, false);
+		igt_assert_f(status, "Failed to toggle force joiner\n");
+	}
+}
+
+static void enable_force_joiner_on_all_non_ultra_joiner_outputs(data_t *data)
+{
+	bool status;
+	igt_output_t *output;
+	int i;
+
+	for (i = 0; i < data->non_ultra_joiner_output_count; i++) {
+		output = data->non_ultra_joiner_output[i];
+		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector, true);
 		igt_assert_f(status, "Failed to toggle force joiner\n");
 	}
 }
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


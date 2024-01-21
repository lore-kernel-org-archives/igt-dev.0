Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA16C47DAF
	for <igt-dev@archiver.kernel.org>; Sun, 21 Jan 2024 12:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D72D10E1EC;
	Sun, 21 Jan 2024 12:48:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E308510E1EC
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Jan 2024 12:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705841305; x=1737377305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EuK2J5c3hPy6PEQZwfNaABfRFPBADF+krtjRMtalj38=;
 b=BVbEPKAmknJGHLCi8ZcvzaC7b2/Qdse9drUsc3jqxBi6fk6JdW52669E
 kxXk8MYy/+Kd5ZJ7OzGS6AwlWBZQRAbeIJZsMNuU2eakOnzRyPBoVeNC4
 4BhTd8qYIiiX2zpFgoZzcn/DXP43QhigWNXec0gUHab7KYXE03+enWmGR
 vayCtUW0E7GgEdyp726wfQkUnwN4XOJwQUFXmxNJi+HG6RdckGlXIsaI3
 Ul4lhiCwXn1/SbPEWN0nT78DNTFuz8etNNr7df33xyRneQLuyqRVs3Fll
 L6k/GAr3SVsKMQWXgCZTzJU7V/+9YXHzX0ZzN+WtODntTbiZfNR211zBC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="487167504"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; d="scan'208";a="487167504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 04:48:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="953617"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 04:48:22 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] lib/igt_psr.c: add support for panel replay sf
Date: Sun, 21 Jan 2024 18:27:43 +0530
Message-Id: <20240121125744.1129837-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240121125744.1129837-1-kunal1.joshi@intel.com>
References: <20240121125744.1129837-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

modify functions in igt_psr to extend support for validating
panel replay selective fetch.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c             | 46 ++++++++++++++++++++++++++-------------
 lib/igt_psr.h             |  6 ++---
 tests/intel/kms_psr2_sf.c |  8 ++++---
 tests/kms_async_flips.c   |  4 ++--
 tests/kms_cursor_legacy.c |  2 +-
 5 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 663bac163..1123c8d98 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -37,14 +37,21 @@ bool psr_disabled_check(int debugfs_fd)
 	return strstr(buf, "PSR mode: disabled\n");
 }
 
-bool psr2_selective_fetch_check(int debugfs_fd)
+enum psr_mode selective_fetch_check(int debugfs_fd, igt_output_t *output)
 {
+	char debugfs_file[128] = {0};
 	char buf[PSR_STATUS_MAX_LEN];
 
-	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
-				sizeof(buf));
+	if (output)
+		sprintf(debugfs_file, "%s/i915_psr_status", output->name);
+	else
+		sprintf(debugfs_file, "%s", "i915_edp_psr_status");
 
-	return strstr(buf, "PSR2 selective fetch: enabled");
+	igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
+							sizeof(buf));
+
+	return strstr(buf, "PSR2 selective fetch: enabled") ? PSR_MODE_2_SEL_FETCH :
+		   strstr(buf, "Panel Replay Selective Update Enabled") ? PR_MODE_SEL_FETCH : PSR_DISABLED;
 }
 
 static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
@@ -246,6 +253,8 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
 	case PR_MODE:
 		return strstr(line, "Panel Replay = yes");
+	case PR_MODE_SEL_FETCH:
+		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
 	default:
 		igt_assert_f(false, "Invalid psr mode\n");
 		return false;
@@ -305,7 +314,7 @@ void psr_print_debugfs(int debugfs_fd)
 	igt_info("%s", buf);
 }
 
-bool i915_psr2_selective_fetch_check(int drm_fd)
+bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output)
 {
 	int debugfs_fd;
 	bool ret;
@@ -314,24 +323,24 @@ bool i915_psr2_selective_fetch_check(int drm_fd)
 		return false;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	ret = psr2_selective_fetch_check(debugfs_fd);
+	ret = selective_fetch_check(debugfs_fd, output) != PSR_DISABLED;
 	close(debugfs_fd);
 
 	return ret;
 }
 
-/**
- * i915_psr2_sel_fetch_to_psr1
+/*
+ * i915_pr_psr2_sel_fetch_to_pr_psr1
  *
- * Check if PSR2 selective fetch is enabled, if yes switch to PSR1 and returns
+ * Check if PR/PSR2 selective fetch is enabled, if yes switch to PR/PSR1 and returns
  * true otherwise returns false.
- * This function should be called from tests that are not compatible with PSR2
- * selective fetch.
  *
+ * @param drm_fd The file descriptor of the DRM device.
+ * @param output The output for which the conversion is performed.
  * Returns:
- * True if PSR mode changed to PSR1, false otherwise.
+ *	True if the conversion was successful, false otherwise.
  */
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t *output)
 {
 	int debugfs_fd;
 	bool ret = false;
@@ -340,11 +349,18 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd)
 		return ret;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	if (psr2_selective_fetch_check(debugfs_fd)) {
+	switch (selective_fetch_check(debugfs_fd, output)) {
+	case PSR_MODE_2_SEL_FETCH:
 		psr_set(drm_fd, debugfs_fd, PSR_MODE_1);
 		ret = true;
+		break;
+	case PR_MODE_SEL_FETCH:
+		psr_set(drm_fd, debugfs_fd, PR_MODE);
+		ret = true;
+		break;
+	default:
+		ret = false;
 	}
-
 	close(debugfs_fd);
 	return ret;
 }
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 36711c0d4..5dc70f23e 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -46,7 +46,7 @@ enum fbc_mode {
 };
 
 bool psr_disabled_check(int debugfs_fd);
-bool psr2_selective_fetch_check(int debugfs_fd);
+enum psr_mode selective_fetch_check(int debugfs_fd, igt_output_t *output);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
@@ -57,9 +57,9 @@ bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
 void psr_print_debugfs(int debugfs_fd);
 enum psr_mode psr_get_mode(int debugfs_fd);
 
-bool i915_psr2_selective_fetch_check(int drm_fd);
+bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output);
 
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t *output);
 void i915_psr2_sel_fetch_restore(int drm_fd);
 
 #endif
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index ecf9ad77f..c826cd7c3 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -994,6 +994,7 @@ igt_main
 	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
 
 	igt_fixture {
+		bool pr_or_psr2_selective_fetch_supported = false;
 		drmModeResPtr res;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
@@ -1026,10 +1027,9 @@ igt_main
 		igt_info("Big framebuffer size %dx%d\n",
 			 data.big_fb_width, data.big_fb_height);
 
-		igt_require_f(psr2_selective_fetch_check(data.debugfs_fd),
-			      "PSR2 selective fetch not enabled\n");
-
 		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
+			pr_or_psr2_selective_fetch_supported |= (selective_fetch_check(data.debugfs_fd,
+													 data.output) != PSR_DISABLED);
 			coexist_features[n_pipes] = 0;
 			if (check_psr2_support(&data)) {
 				pipes[n_pipes] = data.pipe;
@@ -1041,6 +1041,8 @@ igt_main
 				n_pipes++;
 			}
 		}
+		igt_require_f(pr_or_psr2_selective_fetch_supported,
+					  "PR/PSR2 selective fetch not supported\n");
 	}
 
 	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a0349fa03..0ab8ea429 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -391,7 +391,7 @@ static void test_cursor(data_t *data)
 	 * necessary, causing the async flip to fail because async flip is not
 	 * supported in cursor plane.
 	 */
-	igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd),
+	igt_skip_on_f(i915_pr_psr2_sel_fetch_to_pr_psr1(data->drm_fd, NULL),
 		      "PSR2 sel fetch causes cursor to be added to primary plane " \
 		      "pages flips and async flip is not supported in cursor\n");
 
@@ -704,7 +704,7 @@ igt_main
 		 * necessary, causing the async flip to fail because async flip is not
 		 * supported in cursor plane.
 		 */
-		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd),
+		igt_skip_on_f(i915_pr_psr2_sel_fetch_to_pr_psr1(data.drm_fd, NULL),
 			      "PSR2 sel fetch causes cursor to be added to primary plane " \
 			      "pages flips and async flip is not supported in cursor\n");
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 0017659d4..f453e2998 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1849,7 +1849,7 @@ igt_main
 		 * page flip with cursor legacy APIS when Intel's PSR2 selective
 		 * fetch is enabled, so switching PSR1 for this whole test.
 		 */
-		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd);
+		intel_psr2_restore = i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
-- 
2.25.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F059C5475B
	for <igt-dev@archiver.kernel.org>; Sun, 18 Feb 2024 09:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B7D10E0C5;
	Sun, 18 Feb 2024 09:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlDKoOGl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E7010E0BB
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Feb 2024 09:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708247259; x=1739783259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MaswoN3g27tU6RbNZbXuHnJFCpa39g/bfU4Uq4lMc7A=;
 b=NlDKoOGlu/opszjFwz67R1s/2wMtxEv+2h3DNY0IYjgRxNI3Z9H/Bhp6
 xZ7zz9BognCMUdkyPVtKk7q1Zb53HBCom5KHBVpM7SW2JfGmtzdhhwDGG
 3xb/yUZzIBvLTpW+0+QMde1NOVjfqn8L5JNz7sCaJJmwQGDJN9wErwZrS
 09OzGZJLdMWjS6USn30BLAPWutch/DvLEFVWmxSNgBF+623Y+dqmyqiAY
 fOkpMRXtvCjz90re1eCHd1PraqhkCq8TzZ9hwUOtomDAajQw1JthF0aSl
 xJlyfZqlHURND464buyvIpcIQz/FXaCoTYfF70mv1CYrzFfe7MhYXpR1n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="12885285"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; d="scan'208";a="12885285"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2024 01:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4281657"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 01:07:37 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_psr: add support for PR selective update
Date: Sun, 18 Feb 2024 14:47:03 +0530
Message-Id: <20240218091704.2259937-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240218091704.2259937-1-kunal1.joshi@intel.com>
References: <20240218091704.2259937-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Extend the tests to cover panel replay selective fetch feature.

From kms_psr2_sf test point of view we have check_pr_psr2_sel_fetch_support
function to check if PR/PSR2 selective fetch is supported for an output
if output supports selective fetch then we check we enter DEEP_SLEEP mode
in run function

v2: fixed dynamic test name
v3: use check_psr2_support (Jouni)
v4: split patches (Jouni)

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c             | 36 ++++++++++++++++++++++++++----------
 lib/igt_psr.h             |  6 +++---
 tests/kms_cursor_legacy.c |  4 ++--
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index cad8cce05..9accd2047 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -41,7 +41,7 @@ bool psr_disabled_check(int debugfs_fd)
 	return strstr(buf, "PSR mode: disabled\n");
 }
 
-bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t *output)
+bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
 {
 	char buf[PSR_STATUS_MAX_LEN];
 	char debugfs_file[128] = {0};
@@ -248,7 +248,9 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       (strstr(line, "PSR = yes") &&
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
 	case PR_MODE:
-		return strstr(line, "Panel Replay = yes");
+		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
+	case PR_MODE_SEL_FETCH:
+		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
 	default:
 		igt_assert_f(false, "Invalid psr mode\n");
 		return false;
@@ -317,7 +319,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output)
 		return false;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	ret = psr2_selective_fetch_check(debugfs_fd, output);
+	ret = selective_fetch_check(debugfs_fd, output);
 	close(debugfs_fd);
 
 	return ret;
@@ -334,17 +336,24 @@ bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output)
  * Returns:
  * True if PSR mode changed to PSR1, false otherwise.
  */
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output)
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t *output)
 {
 	int debugfs_fd;
 	bool ret = false;
+	enum psr_mode mode;
 
 	if (!is_intel_device(drm_fd))
 		return ret;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	if (psr2_selective_fetch_check(debugfs_fd, output)) {
-		psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
+	if (selective_fetch_check(debugfs_fd, output)) {
+		mode = psr_get_mode(debugfs_fd, output);
+		if (mode == PR_MODE_SEL_FETCH)
+			psr_set(drm_fd, debugfs_fd, PR_MODE, output);
+		else if (mode == PSR_MODE_2_SEL_FETCH)
+			psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
+		else
+			igt_assert("switch not possible from current psr mode\n");
 		ret = true;
 	}
 
@@ -358,12 +367,17 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output)
  * Restore PSR2 selective fetch after tests were executed, this function should
  * only be called if i915_psr2_sel_fetch_to_psr1() returned true.
  */
-void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output)
+void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output)
 {
 	int debugfs_fd;
+	enum psr_mode mode;
 
 	debugfs_fd = igt_debugfs_dir(drm_fd);
-	psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
+	mode = psr_get_mode(debugfs_fd, output);
+	if (mode == PR_MODE)
+		psr_set(drm_fd, debugfs_fd, PR_MODE_SEL_FETCH, output);
+	else
+		psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
 	close(debugfs_fd);
 }
 
@@ -389,11 +403,13 @@ enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
 
 	if (strstr(buf, "Panel Replay Enabled"))
 		return PR_MODE;
+	else if (strstr(buf, "Panel Replay Selective Update Enabled"))
+		return PR_MODE_SEL_FETCH;
 	else if (strstr(buf, "PSR2 selective fetch: enabled"))
 		return PSR_MODE_2_SEL_FETCH;
-	else if (strstr(buf, "PSR2 enabled"))
+	else if (strstr(buf, "PSR2"))
 		return PSR_MODE_2;
-	else if (strstr(buf, "PSR1 enabled"))
+	else if (strstr(buf, "PSR1"))
 		return PSR_MODE_1;
 
 	return PSR_DISABLED;
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 372bef2b2..36ba7f068 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -46,7 +46,7 @@ enum fbc_mode {
 };
 
 bool psr_disabled_check(int debugfs_fd);
-bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t *output);
+bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
@@ -59,8 +59,8 @@ enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output);
 
 bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t *output);
 
-bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output);
-void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output);
+bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t *output);
+void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output);
 bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
 
 #endif
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index a430f735a..91e5e9b07 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1849,7 +1849,7 @@ igt_main
 		 * page flip with cursor legacy APIS when Intel's PSR2 selective
 		 * fetch is enabled, so switching PSR1 for this whole test.
 		 */
-		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
+		intel_psr2_restore = i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
@@ -2074,7 +2074,7 @@ igt_main
 
 	igt_fixture {
 		if (intel_psr2_restore)
-			i915_psr2_sel_fetch_restore(display.drm_fd, NULL);
+			i915_pr_psr2_sel_fetch_restore(display.drm_fd, NULL);
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
 	}
-- 
2.25.1


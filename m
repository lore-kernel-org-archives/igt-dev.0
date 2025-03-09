Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F39AC282D1
	for <igt-dev@archiver.kernel.org>; Sun,  9 Mar 2025 10:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B32910E353;
	Sun,  9 Mar 2025 10:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i6Oz2XBN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1AF10E353
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Mar 2025 10:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741516118; x=1773052118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=boaQyAsaH7TmNaMgG8CkO3bIYcTGyks5FCArOJmGEMw=;
 b=i6Oz2XBN7EnHqSPK+gI80q6N7EdJMxQTgqUhLiGCesLNz3LSh+Se2io+
 I+abTG1vDhz9mDpgNjyE6emMspxqahvA2Tl0IOhqImucXvMN/8ewfBNPu
 yh6+mBYLQrA/Cw+uYlLtRxVdda+gALFier260pWKgpnlexsDl0E55VDge
 Yk8ic22vl9WA9cT5uY58d+KJgxeyIz3dSiCGhtbhqr89LQlToJuykDcfn
 +YvT8s5ecHvffdH8PXM2cUS2j8RGmS4K5/lJikgjoHM6XnyHFgHR5bibF
 rdydG2K3cbQ0yk6PgfGEdkaQ99pvXyZhPnpMDDfh9H6sNfoaKlMHtTJ0c A==;
X-CSE-ConnectionGUID: bhPST+iUR7WkXyh88OYdag==
X-CSE-MsgGUID: Bt/kYOjIRTexJv1fv4MQfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="53901188"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; d="scan'208";a="53901188"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 03:28:37 -0700
X-CSE-ConnectionGUID: Mt0mqIcCR9uSL7sHG6PAxQ==
X-CSE-MsgGUID: E/qfCbvURWexaD1OKPRXoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124981226"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by orviesa005.jf.intel.com with ESMTP; 09 Mar 2025 03:28:37 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_pm_dc: Remove PkgC dependecy to
 validate deep-pkgc test
Date: Sun,  9 Mar 2025 15:58:33 +0530
Message-ID: <20250309102833.56309-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309100301.41405-1-mohammed.thasleem@intel.com>
References: <20250309100301.41405-1-mohammed.thasleem@intel.com>
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

PkgC counter was removed from MTL onwards, so an alternative counter was
used to validate deep pkgC tests. With the new KMD changes, a dedicated DC6
debugfs entry counter has been created to validate these tests,
allowing for the removal of the existing alternative counter code.

v2: Updated igt_describe and discription.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index b4f30a37d..ed24a24b8 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -78,7 +78,8 @@
  * Description: This test validates display engine entry to DC9 state
  *
  * SUBTEST: deep-pkgc
- * Description: This test validates display engine entry to PKGC10 state for extended vblank
+ * Description: This test validates display engine entry to deep pkgc by
+ *              checking dc6 entry for extended vblank
  * Functionality: pm_dc
  *
  * SUBTEST: dc5-retention-flops
@@ -617,22 +618,7 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
-static unsigned int read_pkgc_counter(int debugfs_root_fd)
-{
-	char buf[4096];
-	char *str;
-	int len;
-
-	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
-	igt_skip_on_f(len < 0, "PKGC state file not found\n");
-	buf[len] = '\0';
-	str = strstr(buf, "Package C10");
-	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
-
-	return get_dc_counter(str);
-}
-
-static void test_deep_pkgc_state(data_t *data)
+static void test_deep_pkgc_state(data_t *data, int dc_target)
 {
 	unsigned int pre_val = 0, cur_val = 0;
 	time_t start = time(NULL);
@@ -694,7 +680,7 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_display_commit(&data->display);
 	/* Wait for the vblank to sync the frame time */
 	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
-	pre_val = read_pkgc_counter(data->debugfs_root_fd);
+	pre_val = read_dc_counter(data->debugfs_fd, dc_target);
 	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
 	usleep(delay * 0.5);
 
@@ -703,8 +689,8 @@ static void test_deep_pkgc_state(data_t *data)
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
 
-		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
-						      (delay * 2), (5 * MSEC));
+		igt_wait((cur_val = read_dc_counter(data->debugfs_fd, dc_target)) > pre_val,
+						    (delay * 2), (5 * MSEC));
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
 			break;
@@ -712,7 +698,7 @@ static void test_deep_pkgc_state(data_t *data)
 	}
 
 	cleanup_dc3co_fbs(data);
-	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
+	igt_assert_f(pkgc_flag, "Deep pkgc state is not achieved.\n");
 }
 
 static void kms_poll_state_restore(int sig)
@@ -781,13 +767,13 @@ igt_main
 		test_dc_state_psr(&data, CHECK_DC6);
 	}
 
-	igt_describe("This test validates display engine entry to PKGC10 state "
-		     "during extended vblank");
+	igt_describe("This test validates display engine entry to deep pkgc by "
+		     "checking dc6 state entry during extended vblank");
 	igt_subtest("deep-pkgc") {
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
 		igt_require(intel_display_ver(data.devid) >= 20);
-		test_deep_pkgc_state(&data);
+		test_deep_pkgc_state(&data, CHECK_DC6);
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
-- 
2.43.0


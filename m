Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F60E7718F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 18:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B8210E580;
	Mon, 30 Dec 2024 18:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUShIHxE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ECA10E580
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 18:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735585101; x=1767121101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0IRH4TLA27saTrSwKZxXi1aXRswaDD/mhGE1bqGhJgw=;
 b=EUShIHxEIJJ/r+OEclL1SkvMeF8XX2TY4TVbGG8VDjmUjqX6mpHfyzjM
 QIW3jUK7OdYloLJJcwCZ0JQqV3TcGPTk57epq/XPsxu5kYzlVyY6vogC7
 p639xoqu/rYKFGPwH3S6DvnPzdlqY0EFDMjnikoE1aXwMWq0HYRXD43XY
 BvNOSmX01EgAnOZNfx3LJ8boT15PGO3NeriruzdNoA36lI5rpXmOyno3z
 fNqJGgSNIxh15LS0eWRYxdVykH+Jy23coYguM6sFKmSS98FgOYacsLD2E
 jfeeXOA8Q+ople8hsM2jxNmkW2OBk92+OCRCxKH7csyNPQvlFsYX1ENE7 g==;
X-CSE-ConnectionGUID: vE3B4JZ3QJWmG8qyFglFrA==
X-CSE-MsgGUID: jnKizNFYRWW2aWaZyk0Fsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39803545"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="39803545"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:21 -0800
X-CSE-ConnectionGUID: ESXxRSi1SI2Xw4Jevdl6VA==
X-CSE-MsgGUID: AVVzI6jIR5SeRMbLIVdY5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="100728931"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:19 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 6/6] tests/intel/kms_cdclk: Add get_max_cdclk_freq()
Date: Tue, 31 Dec 2024 00:33:15 +0530
Message-Id: <20241230190315.48821-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241230190315.48821-1-swati2.sharma@intel.com>
References: <20241230190315.48821-1-swati2.sharma@intel.com>
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

Replace hardcoded max cdclk freq with one computed from debugfs.
Also, add same condition for all_outputs subtest.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index fcbfa3f37..2ea805b94 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -53,7 +53,6 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
 #define HDISPLAY_4K	3840
 #define VDISPLAY_4K	2160
 #define VREFRESH	60
-#define MAX_CDCLK_4K	307200
 
 /* Test flags */
 enum {
@@ -104,6 +103,34 @@ static int get_current_cdclk_freq(int debugfs_fd)
 	return cdclk_freq_current;
 }
 
+static int get_max_cdclk_freq(int debugfs_fd)
+{
+	int cdclk_freq_max;
+	char buf[1024];
+	char *start_loc;
+	int res;
+
+	/*
+	 * Display specific clock frequency info is moved to i915_cdclk_info,
+	 * On older kernels if this debugfs is not found, fallback to read from
+	 * i915_frequency_info.
+	 *
+	 * FIXME: As of now, XE debugfs is still using i915 namespace, once the
+	 * Kernel changes are landed, update this to use the XE specific debugfs.
+	 */
+	res = igt_debugfs_simple_read(debugfs_fd, "i915_cdclk_info",
+				      buf, sizeof(buf));
+	if (res <= 0)
+		res = igt_debugfs_simple_read(debugfs_fd, "i915_frequency_info",
+					      buf, sizeof(buf));
+	igt_require(res > 0);
+
+	igt_assert(start_loc = strstr(buf, "Max CD clock frequency: "));
+	igt_assert_eq(sscanf(start_loc, "Max CD clock frequency: %d", &cdclk_freq_max), 1);
+
+	return cdclk_freq_max;
+}
+
 static __u64 get_mode_data_rate(drmModeModeInfo *mode)
 {
 	__u64 data_rate = (__u64)mode->hdisplay * (__u64)mode->vdisplay * (__u64)mode->vrefresh;
@@ -250,7 +277,7 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 	/* cdclk should bump */
-	if (cdclk_new != MAX_CDCLK_4K)
+	if (cdclk_new != get_max_cdclk_freq(debugfs_fd))
 		igt_assert_lt(cdclk_ref, cdclk_new);
 
 	/* cleanup */
@@ -348,7 +375,8 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 	/* cdclk should bump */
-	igt_assert_lt(cdclk_ref, cdclk_new);
+	if (cdclk_new != get_max_cdclk_freq(debugfs_fd))
+		igt_assert_lt(cdclk_ref, cdclk_new);
 
 	do_cleanup_display(display);
 	igt_remove_fb(data->drm_fd, &fb);
-- 
2.25.1


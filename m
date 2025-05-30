Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721D8C5B549
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 07:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C8C10E7C3;
	Fri, 30 May 2025 07:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qv1caOgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA2010E7CA
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748591692; x=1780127692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d6+J6OYRTETHzgxFqY0AfrYtI2ZXIZ7nGgFlq3SsplU=;
 b=Qv1caOgrhLUjW4GF9qP1Xl4Nvq+5z4Xte1TxtffE8e1VxsjYF0Iy/yjn
 OamjFbgPwoSt6E3p9nzXfZSTX2igQ4U6dhZGVgcb4dHMBd5fBDDVI3ftL
 Pl7RR5OnqBhJXDQw5fZcUxKA6qFpfmWS5AEHC5hAYnnhbbyzJ+5zIo8PL
 MKPPQ/n9zWKCTTAE3vKDZ4fnoWIZYXxqxuAEb0oOl2NRaQLSNkAcN3a1f
 cAb4hxzNpJ/GjBXy9KGpxphNEp+JqLkTmh+pjluxgWNh9/iXJJ8HC5VXe
 +DFxbe7DACzryIRjDhcbKrVieCe5IdKFAHSHlwizKnB1c0sEevYACRBzW Q==;
X-CSE-ConnectionGUID: KxnftmOuT76jKOIdMJz5jA==
X-CSE-MsgGUID: 4bL0NatOSWesEunvnQyPRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="76068454"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="76068454"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 00:54:51 -0700
X-CSE-ConnectionGUID: tVeJmfcIRXGbZEL5SN4YcQ==
X-CSE-MsgGUID: bIH+owsOR6Or0fvMfKOLFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="144787242"
Received: from linux-lunar-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa009.fm.intel.com with ESMTP; 30 May 2025 00:54:50 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 2/2] tests/intel/kms_frontbuffer_tracking: Enable the tests
 support variations based on the WAs
Date: Fri, 30 May 2025 13:28:11 +0530
Message-Id: <20250530075811.1033-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530075811.1033-1-mohammed.thasleem@intel.com>
References: <20250530075811.1033-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

v2: Use WA_FBC_DISABLED instead CHECK_WA. (Vinod)
    Update igt_skip_on_f discription. (Vinod)
v3: Remove platform check and make it for xe specific. (Vinod)
    Rename function name with is_fbc_support. (Vinod)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0809352cb..fd35cbd88 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -781,6 +781,7 @@
  */
 
 #define TIME SLOW_QUICK(1000, 10000)
+#define WA_FBC_DISABLED "16023588340"
 
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
 		     "its related features: FBC, PSR and DRRS");
@@ -2248,6 +2249,20 @@ static void do_flush(const struct test_mode *t)
 
 #define ASSERT_NO_IDLE_GPU		(1 << 11)
 
+static void is_fbc_support(int devid, const struct test_mode *t)
+{
+	int wa;
+
+	if (t->feature != FEATURE_FBC)
+		return;
+
+	wa = igt_has_intel_wa(drm.fd, WA_FBC_DISABLED);
+
+	igt_assert_f(wa >= 0, "WA path not found on GTs\n");
+
+	igt_skip_on_f(wa == 1, "WA has disabled FBC\n");
+}
+
 static int adjust_assertion_flags(const struct test_mode *t, int flags)
 {
 	if (!(flags & DONT_ASSERT_FEATURE_STATUS)) {
@@ -2610,8 +2625,7 @@ static void prepare_subtest_data(const struct test_mode *t,
 static void prepare_subtest_screens(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
-		      "FBC isn't supported on BMG\n");
+	is_fbc_support(drm.devid, t);
 
 	if (t->pipes == PIPE_DUAL)
 		enable_both_screens_and_wait(t);
@@ -2658,8 +2672,7 @@ static void prepare_subtest(const struct test_mode *t,
 static void rte_subtest(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
-		      "FBC isn't supported on BMG\n");
+	is_fbc_support(drm.devid, t);
 
 	prepare_subtest_data(t, NULL);
 
@@ -4157,8 +4170,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			t.tiling = opt.tiling;
 
 			/* FBC disabled: Wa_16023588340 */
-			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
-				      "FBC isn't supported on BMG\n");
+			is_fbc_support(drm.devid, &t);
 
 			for_each_pipe(&drm.display, pipe) {
 				if (pipe == default_pipe) {
-- 
2.34.1


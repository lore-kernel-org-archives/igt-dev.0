Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E84C5479B
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 12:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E1910E3B2;
	Mon, 19 May 2025 12:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amtm5zxx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336AB10E3B6
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747657930; x=1779193930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M3YizZ4fLjKI0e4IgSY+WDsmjg51cRILUlByAYO3coU=;
 b=amtm5zxxvN4V798dMBZOyBunS5Jjdkeqq1lhOFlUfd7U87fyLuTkezj5
 3KLmmcpeMYEgQzTbACAf++yLeGpdqJ/rs36FZ1LiTD6X5URmEAyDkidi3
 gj4YJ0qz0GgDw49n4YLTig0E4uOewVYWzgvRvG38opoaIzBhqR5LORVWg
 5BqV2vNwvVLkDLgOqHVjI0dAcr8qW8O8RgYIGkt8MpfTRk1Sq0l+bUhJL
 7HQ2fMOuUrPvgdL5O6AKhRyJL+S0Os2+RDfn0VhQBoglUYBqCpm8bMZML
 8yHYH0LiL6Ja3VI4KUPfTjshDeIOyfzy2OsA+yY/U2ZoYupBYeBtoKvzo A==;
X-CSE-ConnectionGUID: +3LfzcFDQH6yVGo5LOWhDA==
X-CSE-MsgGUID: 3T5inPzZS5+2NIw755kigQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710020"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49710020"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 05:32:10 -0700
X-CSE-ConnectionGUID: Q32QsXsQT8SR3oozozNiSA==
X-CSE-MsgGUID: D4oLfx/AQ1yRFFXiJR5/bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="144358208"
Received: from unknown (HELO thasleem.iind.intel.com) ([10.190.216.203])
 by orviesa004.jf.intel.com with ESMTP; 19 May 2025 05:32:09 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 2/2] tests/intel/kms_frontbuffer_tracking: Enable the tests
 support variations based on the WAs
Date: Mon, 19 May 2025 18:01:35 +0530
Message-ID: <20250519123135.1307174-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519123135.1307174-1-mohammed.thasleem@intel.com>
References: <20250519123135.1307174-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs

v2: Use WA_FBC_DISABLED instead CHECK_WA. (Vinod)
    Update igt_skip_on_f discription. (Vinod)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0809352cb..aebee7048 100644
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
 
+static void check_fbc_support(int devid, const struct test_mode *t)
+{
+	int wa;
+
+	if (IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC) {
+		wa = igt_has_intel_wa(drm.fd, WA_FBC_DISABLED);
+
+		if (wa == 1)
+			igt_skip("WA has disabled FBC on BMG\n");
+		else if (wa == -1)
+			igt_assert_f(wa >= 0, "WA path not found on GTs\n");
+	}
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
+	check_fbc_support(drm.devid, t);
 
 	if (t->pipes == PIPE_DUAL)
 		enable_both_screens_and_wait(t);
@@ -2658,8 +2672,7 @@ static void prepare_subtest(const struct test_mode *t,
 static void rte_subtest(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
-		      "FBC isn't supported on BMG\n");
+	check_fbc_support(drm.devid, t);
 
 	prepare_subtest_data(t, NULL);
 
@@ -4157,8 +4170,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			t.tiling = opt.tiling;
 
 			/* FBC disabled: Wa_16023588340 */
-			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
-				      "FBC isn't supported on BMG\n");
+			check_fbc_support(drm.devid, &t);
 
 			for_each_pipe(&drm.display, pipe) {
 				if (pipe == default_pipe) {
-- 
2.34.1


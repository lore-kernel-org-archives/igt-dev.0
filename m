Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B66E7719E
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 07:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524B910E44F;
	Sat,  4 Jan 2025 07:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ER534fBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F3010E102
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 07:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735974963; x=1767510963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nQFHXlXi0Kxoqo2PtOWxVhm/06zPn9L9OLPIIFIIejw=;
 b=ER534fBklPbFM2zqbBZxgCK/ZrMkk0Qrc/JWFc25hFUjy9XlMx9pM6k9
 EU+pcetAVM6+BEGeTv2mEi2N7qot2BCaGNoLPqMo/LOxhbPdsJfwiRu9n
 um7sP1+zYGpHH+BAxOdceceQRlLJROqEJonil89HH9yLAaDJSaIRQ7leS
 DYpLZkqg+6yP9vYKGRJyQm3rQAfCpxaZOM2vWUGyqvFonMNCvyfnyK+PI
 hMDdSGtopyKltu0fuNERaJrpJ3tTkbl11kJEwTb0zubICvpMoBCuFWmDf
 PCBFqiGB838wi6fpX/n0vyb1xkQs3dBZpKiGHQDNfr8FMWct0FxnFirnX w==;
X-CSE-ConnectionGUID: Eoqj/wFHTBO6vEK98iSF0w==
X-CSE-MsgGUID: dv1tS64fR4yKEb2NdQEBtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46878992"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="46878992"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
X-CSE-ConnectionGUID: Uk2glkCFShOSFN95tJeH9g==
X-CSE-MsgGUID: yL5dpT7NRCKghgvxCJ/How==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="101761993"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 4/8] lib/xe: Rename xe_is_gt_in_c6()
Date: Fri,  3 Jan 2025 23:15:44 -0800
Message-ID: <20250104071548.737612-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250104071548.737612-1-lucas.demarchi@intel.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
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

Use xe_gt_ as namespace.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_gt.c                |  4 ++--
 lib/xe/xe_gt.h                |  2 +-
 tests/intel/xe_gt_freq.c      | 12 ++++++------
 tests/intel/xe_pm_residency.c |  8 ++++----
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index e1f353b41..6f1475be0 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -176,13 +176,13 @@ int xe_gt_stats_get_count(int fd, int gt, const char *stat)
 }
 
 /**
- * xe_is_gt_in_c6:
+ * xe_gt_is_in_c6:
  * @fd: pointer to xe drm fd
  * @gt: gt number
  *
  * Check if GT is in C6 state
  */
-bool xe_is_gt_in_c6(int fd, int gt)
+bool xe_gt_is_in_c6(int fd, int gt)
 {
 	char gt_c_state[16];
 	int gt_fd;
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index 47569cec3..511b31149 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -17,7 +17,7 @@ igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
 void xe_post_hang_ring(int fd, igt_hang_t arg);
 int xe_gt_stats_get_count(int fd, int gt, const char *stat);
 
-bool xe_is_gt_in_c6(int fd, int gt);
+bool xe_gt_is_in_c6(int fd, int gt);
 
 int xe_gt_fill_engines_by_class(int fd, int gt, int class,
 				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 5d806cf15..2ece2e6f4 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -200,7 +200,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 
 	if (gt_idle) {
 		/* Wait for GT to go in C6 as previous get_freq wakes up GT*/
-		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -215,7 +215,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -234,7 +234,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rp0);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(get_freq(fd, gt_id, "act") == 0);
 	}
@@ -265,7 +265,7 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
 	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -466,7 +466,7 @@ igt_main
 
 	igt_subtest("freq_fixed_idle") {
 		xe_for_each_gt(fd, gt) {
-			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
+			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
 				      "GT %d should be in C6\n", gt);
 			test_freq_fixed(fd, gt, true);
 		}
@@ -484,7 +484,7 @@ igt_main
 
 	igt_subtest("freq_range_idle") {
 		xe_for_each_gt(fd, gt) {
-			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
+			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
 				      "GT %d should be in C6\n", gt);
 			test_freq_range(fd, gt, true);
 		}
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 18e5cb6c3..0b48a1c79 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -210,7 +210,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 {
 	unsigned long elapsed_ms, residency_start, residency_end;
 
-	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
+	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
 
 	if (flag == TEST_S2IDLE) {
 		/*
@@ -300,7 +300,7 @@ static void toggle_gt_c6(int fd, int n)
 		igt_assert_lte(0, fw_handle);
 		/* check if all gts are in C0 after forcewake is acquired */
 		xe_for_each_gt(fd, gt)
-			igt_assert_f(!xe_is_gt_in_c6(fd, gt),
+			igt_assert_f(!xe_gt_is_in_c6(fd, gt),
 				     "Forcewake acquired, GT %d should be in C0\n", gt);
 
 		if (n == NUM_REPS)
@@ -309,7 +309,7 @@ static void toggle_gt_c6(int fd, int n)
 		close(fw_handle);
 		/* check if all gts are in C6 after forcewake is released */
 		xe_for_each_gt(fd, gt)
-			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
+			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
 				     "Forcewake released, GT %d should be in C6\n", gt);
 
 		if (n == NUM_REPS)
@@ -406,7 +406,7 @@ igt_main
 	igt_subtest_with_dynamic("gt-c6-on-idle") {
 		xe_for_each_gt(fd, gt)
 			igt_dynamic_f("gt%u", gt)
-				igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
+				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
 					     "GT %d not in C6\n", gt);
 	}
 
-- 
2.47.0


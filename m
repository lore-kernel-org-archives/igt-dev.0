Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E162DE77199
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F96310E7A1;
	Tue,  7 Jan 2025 20:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPYrmRTT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A17A10E31D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736281685; x=1767817685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/pbHShNdVZCPTZBLiAoSzYXcYWsXyYaf8n+1oKI8sG8=;
 b=MPYrmRTT9v4QACkjaY/AVqmUDiPCrOGkij5VzwYBwo23HQAyKp5bOA/z
 H+Umuluj6O9sVp0iOeYy0wUcH7orKgFRYFVWUhxeiHgK3id8R6YT8DFx9
 tMVoxbhb8C/McYdHnbhg1CJw6ySi4STspORdvR7NMABBmV6lk6VLhPnua
 rHycpATtU3kvCkoCF3QPMFQWpXla9HU3neDXWnRNllwrci24om6PPx3Uv
 sTB6r0ZquDzJGFHrvR6I8gqRAy2yZBhWqtrhi2ybj9SHO21TRS/M6/Jy2
 FgHD12lCeP2XG8h1nHU6TDuJqM0yosoB/C/EB4sMKw9BfiIavmIgAgQvB Q==;
X-CSE-ConnectionGUID: p6kzEAdCStSw+lA/UjtJzA==
X-CSE-MsgGUID: 9KeiE3YvQf258BY8Auyc2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="39309010"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="39309010"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:05 -0800
X-CSE-ConnectionGUID: qwW7sZXETV6iSnJyAjxeoA==
X-CSE-MsgGUID: /BoPmIK2TTC0Tc65eQb08g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="133725680"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 3/8] lib/xe: Rename xe_is_gt_in_c6()
Date: Tue,  7 Jan 2025 12:26:10 -0800
Message-ID: <20250107202615.1306306-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250107202615.1306306-1-lucas.demarchi@intel.com>
References: <20250107202615.1306306-1-lucas.demarchi@intel.com>
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

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
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
index a4791071f..1fb6d2b53 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -199,7 +199,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 
 	if (gt_idle) {
 		/* Wait for GT to go in C6 as previous get_freq wakes up GT*/
-		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -214,7 +214,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -233,7 +233,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rp0);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(get_freq(fd, gt_id, "act") == 0);
 	}
@@ -264,7 +264,7 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
 	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -465,7 +465,7 @@ igt_main
 
 	igt_subtest("freq_fixed_idle") {
 		xe_for_each_gt(fd, gt) {
-			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
+			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
 				      "GT %d should be in C6\n", gt);
 			test_freq_fixed(fd, gt, true);
 		}
@@ -483,7 +483,7 @@ igt_main
 
 	igt_subtest("freq_range_idle") {
 		xe_for_each_gt(fd, gt) {
-			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
+			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
 				      "GT %d should be in C6\n", gt);
 			test_freq_range(fd, gt, true);
 		}
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 8a9e2c89e..06f4a0bc6 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -209,7 +209,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 {
 	unsigned long elapsed_ms, residency_start, residency_end;
 
-	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
+	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
 
 	if (flag == TEST_S2IDLE) {
 		/*
@@ -299,7 +299,7 @@ static void toggle_gt_c6(int fd, int n)
 		igt_assert_lte(0, fw_handle);
 		/* check if all gts are in C0 after forcewake is acquired */
 		xe_for_each_gt(fd, gt)
-			igt_assert_f(!xe_is_gt_in_c6(fd, gt),
+			igt_assert_f(!xe_gt_is_in_c6(fd, gt),
 				     "Forcewake acquired, GT %d should be in C0\n", gt);
 
 		if (n == NUM_REPS)
@@ -308,7 +308,7 @@ static void toggle_gt_c6(int fd, int n)
 		close(fw_handle);
 		/* check if all gts are in C6 after forcewake is released */
 		xe_for_each_gt(fd, gt)
-			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
+			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
 				     "Forcewake released, GT %d should be in C6\n", gt);
 
 		if (n == NUM_REPS)
@@ -405,7 +405,7 @@ igt_main
 	igt_subtest_with_dynamic("gt-c6-on-idle") {
 		xe_for_each_gt(fd, gt)
 			igt_dynamic_f("gt%u", gt)
-				igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
+				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
 					     "GT %d not in C6\n", gt);
 	}
 
-- 
2.47.0


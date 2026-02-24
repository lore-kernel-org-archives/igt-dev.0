Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D93CF4BB8B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 21:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F287210E61D;
	Tue, 24 Feb 2026 21:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhblYxXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FBF10E61D
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 21:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771967781; x=1803503781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ehxixySiuaGfpXhq+GfBtqEi920CqiNR2y4SEAFU5MM=;
 b=XhblYxXAPt5k5Zg/4ouqbbkjdr1klB7QaoZ7qMtuuZNl90It55IROUlH
 SgWJbPix4NQilYQRzvWYwvRoANUDvLxv3PLmhsDsBSXKgJUAqAAmBuT9H
 TI2K5stfRklfOLzKOVDI35YZuVkiPqx1oNCIb61TTnornQZurBuknEgnI
 MnuRDjUJbOfzHAUz7KAWC9S+r5U5Wm7LM3/Chs0iYa4uBimUb7RDJ/U6S
 gyhb+FDbynyODdITR3lpPkUA8Nhj5zx8Ae7T44QqKBx711fMCD1h2by/R
 C6bbpWFj/qRQ9CSSoBBXxIAenFDMw3Kjh0fkNBwhuHsTcxID7rq8vHfdu w==;
X-CSE-ConnectionGUID: LI5Ms47UTG2LFfcM1geTqA==
X-CSE-MsgGUID: zWX9QZt5Q5OADPiVGaEEAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83618823"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="83618823"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 13:16:21 -0800
X-CSE-ConnectionGUID: 1P+kczxYRaud7RAL4H0IJg==
X-CSE-MsgGUID: qnpWhDEiQMOb5OA3cY7egQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="246587312"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 13:16:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] xe_exec_balancer: Report skip when test is unable to run
Date: Tue, 24 Feb 2026 13:16:13 -0800
Message-ID: <20260224211612.2944788-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
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

The xe_exec_balancer tests require two engines of the same class to be
able to execute.  Many Intel platforms today do not have two engines of
any class so the test bails out and does not do anything, however it
returns a 'pass' result in this case which is misleading since the test
was unable to exercise the relevant kernel/hardware functionality.
Adjust the subtests to track whether they found engines capable of
performing the testing; if not, return a 'skip' result that more
accurately reflects that nothing was tested.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_exec_balancer.c | 178 +++++++++++++++++++++++----------
 1 file changed, 124 insertions(+), 54 deletions(-)

diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 98e09961e..9cd641b4e 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -32,7 +32,7 @@
  *	of a class simultaneously
  * Test category: functionality test
  */
-static void test_all_active(int fd, int gt, int class)
+static bool test_all_active(int fd, int gt, int class)
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
@@ -58,7 +58,7 @@ static void test_all_active(int fd, int gt, int class)
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
 	if (num_placements < 2)
-		return;
+		return false;
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * num_placements;
@@ -110,6 +110,8 @@ static void test_all_active(int fd, int gt, int class)
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 	xe_vm_destroy(fd, vm);
+
+	return true;
 }
 
 #define MAX_N_EXEC_QUEUES	16
@@ -156,7 +158,7 @@ static void test_all_active(int fd, int gt, int class)
  * @parallel-userptr-invalidate:	parallel userptr invalidate
  * @parallel-userptr-invalidate-race:	parallel userptr invalidate racy
  */
-static void
+static bool
 test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	  unsigned int flags)
 {
@@ -186,7 +188,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
 	if (num_placements < 2)
-		return;
+		return false;
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
@@ -326,6 +328,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		free(data);
 	}
 	xe_vm_destroy(fd, vm);
+
+	return true;
 }
 
 /**
@@ -365,7 +369,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * @parallel-userptr-invalidate-race:	parallel userptr invalidate racy
  */
 
-static void
+static bool
 test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	unsigned int flags)
 {
@@ -399,7 +403,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
 	if (num_placements < 2)
-		return;
+		return false;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
@@ -557,6 +561,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		free(data);
 	}
 	xe_vm_destroy(fd, vm);
+
+	return true;
 }
 
 
@@ -591,76 +597,140 @@ int igt_main()
 	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
-	igt_subtest("virtual-all-active")
-		xe_for_each_gt(fd, gt)
+	igt_subtest("virtual-all-active") {
+		bool has_necessary_engines = false;
+
+		xe_for_each_gt(fd, gt) {
 			xe_for_each_engine_class(class)
-				test_all_active(fd, gt, class);
+				has_necessary_engines |=
+					test_all_active(fd, gt, class);
+		}
+		igt_require(has_necessary_engines);
+	}
 
 	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("once-%s", s->name)
-			xe_for_each_gt(fd, gt)
+		igt_subtest_f("once-%s", s->name) {
+			bool has_necessary_engines = false;
+
+			xe_for_each_gt(fd, gt) {
 				xe_for_each_engine_class(class)
-					test_exec(fd, gt, class, 1, 1,
-						  s->flags);
+					has_necessary_engines |=
+						test_exec(fd, gt, class, 1, 1, s->flags);
+			}
+			igt_require(has_necessary_engines);
+		}
+
+		igt_subtest_f("twice-%s", s->name) {
+			bool has_necessary_engines = false;
 
-		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt) {
 				xe_for_each_engine_class(class)
-					test_exec(fd, gt, class, 1, 2,
-						  s->flags);
+					has_necessary_engines |=
+						test_exec(fd, gt, class, 1, 2, s->flags);
+			}
+			igt_require(has_necessary_engines);
+		}
+
+		igt_subtest_f("many-%s", s->name) {
+			bool has_necessary_engines = false;
 
-		igt_subtest_f("many-%s", s->name)
-			xe_for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt) {
 				xe_for_each_engine_class(class)
-					test_exec(fd, gt, class, 1,
-						  s->flags & (REBIND | INVALIDATE) ?
-						  64 : 1024,
-						  s->flags);
+					has_necessary_engines |=
+						test_exec(fd, gt, class, 1,
+							  s->flags & (REBIND | INVALIDATE) ?
+							  64 : 1024,
+							  s->flags);
+			}
+			igt_require(has_necessary_engines);
+		}
 
-		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_gt(fd, gt)
+		igt_subtest_f("many-execqueues-%s", s->name) {
+			bool has_necessary_engines = false;
+
+			xe_for_each_gt(fd, gt) {
 				xe_for_each_engine_class(class)
-					test_exec(fd, gt, class, 16,
-						  s->flags & (REBIND | INVALIDATE) ?
-						  64 : 1024,
-						  s->flags);
+					has_necessary_engines |=
+						test_exec(fd, gt, class, 16,
+							  s->flags & (REBIND | INVALIDATE) ?
+							  64 : 1024,
+							  s->flags);
+			}
+			igt_require(has_necessary_engines);
+		}
+
+		igt_subtest_f("no-exec-%s", s->name) {
+			bool has_necessary_engines = false;
 
-		igt_subtest_f("no-exec-%s", s->name)
-			xe_for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt) {
 				xe_for_each_engine_class(class)
-					test_exec(fd, gt, class, 1, 0,
-						  s->flags);
+					has_necessary_engines |=
+						test_exec(fd, gt, class, 1, 0,
+							  s->flags);
+			}
+			igt_require(has_necessary_engines);
+		}
 
-		igt_subtest_f("once-cm-%s", s->name)
-			xe_for_each_gt(fd, gt)
+		igt_subtest_f("once-cm-%s", s->name) {
+			bool has_necessary_engines = false;
+
+			xe_for_each_gt(fd, gt) {
 				xe_for_each_engine_class(class)
-					test_cm(fd, gt, class, 1, 1, s->flags);
+					has_necessary_engines |=
+						test_cm(fd, gt, class, 1, 1, s->flags);
+			}
+			igt_require(has_necessary_engines);
+		}
+
+		igt_subtest_f("twice-cm-%s", s->name) {
+			bool has_necessary_engines = false;
 
-		igt_subtest_f("twice-cm-%s", s->name)
-			xe_for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt) {
 				xe_for_each_engine_class(class)
-					test_cm(fd, gt, class, 1, 2, s->flags);
+					has_necessary_engines |=
+						test_cm(fd, gt, class, 1, 2, s->flags);
+			}
+			igt_require(has_necessary_engines);
+		}
+
+		igt_subtest_f("many-cm-%s", s->name) {
+			bool has_necessary_engines = false;
 
-		igt_subtest_f("many-cm-%s", s->name)
-			xe_for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt) {
 				xe_for_each_engine_class(class)
-					test_cm(fd, gt, class, 1,
-						s->flags & (REBIND | INVALIDATE) ?
-						64 : 1024,
-						s->flags);
+					has_necessary_engines |=
+						test_cm(fd, gt, class, 1,
+							s->flags & (REBIND | INVALIDATE) ?
+							64 : 1024,
+							s->flags);
+			}
+			igt_require(has_necessary_engines);
+		}
 
-		igt_subtest_f("many-execqueues-cm-%s", s->name)
-			xe_for_each_gt(fd, gt)
+		igt_subtest_f("many-execqueues-cm-%s", s->name) {
+			bool has_necessary_engines = false;
+
+			xe_for_each_gt(fd, gt) {
 				xe_for_each_engine_class(class)
-					test_cm(fd, gt, class, 16,
-						s->flags & (REBIND | INVALIDATE) ?
-						64 : 1024,
-						s->flags);
+					has_necessary_engines |=
+						test_cm(fd, gt, class, 16,
+							s->flags & (REBIND | INVALIDATE) ?
+							64 : 1024,
+							s->flags);
+			}
+			igt_require(has_necessary_engines);
+		}
+
+		igt_subtest_f("no-exec-cm-%s", s->name) {
+			bool has_necessary_engines = false;
 
-		igt_subtest_f("no-exec-cm-%s", s->name)
-			xe_for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt) {
 				xe_for_each_engine_class(class)
-					test_cm(fd, gt, class, 1, 0, s->flags);
+					has_necessary_engines |=
+						test_cm(fd, gt, class, 1, 0, s->flags);
+			}
+			igt_require(has_necessary_engines);
+		}
 	}
 
 	igt_fixture()
-- 
2.53.0


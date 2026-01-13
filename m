Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525CAD2D11E
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7D110E356;
	Tue, 13 Jan 2026 14:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1wEM7K0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453A410E356
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768315915; x=1799851915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EghVLmrxB3Bg3Ys1vwN79gBLmgSmBzmW0PUrnBWr5ms=;
 b=h1wEM7K0Km1gtiyXqx2Vn+4r+3M/bLaOLRT9faR8Siopsx9uL2z+QizB
 7cOlBbbi/D0p9XR3aPioLJCDUN5JtjLBbd5fs4vOdlTWewvHnc39gfJyL
 t6PjcMvwRlkXrD0UObe/DBGov+IhOJs5gxeda+wPicEB6P2rCKnqOUSGi
 9X+If/4U5S9SDPhMSP9rk6J/nZ/RLcH1bvMYT8DwRlMyJS7c6RFfPV/FZ
 yvld9veUdURuNOpEMFUCbTx/aD4mbhHyRpE77X0ROn20VfhE/6dbrN4F7
 s8nIFw+7MRK0XJ96opeoMwCpYTm5wH8hLmxRhFuKq69aI18Z4/1/Gd5Qn A==;
X-CSE-ConnectionGUID: iRk/MPTmRjGyVvRcUcDZNA==
X-CSE-MsgGUID: uJrrL/T3QGaTAJBQY7z/5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69333354"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69333354"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:51:54 -0800
X-CSE-ConnectionGUID: 7Idps8ZxQfmeMDDX3IDcKw==
X-CSE-MsgGUID: i8LY1k66Q/ywvdbXl5OWjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208866838"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:51:52 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2] tests/intel/xe_exec_basic: Enable dynamic subtest
Date: Tue, 13 Jan 2026 20:23:15 +0530
Message-ID: <20260113145314.331614-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

Sometimes during debugging it is required to execute tests only on
selected engines. Dynamic subtests allows us to filter engines for test
execution.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---

v2: prefix card index for multigpu tests. Otherwise runner complains
    duplicate test execution when a same dynamic test is executed
    parallely on multiple GPUs.

---
 tests/intel/xe_exec_basic.c | 63 ++++++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index b105455f3..5eda766c1 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -349,62 +349,89 @@ int igt_main()
 		fd = drm_open_driver(DRIVER_XE);
 
 	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("once-%s", s->name)
+		igt_subtest_with_dynamic_f("once-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 1, 1, s->flags);
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 1, 1, 1, s->flags);
 
-		igt_subtest_f("twice-%s", s->name)
+		igt_subtest_with_dynamic_f("twice-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 2, 1, s->flags);
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 1, 2, 1, s->flags);
 
-		igt_subtest_f("many-%s", s->name)
+		igt_subtest_with_dynamic_f("many-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1,
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
-		igt_subtest_f("many-execqueues-%s", s->name)
+		igt_subtest_with_dynamic_f("many-execqueues-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 16,
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
-		igt_subtest_f("many-execqueues-many-vm-%s", s->name)
+		igt_subtest_with_dynamic_f("many-execqueues-many-vm-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 16,
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 16,
 					  s->flags);
 
-		igt_subtest_f("no-exec-%s", s->name)
+		igt_subtest_with_dynamic_f("no-exec-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 0, 1, s->flags);
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 1, 0, 1, s->flags);
 	}
 
 	igt_fixture()
 		drm_close_driver(fd);
 
 	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("multigpu-once-%s", s->name) {
+		igt_subtest_with_dynamic_f("multigpu-once-%s", s->name) {
 			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
 				xe_for_each_engine(gpu_fd, hwe)
-					test_exec(gpu_fd, hwe, 1, 1, 1, s->flags);
+					igt_dynamic_f("card%d-%s%d", gpu_idx,
+						      xe_engine_class_short_string(hwe->engine_class),
+						      hwe->engine_instance)
+						test_exec(gpu_fd, hwe, 1, 1, 1, s->flags);
 			igt_waitchildren();
 		}
 
-		igt_subtest_f("multigpu-many-execqueues-many-vm-%s", s->name) {
+		igt_subtest_with_dynamic_f("multigpu-many-execqueues-many-vm-%s", s->name) {
 			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
 				xe_for_each_engine(gpu_fd, hwe)
-					test_exec(gpu_fd, hwe, 16, 32, 16, s->flags);
+					igt_dynamic_f("card%d-%s%d", gpu_idx,
+						      xe_engine_class_short_string(hwe->engine_class),
+						      hwe->engine_instance)
+						test_exec(gpu_fd, hwe, 16, 32, 16, s->flags);
 			igt_waitchildren();
 		}
 
-		igt_subtest_f("multigpu-no-exec-%s", s->name) {
+		igt_subtest_with_dynamic_f("multigpu-no-exec-%s", s->name) {
 			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
 				xe_for_each_engine(gpu_fd, hwe)
-					test_exec(gpu_fd, hwe, 1, 0, 1, s->flags);
+					igt_dynamic_f("card%d-%s%d", gpu_idx,
+						      xe_engine_class_short_string(hwe->engine_class),
+						      hwe->engine_instance)
+						test_exec(gpu_fd, hwe, 1, 0, 1, s->flags);
 			igt_waitchildren();
 		}
 	}
-- 
2.43.0


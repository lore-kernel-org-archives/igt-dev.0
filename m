Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B845C9EC90
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 14:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67F510E0FC;
	Mon, 12 Jan 2026 14:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPhL4hyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2C610E0FC
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768226401; x=1799762401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LDeg4iYQ1XrmpN8n2No9UyXg4yK3OvQl9uTYA8GAHhQ=;
 b=dPhL4hyhzxC922AydULNFH7JZD7GT8+ix/J92/FjS2roUkFT3t0x20a1
 RWbnObKimVUUjE67QMp4TNFRo2Zd1S5FvyO008uggZveOCYxS5UOqdoMw
 pBKSsupsw8qpwpSQudF/83qtIFTJ2FSkk/niuEbMIoaQuhXfhFYrecyoU
 j0RBHAlS/VGpO5fDpAz+2E4Bhq8tK/9lXOCo5eSbLIZJu9vUGscBZR36s
 bo2Btm9dgzdqTjB93jdwNrLEoMdMzBbav4NJd7sFA9gmBk7VVCw1sWcJg
 eQ5vYcyCqvFoJabuzr/4qN5SK8X1fSlPunivVb4nkeSyMwkpwC+4hn4OX g==;
X-CSE-ConnectionGUID: +AZdUZmpT+iWSUMHqeyO/A==
X-CSE-MsgGUID: 5sgjHx4wQ0qhhiui7R7bCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87083999"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="87083999"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 06:00:01 -0800
X-CSE-ConnectionGUID: 91m0gNbeRkyeIOAanNpbAg==
X-CSE-MsgGUID: 3T0KmEyKT1W8zxD+B9JVfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="234790440"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:59:59 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] tests/intel/xe_exec_basic: Enable dynamic subtest
Date: Mon, 12 Jan 2026 19:31:38 +0530
Message-ID: <20260112140137.311483-2-balasubramani.vivekanandan@intel.com>
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
 tests/intel/xe_exec_basic.c | 63 ++++++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index b105455f3..666c4f12f 100644
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
+					igt_dynamic_f("%s%d",
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
+					igt_dynamic_f("%s%d",
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
+					igt_dynamic_f("%s%d",
+						      xe_engine_class_short_string(hwe->engine_class),
+						      hwe->engine_instance)
+						test_exec(gpu_fd, hwe, 1, 0, 1, s->flags);
 			igt_waitchildren();
 		}
 	}
-- 
2.43.0


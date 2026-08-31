Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FEEC61DD3
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 17:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125EB10EA0C;
	Mon, 31 Aug 2026 17:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOduKoCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF6910E620
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788198924; x=1819734924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HlYBxcFxlRIL1qd/L5hw0Nh8luLBeXJ0O5dUEepTVqI=;
 b=KOduKoCrYTf33y/XeA5AdqDZeOZJxCH5CZMiw/O5SaU2iAJctLLOag99
 MJ5eHe6fb3iaPId6HruJ10+zcyYlRSnvF5PohPyJnWvftnPAajVSSrJ9F
 d4HC2IE4gd/fL3mI8M7DGoxmhhKm71c6C4ekPZ+0wwnwX6NfycJZfM7re
 AI9w3KD8XCMfMLnfwi2wGllsZJhEqSbyUhGLrb0l2P4S/7JvCpYI9Mniy
 f3KTGfun+FQ7QbieCbGKhZDVsFLI7W9t0eqhS78APYn6suPuDSlD3LF7F
 tfFVrFcaHXx+Z1e1TANE38xGn5svyxvgB6p00cwyX6ZHnDdx5OYcTbmk4 w==;
X-CSE-ConnectionGUID: dPK9aA7eTYKM5aNskdkDfw==
X-CSE-MsgGUID: AP5VLuesSYK9CG0oRoX8zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99774491"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="99774491"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:55:24 -0700
X-CSE-ConnectionGUID: kjkpt6E+Sm+k1gQPB2pG3Q==
X-CSE-MsgGUID: m/NormoRQgu0k0dGM6HfDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="265146844"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:55:22 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/3] tests/intel/xe_exec_basic: Make subtest matrix data-driven
Date: Mon, 31 Aug 2026 19:55:09 +0200
Message-ID: <20260831175512.1379368-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831175512.1379368-1-jan.maslak@intel.com>
References: <20260831175512.1379368-1-jan.maslak@intel.com>
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

Describe workload and execution setup variants in tables, and generate
the corresponding subtests by iterating over their combinations.
Preserve existing subtest names and behavior while removing duplicated
registration boilerplate.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_exec_basic.c | 210 +++++++++++++++++++-----------------
 1 file changed, 109 insertions(+), 101 deletions(-)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 5335bffc41..33d4b6a779 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -314,116 +314,124 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 }
 
-int igt_main()
+struct exec_setup_variant {
+	const char *name;
+	unsigned int flags;
+};
+
+static const struct exec_setup_variant exec_setup_variants[] = {
+	{ "basic", 0 },
+	{ "basic-defer-mmap", DEFER_ALLOC },
+	{ "basic-defer-bind", DEFER_ALLOC | DEFER_BIND },
+	{ "userptr", USERPTR },
+	{ "rebind", REBIND },
+	{ "null", SPARSE },
+	{ "null-defer-mmap", SPARSE | DEFER_ALLOC },
+	{ "null-defer-bind", SPARSE | DEFER_ALLOC | DEFER_BIND },
+	{ "null-rebind", SPARSE | REBIND },
+	{ "userptr-rebind", USERPTR | REBIND },
+	{ "userptr-invalidate", USERPTR | INVALIDATE },
+	{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
+	{ "bindexecqueue", BIND_EXEC_QUEUE },
+	{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
+	{ "bindexecqueue-rebind", BIND_EXEC_QUEUE | REBIND },
+	{ "bindexecqueue-userptr-rebind", BIND_EXEC_QUEUE | USERPTR | REBIND },
+	{ "bindexecqueue-userptr-invalidate",
+		BIND_EXEC_QUEUE | USERPTR | INVALIDATE },
+	{ "bindexecqueue-userptr-invalidate-race",
+		BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
+	{ NULL },
+};
+
+struct workload_variant {
+	const char *name;
+	int n_exec_queues;
+	int n_execs;
+	int n_vm;
+	bool reduce_execs;
+};
+
+static const struct workload_variant workload_variants[] = {
+	{ "once", 1, 1, 1, false },
+	{ "twice", 1, 2, 1, false },
+	{ "many", 1, 1024, 1, true },
+	{ "many-execqueues", 16, 1024, 1, true },
+	{ "many-execqueues-many-vm", 16, 1024, 16, true },
+	{ "no-exec", 1, 0, 1, false },
+	{ NULL },
+};
+
+static const struct workload_variant multigpu_workload_variants[] = {
+	{ "once", 1, 1, 1, false },
+	{ "many-execqueues-many-vm", 16, 32, 16, false },
+	{ "no-exec", 1, 0, 1, false },
+	{ NULL },
+};
+
+static int workload_variant_n_execs(const struct workload_variant *workload,
+				    unsigned int flags)
+{
+	if (workload->reduce_execs && (flags & (REBIND | INVALIDATE)))
+		return 64;
+
+	return workload->n_execs;
+}
+
+static void
+register_exec_subtest(int fd, const struct exec_setup_variant *setup,
+		      const struct workload_variant *workload)
 {
 	struct drm_xe_engine_class_instance *hwe;
-	const struct section {
-		const char *name;
-		unsigned int flags;
-	} sections[] = {
-		{ "basic", 0 },
-		{ "basic-defer-mmap", DEFER_ALLOC },
-		{ "basic-defer-bind", DEFER_ALLOC | DEFER_BIND },
-		{ "userptr", USERPTR },
-		{ "rebind", REBIND },
-		{ "null", SPARSE },
-		{ "null-defer-mmap", SPARSE | DEFER_ALLOC },
-		{ "null-defer-bind", SPARSE | DEFER_ALLOC | DEFER_BIND },
-		{ "null-rebind", SPARSE | REBIND },
-		{ "userptr-rebind", USERPTR | REBIND },
-		{ "userptr-invalidate", USERPTR | INVALIDATE },
-		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
-		{ "bindexecqueue", BIND_EXEC_QUEUE },
-		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
-		{ "bindexecqueue-rebind", BIND_EXEC_QUEUE | REBIND },
-		{ "bindexecqueue-userptr-rebind", BIND_EXEC_QUEUE | USERPTR | REBIND },
-		{ "bindexecqueue-userptr-invalidate", BIND_EXEC_QUEUE | USERPTR |
-			INVALIDATE },
-		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
-			INVALIDATE | RACE },
-		{ NULL },
-	};
+
+	igt_subtest_with_dynamic_f("%s-%s", workload->name, setup->name) {
+		xe_for_each_engine(fd, hwe)
+			igt_dynamic_f("%s%d",
+				      xe_engine_class_short_string(hwe->engine_class),
+				      hwe->engine_instance)
+				test_exec(fd, hwe, workload->n_exec_queues,
+					  workload_variant_n_execs(workload,
+								   setup->flags),
+					  workload->n_vm, setup->flags);
+	}
+}
+
+static void
+register_multigpu_exec_subtest(const struct exec_setup_variant *setup,
+			       const struct workload_variant *workload)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	igt_subtest_f("multigpu-%s-%s", workload->name, setup->name) {
+		igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
+			xe_for_each_engine(gpu_fd, hwe)
+				test_exec(gpu_fd, hwe,
+					  workload->n_exec_queues,
+					  workload_variant_n_execs(workload,
+								   setup->flags),
+					  workload->n_vm, setup->flags);
+		igt_waitchildren();
+	}
+}
+
+int igt_main()
+{
 	int fd;
 
 	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
-	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_with_dynamic_f("once-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				igt_dynamic_f("%s%d",
-					      xe_engine_class_short_string(hwe->engine_class),
-					      hwe->engine_instance)
-					test_exec(fd, hwe, 1, 1, 1, s->flags);
-
-		igt_subtest_with_dynamic_f("twice-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				igt_dynamic_f("%s%d",
-					      xe_engine_class_short_string(hwe->engine_class),
-					      hwe->engine_instance)
-					test_exec(fd, hwe, 1, 2, 1, s->flags);
-
-		igt_subtest_with_dynamic_f("many-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				igt_dynamic_f("%s%d",
-					      xe_engine_class_short_string(hwe->engine_class),
-					      hwe->engine_instance)
-					test_exec(fd, hwe, 1,
-					  s->flags & (REBIND | INVALIDATE) ?
-					  64 : 1024, 1,
-					  s->flags);
-
-		igt_subtest_with_dynamic_f("many-execqueues-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				igt_dynamic_f("%s%d",
-					      xe_engine_class_short_string(hwe->engine_class),
-					      hwe->engine_instance)
-					test_exec(fd, hwe, 16,
-					  s->flags & (REBIND | INVALIDATE) ?
-					  64 : 1024, 1,
-					  s->flags);
-
-		igt_subtest_with_dynamic_f("many-execqueues-many-vm-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				igt_dynamic_f("%s%d",
-					      xe_engine_class_short_string(hwe->engine_class),
-					      hwe->engine_instance)
-					test_exec(fd, hwe, 16,
-					  s->flags & (REBIND | INVALIDATE) ?
-					  64 : 1024, 16,
-					  s->flags);
-
-		igt_subtest_with_dynamic_f("no-exec-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				igt_dynamic_f("%s%d",
-					      xe_engine_class_short_string(hwe->engine_class),
-					      hwe->engine_instance)
-					test_exec(fd, hwe, 1, 0, 1, s->flags);
-	}
+	for (const struct exec_setup_variant *setup = exec_setup_variants;
+	     setup->name; setup++)
+		for (const struct workload_variant *workload = workload_variants;
+		     workload->name; workload++)
+			register_exec_subtest(fd, setup, workload);
 
 	igt_fixture()
 		drm_close_driver(fd);
 
-	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("multigpu-once-%s", s->name) {
-			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
-				xe_for_each_engine(gpu_fd, hwe)
-					test_exec(gpu_fd, hwe, 1, 1, 1, s->flags);
-			igt_waitchildren();
-		}
-
-		igt_subtest_f("multigpu-many-execqueues-many-vm-%s", s->name) {
-			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
-				xe_for_each_engine(gpu_fd, hwe)
-					test_exec(gpu_fd, hwe, 16, 32, 16, s->flags);
-			igt_waitchildren();
-		}
-
-		igt_subtest_f("multigpu-no-exec-%s", s->name) {
-			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
-				xe_for_each_engine(gpu_fd, hwe)
-					test_exec(gpu_fd, hwe, 1, 0, 1, s->flags);
-			igt_waitchildren();
-		}
-	}
+	for (const struct exec_setup_variant *setup = exec_setup_variants;
+	     setup->name; setup++)
+		for (const struct workload_variant *workload = multigpu_workload_variants;
+		     workload->name; workload++)
+			register_multigpu_exec_subtest(setup, workload);
 }
-- 
2.43.0


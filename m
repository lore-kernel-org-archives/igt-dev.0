Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DE1CD5BB1
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 08:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE9210E1B6;
	Fri, 22 May 2026 08:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QP8gyzxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0410E1B6
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779438606; x=1810974606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SSbBTfnp6Lr0USzi0/PGhhNTordMBCdnp1SqGLvy+yU=;
 b=QP8gyzxhT6Xg8omhJBr9uO8XUPdsmxTDT1YCOk/iAo09TSFYdoELFC0r
 +jA2y/QLj99x+Obizqyn4KVmAMzMcLbsID2rQaEdDrlfjD4fEOx01fk/K
 CfoGpPkwrFpoD6XpcU5OusppWm2CazvCx8M/gjq01KmPuxyCfGf0gXzsD
 lzCm6xZJ4MR3NGkOz+x8cHoVise1kJTxGrabbh3XZIXH3GXhdNJB3/vFD
 9s/7WHsKhMkCJh6tbbWEPVAJxKASTQbx8Yy0Cs242i3iPkMtaZyc9IL88
 B0BiO2lrHB+BeCSX4Gwn5MXAazynlGhUcZDMQm4OwUKANxmIUvmTPISMw g==;
X-CSE-ConnectionGUID: cuCj+RM6TxqQQFKONeftuA==
X-CSE-MsgGUID: egjLUBILR+ig+s+WJykFnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91056944"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91056944"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:30:06 -0700
X-CSE-ConnectionGUID: c2TsC+C2Q7esAY0Z+5MNkA==
X-CSE-MsgGUID: UFti9YFKScWpKjSe0UPPZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="271202457"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.230])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:30:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Remove copy-paste
 in eu-fault doc
Date: Fri, 22 May 2026 10:29:55 +0200
Message-ID: <20260522082955.28662-1-francois.dugast@intel.com>
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

Replace the six separate eu-fault-{4k,64k,2m}-* SUBTEST doc entries
with a single eu-fault-%s-%s entry using arg[1] for the buffer size
and arg[2] for the access pattern. Introduce a csizes array and use a
nested loop to register the subtests, removing the size-related
copy/paste.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Assisted-by: GitHub Copilot:claude-sonnet-4.6
---
 tests/intel/xe_exec_system_allocator.c | 55 +++++++++++---------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 21973e95d..89b7f565a 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2283,36 +2283,23 @@ static void read_gt_stats_snapshot(int fd,
  * Description: Run a simple compute kernel with the system allocator
  * Test category: functionality test
  *
- * SUBTEST: eu-fault-4k-%s
- * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer
+ * SUBTEST: eu-fault-%s-%s
+ * Description: Run a simple compute kernel %arg[2] on a %arg[1] malloc'ed buffer
  * Test category: performance test
  *
- * SUBTEST: eu-fault-64k-%s
- * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer
- * Test category: performance test
- *
- * SUBTEST: eu-fault-2m-%s
- * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
- * Test category: performance test
- *
- * SUBTEST: eu-fault-4k-range-device-host-madvise-dontneed
- * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
- * Test category: performance test
- *
- * SUBTEST: eu-fault-64k-range-device-host-madvise-dontneed
- * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
- * Test category: performance test
+ * arg[1]:
  *
- * SUBTEST: eu-fault-2m-range-device-host-madvise-dontneed
- * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
- * Test category: performance test
+ * @4k:		4KB
+ * @64k:	64KB
+ * @2m:		2MB
  *
- * arg[1]:
+ * arg[2]:
  *
  * @once-device:				touch the buffer only once, from the device
  * @once-device-host:				touch the buffer only once, from the device then from the host
  * @range-device:				touch the whole buffer, from the device
  * @range-device-host:				touch the whole buffer, from the device then from the host
+ * @range-device-host-madvise-dontneed:		touch the whole buffer, from the device then from the host, with madvise(MADV_DONTNEED) used
  */
 static void
 test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
@@ -2578,6 +2565,15 @@ int igt_main()
 		{ "range-device-host-madvise-dontneed", ACCESS_DEVICE_HOST | USE_MADV_DONTNEED },
 		{ NULL },
 	};
+	const struct {
+		const char *name;
+		size_t size;
+	} csizes[] = {
+		{ "4k", SZ_4K },
+		{ "64k", SZ_64K },
+		{ "2m", SZ_2M },
+		{ NULL, 0 },
+	};
 
 	const struct section intel_get_pat_idx_functions[] = {
 		{ "madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
@@ -2830,18 +2826,11 @@ int igt_main()
 				test_compute(fd, hwe, SZ_2M, 0, svm_compute_loops);
 
 	for (const struct section *s = csections; s->name; s++) {
-		igt_subtest_f("eu-fault-4k-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
-					test_compute(fd, hwe, SZ_4K, s->flags, svm_compute_loops);
-		igt_subtest_f("eu-fault-64k-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
-					test_compute(fd, hwe, SZ_64K, s->flags, svm_compute_loops);
-		igt_subtest_f("eu-fault-2m-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
-					test_compute(fd, hwe, SZ_2M, s->flags, svm_compute_loops);
+		for (int i = 0; csizes[i].name; i++)
+			igt_subtest_f("eu-fault-%s-%s", csizes[i].name, s->name)
+				xe_for_each_engine(fd, hwe)
+					if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+						test_compute(fd, hwe, csizes[i].size, s->flags, svm_compute_loops);
 	}
 
 	igt_fixture() {
-- 
2.43.0


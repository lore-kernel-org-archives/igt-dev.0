Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31AFC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 17:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5732688284;
	Wed, 14 Aug 2024 17:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzH6ZSIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91A410E4FE
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723657828; x=1755193828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nns0uBT9yrzfTVcw0beyAjWeI7VJcLVTMFnqtzrQUuk=;
 b=FzH6ZSIx5eO2/Et4kpuDtPxKSYiw04WXCU1okogQCIYF8qf+X2pMOSBl
 MpehYFNchfu1cvRV4CRfN9Ftz4Z/vwrOpjKwScXqLxrJoCIhV/I1EZm+H
 pfmFa5n9uLNqR9/YlcQ6AFidmrVzENnz3bh+Q/86GSDiao+Eoepaw6442
 /vAEDxHlWvNKPySeoLifhlKvh8NeXqFaGF+vIRoIKs7srtRBlYemYQFhp
 smtB1Mr6+znRgLo9EwPtSldutLyq7l0eV9eZUMYkmrXPpps4pP+ivNxoa
 DtAKZUPLYsX+FrpDpPVcyPbkzBG8UkdtVvbMBPe3gfNFRFgGsOkjJODVn A==;
X-CSE-ConnectionGUID: ODjsHJYpROeWNq4GY52lTg==
X-CSE-MsgGUID: krDi9DMaSl6T6iTUETmZ8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="25757456"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="25757456"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 10:50:28 -0700
X-CSE-ConnectionGUID: fh+Kq6L7QDqQpLpbeI8nlg==
X-CSE-MsgGUID: 05Gw4PXoTrStmk6H2Rjimw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="63750645"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 10:50:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe: Add XE_MAX_ENGINE_INSTANCE
Date: Wed, 14 Aug 2024 10:50:12 -0700
Message-ID: <20240814175013.3679997-1-lucas.demarchi@intel.com>
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

Replace all the duplicate defines of MAX_INSTANCE with a better one in
xe_query.h.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_query.h              |  6 ++++++
 tests/intel/xe_exec_balancer.c | 16 +++++++---------
 tests/intel/xe_exec_reset.c    | 13 ++++++-------
 tests/intel/xe_exec_store.c    |  1 -
 tests/intel/xe_exec_threads.c  |  5 ++---
 tests/intel/xe_spin_batch.c    |  8 +++-----
 6 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index c33f91ca1..1e4d1512f 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -76,6 +76,12 @@ struct xe_device {
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
 
+/*
+ * Max possible engine instance in drm_xe_engine_class_instance::engine_instance. Only
+ * used to declare arrays of drm_xe_engine_class_instance
+ */
+#define XE_MAX_ENGINE_INSTANCE	9
+
 unsigned int xe_number_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 73f69e7b0..53ea245a0 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -24,8 +24,6 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 
-#define MAX_INSTANCE 9
-
 /**
  * SUBTEST: virtual-all-active
  * Description:
@@ -46,8 +44,8 @@ static void test_all_active(int fd, int gt, int class)
 		.num_syncs = 2,
 		.syncs = to_user_pointer(sync),
 	};
-	uint32_t exec_queues[MAX_INSTANCE];
-	uint32_t syncobjs[MAX_INSTANCE];
+	uint32_t exec_queues[XE_MAX_ENGINE_INSTANCE];
+	uint32_t syncobjs[XE_MAX_ENGINE_INSTANCE];
 	size_t bo_size;
 	uint32_t bo = 0;
 	struct {
@@ -55,7 +53,7 @@ static void test_all_active(int fd, int gt, int class)
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
 	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
 	int i, num_placements = 0;
 
 	xe_for_each_engine(fd, hwe) {
@@ -187,7 +185,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint32_t data;
 	} *data;
 	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
 	int i, j, b, num_placements = 0;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
@@ -244,7 +242,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t batch_addr = addr + batch_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = addr + sdi_offset;
-		uint64_t batches[MAX_INSTANCE];
+		uint64_t batches[XE_MAX_ENGINE_INSTANCE];
 		int e = i % n_exec_queues;
 
 		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
@@ -406,7 +404,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint32_t data;
 	} *data;
 	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
 	int i, j, b, num_placements = 0;
 	int map_fd = -1;
 
@@ -468,7 +466,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t batch_addr = addr + batch_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = addr + sdi_offset;
-		uint64_t batches[MAX_INSTANCE];
+		uint64_t batches[XE_MAX_ENGINE_INSTANCE];
 		int e = i % n_exec_queues;
 
 		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 61c35ce69..bcda78609 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -105,7 +105,6 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 }
 
 #define MAX_N_EXECQUEUES	16
-#define MAX_INSTANCE		9
 #define GT_RESET			(0x1 << 0)
 #define CLOSE_FD			(0x1 << 1)
 #define CLOSE_EXEC_QUEUES	(0x1 << 2)
@@ -164,7 +163,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
 	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
 	int i, j, b, num_placements = 0, bad_batches = 1;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
@@ -213,7 +212,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = base_addr + sdi_offset;
 		uint64_t exec_addr;
-		uint64_t batches[MAX_INSTANCE];
+		uint64_t batches[XE_MAX_ENGINE_INSTANCE];
 		int e = i % n_exec_queues;
 
 		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
@@ -793,15 +792,15 @@ igt_main
 		igt_subtest_f("%s-cat-error", s->name)
 			xe_for_each_gt(fd, gt)
 				xe_for_each_engine_class(class)
-					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
-						      MAX_INSTANCE + 1,
+					test_balancer(fd, gt, class, XE_MAX_ENGINE_INSTANCE + 1,
+						      XE_MAX_ENGINE_INSTANCE + 1,
 						      CAT_ERROR | s->flags);
 
 		igt_subtest_f("%s-gt-reset", s->name)
 			xe_for_each_gt(fd, gt)
 				xe_for_each_engine_class(class)
-					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
-						      MAX_INSTANCE + 1,
+					test_balancer(fd, gt, class, XE_MAX_ENGINE_INSTANCE + 1,
+						      XE_MAX_ENGINE_INSTANCE + 1,
 						      GT_RESET | s->flags);
 
 		igt_subtest_f("%s-close-fd-no-exec", s->name)
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 67c53fbd1..1375ee906 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -21,7 +21,6 @@
  * Test category: functionality test
  */
 
-#define MAX_INSTANCE 9
 #define STORE 0
 #define COND_BATCH 1
 
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 6e53d3cf8..06452862e 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -25,7 +25,6 @@
 #include <string.h>
 
 #define MAX_N_EXEC_QUEUES	16
-#define MAX_INSTANCE	9
 #define USERPTR		(0x1 << 0)
 #define REBIND		(0x1 << 1)
 #define INVALIDATE	(0x1 << 2)
@@ -66,7 +65,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint32_t data;
 	} *data;
 	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
 	int i, j, b, num_placements = 0;
 	bool owns_vm = false, owns_fd = false;
 
@@ -139,7 +138,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t batch_addr = addr + batch_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = addr + sdi_offset;
-		uint64_t batches[MAX_INSTANCE];
+		uint64_t batches[XE_MAX_ENGINE_INSTANCE];
 		int e = i % n_exec_queues;
 
 		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 4e95060d3..9314e229e 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -15,8 +15,6 @@
  * Test category: functionality test
  */
 
-#define MAX_INSTANCE 9
-
 /**
  * SUBTEST: spin-basic
  * Description: Basic test to submit spin batch submissons on copy engine.
@@ -97,10 +95,10 @@ static void spin_basic_all(int fd)
 static void spin_all(int fd, int gt, int class)
 {
 	uint64_t ahnd;
-	uint32_t exec_queues[MAX_INSTANCE], vm;
+	uint32_t exec_queues[XE_MAX_ENGINE_INSTANCE], vm;
 	int i, num_placements = 0;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
-	igt_spin_t *spin[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
+	igt_spin_t *spin[XE_MAX_ENGINE_INSTANCE];
 	struct drm_xe_engine_class_instance *hwe;
 
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
-- 
2.43.0


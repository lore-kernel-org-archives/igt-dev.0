Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004AFCCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 12:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC46710E121;
	Thu,  9 Oct 2025 12:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BC1vgWs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C9710E121
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760012082; x=1791548082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NpOOiLIEY2cXuljMfF5hbRLOVzOL2/DQDrFcCTf3GH8=;
 b=BC1vgWs+mmyZDsmzeKF4ZNCfVBc0CDMcBIH2ARmmMiyRoJVxu2/p4oNZ
 oXBqSEu8cIT4GKy2B2j3k1tZeu7BQWg5efS6K2196Lyf78DqVzr2grO2N
 2w0/9w/l2vyNy2fOj4IqZ0+b/SGO+e6QfbS4MkNYraBzyCDIqOXi+cKdd
 0Lu+nHABPAhicoCHpoKma2+MH2pLtQdncJJaF9+nFoYBgfscVlba+ilPA
 /26OcO7Jtz7OGiaYD4LF9s4TPMhZr9Q6KhEAWjFPkrgL64ggdEeXBHNAq
 VkAc3VP1sjZDkRIilJ1XPt/LIm6phdbPstEJ6aS/Yq2nd4ET017ST1/4B A==;
X-CSE-ConnectionGUID: geyeZYKVQhKqrc+qyIBNIQ==
X-CSE-MsgGUID: PZdKixuGTamcuA1SUttcSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="66070842"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="66070842"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:14:41 -0700
X-CSE-ConnectionGUID: E+rmJcdBQLKtJOhM1k7eKQ==
X-CSE-MsgGUID: DhrHPOOWRDGGabS6X2WAIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="179809339"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:14:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
Subject: [PATCH] tests/xe/xe_exec_system_allocator: Add partial unmap atomic
 access sections
Date: Thu,  9 Oct 2025 05:14:36 -0700
Message-Id: <20251009121436.3503049-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Atomic GPU access changes the migration policy in the GPU page fault
handler. Ensure that partial unmaps work correctly with atomic access.
Also, remove the VAL_ATOMIC_EXPECTED complication; instead, set the data
to the expected value minus one before programming the atomic
instruction.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 85 ++++++++++++++++----------
 1 file changed, 54 insertions(+), 31 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index b17ece9d71..b88967e580 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -48,7 +48,6 @@ struct batch_data {
 	uint32_t expected_data;
 };
 
-#define VAL_ATOMIC_EXPECTED  56
 #define WRITE_VALUE(data__, i__)	({			\
 	if (!(data__)->expected_data)				\
 		(data__)->expected_data = rand() << 12 | (i__);	\
@@ -71,7 +70,7 @@ static void write_dword(struct test_exec_data *data, uint64_t sdi_addr, uint32_t
 	uint32_t *batch = data->batch;
 
 	if (atomic) {
-		data->data = VAL_ATOMIC_EXPECTED - 1;
+		data->data = wdata - 1;
 		batch[(*idx)++] = MI_ATOMIC | MI_ATOMIC_INC;
 		batch[(*idx)++] = sdi_addr;
 		batch[(*idx)++] = sdi_addr >> 32;
@@ -715,6 +714,7 @@ processes_evict(int fd, uint64_t alloc_size, uint64_t stride,
 #define CPU_FAULT	(0x1 << 0)
 #define REMAP		(0x1 << 1)
 #define MIDDLE		(0x1 << 2)
+#define ATOMIC_ACCESS	(0x1 << 3)
 
 /**
  * SUBTEST: partial-munmap-cpu-fault
@@ -748,6 +748,38 @@ processes_evict(int fd, uint64_t alloc_size, uint64_t stride,
  * SUBTEST: partial-middle-remap-no-cpu-fault
  * Description: remap middle with no cpu access in between
  * Test category: functionality test
+ *
+ * SUBTEST: partial-atomic-munmap-cpu-fault
+ * Description: munmap partially with cpu access in between, GPU uses atomics
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-atomic-munmap-no-cpu-fault
+ * Description: munmap partially with no cpu access in between, GPU uses atomics
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-atomic-remap-cpu-fault
+ * Description: remap partially with cpu access in between, GPU uses atomics
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-atomic-remap-no-cpu-fault
+ * Description: remap partially with no cpu access in between, GPU uses atomics
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-atomic-middle-munmap-cpu-fault
+ * Description: munmap middle with cpu access in between, GPU uses atomics
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-atomic-middle-munmap-no-cpu-fault
+ * Description: munmap middle with no cpu access in between, GPU uses atomics
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-atomic-middle-remap-cpu-fault
+ * Description: remap middle with cpu access in between, GPU uses atomics
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-atomic-middle-remap-no-cpu-fault
+ * Description: remap middle with no cpu access in between, GPU uses atomics
+ * Test category: functionality test
  */
 
 static void
@@ -762,20 +794,14 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 		.num_syncs = 1,
 		.syncs = to_user_pointer(sync),
 	};
-	struct {
-		uint32_t batch[16];
-		uint64_t pad;
-		uint64_t vm_sync;
-		uint64_t exec_sync;
-		uint32_t data;
-		uint32_t expected_data;
-	} *data;
+	struct test_exec_data *data;
 	size_t bo_size = SZ_2M, unmap_offset = 0;
 	uint32_t vm, exec_queue;
 	u64 *exec_ufence = NULL;
 	int i;
 	void *old, *new = NULL;
 	struct aligned_alloc_type alloc;
+	bool atomic = flags & ATOMIC_ACCESS;
 
 	if (flags & MIDDLE)
 		unmap_offset = bo_size / 4;
@@ -811,8 +837,8 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 		uint64_t sdi_addr = addr + sdi_offset;
 		int b = 0;
 
-		write_dword((struct test_exec_data *)&data[i], sdi_addr, WRITE_VALUE(&data[i], i),
-			    &b, false);
+		write_dword(&data[i], sdi_addr, WRITE_VALUE(&data[i], i),
+			    &b, atomic);
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
 		if (!i)
@@ -834,8 +860,9 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 
 		xe_wait_ufence(fd, new ?: exec_ufence, USER_FENCE_VALUE,
 			       exec_queue, FIVE_SEC);
-		if (i || (flags & CPU_FAULT))
+		if (i || (flags & CPU_FAULT)) {
 			igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
+		}
 		exec_ufence[0] = 0;
 
 		if (!i) {
@@ -1742,25 +1769,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				if (flags & FORK_READ) {
 					igt_fork(child, 1)
 						igt_assert_eq(data[idx].data,
-							      flags & ATOMIC_BATCH
-							      ? VAL_ATOMIC_EXPECTED
-							      : READ_VALUE(&data[idx]));
+							      READ_VALUE(&data[idx]));
 					if (!(flags & FORK_READ_AFTER))
 						igt_assert_eq(data[idx].data,
-							      flags & ATOMIC_BATCH
-							      ? VAL_ATOMIC_EXPECTED
-							      : READ_VALUE(&data[idx]));
+							      READ_VALUE(&data[idx]));
 					igt_waitchildren();
 					if (flags & FORK_READ_AFTER)
 						igt_assert_eq(data[idx].data,
-							      flags & ATOMIC_BATCH
-							      ? VAL_ATOMIC_EXPECTED
-							      : READ_VALUE(&data[idx]));
+							      READ_VALUE(&data[idx]));
 				} else {
 					igt_assert_eq(data[idx].data,
-						      flags & ATOMIC_BATCH
-						      ? VAL_ATOMIC_EXPECTED
-						      : READ_VALUE(&data[idx]));
+						      READ_VALUE(&data[idx]));
 					if (flags & PREFETCH_SYS_BENCHMARK) {
 						struct timespec tv = {};
 						u64 start, end;
@@ -1787,17 +1806,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 								((void *)data) + j * orig_size;
 
 							igt_assert_eq(__data[idx].data,
-								      flags & ATOMIC_BATCH
-								      ? VAL_ATOMIC_EXPECTED
-								      : READ_VALUE(&data[idx]));
+								      READ_VALUE(&data[idx]));
 						}
 					}
 				}
 				if (flags & EVERY_OTHER_CHECK)
 					igt_assert_eq(data[prev_idx].data,
-						      flags & ATOMIC_BATCH
-						      ? VAL_ATOMIC_EXPECTED
-						      : READ_VALUE(&data[prev_idx]));
+						      READ_VALUE(&data[prev_idx]));
 			}
 		}
 
@@ -2298,6 +2313,14 @@ igt_main
 		{ "middle-munmap-no-cpu-fault", MIDDLE },
 		{ "middle-remap-cpu-fault", MIDDLE | CPU_FAULT | REMAP },
 		{ "middle-remap-no-cpu-fault", MIDDLE | REMAP },
+		{ "atomic-munmap-cpu-fault", ATOMIC_ACCESS | CPU_FAULT },
+		{ "atomic-munmap-no-cpu-fault", ATOMIC_ACCESS },
+		{ "atomic-remap-cpu-fault", ATOMIC_ACCESS | CPU_FAULT | REMAP },
+		{ "atomic-remap-no-cpu-fault", ATOMIC_ACCESS | REMAP },
+		{ "atomic-middle-munmap-cpu-fault", ATOMIC_ACCESS | MIDDLE | CPU_FAULT },
+		{ "atomic-middle-munmap-no-cpu-fault", ATOMIC_ACCESS | MIDDLE },
+		{ "atomic-middle-remap-cpu-fault", ATOMIC_ACCESS | MIDDLE | CPU_FAULT | REMAP },
+		{ "atomic-middle-remap-no-cpu-fault", ATOMIC_ACCESS | MIDDLE | REMAP },
 		{ NULL },
 	};
 	const struct section esections[] = {
-- 
2.34.1


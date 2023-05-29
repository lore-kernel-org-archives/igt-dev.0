Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218E210E264
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 09:51:11 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Mon, 29 May 2023 15:21:26 +0530
Message-Id: <20230529095126.481130-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe_exec_threads: Increase fence
 timeout for simulation env
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Increase fence timeout to 30 seconds for simulation env.
Value is determined based on experiments.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_exec_threads.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 3f2c2de9..2e777977 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -264,6 +264,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		.num_syncs = 1,
 		.syncs = to_user_pointer(sync),
 	};
+	int64_t fence_timeout;
 	uint32_t engines[MAX_N_ENGINES];
 	size_t bo_size;
 	uint32_t bo = 0;
@@ -335,7 +336,11 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
 					 bo_size, sync, 1);
 #define THREE_SEC	3000
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
+#define THIRTY_SEC	30000
+
+	fence_timeout = igt_run_in_simulation() ? THIRTY_SEC : THREE_SEC;
+
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, fence_timeout);
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
@@ -363,7 +368,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			for (j = i - 0x20; j <= i; ++j)
 				xe_wait_ufence(fd, &data[j].exec_sync,
 					       USER_FENCE_VALUE,
-					       NULL, THREE_SEC);
+					       NULL, fence_timeout);
 			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
 					   NULL, 0);
 
@@ -378,7 +383,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       NULL, THREE_SEC);
+				       NULL, fence_timeout);
 			data[0].vm_sync = 0;
 		}
 
@@ -393,7 +398,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 				for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
 					xe_wait_ufence(fd, &data[j].exec_sync,
 						       USER_FENCE_VALUE,
-						       NULL, THREE_SEC);
+						       NULL, fence_timeout);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
@@ -426,7 +431,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		(flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
 	for (i = j; i < n_execs; i++)
 		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
-			       THREE_SEC);
+			       fence_timeout);
 
 	/* Wait for all execs to complete */
 	if (flags & INVALIDATE)
@@ -434,7 +439,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, fence_timeout);
 
 	for (i = j; i < n_execs; i++)
 		igt_assert_eq(data[i].data, 0xc0ffee);
-- 
2.25.1

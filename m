Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE67910E310
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 16:16:51 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 18:14:07 +0200
Message-Id: <20230627161407.344961-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230627161407.344961-1-zbigniew.kempczynski@intel.com>
References: <20230627161407.344961-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe_*: Use nanoseconds instead
 jiffies in wait user fence
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

Before kernel change will land we need to merge change in igt first
otherwise all tests which waits in wait user fence are prone to
get the timeout and fail.

One user fence wait which couldn't be touched in this patch
is xe_exec_threads.c:vm_async_ops_err_thread() which uses
BASICALLY_FOREVER = 0xffffffffffff as a timeout. New uapi allows
passing negative to select unlimited timeout (MAX_SCHEDULE_TIMEOUT)
but until merging kernel change this cannot be used here. There's
not a big problem as current timeout is far in the future what's
enough to keep test semantics.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/xe/xe_evict.c             | 2 +-
 tests/xe/xe_exec_balancer.c     | 2 +-
 tests/xe/xe_exec_compute_mode.c | 4 ++--
 tests/xe/xe_exec_fault_mode.c   | 2 +-
 tests/xe/xe_exec_reset.c        | 2 +-
 tests/xe/xe_exec_threads.c      | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 2c39d43908..34be54d7ec 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -313,7 +313,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 				xe_vm_bind_async(fd, vm, bind_engines[0], __bo,
 						 0, addr, bo_size, sync, 1);
 			}
-#define TWENTY_SEC	20000
+#define TWENTY_SEC	MS_TO_NS(20000)
 			xe_wait_ufence(fd, &data[i].vm_sync, USER_FENCE_VALUE,
 				       NULL, TWENTY_SEC);
 		}
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index 83a7b77ba5..040caaca3e 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -479,7 +479,7 @@ test_cm(int fd, int gt, int class, int n_engines, int n_execs,
 		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
 					 bo_size, sync, 1);
 
-#define ONE_SEC	1000
+#define ONE_SEC	MS_TO_NS(1000)
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
 	data[0].vm_sync = 0;
 
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index e2c9d0f383..61747787d1 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -181,8 +181,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_vm_bind_userptr_async(fd, vm, bind_engines[0],
 					 to_user_pointer(data), addr,
 					 bo_size, sync, 1);
-#define ONE_SEC	1000
-#define HUNDRED_SEC	100000
+#define ONE_SEC	MS_TO_NS(1000)
+#define HUNDRED_SEC	MS_TO_NS(100000)
 
 	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
 
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index 6d9e64868b..f42860caf4 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -190,7 +190,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 						 bo_size, sync, 1);
 	}
 
-#define ONE_SEC	1000
+#define ONE_SEC	MS_TO_NS(1000)
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
 	data[0].vm_sync = 0;
 
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 30b0548bfe..b526afffee 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -588,7 +588,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
-#define THREE_SEC	3000
+#define THREE_SEC	MS_TO_NS(3000)
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
 	data[0].vm_sync = 0;
 
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index aac2450eec..5f7d3bfcdf 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -335,8 +335,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	else
 		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
 					 bo_size, sync, 1);
-#define THREE_SEC	3000
-#define THIRTY_SEC	30000
+#define THREE_SEC	MS_TO_NS(3000)
+#define THIRTY_SEC	MS_TO_NS(30000)
 
 	fence_timeout = igt_run_in_simulation() ? THIRTY_SEC : THREE_SEC;
 
-- 
2.34.1

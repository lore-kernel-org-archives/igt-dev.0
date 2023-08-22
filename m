Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D8F10E08D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 18:55:28 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Aug 2023 20:55:07 +0200
Message-ID: <20230822185507.26407-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_exec_compute_mode: Test pinned
 userptr functionality
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Update the xe uapi definition and test the new XE_VM_BIND_FLAG_PIN
flag with xe_exec_compute_mode . Compute mode VMs will initially be
the main user of this flag.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm-uapi/xe_drm.h       | 18 +++++++++++
 tests/xe/xe_exec_compute_mode.c | 54 +++++++++++++++++++++++++++------
 2 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index d1d49cd71..db7a47bab 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -631,6 +631,24 @@ struct drm_xe_vm_bind_op {
 	 * intended to implement VK sparse bindings.
 	 */
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
+	 /*
+	  * When the PIN flag is set, the user requests the underlying
+	  * backing store of the vma to be pinned, that is, it will be
+	  * resident while bound and the underlying physical memory
+	  * will not change. For userptr VMAs this means that if the
+	  * user performs an operation that changes the underlying
+	  * pages of the CPU virtual space, the corresponding pinned
+	  * GPU virtual space will not pick up the new memory unless
+	  * an OP_UNMAP followed by a OP_MAP_USERPTR is performed.
+	  * Pinned userptr memory is accounted in the same way as
+	  * mlock(2), and if pinning fails the following error codes
+	  * may be returned:
+	  * -EINVAL: The memory region does not support pinning.
+	  * -EPERM: The process is not permitted to pin.
+	  * -ENOMEM: The pinning limit does not allow pinning.
+	  * For userptr memory, CAP_IPC_LOCK will bypass the limit checking.
+	  */
+#define XE_VM_BIND_FLAG_PIN		(0x1 << 20)
 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
 	__u32 op;
 
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index 679b84fa1..b7e20aca5 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -30,6 +30,7 @@
 #define BIND_EXECQUEUE		(0x1 << 4)
 #define VM_FOR_BO			(0x1 << 5)
 #define EXEC_QUEUE_EARLY	(0x1 << 6)
+#define PIN                             (0x1 << 7)
 
 /**
  * SUBTEST: twice-%s
@@ -178,9 +179,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
 				 bo_size, sync, 1);
 	else
-		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
-					 to_user_pointer(data), addr,
-					 bo_size, sync, 1);
+		xe_vm_bind_userptr_async_flags(fd, vm, bind_exec_queues[0],
+					       to_user_pointer(data), addr,
+					       bo_size, sync, 1,
+					       (flags & PIN) ? XE_VM_BIND_FLAG_PIN : 0);
 #define ONE_SEC	MS_TO_NS(1000)
 #define HUNDRED_SEC	MS_TO_NS(100000)
 
@@ -223,15 +225,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
 						 0, addr, bo_size, sync, 1);
 			else
-				xe_vm_bind_userptr_async(fd, vm,
-							 bind_exec_queues[e],
-							 to_user_pointer(data),
-							 addr, bo_size, sync,
-							 1);
+				xe_vm_bind_userptr_async_flags(fd, vm,
+							       bind_exec_queues[e],
+							       to_user_pointer(data),
+							       addr, bo_size, sync, 1,
+							       (flags & PIN) ?
+							       XE_VM_BIND_FLAG_PIN : 0);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
 				       NULL, fence_timeout);
 			data[0].vm_sync = 0;
-		}
+		} else if (flags & PIN &&  i + 1 != n_execs)
+			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				       NULL, fence_timeout);
 
 		if (flags & INVALIDATE && i + 1 != n_execs) {
 			if (!(flags & RACE)) {
@@ -268,6 +273,26 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			}
 			igt_assert(data != MAP_FAILED);
 		}
+
+		if (flags & PIN && i + 1 != n_execs) {
+			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
+					   addr, bo_size, NULL, 0);
+
+			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			addr += bo_size;
+			if (bo)
+				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
+						 0, addr, bo_size, sync, 1);
+			else
+				xe_vm_bind_userptr_async_flags(fd, vm,
+							       bind_exec_queues[e],
+							       to_user_pointer(data),
+							       addr, bo_size, sync, 1,
+							       XE_VM_BIND_FLAG_PIN);
+			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+				       NULL, fence_timeout);
+			data[0].vm_sync = 0;
+		}
 	}
 
 	j = flags & INVALIDATE ? n_execs - 1 : 0;
@@ -319,6 +344,10 @@ igt_main
 		{ "userptr-rebind", USERPTR | REBIND },
 		{ "userptr-invalidate", USERPTR | INVALIDATE },
 		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
+		{ "userptr-pin", USERPTR | PIN },
+		{ "userptr-rebind-pin", USERPTR | REBIND | PIN },
+		{ "userptr-invalidate-pin", USERPTR | INVALIDATE | PIN },
+		{ "userptr-invalidate-race-pin", USERPTR | INVALIDATE | RACE | PIN},
 		{ "bindexecqueue", BIND_EXECQUEUE },
 		{ "bindexecqueue-userptr", BIND_EXECQUEUE | USERPTR },
 		{ "bindexecqueue-rebind",  BIND_EXECQUEUE | REBIND },
@@ -328,6 +357,13 @@ igt_main
 			INVALIDATE },
 		{ "bindexecqueue-userptr-invalidate-race", BIND_EXECQUEUE | USERPTR |
 			INVALIDATE | RACE },
+		{ "bindexecqueue-userptr-pin", BIND_EXECQUEUE | USERPTR | PIN },
+		{ "bindexecqueue-userptr-rebind-pin",  BIND_EXECQUEUE |
+			USERPTR | REBIND | PIN },
+		{ "bindexecqueue-userptr-invalidate-pin",  BIND_EXECQUEUE |
+			USERPTR | INVALIDATE | PIN },
+		{ "bindexecqueue-userptr-invalidate-race-pin", BIND_EXECQUEUE |
+			USERPTR | INVALIDATE | RACE | PIN },
 		{ NULL },
 	};
 	int fd;
-- 
2.41.0

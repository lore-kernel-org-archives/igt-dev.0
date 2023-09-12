Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD9A10E0A3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 23:49:43 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 16:49:53 -0700
Message-Id: <20230912234954.2110973-2-matthew.brost@intel.com>
In-Reply-To: <20230912234954.2110973-1-matthew.brost@intel.com>
References: <20230912234954.2110973-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] xe_exec_threads: Use
 DRM_XE_VM_CREATE_COMPUTE_MODE when creating a compute VM
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

XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE was used creating a compute VM.
This just happened to work as it is same value as
DRM_XE_VM_CREATE_COMPUTE_MODE. Fix this and use correct flag,
DRM_XE_VM_CREATE_COMPUTE_MODE.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_threads.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index ae4da0568a..34bcb3d4d5 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -286,7 +286,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (!vm) {
 		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
-				  XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE, 0);
+				  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 		owns_vm = true;
 	}
 
@@ -1075,7 +1075,7 @@ static void threads(int fd, int flags)
 					      to_user_pointer(&ext));
 		vm_compute_mode = xe_vm_create(fd,
 					       DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
-					       XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
+					       DRM_XE_VM_CREATE_COMPUTE_MODE,
 					       0);
 
 		vm_err_thread.capture = &capture;
-- 
2.34.1

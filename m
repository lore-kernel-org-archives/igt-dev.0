Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC8910E3DA
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 13:01:12 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:00:36 +0000
Message-Id: <20230926130054.6-7-francois.dugast@intel.com>
In-Reply-To: <20230926130054.6-1-francois.dugast@intel.com>
References: <20230926130054.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 06/24] xe_exec_threads: Use
 DRM_XE_VM_CREATE_COMPUTE_MODE when creating a compute VM
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE was used creating a compute VM.
This just happened to work as it is same value as
DRM_XE_VM_CREATE_COMPUTE_MODE. Fix this and use correct flag,
DRM_XE_VM_CREATE_COMPUTE_MODE.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_exec_threads.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 1f9af894f..d19708f80 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -286,7 +286,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (!vm) {
 		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
-				  XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE, 0);
+				  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 		owns_vm = true;
 	}
 
@@ -1076,7 +1076,7 @@ static void threads(int fd, int flags)
 					      to_user_pointer(&ext));
 		vm_compute_mode = xe_vm_create(fd,
 					       DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
-					       XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
+					       DRM_XE_VM_CREATE_COMPUTE_MODE,
 					       0);
 
 		vm_err_thread.capture = &capture;
-- 
2.34.1

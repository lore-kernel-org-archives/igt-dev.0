Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444E910E5DA
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 17:00:00 +0000 (UTC)
Date: Fri, 20 Oct 2023 09:59:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZTKyCT18eNq73eln@nvishwa1-DESK>
References: <20231020093801.631809-1-matthew.auld@intel.com>
 <20231020093801.631809-11-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020093801.631809-11-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 10/15] lib/xe_ioctl: update vm_bind
 to account for pat_index
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 20, 2023 at 10:37:56AM +0100, Matthew Auld wrote:
>Keep things minimal and select the 1way+ by default on all platforms.
>Other users can use intel_buf, get_offset_pat_index etc or use
>__xe_vm_bind() directly.  Display tests don't directly use this
>interface.
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Cc: José Roberto de Souza <jose.souza@intel.com>
>Cc: Pallavi Mishra <pallavi.mishra@intel.com>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> lib/xe/xe_ioctl.c   | 8 ++++++--
> lib/xe/xe_ioctl.h   | 2 +-
> tests/intel/xe_vm.c | 5 ++++-
> 3 files changed, 11 insertions(+), 4 deletions(-)
>
>diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
>index 4cf44f1ee..f51f931ee 100644
>--- a/lib/xe/xe_ioctl.c
>+++ b/lib/xe/xe_ioctl.c
>@@ -41,6 +41,7 @@
> #include "config.h"
> #include "drmtest.h"
> #include "igt_syncobj.h"
>+#include "intel_pat.h"
> #include "ioctl_wrappers.h"
> #include "xe_ioctl.h"
> #include "xe_query.h"
>@@ -92,7 +93,7 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
> int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> 		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
>-		  uint32_t region, uint64_t ext)
>+		  uint32_t region, uint8_t pat_index, uint64_t ext)
> {
> 	struct drm_xe_vm_bind bind = {
> 		.extensions = ext,
>@@ -108,6 +109,8 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> 		.num_syncs = num_syncs,
> 		.syncs = (uintptr_t)sync,
> 		.exec_queue_id = exec_queue,
>+		.bind.pat_index = (pat_index == DEFAULT_PAT_INDEX) ?
>+			intel_get_pat_idx_wb(fd) : pat_index,
> 	};
>
> 	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
>@@ -122,7 +125,8 @@ void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> 			  uint32_t num_syncs, uint32_t region, uint64_t ext)
> {
> 	igt_assert_eq(__xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
>-				   op, flags, sync, num_syncs, region, ext), 0);
>+				   op, flags, sync, num_syncs, region, DEFAULT_PAT_INDEX,
>+				   ext), 0);
> }
>
> void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
>index e3f62a28a..a28375d3e 100644
>--- a/lib/xe/xe_ioctl.h
>+++ b/lib/xe/xe_ioctl.h
>@@ -20,7 +20,7 @@ uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
> int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> 		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
>-		  uint32_t region, uint64_t ext);
>+		  uint32_t region, uint8_t pat_index, uint64_t ext);
> void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> 			  uint64_t offset, uint64_t addr, uint64_t size,
> 			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
>diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
>index dd3302337..a01e1ba47 100644
>--- a/tests/intel/xe_vm.c
>+++ b/tests/intel/xe_vm.c
>@@ -10,6 +10,7 @@
>  */
>
> #include "igt.h"
>+#include "intel_pat.h"
> #include "lib/igt_syncobj.h"
> #include "lib/intel_reg.h"
> #include "xe_drm.h"
>@@ -316,7 +317,8 @@ static void userptr_invalid(int fd)
> 	vm = xe_vm_create(fd, 0, 0);
> 	munmap(data, size);
> 	ret = __xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
>-			   size, XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0, 0);
>+			   size, XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
>+			   DEFAULT_PAT_INDEX, 0);
> 	igt_assert(ret == -EFAULT);
>
> 	xe_vm_destroy(fd, vm);
>@@ -755,6 +757,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
> 		bind_ops[i].op = XE_VM_BIND_OP_MAP;
> 		bind_ops[i].flags = XE_VM_BIND_FLAG_ASYNC;
> 		bind_ops[i].region = 0;
>+		bind_ops[i].pat_index = intel_get_pat_idx_wb(fd);
> 		bind_ops[i].reserved[0] = 0;
> 		bind_ops[i].reserved[1] = 0;
>
>-- 
>2.41.0
>

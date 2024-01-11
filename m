Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0FA10E813
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 09:02:23 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_exec_store: don't pass gt_id as bind
 queue
Date: Thu, 11 Jan 2024 09:01:52 +0000
Message-ID: <20240111090152.296752-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The gt_id of the engine is not a valid bind queue. Typically it is zero
so we likely don't notice anything, but that might not always be the
case.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_store.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 870394d3c..3ec84295b 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -217,7 +217,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 		dst_offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
 								    bo_size, 0,
 								    ALLOC_STRATEGY_LOW_TO_HIGH);
-		xe_vm_bind_async(fd, vm, eci->gt_id, bo[i], 0, dst_offset[i], bo_size, sync, 1);
+		xe_vm_bind_async(fd, vm, 0, bo[i], 0, dst_offset[i], bo_size, sync, 1);
 	}
 
 	batch_map = xe_bo_map(fd, bo[i-1], bo_size);
@@ -303,7 +303,7 @@ static void persistent(int fd)
 			      vram_if_possible(fd, engine->instance.gt_id),
 			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	xe_vm_bind_async(fd, vm, engine->instance.gt_id, sd_batch, 0, addr, batch_size, &sync, 1);
+	xe_vm_bind_async(fd, vm, 0, sd_batch, 0, addr, batch_size, &sync, 1);
 	sd_data = xe_bo_map(fd, sd_batch, batch_size);
 	prt_data = xe_bo_map(fd, prt_batch, batch_size);
 
-- 
2.43.0

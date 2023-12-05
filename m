Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2080210E517
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Dec 2023 12:57:36 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Dec 2023 13:44:33 +0100
Message-ID: <20231205124433.9868-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] test/xe_spin_batch: Fix compilation failures
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Fix compilation failures with recent uAPI changes.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_spin_batch.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 87e1a86a2..a392c3c96 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -165,7 +165,7 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
 static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL
+		.flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -195,8 +195,8 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, hwe->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, hwe->gt_id), 0);
 
 	xe_vm_bind_async(fd, vm, hwe->gt_id, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
@@ -267,7 +267,7 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 	if (flags & SPIN_FIX_DURATION_PREEMPT)
 		ext = to_user_pointer(&ext_prio);
 
-	xe_for_each_hw_engine(fd, _hwe)
+	xe_for_each_engine(fd, _hwe)
 		if (_hwe->engine_class == class && _hwe->gt_id == gt)
 			hwe = _hwe;
 
@@ -348,7 +348,7 @@ igt_main
 
 	igt_subtest("spin-fixed-duration-with-preempter")
 		xe_for_each_gt(fd, gt)
-			xe_for_each_hw_engine_class(class)
+			xe_for_each_engine_class(class)
 				xe_spin_fixed_duration(fd, gt, class, SPIN_FIX_DURATION_PREEMPT);
 
 	igt_fixture
-- 
2.42.0

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH] Fix CAT error by adjusting prefetch size for Xe2
Date: Wed, 17 Jan 2024 12:46:00 -0800
Message-Id: <440d8d632ad08907dd8fc7ac1b8322176c2b48df.1705523804.git.jagmeet.randhawa@intel.com>
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
List-ID: <igt-dev.lists.freedesktop.org>
To: 
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com

Due to batch pre-fetch being quite aggressive on Xe2, we need
an extra 4K page at the end of the batch to ensure HW doesn't
pre-fetch beyond the boundaries of the batch itself, hitting
an invalid ppGTT page, resulting in CAT errors. Fix this by
accounting for the xe_cs_prefetch_size() when calculating
the size of the batch.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_store.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 2e4f57b47..bed118688 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -201,7 +201,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t *batch_map;
 	size_t bo_size = 4096;
 
-	bo_size = ALIGN(bo_size, xe_get_default_alignment(fd));
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 	vm = xe_vm_create(fd, 0, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
 	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
-- 
2.25.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F92210EA33
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 09:06:46 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/1] tests/intel/xe_create: create-contexts subtest
Date: Fri,  8 Dec 2023 10:05:58 +0100
Message-Id: <20231208090558.17004-2-lukasz.laguna@intel.com>
In-Reply-To: <20231208090558.17004-1-lukasz.laguna@intel.com>
References: <20231208090558.17004-1-lukasz.laguna@intel.com>
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

Validates the creation of significant number of HW contexts (4096 as
default). The number of contexts to create can be adjusted using command
line '-Q' parameter representing resource quantity.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_create.c | 65 ++++++++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index cef9db23d..45b0c116c 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -19,11 +19,11 @@
 #define PAGE_SIZE 0x1000
 
 static struct param {
-	unsigned int size_mb;
-	unsigned int vram_percent;
+	unsigned int quantity;
+	unsigned int percent;
 } params = {
-	.size_mb = 0,
-	.vram_percent = 100,
+	.quantity = 0,
+	.percent = 100,
 };
 
 static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
@@ -244,8 +244,8 @@ static void create_big_vram(int fd, int gt)
 	visible_avail_size = xe_visible_available_vram_size(fd, gt);
 	igt_require(visible_avail_size);
 
-	bo_size = params.size_mb ? params.size_mb * 1024ULL * 1024ULL
-		  : ALIGN_DOWN(visible_avail_size * params.vram_percent / 100, alignment);
+	bo_size = params.quantity ? params.quantity * 1024ULL * 1024ULL
+		  : ALIGN_DOWN(visible_avail_size * params.percent / 100, alignment);
 	igt_require(bo_size);
 	igt_info("gt%u bo_size=%lu visible_available_vram_size=%lu\n",
 		gt, bo_size, visible_avail_size);
@@ -268,16 +268,49 @@ static void create_big_vram(int fd, int gt)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: create-contexts
+ * Functionality: contexts creation
+ * Test category: functionality test
+ * Description: Verifies the creation of substantial number of HW contexts
+ *		(4096 as default).
+ */
+static void create_contexts(int fd)
+{
+	unsigned int i, n = params.quantity ? params.quantity : 4096;
+	uint64_t bo_size = xe_get_default_alignment(fd), bo_addr = 0x1a0000;
+	uint32_t vm, bo, *batch, exec_queues[n];
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+	bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
+
+	batch = xe_bo_map(fd, bo, bo_size);
+	*batch = MI_BATCH_BUFFER_END;
+	munmap(batch, bo_size);
+
+	xe_vm_bind_sync(fd, vm, bo, 0, bo_addr, bo_size);
+
+	for (i = 0; i < n; i++) {
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &xe_engine(fd, 0)->instance, 0);
+		xe_exec_wait(fd, exec_queues[i], bo_addr);
+	}
+
+	for (i = 0; i < n; i++)
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
-	case 'S':
-		params.size_mb = atoi(optarg);
-		igt_debug("Size MB: %d\n", params.size_mb);
+	case 'Q':
+		params.quantity = atoi(optarg);
+		igt_debug("Resource quantity (memory in MB): %d\n", params.quantity);
 		break;
 	case 'p':
-		params.vram_percent = atoi(optarg);
-		igt_debug("Percent of VRAM: %d\n", params.vram_percent);
+		params.percent = atoi(optarg);
+		igt_debug("Percent of available resource: %d\n", params.percent);
 		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
@@ -287,11 +320,11 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	"  -S\tBO size in MB\n"
-	"  -p\tPercent of VRAM for BO\n"
+	"  -Q\tresource quantity (memory in MB)\n"
+	"  -p\tpercent of available resource\n"
 	;
 
-igt_main_args("S:p:", NULL, help_str, opt_handler, NULL)
+igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 {
 	int xe;
 
@@ -322,6 +355,10 @@ igt_main_args("S:p:", NULL, help_str, opt_handler, NULL)
 				create_big_vram(xe, gt);
 	}
 
+	igt_subtest("create-contexts") {
+		create_contexts(xe);
+	}
+
 	igt_subtest("multigpu-create-massive-size") {
 		int gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
 
-- 
2.40.0

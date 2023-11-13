Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE7510E18E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 19:21:01 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Nov 2023 20:20:56 +0100
Message-Id: <20231113192056.15916-1-marcin.bernatowicz@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] xe_create: create-big-vram subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adam.miszczak@intel.com, jakub1.kolakowski@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Validates the creation of significant Buffer Objects (BO) within VRAM,
accounting for 75% of the CPU-visible VRAM size.
The size of the created BO can be adjusted using command line parameters,
with '-S' representing BO size in MB,
and '-p' representing BO size as a percentage of the VRAM size.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
---
 tests/intel/xe_create.c | 79 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d99bd51cf..fc1b23823 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -18,6 +18,14 @@
 
 #define PAGE_SIZE 0x1000
 
+static struct param {
+	int size_MB;
+	int vram_percent;
+} params = {
+	.size_MB = 0,
+	.vram_percent = 75,
+};
+
 static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 		       uint32_t *handlep)
 {
@@ -207,7 +215,72 @@ static void create_massive_size(int fd)
 	}
 }
 
-igt_main
+/**
+ * SUBTEST: create-big-vram
+ * Functionality: BO creation
+ * Test category: functionality test
+ * Description: Validates the creation of substantial BO within VRAM
+ *              (constituting 75% of the CPU-visible VRAM).
+ */
+static void create_big_vram(int fd)
+{
+	uint64_t bo_size, size, vram_size, alignment;
+	uint32_t bo_handle;
+	char *bo_ptr = NULL;
+	uint64_t vm = 0;
+	int gt;
+
+	igt_require(xe_has_vram(fd));
+	alignment = xe_get_default_alignment(fd);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+
+	xe_for_each_gt(fd, gt) {
+		vram_size = xe_visible_vram_size(fd, gt);
+		bo_size = params.size_MB ? params.size_MB * 1024UL * 1024UL
+					 : ALIGN(vram_size * params.vram_percent / 100, alignment);
+		igt_debug("gt%u bo_size=%lu visible_vram_size=%lu\n", gt, bo_size, vram_size);
+
+		igt_assert_eq(0, __create_bo(fd, vm, bo_size, vram_memory(fd, gt), &bo_handle));
+		bo_ptr = xe_bo_map(fd, bo_handle, bo_size);
+		size = bo_size - 1;
+		while (size > SZ_64K) {
+			igt_assert_eq(0, READ_ONCE(bo_ptr[size]));
+			WRITE_ONCE(bo_ptr[size], 'A');
+			igt_assert_eq('A', READ_ONCE(bo_ptr[size]));
+			size >>= 1;
+		}
+		igt_assert_eq(0, bo_ptr[0]);
+		munmap(bo_ptr, bo_size);
+		gem_close(fd, bo_handle);
+	}
+
+	xe_vm_destroy(fd, vm);
+}
+
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'S':
+		params.size_MB = atoi(optarg);
+		igt_debug("Size MB: %d\n", params.size_MB);
+		break;
+	case 'p':
+		params.vram_percent = atoi(optarg);
+		igt_debug("Percent of VRAM: %d\n", params.vram_percent);
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -S\tBO size in MB\n"
+	"  -p\tPercent of VRAM for BO (default 75% of visible VRAM size)\n"
+	;
+
+igt_main_args("S:p:", NULL, help_str, opt_handler, NULL)
 {
 	int xe;
 
@@ -228,6 +301,10 @@ igt_main
 		create_massive_size(xe);
 	}
 
+	igt_subtest("create-big-vram") {
+		create_big_vram(xe);
+	}
+
 	igt_fixture
 		drm_close_driver(xe);
 }
-- 
2.31.1

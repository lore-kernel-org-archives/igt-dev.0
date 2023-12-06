Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B596F10E77A
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 17:02:22 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 18:01:56 +0100
Message-Id: <20231206170156.23120-3-marcin.bernatowicz@intel.com>
In-Reply-To: <20231206170156.23120-1-marcin.bernatowicz@intel.com>
References: <20231206170156.23120-1-marcin.bernatowicz@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v6 i-g-t 2/2] tests/intel/xe_create:
 create-big-vram subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adam.miszczak@intel.com, matthew.auld@intel.com,
 jakub1.kolakowski@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Validates the creation of significant Buffer Object (BO) within VRAM,
considering the entire available CPU-visible VRAM size.
The size of the created BO can be adjusted using command line
parameters, with '-S' representing BO size in MB,
and '-p' representing BO size as a percentage of the VRAM size.

v2: rebased, updated to uAPI changes (DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT),
    after review corrections: 1024UL -> 1024ULL,
    int -> unsigned int (Kamil)

v3: provided a flag to allocate the memory within the CPU-visible
      portion of VRAM (Matt)
    __create_bo replaced with xe_bo_create_flags (Lukasz)
    removed the percent command line parameter (Lukasz)
    renamed size_MB to size_mb (Lukasz)
    added helper function to query available CPU-visible VRAM size,
    renamed 'xe_vram_available' to 'xe_available_vram_size' for
      consistency with other function names

v4: split lib and test changes into separate patches (Lukasz, Kamil)
    added prefixes to titles (Kamil)
    restored percent command line parameter (Kamil)
    whitespace correction (Kamil)

v5: skip the test if there is no available visible VRAM (Kamil)
    split to per gt subtests
    simplified bo_size assignment

v6: adjustments to uAPI changes

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
---
 tests/intel/xe_create.c | 86 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index bbdddc7c9..6a1fe5750 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -18,6 +18,14 @@
 
 #define PAGE_SIZE 0x1000
 
+static struct param {
+	unsigned int size_mb;
+	unsigned int vram_percent;
+} params = {
+	.size_mb = 0,
+	.vram_percent = 100,
+};
+
 static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 		       uint32_t *handlep)
 {
@@ -216,7 +224,74 @@ static void create_massive_size(int fd)
 	}
 }
 
-igt_main
+/**
+ * SUBTEST: create-big-vram
+ * Functionality: BO creation
+ * Test category: functionality test
+ * Description: Verifies the creation of substantial BO within VRAM,
+ *		constituting all available CPU-visible VRAM.
+ */
+static void create_big_vram(int fd, int gt)
+{
+	uint64_t bo_size, size, visible_avail_size, alignment;
+	uint32_t bo_handle;
+	char *bo_ptr = NULL;
+	uint64_t vm = 0;
+
+	alignment = xe_get_default_alignment(fd);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+
+	visible_avail_size = xe_visible_available_vram_size(fd, gt);
+	igt_require(visible_avail_size);
+
+	bo_size = params.size_mb ? params.size_mb * 1024ULL * 1024ULL
+		  : ALIGN_DOWN(visible_avail_size * params.vram_percent / 100, alignment);
+	igt_require(bo_size);
+	igt_info("gt%u bo_size=%lu visible_available_vram_size=%lu\n",
+		gt, bo_size, visible_avail_size);
+
+	bo_handle = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
+				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bo_ptr = xe_bo_map(fd, bo_handle, bo_size);
+
+	size = bo_size - 1;
+	while (size > SZ_64K) {
+		igt_assert_eq(0, READ_ONCE(bo_ptr[size]));
+		WRITE_ONCE(bo_ptr[size], 'A');
+		igt_assert_eq('A', READ_ONCE(bo_ptr[size]));
+		size >>= 1;
+	}
+	igt_assert_eq(0, bo_ptr[0]);
+
+	munmap(bo_ptr, bo_size);
+	gem_close(fd, bo_handle);
+	xe_vm_destroy(fd, vm);
+}
+
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'S':
+		params.size_mb = atoi(optarg);
+		igt_debug("Size MB: %d\n", params.size_mb);
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
+	"  -p\tPercent of VRAM for BO\n"
+	;
+
+igt_main_args("S:p:", NULL, help_str, opt_handler, NULL)
 {
 	int xe;
 
@@ -255,6 +330,15 @@ igt_main
 		igt_waitchildren();
 	}
 
+	igt_subtest_with_dynamic("create-big-vram") {
+		int gt;
+
+		igt_require(xe_has_vram(xe));
+
+		xe_for_each_gt(xe, gt)
+			igt_dynamic_f("gt%u", gt)
+				create_big_vram(xe, gt);
+	}
 
 	igt_fixture
 		drm_close_driver(xe);
-- 
2.31.1

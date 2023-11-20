Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67DD10E112
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 18:24:53 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Nov 2023 18:24:20 +0000
Message-ID: <20231120182430.88753-6-matthew.auld@intel.com>
In-Reply-To: <20231120182430.88753-1-matthew.auld@intel.com>
References: <20231120182430.88753-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 05/15] tests/xe/mmap: add some tests for
 explicit cpu_caching
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

Ensure the various invalid combinations are rejected. Also ensure we can
mmap and fault anything that is valid.

v2: Rebase on coh_mode removal.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 tests/intel/xe_mmap.c | 51 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 7e7e43c00..bd894f26f 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -199,6 +199,54 @@ static void test_small_bar(int fd)
 	gem_close(fd, bo);
 }
 
+static void assert_caching(int fd, uint64_t flags, uint16_t cpu_caching, bool fail)
+{
+	uint64_t size = xe_get_default_alignment(fd);
+	uint64_t mmo;
+	uint32_t handle;
+	uint32_t *map;
+	bool ret;
+
+	ret = __xe_bo_create_caching(fd, 0, size, flags, cpu_caching, &handle);
+	igt_assert(ret == fail);
+
+	if (fail)
+		return;
+
+	mmo = xe_bo_mmap_offset(fd, handle);
+	map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
+	igt_assert(map != MAP_FAILED);
+	map[0] = 0xdeadbeaf;
+	gem_close(fd, handle);
+}
+
+/**
+ * SUBTEST: cpu-caching
+ * Description: Test explicit cpu_caching, including mmap behaviour.
+ * Test category: functionality test
+ */
+static void test_cpu_caching(int fd)
+{
+	if (vram_memory(fd, 0)) {
+		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CPU_CACHING_WC, false);
+		assert_caching(fd, vram_memory(fd, 0) | system_memory(fd),
+			       DRM_XE_GEM_CPU_CACHING_WC, false);
+
+		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CPU_CACHING_WB, true);
+		assert_caching(fd, vram_memory(fd, 0) | system_memory(fd),
+			       DRM_XE_GEM_CPU_CACHING_WB, true);
+	}
+
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WB, false);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC, false);
+
+	assert_caching(fd, system_memory(fd), -1, true);
+	assert_caching(fd, system_memory(fd), 0, true);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC + 1, true);
+}
+
 igt_main
 {
 	int fd;
@@ -230,6 +278,9 @@ igt_main
 		test_small_bar(fd);
 	}
 
+	igt_subtest("cpu-caching")
+		test_cpu_caching(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.42.0

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:09 +0100
Message-ID: <20231005153116.452319-6-matthew.auld@intel.com>
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/12] tests/xe/mmap: add some tests for
 cpu_caching and coh_mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ensure the various invalid combinations are rejected. Also ensure we can
mmap and fault anything that is valid.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 tests/intel/xe_mmap.c | 77 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 7e7e43c00..09e9c8aae 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -199,6 +199,80 @@ static void test_small_bar(int fd)
 	gem_close(fd, bo);
 }
 
+static void assert_caching(int fd, uint64_t flags, uint16_t cpu_caching,
+			   uint16_t coh_mode, bool fail)
+{
+	uint64_t size = xe_get_default_alignment(fd);
+	uint64_t mmo;
+	uint32_t handle;
+	uint32_t *map;
+	bool ret;
+
+	ret = __xe_bo_create_caching(fd, 0, size, flags, cpu_caching,
+				     coh_mode, &handle);
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
+ * SUBTEST: cpu-caching-coh
+ * Description: Test cpu_caching and coh, including mmap behaviour.
+ * Test category: functionality test
+ */
+static void test_cpu_caching(int fd)
+{
+	if (vram_memory(fd, 0)) {
+		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CPU_CACHING_WC, DRM_XE_GEM_COH_NONE,
+			       false);
+		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CPU_CACHING_WC, DRM_XE_GEM_COH_AT_LEAST_1WAY,
+			       false);
+		assert_caching(fd, vram_memory(fd, 0) | system_memory(fd),
+			       DRM_XE_GEM_CPU_CACHING_WC, DRM_XE_GEM_COH_NONE,
+			       false);
+
+		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CPU_CACHING_WB, DRM_XE_GEM_COH_NONE,
+			       true);
+		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CPU_CACHING_WB, DRM_XE_GEM_COH_AT_LEAST_1WAY,
+			       true);
+		assert_caching(fd, vram_memory(fd, 0) | system_memory(fd),
+			       DRM_XE_GEM_CPU_CACHING_WB, DRM_XE_GEM_COH_NONE,
+			       true);
+		assert_caching(fd, vram_memory(fd, 0) | system_memory(fd),
+			       DRM_XE_GEM_CPU_CACHING_WB, DRM_XE_GEM_COH_AT_LEAST_1WAY,
+			       true);
+	}
+
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WB,
+		       DRM_XE_GEM_COH_AT_LEAST_1WAY, false);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC,
+		       DRM_XE_GEM_COH_NONE, false);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC,
+		       DRM_XE_GEM_COH_AT_LEAST_1WAY, false);
+
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WB,
+		       DRM_XE_GEM_COH_NONE, true);
+	assert_caching(fd, system_memory(fd), -1, -1, true);
+	assert_caching(fd, system_memory(fd), 0, 0, true);
+	assert_caching(fd, system_memory(fd), 0, DRM_XE_GEM_COH_AT_LEAST_1WAY, true);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC, 0, true);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC + 1,
+		       DRM_XE_GEM_COH_AT_LEAST_1WAY, true);
+	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC,
+		       DRM_XE_GEM_COH_AT_LEAST_1WAY + 1, true);
+}
+
 igt_main
 {
 	int fd;
@@ -230,6 +304,9 @@ igt_main
 		test_small_bar(fd);
 	}
 
+	igt_subtest("cpu-caching-coh")
+		test_cpu_caching(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.41.0

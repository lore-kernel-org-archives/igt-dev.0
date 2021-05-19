Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Wed, 19 May 2021 15:53:34 +0100
Message-Id: <20210519145337.255167-7-matthew.auld@intel.com>
In-Reply-To: <20210519145337.255167-1-matthew.auld@intel.com>
References: <20210519145337.255167-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/9] tests/i915/gem_gpgpu_fill: Use memory
 region interface
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, petri.latvala@intel.com, intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

From: Andrzej Turko <andrzej.turko@linux.intel.com>

Converted the test gem_gpgpu_fill to use memory region uapi.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/i915/gem_gpgpu_fill.c | 42 ++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
index 5b11fb35..1fcd42e2 100644
--- a/tests/i915/gem_gpgpu_fill.c
+++ b/tests/i915/gem_gpgpu_fill.c
@@ -45,13 +45,14 @@
 #include "drm.h"
 #include "i915/gem.h"
 #include "igt.h"
+#include "igt_collection.h"
 #include "intel_bufops.h"
+#include "i915/intel_memory_region.h"
 
 #define WIDTH 64
 #define HEIGHT 64
 #define STRIDE (WIDTH)
 #define SIZE (HEIGHT*STRIDE)
-
 #define COLOR_C4	0xc4
 #define COLOR_4C	0x4c
 
@@ -62,10 +63,11 @@ typedef struct {
 } data_t;
 
 static struct intel_buf *
-create_buf(data_t *data, int width, int height, uint8_t color)
+create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
 {
 	struct intel_buf *buf;
 	uint8_t *ptr;
+	uint32_t handle;
 	int i;
 
 	buf = calloc(1, sizeof(*buf));
@@ -75,8 +77,10 @@ create_buf(data_t *data, int width, int height, uint8_t color)
 	 * Legacy code uses 32 bpp after buffer creation.
 	 * Let's do the same due to keep shader intact.
 	 */
-	intel_buf_init(data->bops, buf, width/4, height, 32, 0,
-		       I915_TILING_NONE, 0);
+	handle = gem_create_in_memory_regions(data->drm_fd, SIZE, region);
+	intel_buf_init_using_handle(data->bops, handle, buf,
+				    width/4, height, 32, 0,
+				    I915_TILING_NONE, 0);
 
 	ptr = gem_mmap__cpu_coherent(data->drm_fd, buf->handle, 0,
 				     buf->surface[0].size, PROT_WRITE);
@@ -99,15 +103,16 @@ static void buf_check(uint8_t *ptr, int x, int y, uint8_t color)
 		     color, val, x, y);
 }
 
-static void gpgpu_fill(data_t *data, igt_fillfunc_t fill)
+static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region)
 {
 	struct intel_buf *buf;
 	uint8_t *ptr;
 	int i, j;
 
-	buf = create_buf(data, WIDTH, HEIGHT, COLOR_C4);
+	buf = create_buf(data, WIDTH, HEIGHT, COLOR_C4, region);
 	ptr = gem_mmap__device_coherent(data->drm_fd, buf->handle, 0,
 					buf->surface[0].size, PROT_READ);
+
 	for (i = 0; i < WIDTH; i++)
 		for (j = 0; j < HEIGHT; j++)
 			buf_check(ptr, i, j, COLOR_C4);
@@ -123,10 +128,13 @@ static void gpgpu_fill(data_t *data, igt_fillfunc_t fill)
 
 	munmap(ptr, buf->surface[0].size);
 }
+
 igt_main
 {
 	data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
+	struct drm_i915_query_memory_regions *region_info;
+	struct igt_collection *region_set;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_render(DRIVER_INTEL);
@@ -138,12 +146,30 @@ igt_main
 
 		igt_require_f(fill_fn, "no gpgpu-fill function\n");
 
+		region_info = gem_get_query_memory_regions(data.drm_fd);
+		igt_assert(region_info);
+
+		region_set = get_memory_region_set(region_info,
+						   I915_SYSTEM_MEMORY);
 	}
 
-	igt_subtest("basic")
-		gpgpu_fill(&data, fill_fn);
+	igt_subtest_with_dynamic("basic") {
+		struct igt_collection *region;
+
+		for_each_combination(region, 1, region_set) {
+			char *name = memregion_dynamic_subtest_name(region);
+			uint32_t id = igt_collection_get_value(region, 0);
+
+			igt_dynamic(name)
+				gpgpu_fill(&data, fill_fn, id);
+
+			free(name);
+		}
+	}
 
 	igt_fixture {
+		igt_collection_destroy(region_set);
+		free(region_info);
 		buf_ops_destroy(data.bops);
 	}
 }
-- 
2.26.3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

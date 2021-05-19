Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Wed, 19 May 2021 15:53:33 +0100
Message-Id: <20210519145337.255167-6-matthew.auld@intel.com>
In-Reply-To: <20210519145337.255167-1-matthew.auld@intel.com>
References: <20210519145337.255167-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/9] tests/i915/gem_exec_basic: Use memory
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

Converted the test gem_exec_basic to use the memory region uapi.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/i915/gem_exec_basic.c | 50 +++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index 5021852f..8bc4dc52 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -22,17 +22,18 @@
  */
 
 #include "igt.h"
+#include "igt_collection.h"
 
 #include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl rings.");
 
-static uint32_t batch_create(int fd)
+static uint32_t batch_create(int fd, uint32_t batch_size, uint32_t region)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t handle;
 
-	handle = gem_create(fd, 4096);
+	handle = gem_create_in_memory_regions(fd, batch_size, region);
 	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
 
 	return handle;
@@ -41,36 +42,53 @@ static uint32_t batch_create(int fd)
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	struct drm_i915_query_memory_regions *query_info;
+	struct igt_collection *regions, *set;
+	uint32_t batch_size;
 	int fd = -1;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		/* igt_require_gem(fd); // test is mandatory */
 		igt_fork_hang_detector(fd);
+
+		query_info = gem_get_query_memory_regions(fd);
+		igt_assert(query_info);
+
+		set = get_memory_region_set(query_info,
+					    I915_SYSTEM_MEMORY);
 	}
 
 	igt_subtest_with_dynamic("basic") {
-		struct drm_i915_gem_exec_object2 exec = {
-			.handle = batch_create(fd),
-		};
+		for_each_combination(regions, 1, set) {
+			char *sub_name = memregion_dynamic_subtest_name(regions);
+			struct drm_i915_gem_exec_object2 exec;
+			uint32_t region = igt_collection_get_value(regions, 0);
 
-		__for_each_physical_engine(fd, e) {
-			igt_dynamic_f("%s", e->name) {
-				struct drm_i915_gem_execbuffer2 execbuf = {
-					.buffers_ptr = to_user_pointer(&exec),
-					.buffer_count = 1,
-					.flags = e->flags,
-				};
+			batch_size = gem_get_batch_size(fd, MEMORY_TYPE_FROM_REGION(region));
+			memset(&exec, 0, sizeof(exec));
+			exec.handle = batch_create(fd, batch_size, region);
 
-				gem_execbuf(fd, &execbuf);
+			__for_each_physical_engine(fd, e) {
+				igt_dynamic_f("%s-%s", e->name, sub_name) {
+					struct drm_i915_gem_execbuffer2 execbuf = {
+						.buffers_ptr = to_user_pointer(&exec),
+						.buffer_count = 1,
+						.flags = e->flags,
+					};
+
+					gem_execbuf(fd, &execbuf);
+				}
 			}
+			gem_sync(fd, exec.handle); /* catch any GPU hang */
+			gem_close(fd, exec.handle);
+			free(sub_name);
 		}
-
-		gem_sync(fd, exec.handle); /* catch any GPU hang */
-		gem_close(fd, exec.handle);
 	}
 
 	igt_fixture {
+		free(query_info);
+		igt_collection_destroy(set);
 		igt_stop_hang_detector();
 		close(fd);
 	}
-- 
2.26.3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

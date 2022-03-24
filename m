Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Mar 2022 14:26:18 +0000
Message-Id: <20220324142621.347452-2-matthew.auld@intel.com>
In-Reply-To: <20220324142621.347452-1-matthew.auld@intel.com>
References: <20220324142621.347452-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] test/gem_lmem_swapping: account for
 object rounding
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On DG2 the object size might be rounded when allocating lmem. Make sure
we account for any rounding up.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 tests/i915/gem_lmem_swapping.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 582111dd..193ff370 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -72,7 +72,7 @@ struct object {
 };
 
 static uint32_t create_bo(int i915,
-			  uint64_t size,
+			  uint64_t *size,
 			  struct drm_i915_gem_memory_class_instance *region,
 			  bool do_oom_test)
 {
@@ -80,7 +80,7 @@ static uint32_t create_bo(int i915,
 	int ret;
 
 retry:
-	ret = __gem_create_in_memory_region_list(i915, &handle, &size, region, 1);
+	ret = __gem_create_in_memory_region_list(i915, &handle, size, region, 1);
 	if (do_oom_test && ret == -ENOMEM)
 		goto retry;
 	igt_assert_eq(ret, 0);
@@ -172,7 +172,7 @@ static void __do_evict(int i915,
 
 	__gem_context_set_persistence(i915, 0, false);
 	size = 4096;
-	batch = create_bo(i915, size, region, params->oom_test);
+	batch = create_bo(i915, &size, region, params->oom_test);
 
 	gem_write(i915, batch, 0, &bbe, sizeof(bbe));
 
@@ -199,7 +199,7 @@ static void __do_evict(int i915,
 			params->count = i;
 			break;
 		}
-		obj->handle = create_bo(i915, obj->size, region, params->oom_test);
+		obj->handle = create_bo(i915, &obj->size, region, params->oom_test);
 
 		move_to_lmem(i915, objects + i, 1, batch, engine,
 			     params->oom_test);
@@ -270,7 +270,7 @@ static void fill_params(int i915, struct params *params,
 
 	if (flags & TEST_RANDOM) {
 		params->size.min = 4096;
-		handle = create_bo(i915, params->size.min, &region->region,
+		handle = create_bo(i915, &params->size.min, &region->region,
 				   do_oom_test);
 		gem_close(i915, handle);
 		params->size.max = 2 * size + params->size.min;
-- 
2.34.1

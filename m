Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEDF10E19E
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jan 2023 19:22:47 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 27 Jan 2023 21:22:20 +0200
Message-Id: <20230127192220.10071-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20230127192220.10071-1-ville.syrjala@linux.intel.com>
References: <20230127192220.10071-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] Silence compiler warnings on 32bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

uint64_t is unsigned long long on 32bit x86. Use %PRIu64
instead of %lu when printing them to avoid warnings.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_sysfs.c                | 5 +++--
 tests/i915/gem_lmem_swapping.c | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 8021ba9cbb2e..76593c4ac722 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -801,7 +801,8 @@ static int rw_attr_sweep(igt_sysfs_rw_attr_t *rw)
 	while (set < UINT64_MAX / 2) {
 		ret = igt_sysfs_set_u64(rw->dir, rw->attr, set);
 		get = igt_sysfs_get_u64(rw->dir, rw->attr);
-		igt_debug("'%s': ret %d set %lu get %lu\n", rw->attr, ret, set, get);
+		igt_debug("'%s': ret %d set %"PRIu64" get %"PRIu64"\n",
+			  rw->attr, ret, set, get);
 		if (ret && rw_attr_equal_within_epsilon(get, set, rw->tol)) {
 			igt_debug("'%s': matches\n", rw->attr);
 			num_points++;
@@ -845,7 +846,7 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
 	igt_assert(rw->start);	/* cannot be 0 */
 
 	prev = igt_sysfs_get_u64(rw->dir, rw->attr);
-	igt_debug("'%s': prev %lu\n", rw->attr, prev);
+	igt_debug("'%s': prev %"PRIu64"\n", rw->attr, prev);
 
 	ret = rw_attr_sweep(rw);
 
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 55b044ecdd63..e7608e3171f4 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -169,7 +169,7 @@ verify_object(int i915, const struct object *obj,  unsigned int flags)
 		uint32_t val = obj->seed + x;
 
 		igt_assert_f(buf[x] == val,
-			     "Object mismatch at offset %zu - found %08x, expected %08x; difference:%08x!\n",
+			     "Object mismatch at offset %lu - found %08x, expected %08x; difference:%08x!\n",
 			     x * sizeof(*buf), buf[x], val, buf[x] ^ val);
 	}
 
@@ -364,7 +364,7 @@ static void __do_evict(int i915,
 		}
 	}
 
-	igt_debug("obj size min/max=%lu %s/%lu %s, count=%u, seed: %u\n",
+	igt_debug("obj size min/max=%"PRIu64" %s/%"PRIu64" %s, count=%u, seed: %u\n",
 		  readable_size(params->size.min), readable_unit(params->size.min),
 		  readable_size(params->size.max), readable_unit(params->size.max),
 		  params->count, seed);
@@ -513,7 +513,7 @@ static void fill_params(int i915, struct params *params,
 		(region->probed_size >> 20);
 	igt_info("Memory: system-total %dMiB, lmem-region %lldMiB, usage-limit %dMiB\n",
 		 swap_mb, (region->probed_size >> 20), params->mem_limit);
-	igt_info("Using %u thread(s), %u loop(s), %u objects of %lu %s - %lu %s, seed: %u, oom: %s\n",
+	igt_info("Using %u thread(s), %u loop(s), %u objects of %"PRIu64" %s - %"PRIu64" %s, seed: %u, oom: %s\n",
 		 params->flags & TEST_PARALLEL ? nproc : 1,
 		 params->loops,
 		 params->count,
-- 
2.39.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 18 Jun 2020 11:47:40 +0100
Message-Id: <20200618104747.24005-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
References: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 04/11] gem_wsim: Move BO allocation to a
 helper
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index dd0b2e260a5a..23b81d181df3 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1490,6 +1490,11 @@ get_ctxid(struct workload *wrk, struct w_step *w)
 	return wrk->ctx_list[w->context].id;
 }
 
+static uint32_t alloc_bo(int i915, unsigned long size)
+{
+	return gem_create(i915, size);
+}
+
 static void
 alloc_step_batch(struct workload *wrk, struct w_step *w)
 {
@@ -1501,7 +1506,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
 	w->obj = calloc(nr_obj, sizeof(*w->obj));
 	igt_assert(w->obj);
 
-	w->obj[j].handle = gem_create(fd, 4096);
+	w->obj[j].handle = alloc_bo(fd, 4096);
 	w->obj[j].flags = EXEC_OBJECT_WRITE;
 	j++;
 	igt_assert(j < nr_obj);
@@ -1546,7 +1551,8 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
 	else
 		w->bb_sz = get_bb_sz(w, w->duration.max);
 
-	w->bb_handle = w->obj[j].handle = gem_create(fd, w->bb_sz + (w->unbound_duration ? 4096 : 0));
+	w->bb_handle = w->obj[j].handle =
+		alloc_bo(fd, w->bb_sz + (w->unbound_duration ? 4096 : 0));
 	init_bb(w);
 	w->obj[j].relocation_count = terminate_bb(w);
 
@@ -1703,7 +1709,7 @@ static void allocate_working_set(struct working_set *set)
 	igt_assert(set->handles);
 
 	for (i = 0; i < set->nr; i++)
-		set->handles[i] = gem_create(fd, set->sizes[i]);
+		set->handles[i] = alloc_bo(fd, set->sizes[i]);
 }
 
 #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, sz__); })
@@ -2339,7 +2345,7 @@ static unsigned long calibrate_nop(unsigned int tolerance_pct, struct intel_exec
 	do {
 		struct timespec t_start;
 
-		obj.handle = gem_create(fd, size);
+		obj.handle = alloc_bo(fd, size);
 		gem_write(fd, obj.handle, size - sizeof(bbe), &bbe,
 			  sizeof(bbe));
 		gem_execbuf(fd, &eb);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

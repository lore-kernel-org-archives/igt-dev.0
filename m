Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Mon, 27 Apr 2020 10:00:14 +0100
Message-Id: <20200427090014.10041-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] gem_wsim: Fix preempt period assert
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

Recently added assert in a common helper used for calculating batch
duration and preemption period is harmful when preemption is disabled on a
context. Split out into low level and high level helper and use the former
for preemption period queries.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 81f47b86d619..ad4edb936920 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1151,7 +1151,7 @@ __get_ctx(struct workload *wrk, const struct w_step *w)
 }
 
 static unsigned long
-get_bb_sz(const struct w_step *w, unsigned int duration)
+__get_bb_sz(const struct w_step *w, unsigned int duration)
 {
 	enum intel_engine_id engine = w->engine;
 	struct ctx *ctx = __get_ctx(w->wrk, w);
@@ -1165,6 +1165,15 @@ get_bb_sz(const struct w_step *w, unsigned int duration)
 	d = ALIGN(duration * engine_calib_map[engine] * sizeof(uint32_t) /
 		  nop_calibration_us,
 		  sizeof(uint32_t));
+
+	return d;
+}
+
+static unsigned long
+get_bb_sz(const struct w_step *w, unsigned int duration)
+{
+	unsigned long d = __get_bb_sz(w, duration);
+
 	igt_assert(d);
 
 	return d;
@@ -1174,7 +1183,7 @@ static void
 init_bb(struct w_step *w, unsigned int flags)
 {
 	const unsigned int arb_period =
-			get_bb_sz(w, w->preempt_us) / sizeof(uint32_t);
+			__get_bb_sz(w, w->preempt_us) / sizeof(uint32_t);
 	const unsigned int mmap_len = ALIGN(w->bb_sz, 4096);
 	unsigned int i;
 	uint32_t *ptr;
@@ -1395,7 +1404,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w, unsigned int flags)
 
 	if (w->unbound_duration)
 		/* nops + MI_ARB_CHK + MI_BATCH_BUFFER_START */
-		w->bb_sz = max(PAGE_SIZE, get_bb_sz(w, w->preempt_us)) +
+		w->bb_sz = max(PAGE_SIZE, __get_bb_sz(w, w->preempt_us)) +
 			   (1 + 3) * sizeof(uint32_t);
 	else
 		w->bb_sz = get_bb_sz(w, w->duration.max);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

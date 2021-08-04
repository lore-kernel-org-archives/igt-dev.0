Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue,  3 Aug 2021 18:23:02 -0700
Message-Id: <20210804012303.158392-3-matthew.brost@intel.com>
In-Reply-To: <20210804012303.158392-1-matthew.brost@intel.com>
References: <20210804012303.158392-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] i915/gem_ctx_shared: Make
 gem_ctx_shared understand static priority mapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The i915 currently has 2k visible priority levels which are currently
unique. This is changing to statically map these 2k levels into 3
buckets:

low: < 0
mid: 0
high: > 0

Update gem_ctx_shared to understand this. This entails updating
promotion test to use 3 levels that will map into different buckets and
also add bit of delay after releasing a cork beforing completing the
spinners.

v2: Add a delay between starting releasing spinner and cork in
promotion

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/gem_ctx_shared.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 4441e6eb7..b3a156ca4 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -571,7 +571,8 @@ create_highest_priority(int i915, const intel_ctx_cfg_t *cfg)
 }
 
 static void unplug_show_queue(int i915, struct igt_cork *c,
-			      const intel_ctx_cfg_t *cfg, unsigned int engine)
+			      const intel_ctx_cfg_t *cfg, unsigned int engine,
+			      unsigned int usec_delay)
 {
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 
@@ -583,6 +584,7 @@ static void unplug_show_queue(int i915, struct igt_cork *c,
 
 	igt_cork_unplug(c); /* batches will now be queued on the engine */
 	igt_debugfs_dump(i915, "i915_engine_info");
+	usleep(usec_delay);
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++)
 		igt_spin_free(i915, spin[n]);
@@ -734,7 +736,7 @@ static void reorder(int i915, const intel_ctx_cfg_t *cfg,
 	store_dword(i915, ctx[LO], ring, scratch, 0, ctx[LO]->id, plug, 0);
 	store_dword(i915, ctx[HI], ring, scratch, 0, ctx[HI]->id, plug, 0);
 
-	unplug_show_queue(i915, &cork, &q_cfg, ring);
+	unplug_show_queue(i915, &cork, &q_cfg, ring, 0);
 	gem_close(i915, plug);
 
 	ptr = gem_mmap__device_coherent(i915, scratch, 0, 4096, PROT_READ);
@@ -771,10 +773,10 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	gem_context_set_priority(i915, ctx[LO]->id, MIN_PRIO);
 
 	ctx[HI] = intel_ctx_create(i915, &q_cfg);
-	gem_context_set_priority(i915, ctx[HI]->id, 0);
+	gem_context_set_priority(i915, ctx[HI]->id, MAX_PRIO);
 
 	ctx[NOISE] = intel_ctx_create(i915, &q_cfg);
-	gem_context_set_priority(i915, ctx[NOISE]->id, MIN_PRIO/2);
+	gem_context_set_priority(i915, ctx[NOISE]->id, 0);
 
 	result = gem_create(i915, 4096);
 	dep = gem_create(i915, 4096);
@@ -795,7 +797,7 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 
 	store_dword(i915, ctx[HI], ring, result, 0, ctx[HI]->id, 0, 0);
 
-	unplug_show_queue(i915, &cork, &q_cfg, ring);
+	unplug_show_queue(i915, &cork, &q_cfg, ring, 250000);
 	gem_close(i915, plug);
 
 	ptr = gem_mmap__device_coherent(i915, dep, 0, 4096, PROT_READ);
-- 
2.28.0

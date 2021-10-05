Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7AE6E095
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 16:52:52 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue,  5 Oct 2021 09:47:45 -0700
Message-Id: <20211005164746.14411-3-matthew.brost@intel.com>
In-Reply-To: <20211005164746.14411-1-matthew.brost@intel.com>
References: <20211005164746.14411-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/3] i915/gem_ctx_shared: Make gem_ctx_shared
 understand static priority mapping
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
spinners to give time to the i915 schedule to process the fence and
release and queue the requests.

v2: Add a delay between starting releasing spinner and cork in
promotion
v3:
 (Daniele)
  - Always add delay, update commit message
v4:
 (Tvrtko)
  - Reduce sleep period
 (Daniele)
  - Add comment in code by sleep

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/gem_ctx_shared.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index ea1b5dd1b..34ffef7d0 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -623,6 +623,9 @@ static void unplug_show_queue(int i915, struct igt_cork *c, uint64_t ahnd,
 	igt_cork_unplug(c); /* batches will now be queued on the engine */
 	igt_debugfs_dump(i915, "i915_engine_info");
 
+	/* give time to the kernel to complete the queueing */
+	usleep(25000);
+
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 		ahnd = spin[n]->ahnd;
 		igt_spin_free(i915, spin[n]);
@@ -831,10 +834,10 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	gem_context_set_priority(i915, ctx[LO]->id, MIN_PRIO);
 
 	ctx[HI] = intel_ctx_create(i915, &q_cfg);
-	gem_context_set_priority(i915, ctx[HI]->id, 0);
+	gem_context_set_priority(i915, ctx[HI]->id, MAX_PRIO);
 
 	ctx[NOISE] = intel_ctx_create(i915, &q_cfg);
-	gem_context_set_priority(i915, ctx[NOISE]->id, MIN_PRIO/2);
+	gem_context_set_priority(i915, ctx[NOISE]->id, 0);
 
 	result = gem_create(i915, 4096);
 	result_offset = get_offset(ahnd, result, 4096, 0);
-- 
2.32.0

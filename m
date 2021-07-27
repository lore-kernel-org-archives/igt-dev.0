Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue, 27 Jul 2021 08:22:02 -0700
Message-Id: <20210727152202.9527-8-matthew.brost@intel.com>
In-Reply-To: <20210727152202.9527-1-matthew.brost@intel.com>
References: <20210727152202.9527-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 7/7] i915/gem_ctx_shared: Make
 gem_ctx_shared understand static priority mapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The i915 currently has 2k visible priority levels which are currently
unique. This is changing to statically map these 2k levels into 3
buckets:

low: < 0
mid: 0
high: > 0

Update gem_scheduler to understand this. This entails updating promotion
test to use 3 levels that will map into different buckets and also
delete a racey check.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/gem_ctx_shared.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 4441e6eb7..0d95df8a5 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -771,10 +771,10 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	gem_context_set_priority(i915, ctx[LO]->id, MIN_PRIO);
 
 	ctx[HI] = intel_ctx_create(i915, &q_cfg);
-	gem_context_set_priority(i915, ctx[HI]->id, 0);
+	gem_context_set_priority(i915, ctx[HI]->id, MAX_PRIO);
 
 	ctx[NOISE] = intel_ctx_create(i915, &q_cfg);
-	gem_context_set_priority(i915, ctx[NOISE]->id, MIN_PRIO/2);
+	gem_context_set_priority(i915, ctx[NOISE]->id, 0);
 
 	result = gem_create(i915, 4096);
 	dep = gem_create(i915, 4096);
@@ -811,7 +811,6 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(i915, result);
 
-	igt_assert_eq_u32(ptr[0], ctx[NOISE]->id);
 	munmap(ptr, 4096);
 
 	intel_ctx_destroy(i915, ctx[NOISE]);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

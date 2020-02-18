Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9611F6E081
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 16:16:18 +0000 (UTC)
From: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
Date: Tue, 18 Feb 2020 05:47:10 +0530
Message-Id: <20200218001710.16537-3-sreedhar.telukuntla@intel.com>
In-Reply-To: <20200218001710.16537-1-sreedhar.telukuntla@intel.com>
References: <20200218001710.16537-1-sreedhar.telukuntla@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_ctx_shared: Use
 gem_mmap__device_coherent_sync api
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Replace the existing gem_mmap__device_coherent and gem_set_domain
calls with the new api gem_mmap__device_coherent_sync which takes
care of setting the appropriate memory domain along with memory mapping

Signed-off-by: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/gem_ctx_shared.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 820b96c1..d7d86bc5 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -214,9 +214,8 @@ static void exec_shared_gtt(int i915, unsigned int ring)
 	gem_close(i915, scratch);
 
 	scratch = gem_create(i915, 4096);
-	s = gem_mmap__wc(i915, scratch, 0, 4096, PROT_WRITE);
+	s = gem_mmap__device_coherent_sync(i915, scratch, 0, 4096, PROT_WRITE);
 
-	gem_set_domain(i915, scratch, I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
 	s[0] = bbe;
 	s[64] = bbe;
 
@@ -605,9 +604,7 @@ static void independent(int i915, unsigned ring, unsigned flags)
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
 		uint32_t *ptr;
 
-		ptr = gem_mmap__device_coherent(i915, handle[i], 0, 4096, PROT_READ);
-		gem_set_domain(i915, handle[i], /* no write hazard lies! */
-			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+		ptr = gem_mmap__device_coherent_sync(i915, handle[i], 0, 4096, PROT_READ);
 		gem_close(i915, handle[i]);
 
 		handle[i] = ptr[TIMESTAMP];
@@ -650,9 +647,7 @@ static void reorder(int i915, unsigned ring, unsigned flags)
 	gem_context_destroy(i915, ctx[LO]);
 	gem_context_destroy(i915, ctx[HI]);
 
-	ptr = gem_mmap__device_coherent(i915, scratch, 0, 4096, PROT_READ);
-	gem_set_domain(i915, scratch, /* no write hazard lies! */
-		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+	ptr = gem_mmap__device_coherent_sync(i915, scratch, 0, 4096, PROT_READ);
 	gem_close(i915, scratch);
 
 	if (flags & EQUAL) /* equal priority, result will be fifo */
@@ -705,17 +700,13 @@ static void promotion(int i915, unsigned ring)
 	gem_context_destroy(i915, ctx[LO]);
 	gem_context_destroy(i915, ctx[HI]);
 
-	ptr = gem_mmap__device_coherent(i915, dep, 0, 4096, PROT_READ);
-	gem_set_domain(i915, dep, /* no write hazard lies! */
-			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+	ptr = gem_mmap__device_coherent_sync(i915, dep, 0, 4096, PROT_READ);
 	gem_close(i915, dep);
 
 	igt_assert_eq_u32(ptr[0], ctx[HI]);
 	munmap(ptr, 4096);
 
-	ptr = gem_mmap__device_coherent(i915, result, 0, 4096, PROT_READ);
-	gem_set_domain(i915, result, /* no write hazard lies! */
-			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+	ptr = gem_mmap__device_coherent_sync(i915, result, 0, 4096, PROT_READ);
 	gem_close(i915, result);
 
 	igt_assert_eq_u32(ptr[0], ctx[NOISE]);
@@ -768,9 +759,7 @@ static void smoketest(int i915, unsigned ring, unsigned timeout)
 	}
 	igt_waitchildren();
 
-	ptr = gem_mmap__device_coherent(i915, scratch, 0, 4096, PROT_READ);
-	gem_set_domain(i915, scratch, /* no write hazard lies! */
-			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+	ptr = gem_mmap__device_coherent_sync(i915, scratch, 0, 4096, PROT_READ);
 	gem_close(i915, scratch);
 
 	for (unsigned n = 0; n < ncpus; n++) {
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

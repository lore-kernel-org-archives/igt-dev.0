Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  7 Jan 2020 11:29:13 +0000
Message-Id: <20200107112913.2726371-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_engine: Skip redundant clear
 of a fresh buffer
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

No need to memset(0) the mapping of a fresh buffer, as we expect it to
be 0 already.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_ctx_engines.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 55794a438..86c4bea5a 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -454,7 +454,6 @@ static void independent(int i915)
 	map = gem_mmap__cpu(i915, results.handle, 0, 4096, PROT_READ);
 	gem_set_domain(i915, results.handle,
 		       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
-	memset(map, 0, 4096);
 
 	for (int i = 0; i < I915_EXEC_RING_MASK + 1; i++) {
 		struct drm_i915_gem_exec_object2 obj[2] = {
-- 
2.25.0.rc1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

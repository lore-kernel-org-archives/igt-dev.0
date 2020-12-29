Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 29 Dec 2020 20:06:47 +0000
Message-Id: <20201229200647.629624-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_engine: Check idempotency by
 passing all known engines
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
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Don't rely on just rcs0 being well defined, check that we return a list
of each engine when asked.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_engines.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index be7d5733f..12c6b84ca 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -230,15 +230,21 @@ static void idempotent(int i915)
 	igt_assert_eq(p.size, base + idx);
 	igt_assert(!memcmp(&expected, &engines, idx));
 
-	memset(&engines, 0, sizeof(engines));
 	p.size = sizeof(engines);
-	gem_context_set_param(i915, &p);
+	__for_each_physical_engine(i915, e) {
+		memset(&engines, 0, sizeof(engines));
+		for (int n = 0; n < I915_EXEC_RING_MASK + 1; n++) {
+			engine_class(&engines, n) = e->class;
+			engine_instance(&engines, n) = e->instance;
+		}
+		gem_context_set_param(i915, &p);
 
-	memcpy(&expected, &engines, sizeof(expected));
+		memcpy(&expected, &engines, sizeof(expected));
 
-	gem_context_get_param(i915, &p);
-	igt_assert_eq(p.size, sizeof(engines));
-	igt_assert(!memcmp(&expected, &engines, idx));
+		gem_context_get_param(i915, &p);
+		igt_assert_eq(p.size, sizeof(engines));
+		igt_assert(!memcmp(&expected, &engines, p.size));
+	}
 
 	gem_context_destroy(i915, p.ctx_id);
 }
-- 
2.30.0.rc2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

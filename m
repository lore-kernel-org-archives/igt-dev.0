Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 20 Feb 2020 16:53:01 +0000
Message-Id: <20200220165301.1996742-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_eio: Trim kms workload
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

We don't need to try reset-stress on every engine with the display, just
once is enough to stress any interlinkage.

This should reduce the runtime to 10s.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Martin Peres <martin.peres@linux.intel.com>
---
 tests/i915/gem_eio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 0fe51efeb..1ec609410 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -898,8 +898,14 @@ static void test_kms(int i915, igt_display_t *dpy)
 
 	test_inflight(i915, 0);
 	if (gem_has_contexts(i915)) {
-		test_reset_stress(i915, 0);
-		test_reset_stress(i915, TEST_WEDGE);
+		uint32_t ctx = context_create_safe(i915);
+
+		reset_stress(i915, ctx,
+			     "default", I915_EXEC_DEFAULT, 0);
+		reset_stress(i915, ctx,
+			     "default", I915_EXEC_DEFAULT, TEST_WEDGE);
+
+		gem_context_destroy(i915, ctx);
 	}
 
 	*shared = 1;
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

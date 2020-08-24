Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 24 Aug 2020 15:49:51 +0100
Message-Id: <20200824144951.146547-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_schedule: Set
 preempt_timeout_ms for fast hang tests
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

Reduce the preemption timeout to 150ms (from infinity for tgl! tsk,
tsk) so that the preemption hang tests run quicker.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_schedule.c | 37 ++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 488d93511..e316cf4d7 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -1235,9 +1235,18 @@ static void promotion(int fd, unsigned ring)
 	igt_assert_eq_u32(result_read, ctx[NOISE]);
 }
 
+static bool set_preempt_timeout(int i915,
+				const struct intel_execution_engine2 *e,
+				int timeout_ms)
+{
+	return gem_engine_property_printf(i915, e->name,
+					  "preempt_timeout_ms",
+					  "%d", timeout_ms) > 0;
+}
+
 #define NEW_CTX (0x1 << 0)
 #define HANG_LP (0x1 << 1)
-static void preempt(int fd, unsigned ring, unsigned flags)
+static void preempt(int fd, const struct intel_execution_engine2 *e, unsigned flags)
 {
 	uint32_t result = gem_create(fd, 4096);
 	uint32_t result_read;
@@ -1245,6 +1254,9 @@ static void preempt(int fd, unsigned ring, unsigned flags)
 	uint32_t ctx[2];
 	igt_hang_t hang;
 
+	/* Set a fast timeout to speed the test up (if available) */
+	set_preempt_timeout(fd, e, 150);
+
 	ctx[LO] = gem_context_clone_with_engines(fd, 0);
 	gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
 
@@ -1252,7 +1264,7 @@ static void preempt(int fd, unsigned ring, unsigned flags)
 	gem_context_set_priority(fd, ctx[HI], MAX_PRIO);
 
 	if (flags & HANG_LP)
-		hang = igt_hang_ctx(fd, ctx[LO], ring, 0);
+		hang = igt_hang_ctx(fd, ctx[LO], e->flags, 0);
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 		if (flags & NEW_CTX) {
@@ -1262,10 +1274,10 @@ static void preempt(int fd, unsigned ring, unsigned flags)
 		}
 		spin[n] = __igt_spin_new(fd,
 					 .ctx = ctx[LO],
-					 .engine = ring);
+					 .engine = e->flags);
 		igt_debug("spin[%d].handle=%d\n", n, spin[n]->handle);
 
-		store_dword(fd, ctx[HI], ring, result, 0, n + 1, I915_GEM_DOMAIN_RENDER);
+		store_dword(fd, ctx[HI], e->flags, result, 0, n + 1, I915_GEM_DOMAIN_RENDER);
 
 		result_read = __sync_read_u32(fd, result, 0);
 		igt_assert_eq_u32(result_read, n + 1);
@@ -1601,12 +1613,15 @@ static void preempt_self(int fd, unsigned ring)
 	gem_close(fd, result);
 }
 
-static void preemptive_hang(int fd, unsigned ring)
+static void preemptive_hang(int fd, const struct intel_execution_engine2 *e)
 {
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 	igt_hang_t hang;
 	uint32_t ctx[2];
 
+	/* Set a fast timeout to speed the test up (if available) */
+	set_preempt_timeout(fd, e, 150);
+
 	ctx[HI] = gem_context_clone_with_engines(fd, 0);
 	gem_context_set_priority(fd, ctx[HI], MAX_PRIO);
 
@@ -1616,12 +1631,12 @@ static void preemptive_hang(int fd, unsigned ring)
 
 		spin[n] = __igt_spin_new(fd,
 					 .ctx = ctx[LO],
-					 .engine = ring);
+					 .engine = e->flags);
 
 		gem_context_destroy(fd, ctx[LO]);
 	}
 
-	hang = igt_hang_ctx(fd, ctx[HI], ring, 0);
+	hang = igt_hang_ctx(fd, ctx[HI], e->flags, 0);
 	igt_post_hang_ring(fd, hang);
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
@@ -2603,10 +2618,10 @@ igt_main
 			}
 
 			test_each_engine_store("preempt", fd, e)
-				preempt(fd, e->flags, 0);
+				preempt(fd, e, 0);
 
 			test_each_engine_store("preempt-contexts", fd, e)
-				preempt(fd, e->flags, NEW_CTX);
+				preempt(fd, e, NEW_CTX);
 
 			test_each_engine_store("preempt-self", fd, e)
 				preempt_self(fd, e->flags);
@@ -2640,10 +2655,10 @@ igt_main
 				}
 
 				test_each_engine_store("preempt-hang", fd, e)
-					preempt(fd, e->flags, NEW_CTX | HANG_LP);
+					preempt(fd, e, NEW_CTX | HANG_LP);
 
 				test_each_engine_store("preemptive-hang", fd, e)
-					preemptive_hang(fd, e->flags);
+					preemptive_hang(fd, e);
 
 				igt_fixture {
 					igt_disallow_hang(fd, hang);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 13 Jan 2022 11:59:35 -0800
Message-Id: <20220113195947.1536897-4-John.C.Harrison@Intel.com>
In-Reply-To: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 i-g-t 03/15] tests/i915/i915_hangman: Update
 capture test to use engine structure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The capture test was still using old style ring_id and ring_name
(derived from the engine structure at the higher level). Update it to
just take the engine structure directly.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/i915_hangman.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index f64b8819d..280eac197 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -207,8 +207,8 @@ static void check_error_state(const char *expected_ring_name,
 	igt_assert(found);
 }
 
-static void test_error_state_capture(const intel_ctx_t *ctx, unsigned ring_id,
-				     const char *ring_name)
+static void test_error_state_capture(const intel_ctx_t *ctx,
+				     const struct intel_execution_engine2 *e)
 {
 	uint32_t *batch;
 	igt_hang_t hang;
@@ -217,7 +217,7 @@ static void test_error_state_capture(const intel_ctx_t *ctx, unsigned ring_id,
 
 	clear_error_state();
 
-	hang = igt_hang_ctx_with_ahnd(device, ahnd, ctx->id, ring_id,
+	hang = igt_hang_ctx_with_ahnd(device, ahnd, ctx->id, e->flags,
 				      HANG_ALLOW_CAPTURE);
 	offset = hang.spin->obj[IGT_SPIN_BATCH].offset;
 
@@ -226,7 +226,7 @@ static void test_error_state_capture(const intel_ctx_t *ctx, unsigned ring_id,
 
 	igt_post_hang_ring(device, hang);
 
-	check_error_state(ring_name, offset, batch);
+	check_error_state(e->name, offset, batch);
 	munmap(batch, 4096);
 	put_ahnd(ahnd);
 }
@@ -351,7 +351,7 @@ igt_main
 	igt_subtest_with_dynamic("error-state-capture") {
 		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				test_error_state_capture(ctx, e->flags, e->name);
+				test_error_state_capture(ctx, e);
 		}
 	}
 
-- 
2.25.1

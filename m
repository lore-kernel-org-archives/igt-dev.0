Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430676EC7C
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:31:23 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id e20so6436095pgg.0
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:31:23 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:30:18 -0500
Message-Id: <20210609043035.102359-33-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 32/93] tests/i915/i915_hangman: Convert to
 intel_ctx_t
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
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/i915_hangman.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index f6fac283..08f0ebb3 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -205,7 +205,7 @@ static void check_error_state(const char *expected_ring_name,
 	igt_assert(found);
 }
 
-static void test_error_state_capture(unsigned ring_id,
+static void test_error_state_capture(const intel_ctx_t *ctx, unsigned ring_id,
 				     const char *ring_name)
 {
 	uint32_t *batch;
@@ -214,7 +214,7 @@ static void test_error_state_capture(unsigned ring_id,
 
 	clear_error_state();
 
-	hang = igt_hang_ctx(device, 0, ring_id, HANG_ALLOW_CAPTURE);
+	hang = igt_hang_ctx(device, ctx->id, ring_id, HANG_ALLOW_CAPTURE);
 	offset = hang.spin->obj[IGT_SPIN_BATCH].offset;
 
 	batch = gem_mmap__cpu(device, hang.spin->handle, 0, 4096, PROT_READ);
@@ -227,32 +227,34 @@ static void test_error_state_capture(unsigned ring_id,
 }
 
 static void
-test_engine_hang(const struct intel_execution_engine2 *e, unsigned int flags)
+test_engine_hang(const intel_ctx_t *ctx,
+		 const struct intel_execution_engine2 *e, unsigned int flags)
 {
 	const struct intel_execution_engine2 *other;
+	const intel_ctx_t *tmp_ctx;
 	igt_spin_t *spin, *next;
 	IGT_LIST_HEAD(list);
-	uint32_t ctx;
 
 	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
 		    gem_has_cmdparser(device, e->flags));
 
 	/* Fill all the other engines with background load */
-	__for_each_physical_engine(device, other) {
+	for_each_ctx_engine(device, ctx, other) {
 		if (other->flags == e->flags)
 			continue;
 
-		ctx = gem_context_clone_with_engines(device, 0);
-		spin = __igt_spin_new(device, ctx,
+		tmp_ctx = intel_ctx_create(device, &ctx->cfg);
+		spin = __igt_spin_new(device, .ctx = tmp_ctx,
 				      .engine = other->flags,
 				      .flags = IGT_SPIN_FENCE_OUT);
-		gem_context_destroy(device, ctx);
+		intel_ctx_destroy(device, tmp_ctx);
 
 		igt_list_move(&spin->link, &list);
 	}
 
 	/* And on the target engine, we hang */
 	spin = igt_spin_new(device,
+			    .ctx = ctx,
 			    .engine = e->flags,
 			    .flags = (IGT_SPIN_FENCE_OUT |
 				      IGT_SPIN_NO_PREEMPTION |
@@ -311,13 +313,16 @@ static void hangcheck_unterminated(void)
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
 	igt_hang_t hang = {};
 
 	igt_fixture {
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
 
-		hang = igt_allow_hang(device, 0, HANG_ALLOW_CAPTURE);
+		ctx = intel_ctx_create_all_physical(device);
+
+		hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE);
 
 		sysfs = igt_sysfs_open(device);
 		igt_assert(sysfs != -1);
@@ -329,9 +334,9 @@ igt_main
 		test_error_state_basic();
 
 	igt_subtest_with_dynamic("error-state-capture") {
-		__for_each_physical_engine(device, e) {
+		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				test_error_state_capture(e->flags, e->name);
+				test_error_state_capture(ctx, e->flags, e->name);
 		}
 	}
 
@@ -347,9 +352,9 @@ igt_main
                 ioctl(device, DRM_IOCTL_I915_GETPARAM, &gp);
 		igt_require(has_gpu_reset > 1);
 
-		__for_each_physical_engine(device, e) {
+		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				test_engine_hang(e, 0);
+				test_engine_hang(ctx, e, 0);
 		}
 	}
 
@@ -364,9 +369,9 @@ igt_main
 		ioctl(device, DRM_IOCTL_I915_GETPARAM, &gp);
 		igt_require(has_gpu_reset > 1);
 
-		__for_each_physical_engine(device, e) {
+		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				test_engine_hang(e, IGT_SPIN_INVALID_CS);
+				test_engine_hang(ctx, e, IGT_SPIN_INVALID_CS);
 		}
 	}
 
@@ -375,5 +380,7 @@ igt_main
 
 	igt_fixture {
 		igt_disallow_hang(device, hang);
+		intel_ctx_destroy(device, ctx);
+		close(device);
 	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

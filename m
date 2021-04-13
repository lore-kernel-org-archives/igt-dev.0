Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD786E239
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:14 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id p16so3530461plf.12
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:14 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:31 -0500
Message-Id: <20210413035350.261794-56-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 55/74] tests/i915/gem_ctx_persistence: Drop
 the clone subtest
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

---
 tests/i915/gem_ctx_persistence.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 10d057f1..91c30176 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -147,33 +147,6 @@ static void test_idempotent(int i915)
 	igt_assert_eq(p.value, expected);
 }
 
-static void test_clone(int i915)
-{
-	struct drm_i915_gem_context_param p = {
-		.param = I915_CONTEXT_PARAM_PERSISTENCE,
-	};
-	uint32_t ctx, clone;
-
-	/*
-	 * Check that persistence is inherited across a clone.
-	 */
-	igt_require( __gem_context_create(i915, &ctx) == 0);
-
-	p.ctx_id = ctx;
-	p.value = 0;
-	gem_context_set_param(i915, &p);
-
-	clone = gem_context_clone(i915, ctx, I915_CONTEXT_CLONE_FLAGS, 0);
-	gem_context_destroy(i915, ctx);
-
-	p.ctx_id = clone;
-	p.value = -1;
-	gem_context_get_param(i915, &p);
-	igt_assert_eq(p.value, 0);
-
-	gem_context_destroy(i915, clone);
-}
-
 static void test_persistence(int i915, unsigned int engine)
 {
 	igt_spin_t *spin;
@@ -1366,9 +1339,6 @@ igt_main
 	igt_subtest("idempotent")
 		test_idempotent(i915);
 
-	igt_subtest("clone")
-		test_clone(i915);
-
 	igt_subtest("file")
 		test_nonpersistent_file(i915);
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

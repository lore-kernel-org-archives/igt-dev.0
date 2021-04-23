Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF456EC93
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:53:12 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id f29so36056670pgm.8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:53:12 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:52:51 -0500
Message-Id: <20210423215252.877174-10-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 88/89] tests/i915/gem_ctx_param: Stop
 setting VMs on old contexts
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

We can still test all the same basic functionality, we just have to
re-create the context more often.
---
 tests/i915/gem_ctx_param.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index 47fea06d..3c27c78c 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -161,6 +161,7 @@ static void test_vm(int i915)
 	struct drm_i915_gem_context_param arg = {
 		.param = I915_CONTEXT_PARAM_VM,
 	};
+	int err;
 	uint32_t parent, child;
 	igt_spin_t *spin;
 
@@ -173,8 +174,11 @@ static void test_vm(int i915)
 	 * in the next context that shared the VM.
 	 */
 
+	arg.ctx_id = gem_context_create(i915);
 	arg.value = -1ull;
-	igt_require(__gem_context_set_param(i915, &arg) == -ENOENT);
+	err = __gem_context_set_param(i915, &arg);
+	gem_context_destroy(i915, arg.ctx_id);
+	igt_require(err == -ENOENT);
 
 	parent = gem_context_create(i915);
 	child = gem_context_create(i915);
@@ -198,6 +202,7 @@ static void test_vm(int i915)
 	batch.offset = 0;
 	gem_execbuf(i915, &eb);
 	igt_assert_eq_u64(batch.offset, 0);
+	gem_context_destroy(i915, child);
 
 	eb.rsvd1 = parent;
 	gem_execbuf(i915, &eb);
@@ -205,14 +210,9 @@ static void test_vm(int i915)
 
 	arg.ctx_id = parent;
 	gem_context_get_param(i915, &arg);
-	gem_context_set_param(i915, &arg);
-
-	/* Still the same VM, so expect the old VMA again */
-	batch.offset = 0;
-	gem_execbuf(i915, &eb);
-	igt_assert_eq_u64(batch.offset, nonzero_offset);
 
 	/* Note: changing an active ctx->vm may be verboten */
+	child = gem_context_create(i915);
 	arg.ctx_id = child;
 	if (__gem_context_set_param(i915, &arg) != -EBUSY) {
 		eb.rsvd1 = child;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

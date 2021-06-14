Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F5F89F2D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:37:53 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id g4so10065697pjk.0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:37:53 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:43 -0500
Message-Id: <20210614163704.365989-29-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 28/77] tests/i915/gem_ctx_shared: Stop
 cloning contexts
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

Instead use either GET/SET_CONTEXT_PARAM or a create ext.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_ctx_shared.c | 77 ++++++++++++++++++++++++++++++-------
 1 file changed, 63 insertions(+), 14 deletions(-)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index b78d95504..e79134bd9 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -63,6 +63,48 @@ static int priorities[] = {
 
 IGT_TEST_DESCRIPTION("Test shared contexts.");
 
+static int __get_vm(int i915, uint32_t ctx, uint32_t *vm)
+{
+	struct drm_i915_gem_context_param p = {
+		.ctx_id = ctx,
+		.param = I915_CONTEXT_PARAM_VM,
+	};
+	int err = __gem_context_get_param(i915, &p);
+	if (err)
+		return err;
+
+	igt_assert(p.value > 0 && p.value < UINT32_MAX);
+	*vm = p.value;
+
+	return 0;
+}
+
+static uint32_t get_vm(int i915, uint32_t ctx)
+{
+	uint32_t vm;
+	igt_assert_eq(__get_vm(i915, ctx, &vm), 0);
+	return vm;
+}
+
+static void set_vm(int i915, uint32_t ctx, uint32_t vm)
+{
+	struct drm_i915_gem_context_param p = {
+		.ctx_id = ctx,
+		.param = I915_CONTEXT_PARAM_VM,
+		.value = vm
+	};
+	gem_context_set_param(i915, &p);
+}
+
+static void copy_vm(int i915, uint32_t dst, uint32_t src)
+{
+	uint32_t vm = get_vm(i915, src);
+	set_vm(i915, dst, vm);
+
+	/* GETPARAM gets a reference to the VM which we have to drop */
+	gem_vm_destroy(i915, vm);
+}
+
 static void create_shared_gtt(int i915, unsigned int flags)
 #define DETACHED 0x1
 {
@@ -83,9 +125,9 @@ static void create_shared_gtt(int i915, unsigned int flags)
 	child = flags & DETACHED ? gem_context_create(i915) : 0;
 	igt_until_timeout(2) {
 		parent = flags & DETACHED ? child : 0;
-		child = gem_context_clone(i915,
-					  parent, I915_CONTEXT_CLONE_VM,
-					  0);
+		child = gem_context_create(i915);
+		copy_vm(i915, child, parent);
+
 		execbuf.rsvd1 = child;
 		gem_execbuf(i915, &execbuf);
 
@@ -99,9 +141,7 @@ static void create_shared_gtt(int i915, unsigned int flags)
 
 		execbuf.rsvd1 = parent;
 		igt_assert_eq(__gem_execbuf(i915, &execbuf), -ENOENT);
-		igt_assert_eq(__gem_context_clone(i915,
-						  parent, I915_CONTEXT_CLONE_VM,
-						  0, &parent), -ENOENT);
+		igt_assert_eq(__get_vm(i915, parent, &parent), -ENOENT);
 	}
 	if (flags & DETACHED)
 		gem_context_destroy(i915, child);
@@ -152,8 +192,19 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
 static void exhaust_shared_gtt(int i915, unsigned int flags)
 #define EXHAUST_LRC 0x1
 {
+	struct drm_i915_gem_context_create_ext_setparam vm_create_ext = {
+		.base = {
+			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+		},
+		.param = {
+			.param = I915_CONTEXT_PARAM_VM,
+		},
+	};
+
 	i915 = gem_reopen_driver(i915);
 
+	vm_create_ext.param.value = gem_vm_create(i915);
+
 	igt_fork(pid, 1) {
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 obj = {
@@ -163,23 +214,21 @@ static void exhaust_shared_gtt(int i915, unsigned int flags)
 			.buffers_ptr = to_user_pointer(&obj),
 			.buffer_count = 1,
 		};
-		uint32_t parent, child;
 		unsigned long count = 0;
 		int err;
 
 		gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
 
-		child = 0;
 		for (;;) {
-			parent = child;
-			err = __gem_context_clone(i915,
-						  parent, I915_CONTEXT_CLONE_VM,
-						  0, &child);
+			uint32_t ctx;
+			err = __gem_context_create_ext(i915, 0,
+						       to_user_pointer(&vm_create_ext),
+						       &ctx);
 			if (err)
 				break;
 
 			if (flags & EXHAUST_LRC) {
-				execbuf.rsvd1 = child;
+				execbuf.rsvd1 = ctx;
 				err = __gem_execbuf(i915, &execbuf);
 				if (err)
 					break;
@@ -849,7 +898,7 @@ igt_main
 
 	igt_subtest_group {
 		igt_fixture {
-			igt_require(gem_contexts_has_shared_gtt(i915));
+			igt_require(gem_has_vm(i915));
 			igt_fork_hang_detector(i915);
 		}
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

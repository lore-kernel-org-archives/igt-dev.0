Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB266EDB3
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 16:20:11 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed,  6 Oct 2021 12:14:37 -0400
Message-Id: <20211006161444.904476-2-rodrigo.vivi@intel.com>
In-Reply-To: <20211006161444.904476-1-rodrigo.vivi@intel.com>
References: <20211006161444.904476-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/8] tests/i915/gem_pxp: Add LOCAL_ UAPI
 defines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

While the UAPI changes don't propagate to drm-next we should
have that as LOCAL_ ones.

That was my mistake during review and merge since I had
ignored the rules documented at README.md and considered
drm-intel branches would be enough. I'm sorry.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/gem_pxp.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 79040165..afd4ce4d 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -25,14 +25,25 @@ struct simple_exec_assets {
 	struct intel_bb *ibb;
 };
 
+#define LOCAL_I915_GEM_CREATE_EXT_PROTECTED_CONTENT	1
+#define LOCAL_I915_CONTEXT_PARAM_PROTECTED_CONTENT	0xd
+#define LOCAL_I915_PROTECTED_CONTENT_DEFAULT_SESSION	0xf
+
+struct local_drm_i915_gem_create_ext_protected_content {
+       /** @base: Extension link. See struct i915_user_extension. */
+       struct i915_user_extension base;
+       /** @flags: reserved for future usage, currently MBZ */
+       __u32 flags;
+};
+
 static int create_bo_ext(int i915, uint32_t size, bool protected_is_true, uint32_t *bo_out)
 {
 	int ret;
 	uint64_t size64 = size;
 	struct i915_user_extension *ext = NULL;
 
-	struct drm_i915_gem_create_ext_protected_content protected_ext = {
-		.base = { .name = I915_GEM_CREATE_EXT_PROTECTED_CONTENT },
+	struct local_drm_i915_gem_create_ext_protected_content protected_ext = {
+		.base = { .name = LOCAL_I915_GEM_CREATE_EXT_PROTECTED_CONTENT },
 		.flags = 0,
 	};
 
@@ -92,7 +103,7 @@ static int create_ctx_with_params(int i915, bool with_protected_param, bool prot
 			.next_extension = 0,
 		},
 		.param = {
-			.param = I915_CONTEXT_PARAM_PROTECTED_CONTENT,
+			.param = LOCAL_I915_CONTEXT_PARAM_PROTECTED_CONTENT,
 			.value = 0,
 		}
 	};
@@ -143,7 +154,7 @@ static int modify_ctx_param(int i915, uint32_t ctx_id, uint32_t param_mask, bool
 	};
 
 	if (param_mask == CHANGE_PARAM_PROTECTED) {
-		ctx_param.param = I915_CONTEXT_PARAM_PROTECTED_CONTENT;
+		ctx_param.param = LOCAL_I915_CONTEXT_PARAM_PROTECTED_CONTENT;
 		ctx_param.value = (int)param_value;
 	} else if (param_mask == CHANGE_PARAM_RECOVERY) {
 		ctx_param.param = I915_CONTEXT_PARAM_RECOVERABLE;
@@ -161,7 +172,7 @@ static int get_ctx_protected_param(int i915, uint32_t ctx_id)
 
 	struct drm_i915_gem_context_param ctx_param = {
 		.ctx_id = ctx_id,
-		.param = I915_CONTEXT_PARAM_PROTECTED_CONTENT,
+		.param = LOCAL_I915_CONTEXT_PARAM_PROTECTED_CONTENT,
 	};
 
 	ret = igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_GETPARAM, &ctx_param);
@@ -508,7 +519,7 @@ static void __test_render_pxp_src_to_protdest(int i915, uint32_t *outpixels, int
 	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
 	ibb = intel_bb_create_with_context(i915, ctx, 4096);
 	igt_assert(ibb);
-	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
+	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, LOCAL_I915_PROTECTED_CONTENT_DEFAULT_SESSION);
 
 	dstbo = alloc_and_fill_dest_buff(i915, true, TSTSURF_SIZE, TSTSURF_INITCOLOR2);
 	dstbuf = intel_buf_create_using_handle(bops, dstbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
@@ -569,7 +580,7 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
 	ibb = intel_bb_create_with_context(i915, ctx, 4096);
 	igt_assert(ibb);
-	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
+	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, LOCAL_I915_PROTECTED_CONTENT_DEFAULT_SESSION);
 
 	dstbo = alloc_and_fill_dest_buff(i915, true, TSTSURF_SIZE, TSTSURF_INITCOLOR2);
 	dstbuf = intel_buf_create_using_handle(bops, dstbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
@@ -603,7 +614,7 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 	intel_buf_set_pxp(dstbuf2, true);
 	intel_buf_set_pxp(dstbuf, true);/*this time, src is protected*/
 
-	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
+	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, LOCAL_I915_PROTECTED_CONTENT_DEFAULT_SESSION);
 
 	gen12_render_copyfunc(ibb, dstbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf2, 0, 0);
 	gem_sync(i915, dstbo2);
@@ -675,7 +686,7 @@ static void test_pxp_dmabuffshare_refcnt(void)
 		igt_assert_eq(get_ctx_protected_param(fd[n], ctx[n]), 1);
 		ibb[n] = intel_bb_create_with_context(fd[n], ctx[n], 4096);
 		intel_bb_set_pxp(ibb[n], true, DISPLAY_APPTYPE,
-				 I915_PROTECTED_CONTENT_DEFAULT_SESSION);
+				 LOCAL_I915_PROTECTED_CONTENT_DEFAULT_SESSION);
 
 		bops[n] = buf_ops_create(fd[n]);
 		if (n == 1)
@@ -1066,7 +1077,7 @@ static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, ui
 
 	ibb->pxp.enabled = true;
 	ibb->pxp.apptype = DISPLAY_APPTYPE;
-	ibb->pxp.appid = I915_PROTECTED_CONTENT_DEFAULT_SESSION;
+	ibb->pxp.appid = LOCAL_I915_PROTECTED_CONTENT_DEFAULT_SESSION;
 
 	gen12_render_copyfunc(ibb, srcbuf, 0, 0, fb->width, fb->height, dstbuf, 0, 0);
 
-- 
2.31.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7184510E4B9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 06:01:53 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 08:01:47 +0200
Message-Id: <20230810060147.398558-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_ctx|fb: Rename engine to
 exec_queue in xe lib for completion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To avoid confusion in the future lets align to current naming
nomenclature.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/igt_fb.c    | 8 ++++----
 lib/intel_ctx.c | 8 ++++----
 lib/intel_ctx.h | 4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 8f5e3db9f5..af3b4588a2 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2852,7 +2852,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	uint32_t src_cc = src_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
 	uint32_t dst_cc = dst_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
 	intel_ctx_t *xe_ctx;
-	uint32_t vm, engine;
+	uint32_t vm, exec_queue;
 	bool is_xe = is_xe_device(dst_fb->fd);
 	bool is_i915 = is_i915_device(dst_fb->fd);
 
@@ -2881,8 +2881,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
 							  mem_region) == 0);
 	} else if (is_xe) {
 		vm = xe_vm_create(dst_fb->fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
-		engine = xe_exec_queue_create(dst_fb->fd, vm, &inst, 0);
-		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, engine, 0, 0, 0);
+		exec_queue = xe_exec_queue_create(dst_fb->fd, vm, &inst, 0);
+		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, exec_queue, 0, 0, 0);
 		mem_region = vram_if_possible(dst_fb->fd, 0);
 
 		ahnd = intel_allocator_open_full(dst_fb->fd, xe_ctx->vm, 0, 0,
@@ -3007,7 +3007,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 
 	if(is_xe) {
 		gem_close(dst_fb->fd, xe_bb);
-		xe_exec_queue_destroy(dst_fb->fd, engine);
+		xe_exec_queue_destroy(dst_fb->fd, exec_queue);
 		xe_vm_destroy(dst_fb->fd, vm);
 		free(xe_ctx);
 	}
diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index 364ede76f5..f927b7df86 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -398,11 +398,11 @@ unsigned int intel_ctx_engine_class(const intel_ctx_t *ctx, unsigned int engine)
  * intel_ctx_xe:
  * @fd: open i915 drm file descriptor
  * @vm: vm
- * @engine: engine
+ * @exec_queue: exec queue
  *
  * Returns an intel_ctx_t representing the xe context.
  */
-intel_ctx_t *intel_ctx_xe(int fd, uint32_t vm, uint32_t engine,
+intel_ctx_t *intel_ctx_xe(int fd, uint32_t vm, uint32_t exec_queue,
 			  uint32_t sync_in, uint32_t sync_bind, uint32_t sync_out)
 {
 	intel_ctx_t *ctx;
@@ -412,7 +412,7 @@ intel_ctx_t *intel_ctx_xe(int fd, uint32_t vm, uint32_t engine,
 
 	ctx->fd = fd;
 	ctx->vm = vm;
-	ctx->engine = engine;
+	ctx->exec_queue = exec_queue;
 	ctx->sync_in = sync_in;
 	ctx->sync_bind = sync_bind;
 	ctx->sync_out = sync_out;
@@ -427,7 +427,7 @@ int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offse
 		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
-		.exec_queue_id = ctx->engine,
+		.exec_queue_id = ctx->exec_queue,
 		.syncs = (uintptr_t)syncs,
 		.num_syncs = 2,
 		.address = bb_offset,
diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
index 59d0360ada..cefc2c2208 100644
--- a/lib/intel_ctx.h
+++ b/lib/intel_ctx.h
@@ -71,7 +71,7 @@ typedef struct intel_ctx {
 	/* Xe */
 	int fd;
 	uint32_t vm;
-	uint32_t engine;
+	uint32_t exec_queue;
 	uint32_t sync_in;
 	uint32_t sync_bind;
 	uint32_t sync_out;
@@ -89,7 +89,7 @@ void intel_ctx_destroy(int fd, const intel_ctx_t *ctx);
 
 unsigned int intel_ctx_engine_class(const intel_ctx_t *ctx, unsigned int engine);
 
-intel_ctx_t *intel_ctx_xe(int fd, uint32_t vm, uint32_t engine,
+intel_ctx_t *intel_ctx_xe(int fd, uint32_t vm, uint32_t exec_queue,
 			  uint32_t sync_in, uint32_t sync_bind, uint32_t sync_out);
 int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offset);
 void intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offset);
-- 
2.34.1

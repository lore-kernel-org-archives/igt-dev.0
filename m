Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D1A10E02D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 08:12:33 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 10:10:50 +0200
Message-Id: <20230628081050.2002028-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Remove unused
 argument in exec_blit
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

We don't use information about platform's gen anymore, so
stop passing it in.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/intel_batchbuffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 186f65aff..0e92c6f70 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -214,8 +214,8 @@ static uint32_t find_engine(const intel_ctx_cfg_t *cfg, unsigned int class)
 
 static void exec_blit(int fd,
 		      struct drm_i915_gem_exec_object2 *objs,
-		      uint32_t count, unsigned int gen,
-		      uint32_t ctx, const intel_ctx_cfg_t *cfg)
+		      uint32_t count, uint32_t ctx,
+		      const intel_ctx_cfg_t *cfg)
 {
 	struct drm_i915_gem_execbuffer2 exec;
 	uint32_t devid = intel_get_drm_devid(fd);
@@ -514,7 +514,7 @@ void igt_blitter_src_copy(int fd,
 		objs[2].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 	}
 
-	exec_blit(fd, objs, 3, gen, ctx, cfg);
+	exec_blit(fd, objs, 3, ctx, cfg);
 
 	gem_close(fd, batch_handle);
 }
@@ -636,7 +636,7 @@ void igt_blitter_fast_copy__raw(int fd,
 		objs[2].flags |= EXEC_OBJECT_PINNED;
 	}
 
-	exec_blit(fd, objs, 3, intel_gen(intel_get_drm_devid(fd)), ctx, cfg);
+	exec_blit(fd, objs, 3, ctx, cfg);
 
 	gem_close(fd, batch_handle);
 }
-- 
2.25.1

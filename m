Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EE410E13F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 15:44:22 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 16:43:33 +0100
Message-Id: <20230609154336.516503-4-matthew.auld@intel.com>
In-Reply-To: <20230609154336.516503-1-matthew.auld@intel.com>
References: <20230609154336.516503-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/6] lib/xe: handle small-bar systems
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

The spinner stuff wants to use mmap. The fb related stuff might want to
CPU access the buffer, so just always ask for it. And the batch buffer
stuff is pretty much always going to need to CPU access the buffer.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 lib/igt_draw.c          | 2 +-
 lib/igt_fb.c            | 2 +-
 lib/intel_batchbuffer.c | 4 ++--
 lib/xe/xe_spin.c        | 3 ++-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index a5c0cbbf6..519018eb3 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -794,7 +794,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	else
 		tmp.handle = xe_bo_create_flags(fd, 0,
 						ALIGN(tmp.size, xe_get_default_alignment(fd)),
-						vram_if_possible(fd, 0));
+						visible_vram_if_possible(fd, 0));
 
 	tmp.stride = rect->w * pixel_size;
 	tmp.bpp = buf->bpp;
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9be312a28..e5e52946e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1192,7 +1192,7 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 			igt_assert(err == 0 || err == -EOPNOTSUPP);
 		} else if (is_xe_device(fd)) {
 			fb->gem_handle = xe_bo_create_flags(fd, 0, fb->size,
-							vram_if_possible(fd, 0));
+							visible_vram_if_possible(fd, 0));
 		} else if (is_vc4_device(fd)) {
 			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3cd680072..047843006 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -943,7 +943,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		ibb->alignment = xe_get_default_alignment(fd);
 		size = ALIGN(size, ibb->alignment);
-		ibb->handle = xe_bo_create_flags(fd, 0, size, vram_if_possible(fd, 0));
+		ibb->handle = xe_bo_create_flags(fd, 0, size, visible_vram_if_possible(fd, 0));
 
 		/* Limit to 48-bit due to MI_* address limitation */
 		ibb->gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
@@ -1399,7 +1399,7 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
 		ibb->handle = gem_create(ibb->fd, ibb->size);
 	else
 		ibb->handle = xe_bo_create_flags(ibb->fd, 0, ibb->size,
-						 vram_if_possible(ibb->fd, 0));
+						 visible_vram_if_possible(ibb->fd, 0));
 
 	/* Reacquire offset for RELOC and SIMPLE */
 	if (ibb->allocator_type == INTEL_ALLOCATOR_SIMPLE ||
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 856d0ba22..3266905c9 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -100,7 +100,8 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	vm = xe_vm_create(fd, 0, 0);
 
-	bo = xe_bo_create(fd, hwe->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, hwe->gt_id));
 	spin = xe_bo_map(fd, bo, 0x1000);
 
 	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
-- 
2.40.1

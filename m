Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9A310E8E3
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:54:52 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:27 +0000
Message-Id: <20231109155410.7-15-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 14/57] drm/xe_query: Remove backward
 compatibility of vram_visible_size.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

We are breaking the uapi compatibility at this time, so this
is useless anyway.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/xe/xe_query.c | 42 +++++++-----------------------------------
 1 file changed, 7 insertions(+), 35 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 9f1ab0cd9..3afbd0c63 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -399,16 +399,6 @@ uint64_t vram_memory(int fd, int gt)
 	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gt_list, gt) : 0;
 }
 
-static uint64_t __xe_visible_vram_size(int fd, int gt)
-{
-	struct xe_device *xe_dev;
-
-	xe_dev = find_in_cache(fd);
-	igt_assert(xe_dev);
-
-	return xe_dev->visible_vram_size[gt];
-}
-
 /**
  * visible_vram_memory:
  * @fd: xe device fd
@@ -420,14 +410,7 @@ static uint64_t __xe_visible_vram_size(int fd, int gt)
  */
 uint64_t visible_vram_memory(int fd, int gt)
 {
-	/*
-	 * TODO: Keep it backwards compat for now. Fixup once the kernel side
-	 * has landed.
-	 */
-	if (__xe_visible_vram_size(fd, gt))
-		return vram_memory(fd, gt) | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
-	else
-		return vram_memory(fd, gt); /* older kernel */
+	return vram_memory(fd, gt) | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 }
 
 /**
@@ -459,14 +442,7 @@ uint64_t visible_vram_if_possible(int fd, int gt)
 	uint64_t system_memory = regions & 0x1;
 	uint64_t vram = regions & (0x2 << gt);
 
-	/*
-	 * TODO: Keep it backwards compat for now. Fixup once the kernel side
-	 * has landed.
-	 */
-	if (__xe_visible_vram_size(fd, gt))
-		return vram ? vram | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : system_memory;
-	else
-		return vram ? vram : system_memory; /* older kernel */
+	return vram ? vram | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : system_memory;
 }
 
 /**
@@ -618,18 +594,14 @@ uint64_t xe_vram_size(int fd, int gt)
  */
 uint64_t xe_visible_vram_size(int fd, int gt)
 {
-	uint64_t visible_size;
+	struct xe_device *xe_dev;
 
-	/*
-	 * TODO: Keep it backwards compat for now. Fixup once the kernel side
-	 * has landed.
-	 */
-	visible_size = __xe_visible_vram_size(fd, gt);
-	if (!visible_size) /* older kernel */
-		visible_size = xe_vram_size(fd, gt);
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
 
-	return visible_size;
+	return xe_dev->visible_vram_size[gt];
 }
+
 /**
  * xe_vram_available:
  * @fd: xe device fd
-- 
2.34.1

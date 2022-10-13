Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5118010E303
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 17:33:30 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Oct 2022 10:30:38 -0700
Message-Id: <20221013173038.1763245-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] drm/i915/ttm: Fix access_memory null pointer
 exception
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jonathan.cavitt@intel.com, matthew.auld@intel.com, nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

i915_ttm_to_gem can return a NULL pointer, which is
dereferenced in i915_ttm_access_memory without first
checking if it is NULL.  Inspecting
i915_ttm_io_mem_reserve, it appears the correct
behavior in this case is to return -EINVAL.

Fixes: 26b15eb0 ("drm/i915/ttm: implement access_memory")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: John C Harrison <John.C.Harrison@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index d63f30efd631..b569624f2ed9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -704,11 +704,16 @@ static int i915_ttm_access_memory(struct ttm_buffer_object *bo,
 				  int len, int write)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
-	resource_size_t iomap = obj->mm.region->iomap.base -
-		obj->mm.region->region.start;
+	resource_size_t iomap;
 	unsigned long page = offset >> PAGE_SHIFT;
 	unsigned long bytes_left = len;
 
+	if (!obj)
+		return -EINVAL;
+
+	iomap = obj->mm.region->iomap.base -
+		obj->mm.region->region.start;
+
 	/*
 	 * TODO: For now just let it fail if the resource is non-mappable,
 	 * otherwise we need to perform the memcpy from the gpu here, without
-- 
2.25.1

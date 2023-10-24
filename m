Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E87110E44A
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 17:36:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 Oct 2023 19:36:15 +0200
Message-Id: <20231024173618.127007-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231024173618.127007-1-zbigniew.kempczynski@intel.com>
References: <20231024173618.127007-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/5] lib/intel_blt: Add visible vram flag
 if object needs to be mapped
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

For objects with blitter helper in vram which needs to be mapped
add visible vram flag to ensure it will be placed in mappable
vram region.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_blt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 0f9100b2ad..5b682c2b67 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1801,8 +1801,13 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 	obj->size = size;
 
 	if (blt->driver == INTEL_DRIVER_XE) {
+		uint64_t flags = region;
+
+		if (create_mapping && region != system_memory(blt->fd))
+			flags |= XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+
 		size = ALIGN(size, xe_get_default_alignment(blt->fd));
-		handle = xe_bo_create_flags(blt->fd, 0, size, region);
+		handle = xe_bo_create_flags(blt->fd, 0, size, flags);
 	} else {
 		igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
 							  &size, region) == 0);
-- 
2.34.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2E310E069
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 19:33:35 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 Oct 2023 21:33:18 +0200
Message-Id: <20231019193321.90009-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231019193321.90009-1-zbigniew.kempczynski@intel.com>
References: <20231019193321.90009-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/5] lib/intel_blt: Add visible vram flag
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
---
 lib/intel_blt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 3c5e97963d..c2ae986fbf 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1618,8 +1618,13 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
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

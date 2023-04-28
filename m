Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1301110EC5E
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 06:23:18 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 08:22:23 +0200
Message-Id: <20230428062224.21322-17-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
References: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 16/17] lib/igt_draw: Pass region while
 building intel_buf from flink
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

For i915 region doesn't matter but for xe we need to be more strict and
region aware. This is related to size and alignment constraints. As we
don't have information about flink buffer origin let's assume region
is vram if possible, otherwise choose system region.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_draw.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index ac512fac5a..c5f2fdfe2b 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -37,6 +37,7 @@
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
 #include "i915/intel_mocs.h"
+#include "xe/xe_query.h"
 
 #ifndef PAGE_ALIGN
 #ifndef PAGE_SIZE
@@ -634,17 +635,24 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
 				    struct buf_data *from, uint32_t tiling)
 {
 	struct intel_buf *buf;
+	enum intel_driver driver = buf_ops_get_driver(bops);
 	uint32_t handle, name, width, height;
+	uint64_t region = driver == INTEL_DRIVER_XE ? vram_if_possible(fd, 0) : -1;
+	uint64_t size = from->size;
 
 	width = from->stride / (from->bpp / 8);
 	height = from->size / from->stride;
+	if (driver == INTEL_DRIVER_XE)
+		size = ALIGN(size, xe_get_default_alignment(fd));
 
 	name = gem_flink(fd, from->handle);
 	handle = gem_open(fd, name);
 
-	buf = intel_buf_create_using_handle(bops, handle,
-					    width, height, from->bpp, 0,
-					    tiling, 0);
+	buf = intel_buf_create_full(bops, handle,
+				    width, height, from->bpp, 0,
+				    tiling, 0,
+				    size, 0,
+				    region);
 
 	/* Make sure we close handle on destroy path */
 	intel_buf_set_ownership(buf, true);
-- 
2.34.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DA310E37A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:50:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:14:53 +0530
Message-Id: <20230418164501.1687266-38-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 37/45] tests/kms_plane: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 62aee9ad0..10e16b638 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -30,6 +30,7 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
+#include "xe/xe_query.h"
 
 /*
  * Throw away enough lsbs in pixel formats tests
@@ -399,6 +400,18 @@ test_plane_panning(data_t *data, enum pipe pipe)
 
 	}
 
+	if (is_xe_device(data->drm_fd)) {
+		struct drm_xe_query_mem_region *memregion;
+		uint64_t memreg = all_memory_regions(data->drm_fd), region;
+
+		xe_for_each_mem_region(data->drm_fd, memreg, region) {
+			memregion = xe_mem_region(data->drm_fd, region);
+
+			if (XE_IS_CLASS_VRAM(memregion))
+				mem_size = memregion->total_size;
+		}
+	}
+
 	for_each_connector_mode(output) {
 		drmModeModeInfo *m = &output->config.connector->modes[j__];
 		uint32_t fb_size = m->hdisplay * m->vdisplay * 4;
@@ -976,6 +989,10 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			.modifier = plane->modifiers[i],
 		};
 
+		if (is_xe_device(data->drm_fd) &&
+		    f.modifier != DRM_FORMAT_MOD_LINEAR)
+			continue;
+
 		if (f.format == ref.format &&
 		    f.modifier == ref.modifier)
 			continue;
@@ -1050,7 +1067,7 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 	if (data->extended)
 		return false;
 
-	if (!is_i915_device(data->drm_fd))
+	if (!is_intel_device(data->drm_fd))
 		return false;
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
-- 
2.40.0

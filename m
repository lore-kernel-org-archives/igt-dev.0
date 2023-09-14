Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C353710E14F
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 16:50:32 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Thu, 14 Sep 2023 22:23:08 +0530
Message-Id: <20230914165308.434969-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_debugfs : Check tile_count
 info
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Check correctness of tile_count info.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_debugfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 88b51dbd4..2e752267c 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -13,7 +13,7 @@
  */
 
 #include "igt.h"
-
+#include "igt_sysfs.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -117,6 +117,9 @@ test_base(int fd, struct drm_xe_query_config *config)
 		igt_assert(igt_debugfs_search(fd, "info", reference));
 	}
 
+	sprintf(reference, "tile_count %d", xe_sysfs_get_num_tiles(fd));
+	igt_assert(igt_debugfs_search(fd, "info", reference));
+
 	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
 	if (config->info[XE_QUERY_CONFIG_GT_COUNT] > 1)
 		igt_assert(igt_debugfs_exists(fd, "gt1", O_RDONLY));
-- 
2.25.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562AB10E4D9
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 07:00:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:24:01 +0530
Message-Id: <20230622065422.2235134-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
References: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 02/23] lib: Cache xe_device at driver
 open/close level
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

Instead of caching the xe_device struct at subtest level, cache
just after opening the driver. And remove from the cache just
before closing the driver.

V2: - Place the logic in correct helpers (Zbigniew)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/drmtest.c   | 24 +++++++++++++++++++++---
 lib/igt_types.c |  6 ++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index a226ebd91..5cdb0196d 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -64,6 +64,7 @@
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
 #include "igt_dummyload.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:drmtest
@@ -497,9 +498,14 @@ int __drm_open_driver_another(int idx, int chipset)
 		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
 	}
 
-	if (fd >= 0)
+	if (fd >= 0) {
 		_set_opened_fd(idx, fd);
 
+		/* Cache xe_device struct. */
+		if (is_xe_device(fd))
+			xe_device_get(fd);
+	}
+
 	return fd;
 }
 
@@ -523,6 +529,8 @@ int __drm_open_driver(int chipset)
 
 int __drm_open_driver_render(int chipset)
 {
+	int fd;
+
 	if (chipset != DRIVER_VGEM && igt_device_filter_count() > 0) {
 		struct igt_device_card card;
 		bool found;
@@ -532,10 +540,16 @@ int __drm_open_driver_render(int chipset)
 		if (!found || !strlen(card.render))
 			return -1;
 
-		return __open_driver_exact(card.render, chipset);
+		fd = __open_driver_exact(card.render, chipset);
+	} else {
+		fd = __open_driver("/dev/dri/renderD", 128, chipset, 0);
 	}
 
-	return __open_driver("/dev/dri/renderD", 128, chipset, 0);
+	/* Cache xe_device struct. */
+	if (fd >= 0 && is_xe_device(fd))
+		xe_device_get(fd);
+
+	return fd;
 }
 
 static int at_exit_drm_fd = -1;
@@ -677,6 +691,10 @@ int drm_close_driver(int fd)
 		return -1;
 	}
 
+	/* Remove xe_device from cache. */
+	if (is_xe_device(fd))
+		xe_device_put(fd);
+
 	return close(fd);
 }
 
diff --git a/lib/igt_types.c b/lib/igt_types.c
index 392f30fca..d5d444889 100644
--- a/lib/igt_types.c
+++ b/lib/igt_types.c
@@ -5,13 +5,19 @@
 
 #include <unistd.h>
 
+#include "drmtest.h"
 #include "igt_types.h"
+#include "xe/xe_query.h"
 
 void igt_cleanup_fd(volatile int *fd)
 {
 	if (!fd || *fd < 0)
 		return;
 
+	/* Remove xe_device from cache. */
+	if (is_xe_device(*fd))
+		xe_device_put(*fd);
+
 	close(*fd);
 	*fd = -1;
 }
-- 
2.40.0

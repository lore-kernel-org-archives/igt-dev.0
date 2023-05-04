Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECF810E246
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 05:02:29 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  4 May 2023 10:27:22 +0530
Message-Id: <20230504045726.2954788-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/6] lib: Cache xe_device at driver open/close
 level
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com, mchehab@kernel.org, kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com, karthik.b.s@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Instead of caching the xe_device struct at subtest level, cache
just after opening the driver. And remove from the cache just
before closing the driver.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/drmtest.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 03b5239b2..f6cd8e500 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -63,6 +63,7 @@
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
 #include "igt_dummyload.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:drmtest
@@ -601,6 +602,10 @@ int drm_open_driver(int chipset)
 		}
 	}
 
+	/* Cache xe_device struct. */
+	if (is_xe_device(fd))
+		xe_device_get(fd);
+
 	return fd;
 }
 
@@ -618,6 +623,10 @@ int drm_close_driver(int fd)
 	if (fd < 3)
 		return -1;
 
+	/* Remove xe_device from cache. */
+	if (is_xe_device(fd))
+		xe_device_put(fd);
+
 	return close(fd);
 }
 
-- 
2.40.0



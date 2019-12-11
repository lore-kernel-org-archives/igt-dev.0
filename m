Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B819F6EA31
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:42 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:14 -0800
Message-Id: <20191211005235.67897-9-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 08/29] lib: remove open-coded card index
 fetching
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Replace open-coded card index fetching via stat with
igt_device_get_card_index() calls.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/igt_debugfs.c | 17 ++++-------------
 lib/igt_sysfs.c   | 10 +++++-----
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 676884c8..34b2e4ee 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -41,6 +41,7 @@
 #include "igt_aux.h"
 #include "igt_kms.h"
 #include "igt_debugfs.h"
+#include "igt_device.h"
 #include "igt_sysfs.h"
 
 /**
@@ -164,20 +165,10 @@ char *igt_debugfs_path(int device, char *path, int pathlen)
 	debugfs_root = igt_debugfs_mount();
 	igt_assert(debugfs_root);
 
-	memset(&st, 0, sizeof(st));
-	if (device != -1) { /* if no fd, we presume we want dri/0 */
-		if (fstat(device, &st)) {
-			igt_debug("Couldn't stat FD for DRM device: %m\n");
-			return NULL;
-		}
-
-		if (!S_ISCHR(st.st_mode)) {
-			igt_debug("FD for DRM device not a char device!\n");
-			return NULL;
-		}
-	}
+	idx = 0;
+	if (device >= 0)
+		idx = igt_device_get_card_index(device);
 
-	idx = minor(st.st_rdev);
 	snprintf(path, pathlen, "%s/dri/%d/name", debugfs_root, idx);
 	if (stat(path, &st))
 		return NULL;
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 7528c3bd..61293a4e 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -43,6 +43,8 @@
 #include "igt_sysfs.h"
 #include "igt_device.h"
 
+#define DRM_MAJOR 226
+
 /**
  * SECTION:igt_sysfs
  * @short_description: Support code for sysfs features
@@ -98,16 +100,14 @@ static int writeN(int fd, const char *buf, int len)
  */
 char *igt_sysfs_path(int device, char *path, int pathlen)
 {
-	struct stat st;
+	int idx;
 
 	if (device < 0)
 		return NULL;
 
-	if (fstat(device, &st) || !S_ISCHR(st.st_mode))
-		return NULL;
+	idx = igt_device_get_card_index(device);
 
-	snprintf(path, pathlen, "/sys/dev/char/%d:%d",
-		 major(st.st_rdev), minor(st.st_rdev));
+	snprintf(path, pathlen, "/sys/dev/char/%d:%d", DRM_MAJOR, idx);
 
 	if (access(path, F_OK))
 		return NULL;
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

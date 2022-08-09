Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53C4D476A
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:14 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:27 +0200
Message-Id: <20220809125037.1231032-9-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 08/19] tests/v3d*: Remove unused headers
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

Using CLion's automated code inspection, most unused includes were found
and removed. Some warnings remain as CLion is unable to track code usage
across certain attributes, but the vast majority of unneeded headers are
now gone.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tests/v3d_get_bo_offset.c | 7 -------
 tests/v3d_get_param.c     | 7 -------
 tests/v3d_mmap.c          | 9 ---------
 3 files changed, 23 deletions(-)

diff --git a/tests/v3d_get_bo_offset.c b/tests/v3d_get_bo_offset.c
index 0923dc85..3b32a203 100644
--- a/tests/v3d_get_bo_offset.c
+++ b/tests/v3d_get_bo_offset.c
@@ -24,17 +24,10 @@
 #include "igt.h"
 #include "igt_v3d.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <poll.h>
 #include "v3d_drm.h"
-#include "igt_v3d.h"
 
 igt_main
 {
diff --git a/tests/v3d_get_param.c b/tests/v3d_get_param.c
index 76563406..5759f41a 100644
--- a/tests/v3d_get_param.c
+++ b/tests/v3d_get_param.c
@@ -24,17 +24,10 @@
 #include "igt.h"
 #include "igt_v3d.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <poll.h>
 #include "v3d_drm.h"
-#include "igt_v3d.h"
 
 igt_main
 {
diff --git a/tests/v3d_mmap.c b/tests/v3d_mmap.c
index a6fe7e5a..d8d9a03e 100644
--- a/tests/v3d_mmap.c
+++ b/tests/v3d_mmap.c
@@ -22,19 +22,10 @@
  */
 
 #include "igt.h"
-#include "igt_v3d.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <poll.h>
 #include "v3d_drm.h"
-#include "igt_v3d.h"
 
 igt_main
 {
-- 
2.37.1

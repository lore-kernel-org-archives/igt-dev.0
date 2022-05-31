Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E253211321D
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 14:29:46 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 31 May 2022 16:28:38 +0200
Message-Id: <20220531142844.278366-8-ryszard.knop@intel.com>
In-Reply-To: <20220531142844.278366-1-ryszard.knop@intel.com>
References: <20220531142844.278366-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 08/14] tests/v3d*: Remove unused headers
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
2.36.1

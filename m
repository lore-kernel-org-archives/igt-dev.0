Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F582D4769
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:13 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:26 +0200
Message-Id: <20220809125037.1231032-8-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 07/19] tests/vc4*: Remove unused headers
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
 tests/vc4_create_bo.c    | 5 -----
 tests/vc4_dmabuf_poll.c  | 5 -----
 tests/vc4_label_bo.c     | 6 ------
 tests/vc4_lookup_fail.c  | 5 -----
 tests/vc4_purgeable_bo.c | 5 -----
 tests/vc4_tiling.c       | 7 -------
 tests/vc4_wait_bo.c      | 4 ----
 tests/vc4_wait_seqno.c   | 6 ------
 8 files changed, 43 deletions(-)

diff --git a/tests/vc4_create_bo.c b/tests/vc4_create_bo.c
index 99d180a8..dc5d565d 100644
--- a/tests/vc4_create_bo.c
+++ b/tests/vc4_create_bo.c
@@ -24,14 +24,9 @@
 #include "igt.h"
 #include "igt_vc4.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include "vc4_drm.h"
 
 igt_main
diff --git a/tests/vc4_dmabuf_poll.c b/tests/vc4_dmabuf_poll.c
index 260e30c3..9027a352 100644
--- a/tests/vc4_dmabuf_poll.c
+++ b/tests/vc4_dmabuf_poll.c
@@ -24,14 +24,9 @@
 #include "igt.h"
 #include "igt_vc4.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <poll.h>
 #include "vc4_drm.h"
 
diff --git a/tests/vc4_label_bo.c b/tests/vc4_label_bo.c
index 7510f87d..e77c0a35 100644
--- a/tests/vc4_label_bo.c
+++ b/tests/vc4_label_bo.c
@@ -24,15 +24,9 @@
 #include "igt.h"
 #include "igt_vc4.h"
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
 #include "vc4_drm.h"
 
 static void
diff --git a/tests/vc4_lookup_fail.c b/tests/vc4_lookup_fail.c
index f0234ee5..0b200514 100644
--- a/tests/vc4_lookup_fail.c
+++ b/tests/vc4_lookup_fail.c
@@ -24,14 +24,9 @@
 #include "igt.h"
 #include <assert.h>
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include "vc4_drm.h"
 #include "vc4_packet.h"
 
diff --git a/tests/vc4_purgeable_bo.c b/tests/vc4_purgeable_bo.c
index d9f7547f..e0a01d42 100644
--- a/tests/vc4_purgeable_bo.c
+++ b/tests/vc4_purgeable_bo.c
@@ -26,13 +26,8 @@
 #include <unistd.h>
 #include <signal.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include "vc4_drm.h"
 
 struct igt_vc4_bo {
diff --git a/tests/vc4_tiling.c b/tests/vc4_tiling.c
index b96fe4ad..06e8e64e 100644
--- a/tests/vc4_tiling.c
+++ b/tests/vc4_tiling.c
@@ -24,15 +24,8 @@
 #include "igt.h"
 #include "igt_vc4.h"
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
 #include "vc4_drm.h"
 
 igt_main
diff --git a/tests/vc4_wait_bo.c b/tests/vc4_wait_bo.c
index 65a085a3..eba5a2b5 100644
--- a/tests/vc4_wait_bo.c
+++ b/tests/vc4_wait_bo.c
@@ -24,13 +24,9 @@
 #include "igt.h"
 #include "igt_vc4.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
 #include "vc4_drm.h"
 
diff --git a/tests/vc4_wait_seqno.c b/tests/vc4_wait_seqno.c
index bcc263cb..08b85f5b 100644
--- a/tests/vc4_wait_seqno.c
+++ b/tests/vc4_wait_seqno.c
@@ -23,14 +23,8 @@
 
 #include "igt.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include "vc4_drm.h"
 
 igt_main
-- 
2.37.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0511D476C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:16 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:28 +0200
Message-Id: <20220809125037.1231032-10-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 09/19] tests/panfrost*: Remove unused
 headers
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
 tests/panfrost_gem_new.c   | 5 -----
 tests/panfrost_get_param.c | 6 ------
 tests/panfrost_prime.c     | 5 -----
 tests/panfrost_submit.c    | 4 ----
 4 files changed, 20 deletions(-)

diff --git a/tests/panfrost_gem_new.c b/tests/panfrost_gem_new.c
index 940525ff..7e753f82 100644
--- a/tests/panfrost_gem_new.c
+++ b/tests/panfrost_gem_new.c
@@ -25,14 +25,9 @@
 #include "igt.h"
 #include "igt_panfrost.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include "panfrost_drm.h"
 
 igt_main
diff --git a/tests/panfrost_get_param.c b/tests/panfrost_get_param.c
index 11c2632b..943d62eb 100644
--- a/tests/panfrost_get_param.c
+++ b/tests/panfrost_get_param.c
@@ -25,15 +25,9 @@
 #include "igt.h"
 #include "igt_panfrost.h"
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
 #include "panfrost_drm.h"
 
 igt_main
diff --git a/tests/panfrost_prime.c b/tests/panfrost_prime.c
index 40ba036b..02eb6507 100644
--- a/tests/panfrost_prime.c
+++ b/tests/panfrost_prime.c
@@ -25,14 +25,9 @@
 #include "igt.h"
 #include "igt_panfrost.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
-#include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include "panfrost_drm.h"
 
 static bool igt_has_dumb(int fd)
diff --git a/tests/panfrost_submit.c b/tests/panfrost_submit.c
index 4747d295..fb7c0e58 100644
--- a/tests/panfrost_submit.c
+++ b/tests/panfrost_submit.c
@@ -26,14 +26,10 @@
 #include "igt_panfrost.h"
 #include "igt_syncobj.h"
 #include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include "panfrost-job.h"
 #include "panfrost_drm.h"
 
-- 
2.37.1

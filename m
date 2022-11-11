Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE9610E8C3
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 20:42:31 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Nov 2022 16:58:09 -0300
Message-Id: <20221111195813.277822-4-mcanal@igalia.com>
In-Reply-To: <20221111195813.277822-1-mcanal@igalia.com>
References: <20221111195813.277822-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/7] tests/v3d: Remove unused or
 redundant includes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The V3D test files contain some includes that aren't required for
compilation: some includes are simply not used and others are included
through other headers. Simplify the code by removing unused includes.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c                 |  3 ---
 tests/v3d/v3d_get_bo_offset.c | 12 ------------
 tests/v3d/v3d_get_param.c     | 12 ------------
 tests/v3d/v3d_mmap.c          | 12 ------------
 4 files changed, 39 deletions(-)

diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index 619c072c..bd645320 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -36,9 +36,6 @@
 #include "igt_core.h"
 #include "igt_v3d.h"
 #include "ioctl_wrappers.h"
-#include "intel_reg.h"
-#include "intel_chipset.h"
-#include "v3d_drm.h"
 
 /**
  * SECTION:igt_v3d
diff --git a/tests/v3d/v3d_get_bo_offset.c b/tests/v3d/v3d_get_bo_offset.c
index 0923dc85..976a28b8 100644
--- a/tests/v3d/v3d_get_bo_offset.c
+++ b/tests/v3d/v3d_get_bo_offset.c
@@ -23,18 +23,6 @@
 
 #include "igt.h"
 #include "igt_v3d.h"
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <poll.h>
-#include "v3d_drm.h"
-#include "igt_v3d.h"
 
 igt_main
 {
diff --git a/tests/v3d/v3d_get_param.c b/tests/v3d/v3d_get_param.c
index 76563406..816a3c7d 100644
--- a/tests/v3d/v3d_get_param.c
+++ b/tests/v3d/v3d_get_param.c
@@ -23,18 +23,6 @@
 
 #include "igt.h"
 #include "igt_v3d.h"
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <poll.h>
-#include "v3d_drm.h"
-#include "igt_v3d.h"
 
 igt_main
 {
diff --git a/tests/v3d/v3d_mmap.c b/tests/v3d/v3d_mmap.c
index a6fe7e5a..ad441607 100644
--- a/tests/v3d/v3d_mmap.c
+++ b/tests/v3d/v3d_mmap.c
@@ -23,18 +23,6 @@
 
 #include "igt.h"
 #include "igt_v3d.h"
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <poll.h>
-#include "v3d_drm.h"
-#include "igt_v3d.h"
 
 igt_main
 {
-- 
2.38.1

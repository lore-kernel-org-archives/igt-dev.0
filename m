Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BED11333D
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 14:29:44 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 31 May 2022 16:28:36 +0200
Message-Id: <20220531142844.278366-6-ryszard.knop@intel.com>
In-Reply-To: <20220531142844.278366-1-ryszard.knop@intel.com>
References: <20220531142844.278366-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/14] tests/amdgpu: Remove unused headers
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
 tests/amdgpu/amd_abm.c    | 2 --
 tests/amdgpu/amd_assr.c   | 2 --
 tests/amdgpu/amd_basic.c  | 5 +----
 tests/amdgpu/amd_dp_dsc.c | 1 -
 tests/amdgpu/amd_ilr.c    | 4 ----
 tests/amdgpu/amd_info.c   | 2 --
 6 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 9400ed80..815de85b 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -20,7 +20,6 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include "igt.h"
 #include "drmtest.h"
 #include "igt_kms.h"
 #include <limits.h>
@@ -30,7 +29,6 @@
 #include <stdio.h>
 #include <string.h>
 #include <fcntl.h>
-#include <time.h>
 
 #define DEBUGFS_CURRENT_BACKLIGHT_PWM "amdgpu_current_backlight_pwm"
 #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index 80cbbe8e..79510732 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -24,8 +24,6 @@
 #include "igt_sysfs.h"
 #include <dirent.h>
 #include <fcntl.h>
-#include <limits.h>
-#include <sys/types.h>
 #include <sys/stat.h>
 
 IGT_TEST_DESCRIPTION("Check if ASSR is enabled on eDP links that support "
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 6c9609b9..ab08fb8c 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -22,13 +22,10 @@
  * Based on libdrm/tests/amdgpu/basic_tests.c
  */
 
-#include "config.h"
-
-#include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
 #ifdef HAVE_ALLOCA_H
-# include <alloca.h>
+#include <alloca.h>
 #endif
 
 #include "drmtest.h"
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 8a18df3b..b818a3bc 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -22,7 +22,6 @@
 
 #include "igt.h"
 #include "igt_amd.h"
-#include "sw_sync.h"
 #include <fcntl.h>
 #include <signal.h>
 
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 50ca93a1..27376ea1 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -22,11 +22,7 @@
 
 #include "igt.h"
 #include "igt_amd.h"
-#include "igt_sysfs.h"
 #include <dirent.h>
-#include <fcntl.h>
-#include <limits.h>
-#include <sys/types.h>
 #include <sys/stat.h>
 
 #define MULTIPLIER_TO_LR 270000
diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index d6aea827..b53b4dc0 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -21,8 +21,6 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include "config.h"
-
 #include "igt.h"
 
 #include <amdgpu.h>
-- 
2.36.1

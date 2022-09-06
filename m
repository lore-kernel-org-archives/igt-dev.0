Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAD110E5BE
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 10:38:57 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 16:08:14 +0530
Message-Id: <20220906103818.2736508-3-riana.tauro@intel.com>
In-Reply-To: <20220906103818.2736508-1-riana.tauro@intel.com>
References: <20220906103818.2736508-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] lib/igt_power: Rename lib igt_rapl with
 igt_power
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Rename igt_rapl library to igt_power.
No functional changes

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/{igt_rapl.c => igt_power.c}    | 2 +-
 lib/{igt_rapl.h => igt_power.h}    | 6 +++---
 lib/meson.build                    | 2 +-
 tests/i915/gem_exec_fair.c         | 1 -
 tests/i915/gem_exec_schedule.c     | 2 +-
 tests/i915/gem_exec_whisper.c      | 2 +-
 tests/i915/i915_pm_rc6_residency.c | 2 +-
 7 files changed, 8 insertions(+), 9 deletions(-)
 rename lib/{igt_rapl.c => igt_power.c} (98%)
 rename lib/{igt_rapl.h => igt_power.h} (97%)

diff --git a/lib/igt_rapl.c b/lib/igt_power.c
similarity index 98%
rename from lib/igt_rapl.c
rename to lib/igt_power.c
index 03e49226..814ad556 100644
--- a/lib/igt_rapl.c
+++ b/lib/igt_power.c
@@ -7,7 +7,7 @@
 #include <inttypes.h>
 
 #include "igt_perf.h"
-#include "igt_rapl.h"
+#include "igt_power.h"
 #include "igt_sysfs.h"
 
 static int rapl_parse(struct rapl *r, const char *str)
diff --git a/lib/igt_rapl.h b/lib/igt_power.h
similarity index 97%
rename from lib/igt_rapl.h
rename to lib/igt_power.h
index 13f4f88a..11ddcdee 100644
--- a/lib/igt_rapl.h
+++ b/lib/igt_power.h
@@ -22,8 +22,8 @@
  *
  */
 
-#ifndef IGT_RAPL_H
-#define IGT_RAPL_H
+#ifndef IGT_POWER_H
+#define IGT_POWER_H
 
 #include <stdbool.h>
 #include <stdint.h>
@@ -98,4 +98,4 @@ static inline double power_W(const struct rapl *r,
 	return power_J(r, p0, p1) / power_s(r, p0, p1);
 }
 
-#endif /* IGT_RAPL_H */
+#endif /* IGT_POWER_H */
diff --git a/lib/meson.build b/lib/meson.build
index 31894c7e..af438328 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -30,9 +30,9 @@ lib_sources = [
 	'igt_os.c',
 	'igt_params.c',
 	'igt_perf.c',
+	'igt_power.c',
 	'igt_primes.c',
 	'igt_rand.c',
-	'igt_rapl.c',
 	'igt_stats.c',
 	'igt_syncobj.c',
 	'igt_sysfs.c',
diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index 89921697..93a138ba 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -21,7 +21,6 @@
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_rand.h"
-#include "igt_rapl.h"
 #include "igt_sysfs.h"
 #include "igt_syncobj.h"
 #include "igt_vgem.h"
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 5ddf39bf..4693894f 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -38,8 +38,8 @@
 #include "i915/gem_create.h"
 #include "i915/gem_vm.h"
 #include "igt.h"
+#include "igt_power.h"
 #include "igt_rand.h"
-#include "igt_rapl.h"
 #include "igt_sysfs.h"
 #include "igt_vgem.h"
 #include "intel_ctx.h"
diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index c93134db..c763cc8e 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -32,8 +32,8 @@
 #include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_debugfs.h"
-#include "igt_rapl.h"
 #include "igt_gt.h"
+#include "igt_power.h"
 #include "igt_rand.h"
 #include "igt_sysfs.h"
 #include "intel_ctx.h"
diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index cf7a92b9..670461c8 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -37,7 +37,7 @@
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_perf.h"
-#include "igt_rapl.h"
+#include "igt_power.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 
-- 
2.25.1

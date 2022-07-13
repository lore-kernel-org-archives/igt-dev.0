Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D908AB91
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 18:16:46 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Jul 2022 20:16:37 +0200
Message-Id: <20220713181637.10707-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [igt-dev] [PATCH i-g-t] i915/perf: Make sure i915 loaded properly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Previous test may leave incomplete i915 state.
make this more resilient my unload and reloading i915.

Reference: https://gitlab.freedesktop.org/drm/intel/-/issues/5608
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/perf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index e641d5d2d..9c36aac34 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -41,8 +41,8 @@
 #include "i915/gem.h"
 #include "i915/perf.h"
 #include "igt.h"
+#include "igt_kmod.h"
 #include "igt_sysfs.h"
-#include "drm.h"
 
 IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
 
@@ -4916,7 +4916,8 @@ igt_main
 		 * loading/unloading i915. Load i915 here before we stat the
 		 * files.
 		 */
-		drm_load_module(DRIVER_INTEL);
+		igt_i915_driver_unload();
+		igt_assert_eq(igt_i915_driver_load(NULL), 0);
 
 		igt_require(stat("/proc/sys/dev/i915/perf_stream_paranoid", &sb)
 			    == 0);
-- 
2.35.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

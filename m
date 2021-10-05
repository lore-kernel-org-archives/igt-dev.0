Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0B66E428
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 16:52:52 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue,  5 Oct 2021 09:47:46 -0700
Message-Id: <20211005164746.14411-4-matthew.brost@intel.com>
In-Reply-To: <20211005164746.14411-1-matthew.brost@intel.com>
References: <20211005164746.14411-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/3] i915/sysfs_preempt_timeout: Update test to
 work with GuC submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Increase reset timeout as resets can take a bit longer with GuC
submission because an error capture is done and with a large GuC log (16
MB) these take a while.

Don't run 'off' section as with GuC submission we don't handle
dynamically changing the preemption timeout from 'off' to 'on' on a
currently running context. This is not bug in GuC submission rather an
architectural decision to not implement this as there is no user aside
from IGTs. We don't run this section on any gen12+ platforms as we
assume GuC submission on these platforms.

v2:
 (Tvrtko)
  - Update comment why we are skipping the 'off' section

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/sysfs_preempt_timeout.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
index d176ae72e..515038281 100644
--- a/tests/i915/sysfs_preempt_timeout.c
+++ b/tests/i915/sysfs_preempt_timeout.c
@@ -29,6 +29,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#include "igt.h"
 #include "igt_params.h"
 #include "drmtest.h"
 #include "i915/gem.h"
@@ -41,7 +42,7 @@
 #include "sw_sync.h"
 
 #define ATTR "preempt_timeout_ms"
-#define RESET_TIMEOUT 50 /* milliseconds, at least one jiffie for kworker */
+#define RESET_TIMEOUT 1000 /* milliseconds, at long enough for an error capture */
 
 static bool __enable_hangcheck(int dir, bool state)
 {
@@ -254,6 +255,14 @@ static void test_off(int i915, int engine)
 	gem_quiescent_gpu(i915);
 	igt_require(enable_hangcheck(i915, false));
 
+	/*
+	 * Not a supported behavior for GuC enabled platforms, assume GuC
+	 * submission on gen12+. This isn't strickly true, e.g. TGL does not use
+	 * GuC submission, but we are not really losing coverage as this test
+	 * isn't not a UMD use case.
+	 */
+	igt_require(intel_gen(intel_get_drm_devid(i915)) < 12);
+
 	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
 	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
 
-- 
2.32.0

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D1010E6E7
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Oct 2022 20:55:41 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Oct 2022 20:55:18 +0000
Message-Id: <20221027205535.12824-12-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
References: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 11/28] i915/perf: Skip tests that use
 rendercopy
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

Running tests that require rendercopy sometimes leaves the DUT in an
unsusable state. Further tests fail to run and DUT requires reboot.
Since it affects CI efficiency, skip tests is rendercopy is missing.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/perf.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 24a6e5bd..7acc5364 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -41,6 +41,7 @@
 #include "i915/gem.h"
 #include "i915/perf.h"
 #include "igt.h"
+#include "igt_perf.h"
 #include "igt_sysfs.h"
 #include "drm.h"
 
@@ -4968,6 +4969,19 @@ static int i915_perf_revision(int fd)
 	return value;
 }
 
+static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
+{
+	int fd;
+
+	fd = perf_i915_open(i915, I915_PMU_ENGINE_BUSY(class, instance));
+	if (fd >= 0) {
+		close(fd);
+		return true;
+	}
+
+	return false;
+}
+
 igt_main
 {
 	igt_fixture {
@@ -5012,7 +5026,8 @@ igt_main
 
 		gt_max_freq_mhz = sysfs_read(RPS_RP0_FREQ_MHZ);
 
-		render_copy = igt_get_render_copyfunc(devid);
+		if (has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0))
+			render_copy = igt_get_render_copyfunc(devid);
 	}
 
 	igt_subtest("non-system-wide-paranoid")
-- 
2.25.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1296AA7259
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Aug 2022 23:57:06 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 Aug 2022 23:56:46 +0000
Message-Id: <20220822235657.280702-13-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220822235657.280702-1-umesh.nerlige.ramappa@intel.com>
References: <20220822235657.280702-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 12/23] i915/perf: Skip tests that use
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
---
 tests/i915/perf.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index ba8c3792..85f3c5de 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -41,6 +41,7 @@
 #include "i915/gem.h"
 #include "i915/perf.h"
 #include "igt.h"
+#include "igt_perf.h"
 #include "igt_sysfs.h"
 #include "drm.h"
 
@@ -5025,6 +5026,19 @@ static int i915_perf_revision(int fd)
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
@@ -5069,7 +5083,8 @@ igt_main
 
 		gt_max_freq_mhz = sysfs_read(RPS_RP0_FREQ_MHZ);
 
-		render_copy = igt_get_render_copyfunc(devid);
+		if (has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0))
+			render_copy = igt_get_render_copyfunc(devid);
 	}
 
 	igt_subtest("non-system-wide-paranoid")
-- 
2.25.1

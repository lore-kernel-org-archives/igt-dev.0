Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB346EA99
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Oct 2021 00:01:32 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 29 Oct 2021 17:07:44 -0700
Message-Id: <20211030000744.231762-2-jose.souza@intel.com>
In-Reply-To: <20211030000744.231762-1-jose.souza@intel.com>
References: <20211030000744.231762-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_async_flips: Skip test when
 running with Intel's PSR2 selective fetch enabled
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
Cc: Karthik B S <karthik.b.s@intel.com>, Vandita Kulkarni <vandita.kulkarni@intel.com>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Intel's PSR2 selective fetch adds other planes to state when
necessary, causing the async flip to fail because async flip is not
supported in cursor plane.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/igt_psr.c           | 16 ++++++++++++++++
 lib/igt_psr.h           |  2 ++
 tests/kms_async_flips.c |  8 ++++++++
 3 files changed, 26 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 857eb591c..8fa8b192f 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -21,6 +21,7 @@
  * IN THE SOFTWARE.
  */
 
+#include "drmtest.h"
 #include "igt_params.h"
 #include "igt_psr.h"
 #include "igt_sysfs.h"
@@ -264,3 +265,18 @@ void psr_print_debugfs(int debugfs_fd)
 
 	igt_info("%s", buf);
 }
+
+bool i915_psr2_selective_fetch_check(int drm_fd)
+{
+	int debugfs_fd;
+	bool ret;
+
+	if (!is_i915_device(drm_fd))
+		return false;
+
+	debugfs_fd = igt_debugfs_dir(drm_fd);
+	ret = psr2_selective_fetch_check(debugfs_fd);
+	close(debugfs_fd);
+
+	return ret;
+}
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index c47b197b1..a075f336d 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -47,4 +47,6 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode);
 bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
 void psr_print_debugfs(int debugfs_fd);
 
+bool i915_psr2_selective_fetch_check(int drm_fd);
+
 #endif
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4ff7a196a..c35565f69 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -27,6 +27,7 @@
 
 #include "igt.h"
 #include "igt_aux.h"
+#include "igt_psr.h"
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <poll.h>
@@ -299,6 +300,13 @@ static void test_cursor(data_t *data)
 	struct igt_fb cursor_fb;
 	struct drm_mode_cursor cur;
 
+	/*
+	 * Intel's PSR2 selective fetch adds other planes to state when
+	 * necessary, causing the async flip to fail because async flip is not
+	 * supported in cursor plane.
+	 */
+	igt_skip_on(i915_psr2_selective_fetch_check(data->drm_fd));
+
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
 
-- 
2.33.1

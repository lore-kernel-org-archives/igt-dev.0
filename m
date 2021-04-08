Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu,  8 Apr 2021 10:31:56 +0200
Message-Id: <20210408083157.23014-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH 1/2] tests/core_hotunplug: Add perf health
 check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Sometimes CI reports skips of perf subtests when run subsequently after
core_hotunplug.  That may be an indication of issues with restoring
device perf features on driver (hot)rebind.

Detect device perf support at test start and check if still available
after driver rebind.  If that fails, a post-subtest device recovery
step restores the device perf support so no subsequently executed tests
are affected.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 22 ++++++++++++++++++++++
 tests/meson.build      |  8 +++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 56a88fefd..06f15d845 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -31,6 +31,7 @@
 #include <unistd.h>
 
 #include "i915/gem.h"
+#include "i915/perf.h"
 #include "igt.h"
 #include "igt_device_scan.h"
 #include "igt_kmod.h"
@@ -50,6 +51,7 @@ struct hotunplug {
 	const char *dev_bus_addr;
 	const char *failure;
 	bool need_healthcheck;
+	bool has_intel_perf;
 };
 
 /* Helpers */
@@ -319,6 +321,16 @@ static int local_i915_recover(int i915)
 	return local_i915_healthcheck(i915, "post-");
 }
 
+static bool local_i915_perf_healthcheck(int i915)
+{
+	struct intel_perf *intel_perf;
+
+	intel_perf = intel_perf_for_fd(i915);
+	if (intel_perf)
+		intel_perf_free(intel_perf);
+	return intel_perf;
+}
+
 #define FLAG_RENDER	(1 << 0)
 #define FLAG_RECOVER	(1 << 1)
 static void node_healthcheck(struct hotunplug *priv, unsigned flags)
@@ -360,6 +372,13 @@ static void node_healthcheck(struct hotunplug *priv, unsigned flags)
 		}
 	}
 
+	if (!priv->failure && priv->has_intel_perf) {
+		local_debug("%s\n", "running i915 device perf healthcheck");
+		priv->failure = "Device perf healthckeck failure!";
+		if (local_i915_perf_healthcheck(fd_drm))
+			priv->failure = NULL;
+	}
+
 	fd_drm = close_device(fd_drm, "", "health checked ");
 	if (closed || fd_drm < -1)	/* update status for post_healthcheck */
 		priv->fd.drm_hc = fd_drm;
@@ -553,6 +572,7 @@ igt_main
 		.fd		= { .drm = -1, .drm_hc = -1, .sysfs_dev = -1, },
 		.failure	= NULL,
 		.need_healthcheck = true,
+		.has_intel_perf = false,
 	};
 
 	igt_fixture {
@@ -567,6 +587,8 @@ igt_main
 			gem_quiescent_gpu(fd_drm);
 			igt_require_gem(fd_drm);
 
+			priv.has_intel_perf = local_i915_perf_healthcheck(fd_drm);
+
 			/**
 			 * FIXME: Unbinding the i915 driver on some Haswell
 			 * platforms with Azalia audio results in a kernel WARN
diff --git a/tests/meson.build b/tests/meson.build
index 3e3db7d5b..3f6dc4fe3 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -3,7 +3,6 @@ test_progs = [
 	'core_getclient',
 	'core_getstats',
 	'core_getversion',
-	'core_hotunplug',
 	'core_setmaster',
 	'core_setmaster_vs_auth',
 	'debugfs_test',
@@ -361,6 +360,13 @@ test_executables += executable('perf',
 	   install : true)
 test_list += 'perf'
 
+test_executables += executable('core_hotunplug', 'core_hotunplug.c',
+	   dependencies : test_deps + [ lib_igt_i915_perf ],
+	   install_dir : libexecdir,
+	   install_rpath : libexecdir_rpathdir,
+	   install : true)
+test_list += 'core_hotunplug'
+
 executable('testdisplay', ['testdisplay.c', 'testdisplay_hotplug.c'],
 	   dependencies : test_deps,
 	   install_dir : libexecdir,
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

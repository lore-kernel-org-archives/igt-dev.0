Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu,  1 Apr 2021 16:36:38 +0200
Message-Id: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 1/6] tests/core_hotunplug: Add 'GEM
 context' variants
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

Verify if an additional context associated with an open device file
descriptor is cleaned up correctly on device hotunbind / hotunplug.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 79 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 56a88fefd..4f6c4f625 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -31,6 +31,7 @@
 #include <unistd.h>
 
 #include "i915/gem.h"
+#include "i915/gem_context.h"
 #include "igt.h"
 #include "igt_device_scan.h"
 #include "igt_kmod.h"
@@ -545,6 +546,60 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
+static void ctx_hotunbind_lateclose(struct hotunplug *priv)
+{
+	uint32_t ctx;
+
+	igt_require(priv->fd.drm = -1);
+	priv->fd.drm = local_drm_open_driver(false, "pre-", " for prerequisites check");
+
+	igt_require_intel(priv->fd.drm);
+	gem_require_contexts(priv->fd.drm);
+	priv->fd.drm = close_device(priv->fd.drm, "", "pre-checked ");
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
+
+	local_debug("%s\n", "creating additional GEM user context");
+	ctx = gem_context_create(priv->fd.drm);
+
+	driver_unbind(priv, "hot ", 0);
+
+	local_debug("%s\n", "trying to late destroy the context");
+	igt_assert_eq(__gem_context_destroy(priv->fd.drm, ctx), -ENODEV);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
+	igt_assert_eq(priv->fd.drm, -1);
+}
+
+static void ctx_hotunplug_lateclose(struct hotunplug *priv)
+{
+	uint32_t ctx;
+
+	igt_require(priv->fd.drm = -1);
+	priv->fd.drm = local_drm_open_driver(false, "pre-", " for prerequisites check");
+
+	igt_require_intel(priv->fd.drm);
+	gem_require_contexts(priv->fd.drm);
+	priv->fd.drm = close_device(priv->fd.drm, "", "pre-checked ");
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
+
+	local_debug("%s\n", "creating additional GEM user context");
+	ctx = gem_context_create(priv->fd.drm);
+
+	device_unplug(priv, "hot ", 0);
+
+	local_debug("%s\n", "trying to late destroy the context");
+	igt_assert_eq(__gem_context_destroy(priv->fd.drm, ctx), -ENODEV);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
+	igt_assert_eq(priv->fd.drm, -1);
+}
+
 /* Main */
 
 igt_main
@@ -682,6 +737,30 @@ igt_main
 			recover(&priv);
 	}
 
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if the driver can be cleanly unbound for a still open device with extra GEM context, then released");
+		igt_subtest("ctx-hotunbind-lateclose")
+			ctx_hotunbind_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
+
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if a still open device with extra GEM context can be cleanly unplugged, then released");
+		igt_subtest("ctx-hotunplug-lateclose")
+			ctx_hotunplug_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
+
 	igt_fixture {
 		post_healthcheck(&priv);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu,  1 Apr 2021 16:36:43 +0200
Message-Id: <20210401143643.7867-6-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
References: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 6/6] tests/core_hotunplug: Add 'GEM
 spin' variants
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

Verify if a device with a GEM spin batch job still running on a GPU can
be hot-unbound/unplugged cleanly and released.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 124 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 0cb1267ae..f93545402 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -35,6 +35,7 @@
 #include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_device_scan.h"
+#include "igt_dummyload.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
@@ -440,6 +441,37 @@ static int local_gem_close(int fd, uint32_t handle)
 	return igt_ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo) ? -errno : 0;
 }
 
+static int local_bo_busy(int fd, uint32_t handle)
+{
+	struct drm_i915_gem_busy busy = { .handle = handle, };
+
+	return igt_ioctl(fd, DRM_IOCTL_I915_GEM_BUSY, &busy) ? -errno : 0;
+}
+
+static void local_spin_free(struct hotunplug *priv, igt_spin_t *spin)
+{
+	igt_spin_end(spin);
+
+	spin->poll_handle = 0;
+	spin->handle = 0;
+
+	if (spin->poll) {
+		void *ptr = spin->poll;
+
+		spin->poll = NULL;
+		igt_assert(!gem_munmap(ptr, 4096));
+	}
+
+	if (spin->batch) {
+		void *ptr = spin->poll;
+
+		spin->batch = NULL;
+		igt_assert(!gem_munmap(ptr, 4096));
+	}
+
+	igt_spin_free(priv->fd.drm, spin);
+}
+
 /* Subtests */
 
 static void unbind_rebind(struct hotunplug *priv)
@@ -862,6 +894,74 @@ static void prime_hotunplug_lateclose(struct hotunplug *priv)
 	igt_assert_eq(dmabuf, -1);
 }
 
+static void spin_hotunbind_lateclose(struct hotunplug *priv)
+{
+	igt_spin_t *spin;
+
+	igt_require(priv->fd.drm = -1);
+	priv->fd.drm = local_drm_open_driver(false, "pre-", " for prerequisites check");
+
+	igt_require_intel(priv->fd.drm);
+	igt_require_gem(priv->fd.drm);
+	priv->fd.drm = close_device(priv->fd.drm, "", "pre-checked ");
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
+
+	local_debug("%s\n", "running dummy load");
+	spin = igt_spin_new(priv->fd.drm, .flags = IGT_SPIN_POLL_RUN);
+	igt_spin_busywait_until_started(spin);
+
+	driver_unbind(priv, "hot ", 0);
+
+	local_debug("%s\n", "trying to late query the dummy load related GEM object status");
+	igt_assert_eq(local_bo_busy(priv->fd.drm, spin->handle), -ENODEV);
+	local_debug("%s\n", "trying to late close the dummy load related GEM objects");
+	igt_assert_eq(local_gem_close(priv->fd.drm, spin->poll_handle), -ENODEV);
+	igt_assert_eq(local_gem_close(priv->fd.drm, spin->handle), -ENODEV);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	local_debug("%s\n", "trying to late free the dummy load");
+	local_spin_free(priv, spin);
+}
+
+static void spin_hotunplug_lateclose(struct hotunplug *priv)
+{
+	igt_spin_t *spin;
+
+	igt_require(priv->fd.drm = -1);
+	priv->fd.drm = local_drm_open_driver(false, "pre-", " for prerequisites check");
+
+	igt_require_intel(priv->fd.drm);
+	igt_require_gem(priv->fd.drm);
+	priv->fd.drm = close_device(priv->fd.drm, "", "pre-checked ");
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
+
+	local_debug("%s\n", "running dummy load");
+	spin = igt_spin_new(priv->fd.drm, .flags = IGT_SPIN_POLL_RUN);
+	igt_spin_busywait_until_started(spin);
+
+	device_unplug(priv, "hot ", 0);
+
+	local_debug("%s\n", "trying to late query the dummy load related GEM object status");
+	igt_assert_eq(local_bo_busy(priv->fd.drm, spin->handle), -ENODEV);
+	local_debug("%s\n", "trying to late close the dummy load related GEM objects");
+	igt_assert_eq(local_gem_close(priv->fd.drm, spin->poll_handle), -ENODEV);
+	igt_assert_eq(local_gem_close(priv->fd.drm, spin->handle), -ENODEV);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	local_debug("%s\n", "trying to late free the dummy load");
+	local_spin_free(priv, spin);
+}
+
 /* Main */
 
 igt_main
@@ -1119,6 +1219,30 @@ igt_main
 			recover(&priv);
 	}
 
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if the driver can be cleanly unbound from a device with a still running spin batch, then released");
+		igt_subtest("spin-hotunbind-lateclose")
+			spin_hotunbind_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
+
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if a device with a still running spin batch can be cleanly unplugged, then released");
+		igt_subtest("spin-hotunplug-lateclose")
+			spin_hotunplug_lateclose(&priv);
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

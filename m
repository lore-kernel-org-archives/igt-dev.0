Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 28 Aug 2020 09:59:25 +0200
Message-Id: <20200828075927.17061-20-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200828075927.17061-1-janusz.krzysztofik@linux.intel.com>
References: <20200828075927.17061-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v5 19/21] tests/core_hotunplug: Duplicate
 debug messages in dmesg
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The purpose of debug messages displayed by the test is to make
identification of a subtest phase that fails more easy.  Since issues
exhibited by the test are mostly reported to dmesg, print those debug
messages to /dev/kmsg as well.

v2: Rebase on upstream.
v3: Refresh.
v4: Refresh.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 305c57a3f..361d601af 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -52,6 +52,12 @@ struct hotunplug {
 
 /* Helpers */
 
+#define local_debug(fmt, msg...)			       \
+({							       \
+	igt_debug(fmt, msg);				       \
+	igt_kmsg(KMSG_DEBUG "%s: " fmt, igt_test_name(), msg); \
+})
+
 /**
  * Subtests must be able to close examined devices completely.  Don't
  * use drm_open_driver() since in case of an i915 device it opens it
@@ -61,7 +67,7 @@ static int local_drm_open_driver(const char *prefix, const char *suffix)
 {
 	int fd_drm;
 
-	igt_debug("%sopening device%s\n", prefix, suffix);
+	local_debug("%sopening device%s\n", prefix, suffix);
 
 	fd_drm = __drm_open_driver(DRIVER_ANY);
 	igt_assert_fd(fd_drm);
@@ -121,7 +127,7 @@ static void prepare(struct hotunplug *priv)
 static void driver_unbind(struct hotunplug *priv, const char *prefix,
 			  int timeout)
 {
-	igt_debug("%sunbinding the driver from the device\n", prefix);
+	local_debug("%sunbinding the driver from the device\n", prefix);
 	priv->failure = "Driver unbind failure!";
 
 	igt_set_timeout(timeout, "Driver unbind timeout!");
@@ -137,7 +143,7 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
 /* Re-bind the driver to the device */
 static void driver_bind(struct hotunplug *priv, int timeout)
 {
-	igt_debug("rebinding the driver to the device\n");
+	local_debug("%s\n", "rebinding the driver to the device");
 	priv->failure = "Driver re-bind failure!";
 
 	igt_set_timeout(timeout, "Driver re-bind timeout!");
@@ -161,7 +167,7 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
 				    O_DIRECTORY);
 	igt_assert_fd(priv->fd.sysfs_dev);
 
-	igt_debug("%sunplugging the device\n", prefix);
+	local_debug("%sunplugging the device\n", prefix);
 	priv->failure = "Device unplug failure!";
 
 	igt_set_timeout(timeout, "Device unplug timeout!");
@@ -179,7 +185,7 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
 /* Re-discover the device by rescanning its bus */
 static void bus_rescan(struct hotunplug *priv, int timeout)
 {
-	igt_debug("rediscovering the device\n");
+	local_debug("%s\n", "rediscovering the device");
 	priv->failure = "Bus rescan failure!";
 
 	igt_set_timeout(timeout, "Bus rescan timeout!");
@@ -232,7 +238,7 @@ static int local_i915_healthcheck(int i915, const char *prefix)
 	if (hang_detected)
 		return -EIO;
 
-	igt_debug("%srunning i915 GPU healthcheck\n", prefix);
+	local_debug("%s%s\n", prefix, "running i915 GPU healthcheck");
 
 	if (local_i915_is_wedged(i915))
 		return -EIO;
@@ -267,7 +273,7 @@ static int local_i915_recover(int i915)
 	if (!local_i915_healthcheck(i915, "re-"))
 		return 0;
 
-	igt_debug("forcing i915 GPU reset\n");
+	local_debug("%s\n", "forcing i915 GPU reset");
 	igt_force_gpu_reset(i915);
 
 	hang_detected = false;
@@ -392,7 +398,7 @@ static void hotunbind_rebind(struct hotunplug *priv)
 
 	driver_unbind(priv, "hot ", 0);
 
-	igt_debug("late closing the unbound device instance\n");
+	local_debug("%s\n", "late closing the unbound device instance");
 	priv->fd.drm = close_device(priv->fd.drm);
 	igt_assert_eq(priv->fd.drm, -1);
 
@@ -408,7 +414,7 @@ static void hotunplug_rescan(struct hotunplug *priv)
 
 	device_unplug(priv, "hot ", 0);
 
-	igt_debug("late closing the removed device instance\n");
+	local_debug("%s\n", "late closing the removed device instance");
 	priv->fd.drm = close_device(priv->fd.drm);
 	igt_assert_eq(priv->fd.drm, -1);
 
@@ -427,7 +433,7 @@ static void hotrebind_lateclose(struct hotunplug *priv)
 
 	healthcheck(priv, false);
 
-	igt_debug("late closing the unbound device instance\n");
+	local_debug("%s\n", "late closing the unbound device instance");
 	priv->fd.drm = close_device(priv->fd.drm);
 	igt_assert_eq(priv->fd.drm, -1);
 
@@ -444,7 +450,7 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 
 	healthcheck(priv, false);
 
-	igt_debug("late closing the removed device instance\n");
+	local_debug("%s\n", "late closing the removed device instance");
 	priv->fd.drm = close_device(priv->fd.drm);
 	igt_assert_eq(priv->fd.drm, -1);
 
-- 
2.21.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

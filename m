Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 11 Sep 2020 12:30:37 +0200
Message-Id: <20200911103039.4574-23-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 22/24] tests/core_hotunplug: Duplicate
 debug messages in dmesg
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The purpose of debug messages displayed by the test is to make
identification of a subtest phase that fails more easy.  Since issues
exhibited by the test are mostly reported to dmesg, print those debug
messages to /dev/kmsg as well.

v2: Rebase on upstream.
v3: Refresh.
v4: Refresh.
v5: Refresh.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 3e2a76ddb..67e67627f 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -53,6 +53,12 @@ struct hotunplug {
 
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
@@ -62,8 +68,8 @@ static int local_drm_open_driver(bool render, const char *when, const char *why)
 {
 	int fd_drm;
 
-	igt_debug("%sopening %s device%s\n", when, render ? "render" : "DRM",
-		  why);
+	local_debug("%sopening %s device%s\n", when, render ? "render" : "DRM",
+		    why);
 
 	fd_drm = render ? __drm_open_driver_render(DRIVER_ANY) :
 			  __drm_open_driver(DRIVER_ANY);
@@ -86,7 +92,7 @@ static int close_device(int fd_drm, const char *when, const char *which)
 	if (fd_drm < 0)	/* not open - return current status */
 		return fd_drm;
 
-	igt_debug("%sclosing %sdevice instance\n", when, which);
+	local_debug("%sclosing %sdevice instance\n", when, which);
 	return local_close(fd_drm, "Device close failed");
 }
 
@@ -128,7 +134,7 @@ static void prepare(struct hotunplug *priv)
 static void driver_unbind(struct hotunplug *priv, const char *prefix,
 			  int timeout)
 {
-	igt_debug("%sunbinding the driver from the device\n", prefix);
+	local_debug("%sunbinding the driver from the device\n", prefix);
 	priv->failure = "Driver unbind failure!";
 
 	igt_set_timeout(timeout, "Driver unbind timeout!");
@@ -144,7 +150,7 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
 /* Re-bind the driver to the device */
 static void driver_bind(struct hotunplug *priv, int timeout)
 {
-	igt_debug("rebinding the driver to the device\n");
+	local_debug("%s\n", "rebinding the driver to the device");
 	priv->failure = "Driver re-bind failure!";
 
 	igt_set_timeout(timeout, "Driver re-bind timeout!");
@@ -168,7 +174,7 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
 				    O_DIRECTORY);
 	igt_assert_fd(priv->fd.sysfs_dev);
 
-	igt_debug("%sunplugging the device\n", prefix);
+	local_debug("%sunplugging the device\n", prefix);
 	priv->failure = "Device unplug failure!";
 
 	igt_set_timeout(timeout, "Device unplug timeout!");
@@ -186,7 +192,7 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
 /* Re-discover the device by rescanning its bus */
 static void bus_rescan(struct hotunplug *priv, int timeout)
 {
-	igt_debug("rediscovering the device\n");
+	local_debug("%s\n", "rediscovering the device");
 	priv->failure = "Bus rescan failure!";
 
 	igt_set_timeout(timeout, "Bus rescan timeout!");
@@ -241,7 +247,7 @@ static int local_i915_healthcheck(int i915, const char *prefix)
 	if (hang_detected)
 		return -EIO;
 
-	igt_debug("%srunning i915 GPU healthcheck\n", prefix);
+	local_debug("%s%s\n", prefix, "running i915 GPU healthcheck");
 
 	if (local_i915_is_wedged(i915))
 		return -EIO;
@@ -276,7 +282,7 @@ static int local_i915_recover(int i915)
 	if (!local_i915_healthcheck(i915, "re-"))
 		return 0;
 
-	igt_debug("forcing i915 GPU reset\n");
+	local_debug("%s\n", "forcing i915 GPU reset");
 	igt_force_gpu_reset(i915);
 
 	hang_detected = false;
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 11 Sep 2020 12:30:28 +0200
Message-Id: <20200911103039.4574-14-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 13/24] tests/core_hotunplug: Let the
 driver time out essential sysfs operations
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

The test now arms a timer before performing each driver unbind / rebind
or device unplug / bus rescan sysfs operation.  Then in case of issues
we may prevent the driver from showing us if and how it can handle
them.

Don't arm the timer before sysfs operations which are essential for a
subtest.

v2: Refresh,
  - don't time out on hot driver rebind / hot device restore in
    *-lateclose variants, those operations haven't been covered by
    other subtests.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index d31faf215..6112704f4 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -120,29 +120,31 @@ static void prepare(struct hotunplug *priv)
 }
 
 /* Unbind the driver from the device */
-static void driver_unbind(struct hotunplug *priv, const char *prefix)
+static void driver_unbind(struct hotunplug *priv, const char *prefix,
+			  int timeout)
 {
 	igt_debug("%sunbinding the driver from the device\n", prefix);
 	priv->failure = "Driver unbind failure!";
 
-	igt_set_timeout(60, "Driver unbind timeout!");
+	igt_set_timeout(timeout, "Driver unbind timeout!");
 	igt_sysfs_set(priv->fd.sysfs_drv, "unbind", priv->dev_bus_addr);
 	igt_reset_timeout();
 }
 
 /* Re-bind the driver to the device */
-static void driver_bind(struct hotunplug *priv)
+static void driver_bind(struct hotunplug *priv, int timeout)
 {
 	igt_debug("rebinding the driver to the device\n");
 	priv->failure = "Driver re-bind failure!";
 
-	igt_set_timeout(60, "Driver re-bind timeout!");
+	igt_set_timeout(timeout, "Driver re-bind timeout!");
 	igt_sysfs_set(priv->fd.sysfs_drv, "bind", priv->dev_bus_addr);
 	igt_reset_timeout();
 }
 
 /* Remove (virtually unplug) the device from its bus */
-static void device_unplug(struct hotunplug *priv, const char *prefix)
+static void device_unplug(struct hotunplug *priv, const char *prefix,
+			  int timeout)
 {
 	igt_require(priv->fd.sysfs_dev == -1);
 
@@ -153,7 +155,7 @@ static void device_unplug(struct hotunplug *priv, const char *prefix)
 	igt_debug("%sunplugging the device\n", prefix);
 	priv->failure = "Device unplug failure!";
 
-	igt_set_timeout(60, "Device unplug timeout!");
+	igt_set_timeout(timeout, "Device unplug timeout!");
 	igt_sysfs_set(priv->fd.sysfs_dev, "remove", "1");
 	igt_reset_timeout();
 
@@ -162,12 +164,12 @@ static void device_unplug(struct hotunplug *priv, const char *prefix)
 }
 
 /* Re-discover the device by rescanning its bus */
-static void bus_rescan(struct hotunplug *priv)
+static void bus_rescan(struct hotunplug *priv, int timeout)
 {
 	igt_debug("rediscovering the device\n");
 	priv->failure = "Bus rescan failure!";
 
-	igt_set_timeout(60, "Bus rescan timeout!");
+	igt_set_timeout(timeout, "Bus rescan timeout!");
 	igt_sysfs_set(priv->fd.sysfs_bus, "../rescan", "1");
 	igt_reset_timeout();
 }
@@ -214,10 +216,10 @@ static void recover(struct hotunplug *priv)
 	cleanup(priv);
 
 	if (faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr, F_OK, 0))
-		bus_rescan(priv);
+		bus_rescan(priv, 60);
 
 	else if (faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0))
-		driver_bind(priv);
+		driver_bind(priv, 60);
 
 	if (priv->failure)
 		healthcheck(priv);
@@ -252,9 +254,9 @@ static void unbind_rebind(struct hotunplug *priv)
 {
 	igt_assert_eq(priv->fd.drm, -1);
 
-	driver_unbind(priv, "");
+	driver_unbind(priv, "", 0);
 
-	driver_bind(priv);
+	driver_bind(priv, 0);
 
 	healthcheck(priv);
 }
@@ -263,9 +265,9 @@ static void unplug_rescan(struct hotunplug *priv)
 {
 	igt_assert_eq(priv->fd.drm, -1);
 
-	device_unplug(priv, "");
+	device_unplug(priv, "", 0);
 
-	bus_rescan(priv);
+	bus_rescan(priv, 0);
 
 	healthcheck(priv);
 }
@@ -275,9 +277,9 @@ static void hotunbind_lateclose(struct hotunplug *priv)
 	igt_assert_eq(priv->fd.drm, -1);
 	priv->fd.drm = local_drm_open_driver("", " for hot unbind");
 
-	driver_unbind(priv, "hot ");
+	driver_unbind(priv, "hot ", 0);
 
-	driver_bind(priv);
+	driver_bind(priv, 0);
 
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
 	igt_assert_eq(priv->fd.drm, -1);
@@ -290,9 +292,9 @@ static void hotunplug_lateclose(struct hotunplug *priv)
 	igt_assert_eq(priv->fd.drm, -1);
 	priv->fd.drm = local_drm_open_driver("", " for hot unplug");
 
-	device_unplug(priv, "hot ");
+	device_unplug(priv, "hot ", 0);
 
-	bus_rescan(priv);
+	bus_rescan(priv, 0);
 
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
 	igt_assert_eq(priv->fd.drm, -1);
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

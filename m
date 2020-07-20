Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 20 Jul 2020 14:19:04 +0200
Message-Id: <20200720121908.28124-12-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
References: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATH i-g-t 11/15] tests/core_hotunplug: Follow
 failed subtests with health checks
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
Cc: intel-gfx@lists.freedesktop.org, =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Subtests now forcibly call or request igt_abort on failures in order to
avoid silently leaving an exercised device in an unusable state.
However, a failure inside a subtest doesn't always mean the device is
no longer working correctly and reboot is needed.  On the other hand,
if a subtest just fails without aborting, that doesn't mean in turn the
device is healthy.  We should still perform a device health check
in that case before deciding on next steps.

Reuse the 'failure' structure field as a mark which is set when a
subtest enters a chunk of critical steps which must be followed by a
successful health check in order to avoid aborting the test execution.
Then, move health checks from inside each subtest body to its
individual follow-up igt_fixture section from where device file
descriptors potentially left open are closed and the health check is
run if theigt_subtest section has been exited with the marker set.
Also, precede health check operations with a driver rebind or bus
rescan attempt as needed.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 107 +++++++++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 32 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 71da8f2a1..082bcc306 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -52,6 +52,9 @@ struct hotunplug {
 
 static int local_close(int fd)
 {
+	if (fd < 0)	/* not open - return current status */
+		return fd;
+
 	errno = 0;
 	if (close(fd))	/* close failure - return -errno (never -1) */
 		return -errno;
@@ -91,11 +94,9 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix)
 {
 	igt_debug("%sunbinding the driver from the device\n", prefix);
 
-	priv->failure = "Driver unbind timeout!";
-	igt_set_timeout(60, priv->failure);
+	igt_set_timeout(60, "Driver unbind timeout!");
 	igt_sysfs_set(priv->fd.sysfs_drv, "unbind", priv->dev_bus_addr);
 	igt_reset_timeout();
-	priv->failure = NULL;
 }
 
 /* Re-bind the driver to the device */
@@ -103,11 +104,9 @@ static void driver_bind(struct hotunplug *priv)
 {
 	igt_debug("rebinding the driver to the device\n");
 
-	priv->failure = "Driver re-bind timeout!";
-	igt_set_timeout(60, priv->failure);
+	igt_set_timeout(60, "Driver re-bind timeout!");
 	igt_sysfs_set(priv->fd.sysfs_drv, "bind", priv->dev_bus_addr);
 	igt_reset_timeout();
-	priv->failure = NULL;
 }
 
 /* Remove (virtually unplug) the device from its bus */
@@ -122,11 +121,9 @@ static void device_unplug(struct hotunplug *priv, const char *prefix)
 
 	igt_debug("%sunplugging the device\n", prefix);
 
-	priv->failure = "Device unplug timeout!";
-	igt_set_timeout(60, priv->failure);
+	igt_set_timeout(60, "Device unplug timeout!");
 	igt_sysfs_set(priv->fd.sysfs_dev, "remove", "1");
 	igt_reset_timeout();
-	priv->failure = NULL;
 
 	priv->fd.sysfs_dev = local_close(priv->fd.sysfs_dev);
 	igt_warn_on_f(priv->fd.sysfs_dev != -1,
@@ -138,11 +135,15 @@ static void bus_rescan(struct hotunplug *priv)
 {
 	igt_debug("recovering the device\n");
 
-	priv->failure = "Bus rescan timeout!";
-	igt_set_timeout(60, priv->failure);
+	igt_set_timeout(60, "Bus rescan timeout!");
 	igt_sysfs_set(priv->fd.sysfs_bus, "../rescan", "1");
 	igt_reset_timeout();
-	priv->failure = NULL;
+}
+
+static void cleanup(struct hotunplug *priv)
+{
+	priv->fd.drm = local_close(priv->fd.drm);
+	priv->fd.sysfs_dev = local_close(priv->fd.sysfs_dev);
 }
 
 static void healthcheck(struct hotunplug *priv)
@@ -150,6 +151,18 @@ static void healthcheck(struct hotunplug *priv)
 	/* preserve error code potentially stored before in priv->fd.drm */
 	int fd_drm;
 
+	if (faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr, F_OK, 0)) {
+		priv->failure = "Bus rescan failed!";
+		bus_rescan(priv);
+		priv->failure = NULL;
+	}
+
+	if (faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0)) {
+		priv->failure = "Driver re-bind failed!";
+		driver_bind(priv);
+		priv->failure = NULL;
+	}
+
 	/* device name may have changed, rebuild IGT device list */
 	igt_devices_scan(true);
 
@@ -169,6 +182,16 @@ static void healthcheck(struct hotunplug *priv)
 	igt_assert_f(fd_drm == -1, "Device close failed\n");
 }
 
+static void recover(struct hotunplug *priv)
+{
+	igt_require(priv->failure);
+	priv->failure = NULL;
+
+	cleanup(priv);
+
+	healthcheck(priv);
+}
+
 static void post_healthckeck(struct hotunplug *priv)
 {
 	igt_abort_on_f(priv->failure, "%s\n", priv->failure);
@@ -195,20 +218,20 @@ static void set_filter_from_device(int fd)
 
 static void unbind_rebind(struct hotunplug *priv)
 {
+	priv->failure = "subtest failure";
+
 	driver_unbind(priv, "");
 
 	driver_bind(priv);
-
-	healthcheck(priv);
 }
 
 static void unplug_rescan(struct hotunplug *priv)
 {
+	priv->failure = "subtest failure";
+
 	device_unplug(priv, "");
 
 	bus_rescan(priv);
-
-	healthcheck(priv);
 }
 
 static void hotunbind_lateclose(struct hotunplug *priv)
@@ -217,6 +240,8 @@ static void hotunbind_lateclose(struct hotunplug *priv)
 	priv->fd.drm = __drm_open_driver(DRIVER_ANY);
 	igt_assert_fd(priv->fd.drm);
 
+	priv->failure = "subtest failure";
+
 	driver_unbind(priv, "hot ");
 
 	driver_bind(priv);
@@ -224,8 +249,6 @@ static void hotunbind_lateclose(struct hotunplug *priv)
 	igt_debug("late closing the unbound device instance\n");
 	priv->fd.drm = local_close(priv->fd.drm);
 	igt_warn_on_f(priv->fd.drm != -1, "Device close failed\n");
-
-	healthcheck(priv);
 }
 
 static void hotunplug_lateclose(struct hotunplug *priv)
@@ -234,6 +257,8 @@ static void hotunplug_lateclose(struct hotunplug *priv)
 	priv->fd.drm = __drm_open_driver(DRIVER_ANY);
 	igt_assert_fd(priv->fd.drm);
 
+	priv->failure = "subtest failure";
+
 	device_unplug(priv, "hot ");
 
 	bus_rescan(priv);
@@ -241,8 +266,6 @@ static void hotunplug_lateclose(struct hotunplug *priv)
 	igt_debug("late closing the removed device instance\n");
 	priv->fd.drm = local_close(priv->fd.drm);
 	igt_warn_on_f(priv->fd.drm != -1, "Device close failed\n");
-
-	healthcheck(priv);
 }
 
 /* Main */
@@ -276,30 +299,50 @@ igt_main
 		prepare(&priv);
 	}
 
-	igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed");
-	igt_subtest("unbind-rebind")
-		unbind_rebind(&priv);
+	igt_subtest_group {
+		igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed");
+		igt_subtest("unbind-rebind")
+			unbind_rebind(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
 
 	igt_fixture
 		post_healthckeck(&priv);
 
-	igt_describe("Check if a device believed to be closed can be cleanly unplugged");
-	igt_subtest("unplug-rescan")
-		unplug_rescan(&priv);
+	igt_subtest_group {
+		igt_describe("Check if a device believed to be closed can be cleanly unplugged");
+		igt_subtest("unplug-rescan")
+			unplug_rescan(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
 
 	igt_fixture
 		post_healthckeck(&priv);
 
-	igt_describe("Check if the driver can be cleanly unbound from a still open device, then released");
-	igt_subtest("hotunbind-lateclose")
-		hotunbind_lateclose(&priv);
+	igt_subtest_group {
+		igt_describe("Check if the driver can be cleanly unbound from a still open device, then released");
+		igt_subtest("hotunbind-lateclose")
+			hotunbind_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
 
 	igt_fixture
 		post_healthckeck(&priv);
 
-	igt_describe("Check if a still open device can be cleanly unplugged, then released");
-	igt_subtest("hotunplug-lateclose")
-		hotunplug_lateclose(&priv);
+	igt_subtest_group {
+		igt_describe("Check if a still open device can be cleanly unplugged, then released");
+		igt_subtest("hotunplug-lateclose")
+			hotunplug_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
 
 	igt_fixture {
 		post_healthckeck(&priv);
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 20 Jul 2020 14:18:59 +0200
Message-Id: <20200720121908.28124-7-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
References: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATH i-g-t 06/15] tests/core_hotunplug: Maintain a
 single data structure instance
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

The following changes to the test are planned:
- avoid global variables,
- skip subtest after device close errors,
- prepare invariant data only once per test run,
- move device health checks to igt_fixture sections,
- try to recover from subtest failures instead of aborting.
For that to be possible, maintain a single instance of hotunplug
structure at igt_main level and pass it down to subtests.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 56 ++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 30 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index cac88c2f3..0e61da2d0 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -183,68 +183,62 @@ static void set_filter_from_device(int fd)
 
 /* Subtests */
 
-static void unbind_rebind(void)
+static void unbind_rebind(struct hotunplug *priv)
 {
-	struct hotunplug priv;
 	char buf[PATH_MAX];
 
-	prepare(&priv, buf, sizeof(buf));
+	prepare(priv, buf, sizeof(buf));
 
 	igt_debug("closing the device\n");
-	close(priv.fd.drm);
+	close(priv->fd.drm);
 
-	driver_unbind(priv.fd.sysfs_drv, priv.dev_bus_addr, "");
+	driver_unbind(priv->fd.sysfs_drv, priv->dev_bus_addr, "");
 
-	driver_bind(priv.fd.sysfs_drv, priv.dev_bus_addr);
+	driver_bind(priv->fd.sysfs_drv, priv->dev_bus_addr);
 
 	healthcheck();
 }
 
-static void unplug_rescan(void)
+static void unplug_rescan(struct hotunplug *priv)
 {
-	struct hotunplug priv;
-
-	prepare(&priv, NULL, 0);
+	prepare(priv, NULL, 0);
 
 	igt_debug("closing the device\n");
-	close(priv.fd.drm);
+	close(priv->fd.drm);
 
-	device_unplug(priv.fd.sysfs_dev, "");
+	device_unplug(priv->fd.sysfs_dev, "");
 
-	bus_rescan(priv.fd.sysfs_bus);
+	bus_rescan(priv->fd.sysfs_bus);
 
 	healthcheck();
 }
 
-static void hotunbind_lateclose(void)
+static void hotunbind_lateclose(struct hotunplug *priv)
 {
-	struct hotunplug priv;
 	char buf[PATH_MAX];
 
-	prepare(&priv, buf, sizeof(buf));
+	prepare(priv, buf, sizeof(buf));
 
-	driver_unbind(priv.fd.sysfs_drv, priv.dev_bus_addr, "hot ");
+	driver_unbind(priv->fd.sysfs_drv, priv->dev_bus_addr, "hot ");
 
-	driver_bind(priv.fd.sysfs_drv, priv.dev_bus_addr);
+	driver_bind(priv->fd.sysfs_drv, priv->dev_bus_addr);
 
 	igt_debug("late closing the unbound device instance\n");
-	close(priv.fd.drm);
+	close(priv->fd.drm);
 
 	healthcheck();
 }
 
-static void hotunplug_lateclose(void)
+static void hotunplug_lateclose(struct hotunplug *priv)
 {
-	struct hotunplug priv;
-
-	prepare(&priv, NULL, 0);
+	prepare(priv, NULL, 0);
 
-	device_unplug(priv.fd.sysfs_dev, "hot ");
+	device_unplug(priv->fd.sysfs_dev, "hot ");
 
-	bus_rescan(priv.fd.sysfs_bus);
+	bus_rescan(priv->fd.sysfs_bus);
 
 	igt_debug("late closing the removed device instance\n");
-	close(priv.fd.drm);
+	close(priv->fd.drm);
 
 	healthcheck();
 }
@@ -253,6 +247,8 @@ static void hotunplug_lateclose(void)
 
 igt_main
 {
+	struct hotunplug priv;
+
 	igt_fixture {
 		int fd_drm;
 
@@ -275,28 +271,28 @@ igt_main
 
 	igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed");
 	igt_subtest("unbind-rebind")
-		unbind_rebind();
+		unbind_rebind(&priv);
 
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
 
 	igt_describe("Check if a device believed to be closed can be cleanly unplugged");
 	igt_subtest("unplug-rescan")
-		unplug_rescan();
+		unplug_rescan(&priv);
 
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
 
 	igt_describe("Check if the driver can be cleanly unbound from a still open device, then released");
 	igt_subtest("hotunbind-lateclose")
-		hotunbind_lateclose();
+		hotunbind_lateclose(&priv);
 
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
 
 	igt_describe("Check if a still open device can be cleanly unplugged, then released");
 	igt_subtest("hotunplug-lateclose")
-		hotunplug_lateclose();
+		hotunplug_lateclose(&priv);
 
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

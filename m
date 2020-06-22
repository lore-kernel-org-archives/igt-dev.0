Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 22 Jun 2020 17:18:38 +0200
Message-Id: <20200622151845.4520-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200622151845.4520-1-janusz.krzysztofik@linux.intel.com>
References: <20200622151845.4520-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 1/8] tests/core_hotunplug: Duplicate
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The purpose of debug messages displayed by the test is to make
identification of a subtest phase that fails more easy.  Since issues
exhibited by the test are mostly reported to dmesg, print those debug
messages to /dev/kmsg as well.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index f9cfc8c3c..187168009 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -48,6 +48,12 @@ struct hotunplug {
 
 /* Helpers */
 
+#define local_debug(msg...)						     \
+({									     \
+	igt_debug("%s: %s\n", __func__, msg);				     \
+	igt_kmsg(KMSG_DEBUG "%s: %s: %s\n", igt_test_name(), __func__, msg); \
+})
+
 static void prepare_for_unbind(struct hotunplug *priv, char *buf, int buflen)
 {
 	int len;
@@ -67,9 +73,9 @@ static void prepare_for_unbind(struct hotunplug *priv, char *buf, int buflen)
 	close(priv->fd.sysfs_dev);
 }
 
-static void prepare(struct hotunplug *priv, char *buf, int buflen)
+static inline void prepare(struct hotunplug *priv, char *buf, int buflen)
 {
-	igt_debug("opening device\n");
+	local_debug("opening device");
 	priv->fd.drm = __drm_open_driver(DRIVER_ANY);
 	igt_assert(priv->fd.drm >= 0);
 
@@ -136,14 +142,14 @@ static void bus_rescan(int fd_sysfs_bus)
 	close(fd_sysfs_bus);
 }
 
-static void healthcheck(void)
+static inline void healthcheck(void)
 {
 	int fd_drm;
 
 	/* device name may have changed, rebuild IGT device list */
 	igt_devices_scan(true);
 
-	igt_debug("reopening the device\n");
+	local_debug("reopening the device");
 	fd_drm = __drm_open_driver(DRIVER_ANY);
 	igt_abort_on_f(fd_drm < 0, "Device reopen failure");
 
@@ -179,13 +185,13 @@ static void unbind_rebind(void)
 
 	prepare(&priv, buf, sizeof(buf));
 
-	igt_debug("closing the device\n");
+	local_debug("closing the device");
 	close(priv.fd.drm);
 
-	igt_debug("unbinding the driver from the device\n");
+	local_debug("unbinding the driver from the device");
 	driver_unbind(priv.fd.sysfs_drv, priv.dev_bus_addr);
 
-	igt_debug("rebinding the driver to the device\n");
+	local_debug("rebinding the driver to the device");
 	driver_bind(priv.fd.sysfs_drv, priv.dev_bus_addr);
 
 	healthcheck();
@@ -197,13 +203,13 @@ static void unplug_rescan(void)
 
 	prepare(&priv, NULL, 0);
 
-	igt_debug("closing the device\n");
+	local_debug("closing the device");
 	close(priv.fd.drm);
 
-	igt_debug("unplugging the device\n");
+	local_debug("unplugging the device");
 	device_unplug(priv.fd.sysfs_dev);
 
-	igt_debug("recovering the device\n");
+	local_debug("recovering the device");
 	bus_rescan(priv.fd.sysfs_bus);
 
 	healthcheck();
@@ -216,13 +222,13 @@ static void hotunbind_lateclose(void)
 
 	prepare(&priv, buf, sizeof(buf));
 
-	igt_debug("hot unbinding the driver from the device\n");
+	local_debug("hot unbinding the driver from the device");
 	driver_unbind(priv.fd.sysfs_drv, priv.dev_bus_addr);
 
-	igt_debug("rebinding the driver to the device\n");
+	local_debug("rebinding the driver to the device");
 	driver_bind(priv.fd.sysfs_drv, priv.dev_bus_addr);
 
-	igt_debug("late closing the unbound device instance\n");
+	local_debug("late closing the unbound device instance");
 	close(priv.fd.drm);
 
 	healthcheck();
@@ -234,13 +240,13 @@ static void hotunplug_lateclose(void)
 
 	prepare(&priv, NULL, 0);
 
-	igt_debug("hot unplugging the device\n");
+	local_debug("hot unplugging the device");
 	device_unplug(priv.fd.sysfs_dev);
 
-	igt_debug("recovering the device\n");
+	local_debug("recovering the device");
 	bus_rescan(priv.fd.sysfs_bus);
 
-	igt_debug("late closing the removed device instance\n");
+	local_debug("late closing the removed device instance");
 	close(priv.fd.drm);
 
 	healthcheck();
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

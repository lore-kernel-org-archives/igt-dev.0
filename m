Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 22 Jun 2020 17:18:41 +0200
Message-Id: <20200622151845.4520-5-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200622151845.4520-1-janusz.krzysztofik@linux.intel.com>
References: <20200622151845.4520-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 4/8] tests/core_hotunplug: Add
 'lateclose before recover' variants
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

If a GPU gets wedged during driver rebind or device re-plug for some
reason, current hotunbind/hotunplug test variants may time out before
lateclose phase, resulting in incomplete CI reports.  Let's rename
those variants to more adequate hotrebind/hotreplug-lateclose and add
new variants focused on exercising the lateclose phase regardless of
potential rebind/re-plug issues under old names.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 57 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 0b7c6006b..f736a991f 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -266,6 +266,43 @@ static void hotunbind_lateclose(void)
 	local_debug("hot unbinding the driver from the device");
 	driver_unbind(priv.fd.sysfs_drv, priv.dev_bus_addr);
 
+	local_debug("late closing the unbound device instance");
+	close(priv.fd.drm);
+
+	local_debug("rebinding the driver to the device");
+	driver_bind(priv.fd.sysfs_drv, priv.dev_bus_addr);
+
+	healthcheck();
+}
+
+static void hotunplug_lateclose(void)
+{
+	struct hotunplug priv;
+
+	prepare_for_rescan(&priv);
+
+	local_debug("hot unplugging the device");
+	device_unplug(priv.fd.sysfs_dev);
+
+	local_debug("late closing the removed device instance");
+	close(priv.fd.drm);
+
+	local_debug("recovering the device");
+	bus_rescan(priv.fd.sysfs_bus);
+
+	healthcheck();
+}
+
+static void hotrebind_lateclose(void)
+{
+	struct hotunplug priv;
+	char buf[PATH_MAX];
+
+	prepare_for_rebind(&priv, buf, sizeof(buf));
+
+	local_debug("hot unbinding the driver from the device");
+	driver_unbind(priv.fd.sysfs_drv, priv.dev_bus_addr);
+
 	local_debug("rebinding the driver to the device");
 	driver_bind(priv.fd.sysfs_drv, priv.dev_bus_addr);
 
@@ -275,7 +312,7 @@ static void hotunbind_lateclose(void)
 	healthcheck();
 }
 
-static void hotunplug_lateclose(void)
+static void hotreplug_lateclose(void)
 {
 	struct hotunplug priv;
 
@@ -338,17 +375,31 @@ igt_main
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
 
-	igt_describe("Check if the driver can be cleanly unbound from a still open device, then released");
+	igt_describe("Check if the driver can be cleanly unbound from a still open device, then released and rebound");
 	igt_subtest("hotunbind-lateclose")
 		hotunbind_lateclose();
 
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
 
-	igt_describe("Check if a still open device can be cleanly unplugged, then released");
+	igt_describe("Check if a still open device can be cleanly unplugged, then released and recovered");
 	igt_subtest("hotunplug-lateclose")
 		hotunplug_lateclose();
 
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
+
+	igt_describe("Check if the driver can be cleanly unbound from an open device and rebound back, then released");
+	igt_subtest("hotrebind-lateclose")
+		hotrebind_lateclose();
+
+	igt_fixture
+		igt_abort_on_f(failure, "%s\n", failure);
+
+	igt_describe("Check if a still open device can be cleanly unplugged and recovered, then released");
+	igt_subtest("hotreplug-lateclose")
+		hotreplug_lateclose();
+
+	igt_fixture
+		igt_abort_on_f(failure, "%s\n", failure);
 }
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

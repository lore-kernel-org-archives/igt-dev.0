Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 22 Jun 2020 17:18:40 +0200
Message-Id: <20200622151845.4520-4-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200622151845.4520-1-janusz.krzysztofik@linux.intel.com>
References: <20200622151845.4520-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 3/8] tests/core_hotunplug: Add
 unbind-unplug-rescan variant
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

Check if this 3-step procedure exhibits any issues with device recover
after unplug.  Such issues may indicate insufficient device hardware
re-initialization performed by the device driver, or other kernel bugs
outside the driver code.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index c7213d728..0b7c6006b 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -209,6 +209,35 @@ static void unbind_rebind(void)
 	healthcheck();
 }
 
+static void unbind_unplug_rescan(void)
+{
+	struct hotunplug priv;
+	char buf[PATH_MAX];
+
+	/* prepare for unbind */
+	prepare_for_rebind(&priv, buf, sizeof(buf));
+
+	/* also prepare for unplug */
+	local_debug("closing the device");
+	close(priv.fd.drm);
+	prepare_for_rescan(&priv);
+
+	local_debug("closing the device");
+	close(priv.fd.drm);
+
+	local_debug("unbinding the driver from the device");
+	driver_unbind(priv.fd.sysfs_drv, priv.dev_bus_addr);
+	close(priv.fd.sysfs_drv);
+
+	local_debug("unplugging the device");
+	device_unplug(priv.fd.sysfs_dev);
+
+	local_debug("recovering the device");
+	bus_rescan(priv.fd.sysfs_bus);
+
+	healthcheck();
+}
+
 static void unplug_rescan(void)
 {
 	struct hotunplug priv;
@@ -288,14 +317,21 @@ igt_main
 		close(fd_drm);
 	}
 
-	igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed");
+	igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed, then rebound");
 	igt_subtest("unbind-rebind")
 		unbind_rebind();
 
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
 
-	igt_describe("Check if a device believed to be closed can be cleanly unplugged");
+	igt_describe("Check if a device with the driver unbound from it can be cleanly recovered after being unplugged\n");
+	igt_subtest("unbind-unplug-rescan")
+		unbind_unplug_rescan();
+
+	igt_fixture
+		igt_abort_on_f(failure, "%s\n", failure);
+
+	igt_describe("Check if a device believed to be closed can be cleanly unplugged and recovered");
 	igt_subtest("unplug-rescan")
 		unplug_rescan();
 
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

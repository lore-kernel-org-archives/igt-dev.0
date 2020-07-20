Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 20 Jul 2020 14:19:06 +0200
Message-Id: <20200720121908.28124-14-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
References: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATH i-g-t 13/15] tests/core_hotunplug: Process
 return values of sysfs operations
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

Return values of driver bind/unbind / device remove/recover sysfs
operations are now ignored.  Assert their correctness.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index ec2d891e6..16b3a244f 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -95,7 +95,9 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix)
 	igt_debug("%sunbinding the driver from the device\n", prefix);
 
 	igt_set_timeout(60, "Driver unbind timeout!");
-	igt_sysfs_set(priv->fd.sysfs_drv, "unbind", priv->dev_bus_addr);
+	igt_assert_f(igt_sysfs_set(priv->fd.sysfs_drv, "unbind",
+				   priv->dev_bus_addr),
+		     "Driver unbind failure!");
 	igt_reset_timeout();
 }
 
@@ -105,7 +107,9 @@ static void driver_bind(struct hotunplug *priv)
 	igt_debug("rebinding the driver to the device\n");
 
 	igt_set_timeout(60, "Driver re-bind timeout!");
-	igt_sysfs_set(priv->fd.sysfs_drv, "bind", priv->dev_bus_addr);
+	igt_assert_f(igt_sysfs_set(priv->fd.sysfs_drv, "bind",
+				   priv->dev_bus_addr),
+		     "Driver re-bind failure!");
 	igt_reset_timeout();
 }
 
@@ -122,7 +126,8 @@ static void device_unplug(struct hotunplug *priv, const char *prefix)
 	igt_debug("%sunplugging the device\n", prefix);
 
 	igt_set_timeout(60, "Device unplug timeout!");
-	igt_sysfs_set(priv->fd.sysfs_dev, "remove", "1");
+	igt_assert_f(igt_sysfs_set(priv->fd.sysfs_dev, "remove", "1"),
+		     "Device unplug failure!");
 	igt_reset_timeout();
 
 	priv->fd.sysfs_dev = local_close(priv->fd.sysfs_dev);
@@ -136,7 +141,8 @@ static void bus_rescan(struct hotunplug *priv)
 	igt_debug("recovering the device\n");
 
 	igt_set_timeout(60, "Bus rescan timeout!");
-	igt_sysfs_set(priv->fd.sysfs_bus, "../rescan", "1");
+	igt_assert_f(igt_sysfs_set(priv->fd.sysfs_bus, "../rescan", "1"),
+		       "Bus rescan failure!");
 	igt_reset_timeout();
 }
 
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

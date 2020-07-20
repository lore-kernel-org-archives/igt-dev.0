Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 20 Jul 2020 14:19:07 +0200
Message-Id: <20200720121908.28124-15-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
References: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATH i-g-t 14/15] tests/core_hotunplug: Assert
 expected device presence/absence
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

Don't rely on successful write to sysfs control files, assert existence
/ non-existence of a respective device sysfs node as well.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 16b3a244f..9bca967c1 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -99,6 +99,9 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix)
 				   priv->dev_bus_addr),
 		     "Driver unbind failure!");
 	igt_reset_timeout();
+
+	igt_assert_f(faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0),
+		     "Unbound device still present\n");
 }
 
 /* Re-bind the driver to the device */
@@ -111,6 +114,10 @@ static void driver_bind(struct hotunplug *priv)
 				   priv->dev_bus_addr),
 		     "Driver re-bind failure!");
 	igt_reset_timeout();
+
+	igt_fail_on_f(faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr,
+				F_OK, 0),
+		      "Rebound device not present!\n");
 }
 
 /* Remove (virtually unplug) the device from its bus */
@@ -133,6 +140,9 @@ static void device_unplug(struct hotunplug *priv, const char *prefix)
 	priv->fd.sysfs_dev = local_close(priv->fd.sysfs_dev);
 	igt_assert_f(priv->fd.sysfs_dev == -1,
 		     "Device sysfs node close failed\n");
+
+	igt_assert_f(faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr, F_OK, 0),
+		     "Unplugged device still present\n");
 }
 
 /* Re-discover the device by rescanning its bus */
@@ -144,6 +154,10 @@ static void bus_rescan(struct hotunplug *priv)
 	igt_assert_f(igt_sysfs_set(priv->fd.sysfs_bus, "../rescan", "1"),
 		       "Bus rescan failure!");
 	igt_reset_timeout();
+
+	igt_fail_on_f(faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr,
+				F_OK, 0),
+		      "Fakely unplugged device not rediscovered!\n");
 }
 
 static void cleanup(struct hotunplug *priv)
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

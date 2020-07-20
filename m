Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 20 Jul 2020 14:19:03 +0200
Message-Id: <20200720121908.28124-11-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
References: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATH i-g-t 10/15] tests/core_hotunplug: Skip
 selectively on sysfs close errors
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

Since we no longer open a device DRM sysfs node, only a PCI one, driver
unbind operations are no longer affected by missed or unsuccessful
sysfs file close attempts.  Skip only affected subtests if that
happens.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index daf0bf745..71da8f2a1 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -82,8 +82,8 @@ static void prepare(struct hotunplug *priv)
 	igt_assert_fd(priv->fd.sysfs_bus);
 
 	priv->fd.sysfs_dev = local_close(priv->fd.sysfs_dev);
-	igt_assert_f(priv->fd.sysfs_dev == -1,
-		     "Device sysfs node close failed\n");
+	igt_warn_on_f(priv->fd.sysfs_dev != -1,
+		      "Device sysfs node close failed\n");
 }
 
 /* Unbind the driver from the device */
@@ -113,6 +113,9 @@ static void driver_bind(struct hotunplug *priv)
 /* Remove (virtually unplug) the device from its bus */
 static void device_unplug(struct hotunplug *priv, const char *prefix)
 {
+	igt_require_f(priv->fd.sysfs_dev == -1,
+		      "Device sysfs node not closed properly\n");
+
 	priv->fd.sysfs_dev = openat(priv->fd.sysfs_bus, priv->dev_bus_addr,
 				    O_DIRECTORY);
 	igt_assert_fd(priv->fd.sysfs_dev);
@@ -171,8 +174,6 @@ static void post_healthckeck(struct hotunplug *priv)
 	igt_abort_on_f(priv->failure, "%s\n", priv->failure);
 
 	igt_require_f(priv->fd.drm == -1, "Device not closed properly\n");
-	igt_require_f(priv->fd.sysfs_dev == -1,
-		      "Device sysfs node not closed properly\n");
 }
 
 static void set_filter_from_device(int fd)
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

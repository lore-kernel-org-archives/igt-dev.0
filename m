Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 20 Jul 2020 14:18:54 +0200
Message-Id: <20200720121908.28124-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
References: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATH i-g-t 01/15] tests/core_hotunplug: Use
 igt_assert_fd()
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

There is a new library helper that asserts validity of open file
descriptors.  Use it instead of open coding.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index e03f3b945..7431346b1 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -57,7 +57,7 @@ static void prepare_for_unbind(struct hotunplug *priv, char *buf, int buflen)
 
 	priv->fd.sysfs_drv = openat(priv->fd.sysfs_dev, "device/driver",
 				    O_DIRECTORY);
-	igt_assert(priv->fd.sysfs_drv >= 0);
+	igt_assert_fd(priv->fd.sysfs_drv);
 
 	len = readlinkat(priv->fd.sysfs_dev, "device", buf, buflen - 1);
 	buf[len] = '\0';
@@ -72,10 +72,10 @@ static void prepare(struct hotunplug *priv, char *buf, int buflen)
 {
 	igt_debug("opening device\n");
 	priv->fd.drm = __drm_open_driver(DRIVER_ANY);
-	igt_assert(priv->fd.drm >= 0);
+	igt_assert_fd(priv->fd.drm);
 
 	priv->fd.sysfs_dev = igt_sysfs_open(priv->fd.drm);
-	igt_assert(priv->fd.sysfs_dev >= 0);
+	igt_assert_fd(priv->fd.sysfs_dev);
 
 	if (buf) {
 		prepare_for_unbind(priv, buf, buflen);
@@ -83,7 +83,7 @@ static void prepare(struct hotunplug *priv, char *buf, int buflen)
 		/* prepare for bus rescan */
 		priv->fd.sysfs_bus = openat(priv->fd.sysfs_dev,
 					    "device/subsystem", O_DIRECTORY);
-		igt_assert(priv->fd.sysfs_bus >= 0);
+		igt_assert_fd(priv->fd.sysfs_bus);
 	}
 }
 
@@ -261,7 +261,7 @@ igt_main
 		 * a device file descriptor open for exit handler use.
 		 */
 		fd_drm = __drm_open_driver(DRIVER_ANY);
-		igt_assert(fd_drm >= 0);
+		igt_assert_fd(fd_drm);
 
 		if (is_i915_device(fd_drm))
 			igt_require_gem(fd_drm);
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

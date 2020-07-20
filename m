Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 20 Jul 2020 14:19:05 +0200
Message-Id: <20200720121908.28124-13-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
References: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATH i-g-t 12/15] tests/core_hotunplug: Fail
 subtests on device close errors
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

Since health checks are now run from follow-up fixture sections, it is
safe to fail subtests without the need to abort the test execution.  Do
that on device close errors instead of emitting warnings.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 082bcc306..ec2d891e6 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -126,8 +126,8 @@ static void device_unplug(struct hotunplug *priv, const char *prefix)
 	igt_reset_timeout();
 
 	priv->fd.sysfs_dev = local_close(priv->fd.sysfs_dev);
-	igt_warn_on_f(priv->fd.sysfs_dev != -1,
-		      "Device sysfs node close failed\n");
+	igt_assert_f(priv->fd.sysfs_dev == -1,
+		     "Device sysfs node close failed\n");
 }
 
 /* Re-discover the device by rescanning its bus */
@@ -248,7 +248,7 @@ static void hotunbind_lateclose(struct hotunplug *priv)
 
 	igt_debug("late closing the unbound device instance\n");
 	priv->fd.drm = local_close(priv->fd.drm);
-	igt_warn_on_f(priv->fd.drm != -1, "Device close failed\n");
+	igt_assert_f(priv->fd.drm == -1, "Device close failed\n");
 }
 
 static void hotunplug_lateclose(struct hotunplug *priv)
@@ -265,7 +265,7 @@ static void hotunplug_lateclose(struct hotunplug *priv)
 
 	igt_debug("late closing the removed device instance\n");
 	priv->fd.drm = local_close(priv->fd.drm);
-	igt_warn_on_f(priv->fd.drm != -1, "Device close failed\n");
+	igt_assert_f(priv->fd.drm == -1, "Device close failed\n");
 }
 
 /* Main */
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

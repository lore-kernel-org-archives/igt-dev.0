Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 11 Sep 2020 12:30:35 +0200
Message-Id: <20200911103039.4574-21-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 20/24] tests/core_hotunplug: Check health
 both before and after late close
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

In hot rebind / hot replug subtests, device health is now checked only
at the end of the subtest, after late close.  If something fails, we
may be not able to identify the failing phase of the subtest easily.

Run health checks also before late closing the device, right after hot
rebind / replug.  For still being able to perform late close while also
handling cleanup of potential device close misses in health checks, we
need to maintain two separate device file descriptors in our private
data structure.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 436517ce5..ac106d964 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -42,6 +42,7 @@ IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
 struct hotunplug {
 	struct {
 		int drm;
+		int drm_hc;	/* for health check */
 		int sysfs_dev;
 		int sysfs_bus;
 		int sysfs_drv;
@@ -200,7 +201,9 @@ static void bus_rescan(struct hotunplug *priv, int timeout)
 
 static void cleanup(struct hotunplug *priv)
 {
-	priv->fd.drm = close_device(priv->fd.drm, "post ", "failed ");
+	priv->fd.drm = close_device(priv->fd.drm, "post ", "exercised ");
+	priv->fd.drm_hc = close_device(priv->fd.drm_hc, "post ",
+							"health checked ");
 	priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
 }
 
@@ -286,14 +289,14 @@ static void node_healthcheck(struct hotunplug *priv, unsigned flags)
 {
 	bool render = flags & FLAG_RENDER;
 	/* preserve potentially dirty device status stored in priv->fd.drm */
-	bool closed = priv->fd.drm == -1;
+	bool closed = priv->fd.drm_hc == -1;
 	int fd_drm;
 
 	priv->failure = render ? "Render device reopen failure!" :
 				 "DRM device reopen failure!";
 	fd_drm = local_drm_open_driver(render, "re", " for health check");
 	if (closed)	/* store fd for cleanup if not dirty */
-		priv->fd.drm = fd_drm;
+		priv->fd.drm_hc = fd_drm;
 
 	if (is_i915_device(fd_drm)) {
 		/* don't report library failed asserts as healthcheck failure */
@@ -311,7 +314,7 @@ static void node_healthcheck(struct hotunplug *priv, unsigned flags)
 
 	fd_drm = close_device(fd_drm, "", "health checked ");
 	if (closed || fd_drm < -1)	/* update status for post_healthcheck */
-		priv->fd.drm = fd_drm;
+		priv->fd.drm_hc = fd_drm;
 }
 
 static void healthcheck(struct hotunplug *priv, bool recover)
@@ -334,7 +337,7 @@ static void recover(struct hotunplug *priv)
 
 	/* unbind the driver from a possibly hot rebound unhealthy device */
 	if (!faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0) &&
-	    priv->fd.drm == -1 && priv->failure)
+	    priv->fd.drm == -1 && priv->fd.drm_hc == -1 && priv->failure)
 		driver_unbind(priv, "post ", 60);
 
 	if (faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr, F_OK, 0))
@@ -353,6 +356,7 @@ static void post_healthcheck(struct hotunplug *priv)
 
 	cleanup(priv);
 	igt_require(priv->fd.drm == -1);
+	igt_require(priv->fd.drm_hc == -1);
 }
 
 static void set_filter_from_device(int fd)
@@ -375,6 +379,7 @@ static void set_filter_from_device(int fd)
 static void unbind_rebind(struct hotunplug *priv)
 {
 	igt_assert_eq(priv->fd.drm, -1);
+	igt_assert_eq(priv->fd.drm_hc, -1);
 
 	driver_unbind(priv, "", 0);
 
@@ -386,6 +391,7 @@ static void unbind_rebind(struct hotunplug *priv)
 static void unplug_rescan(struct hotunplug *priv)
 {
 	igt_assert_eq(priv->fd.drm, -1);
+	igt_assert_eq(priv->fd.drm_hc, -1);
 
 	device_unplug(priv, "", 0);
 
@@ -397,6 +403,7 @@ static void unplug_rescan(struct hotunplug *priv)
 static void hotunbind_rebind(struct hotunplug *priv)
 {
 	igt_assert_eq(priv->fd.drm, -1);
+	igt_assert_eq(priv->fd.drm_hc, -1);
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
 
 	driver_unbind(priv, "hot ", 0);
@@ -412,6 +419,7 @@ static void hotunbind_rebind(struct hotunplug *priv)
 static void hotunplug_rescan(struct hotunplug *priv)
 {
 	igt_assert_eq(priv->fd.drm, -1);
+	igt_assert_eq(priv->fd.drm_hc, -1);
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
 
 	device_unplug(priv, "hot ", 0);
@@ -427,12 +435,15 @@ static void hotunplug_rescan(struct hotunplug *priv)
 static void hotrebind_lateclose(struct hotunplug *priv)
 {
 	igt_assert_eq(priv->fd.drm, -1);
+	igt_assert_eq(priv->fd.drm_hc, -1);
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot rebind");
 
 	driver_unbind(priv, "hot ", 60);
 
 	driver_bind(priv, 0);
 
+	healthcheck(priv, false);
+
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
 	igt_assert_eq(priv->fd.drm, -1);
 
@@ -442,12 +453,15 @@ static void hotrebind_lateclose(struct hotunplug *priv)
 static void hotreplug_lateclose(struct hotunplug *priv)
 {
 	igt_assert_eq(priv->fd.drm, -1);
+	igt_assert_eq(priv->fd.drm_hc, -1);
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot replug");
 
 	device_unplug(priv, "hot ", 60);
 
 	bus_rescan(priv, 0);
 
+	healthcheck(priv, false);
+
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
 	igt_assert_eq(priv->fd.drm, -1);
 
@@ -459,7 +473,7 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 igt_main
 {
 	struct hotunplug priv = {
-		.fd		= { .drm = -1, .sysfs_dev = -1, },
+		.fd		= { .drm = -1, .drm_hc = -1, .sysfs_dev = -1, },
 		.failure	= NULL,
 	};
 
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

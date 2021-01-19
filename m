Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 19 Jan 2021 09:42:57 +0100
Message-Id: <20210119084257.25552-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: Reduce debug noise on
 stdout
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

Since igt_fixture sections are processed unconditionally regardless of
which subtest has been requested, they can now emit a lot of unrelated
debug messages which can make the picture less clear.  Avoid emitting
those messages from outside igt_subtest sections.

Move device close status prerequisite checks from igt_fixture sections
into subtest execution paths.  For simplicity, pass any device close
errors, including those from health checks, to next sections via a
single .fd.drm data structure field.

Moreover, postpone initial device health check until first actually
selected subtest is started.  In order to let that subtest skip on
unsuccessful initial health check, not fail, move the decision whether
to fail or skip on error from the health check helper to its users.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 86 +++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 38 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 91506fa72..e7d2a4472 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -49,6 +49,7 @@ struct hotunplug {
 	} fd;	/* >= 0: valid fd, == -1: closed, < -1: close failed */
 	const char *dev_bus_addr;
 	const char *failure;
+	bool need_healthcheck;
 };
 
 /* Helpers */
@@ -210,6 +211,12 @@ static void cleanup(struct hotunplug *priv)
 	priv->fd.drm = close_device(priv->fd.drm, "post ", "exercised ");
 	priv->fd.drm_hc = close_device(priv->fd.drm_hc, "post ",
 							"health checked ");
+	/* pass device close errors to next sections via priv->fd.drm */
+	if (priv->fd.drm_hc < -1) {
+		priv->fd.drm = priv->fd.drm_hc;
+		priv->fd.drm_hc = -1;
+	}
+
 	priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
 }
 
@@ -346,9 +353,9 @@ static void node_healthcheck(struct hotunplug *priv, unsigned flags)
 
 		priv->failure = "Device sysfs healthckeck failure!";
 		local_debug("%s\n", "running device sysfs healthcheck");
-		igt_assert(igt_sysfs_path(fd_drm, path, sizeof(path)));
-		igt_assert(igt_debugfs_path(fd_drm, path, sizeof(path)));
-		priv->failure = NULL;
+		if (igt_sysfs_path(fd_drm, path, sizeof(path)) &&
+		    igt_debugfs_path(fd_drm, path, sizeof(path)))
+			priv->failure = NULL;
 	}
 
 	fd_drm = close_device(fd_drm, "", "health checked ");
@@ -356,7 +363,7 @@ static void node_healthcheck(struct hotunplug *priv, unsigned flags)
 		priv->fd.drm_hc = fd_drm;
 }
 
-static void healthcheck(struct hotunplug *priv, bool recover)
+static bool healthcheck(struct hotunplug *priv, bool recover)
 {
 	/* device name may have changed, rebuild IGT device list */
 	igt_devices_scan(true);
@@ -366,8 +373,19 @@ static void healthcheck(struct hotunplug *priv, bool recover)
 		node_healthcheck(priv,
 				 FLAG_RENDER | (recover ? FLAG_RECOVER : 0));
 
-	/* not only request igt_abort on failure, also fail the health check */
-	igt_fail_on_f(priv->failure, "%s\n", priv->failure);
+	return !priv->failure;
+}
+
+static void pre_check(struct hotunplug *priv)
+{
+	igt_require(priv->fd.drm == -1);
+
+	if (priv->need_healthcheck) {
+		igt_require_f(healthcheck(priv, false), "%s\n", priv->failure);
+		priv->need_healthcheck = false;
+
+		igt_require(priv->fd.drm_hc == -1);
+	}
 }
 
 static void recover(struct hotunplug *priv)
@@ -386,7 +404,7 @@ static void recover(struct hotunplug *priv)
 		driver_bind(priv, 60);
 
 	if (priv->failure)
-		healthcheck(priv, true);
+		igt_assert_f(healthcheck(priv, true), "%s\n", priv->failure);
 }
 
 static void post_healthcheck(struct hotunplug *priv)
@@ -394,8 +412,6 @@ static void post_healthcheck(struct hotunplug *priv)
 	igt_abort_on_f(priv->failure, "%s\n", priv->failure);
 
 	cleanup(priv);
-	igt_require(priv->fd.drm == -1);
-	igt_require(priv->fd.drm_hc == -1);
 }
 
 static void set_filter_from_device(int fd)
@@ -417,32 +433,30 @@ static void set_filter_from_device(int fd)
 
 static void unbind_rebind(struct hotunplug *priv)
 {
-	igt_assert_eq(priv->fd.drm, -1);
-	igt_assert_eq(priv->fd.drm_hc, -1);
+	pre_check(priv);
 
 	driver_unbind(priv, "", 0);
 
 	driver_bind(priv, 0);
 
-	healthcheck(priv, false);
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
 static void unplug_rescan(struct hotunplug *priv)
 {
-	igt_assert_eq(priv->fd.drm, -1);
-	igt_assert_eq(priv->fd.drm_hc, -1);
+	pre_check(priv);
 
 	device_unplug(priv, "", 0);
 
 	bus_rescan(priv, 0);
 
-	healthcheck(priv, false);
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
 static void hotunbind_rebind(struct hotunplug *priv)
 {
-	igt_assert_eq(priv->fd.drm, -1);
-	igt_assert_eq(priv->fd.drm_hc, -1);
+	pre_check(priv);
+
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
 
 	driver_unbind(priv, "hot ", 0);
@@ -452,13 +466,13 @@ static void hotunbind_rebind(struct hotunplug *priv)
 
 	driver_bind(priv, 0);
 
-	healthcheck(priv, false);
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
 static void hotunplug_rescan(struct hotunplug *priv)
 {
-	igt_assert_eq(priv->fd.drm, -1);
-	igt_assert_eq(priv->fd.drm_hc, -1);
+	pre_check(priv);
+
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
 
 	device_unplug(priv, "hot ", 0);
@@ -468,39 +482,39 @@ static void hotunplug_rescan(struct hotunplug *priv)
 
 	bus_rescan(priv, 0);
 
-	healthcheck(priv, false);
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
 static void hotrebind(struct hotunplug *priv)
 {
-	igt_assert_eq(priv->fd.drm, -1);
-	igt_assert_eq(priv->fd.drm_hc, -1);
+	pre_check(priv);
+
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot rebind");
 
 	driver_unbind(priv, "hot ", 60);
 
 	driver_bind(priv, 0);
 
-	healthcheck(priv, false);
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
 static void hotreplug(struct hotunplug *priv)
 {
-	igt_assert_eq(priv->fd.drm, -1);
-	igt_assert_eq(priv->fd.drm_hc, -1);
+	pre_check(priv);
+
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot replug");
 
 	device_unplug(priv, "hot ", 60);
 
 	bus_rescan(priv, 0);
 
-	healthcheck(priv, false);
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
 static void hotrebind_lateclose(struct hotunplug *priv)
 {
-	igt_assert_eq(priv->fd.drm, -1);
-	igt_assert_eq(priv->fd.drm_hc, -1);
+	pre_check(priv);
+
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot rebind");
 
 	driver_unbind(priv, "hot ", 60);
@@ -510,13 +524,13 @@ static void hotrebind_lateclose(struct hotunplug *priv)
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
 	igt_assert_eq(priv->fd.drm, -1);
 
-	healthcheck(priv, false);
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
 static void hotreplug_lateclose(struct hotunplug *priv)
 {
-	igt_assert_eq(priv->fd.drm, -1);
-	igt_assert_eq(priv->fd.drm_hc, -1);
+	pre_check(priv);
+
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot replug");
 
 	device_unplug(priv, "hot ", 60);
@@ -526,7 +540,7 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
 	igt_assert_eq(priv->fd.drm, -1);
 
-	healthcheck(priv, false);
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
 /* Main */
@@ -536,6 +550,7 @@ igt_main
 	struct hotunplug priv = {
 		.fd		= { .drm = -1, .drm_hc = -1, .sysfs_dev = -1, },
 		.failure	= NULL,
+		.need_healthcheck = true,
 	};
 
 	igt_fixture {
@@ -570,11 +585,6 @@ igt_main
 		igt_assert_eq(close_device(fd_drm, "", "selected "), -1);
 
 		prepare(&priv);
-
-		node_healthcheck(&priv, 0);
-		if (!priv.failure)
-			node_healthcheck(&priv, FLAG_RENDER);
-		igt_skip_on_f(priv.failure, "%s\n", priv.failure);
 	}
 
 	igt_subtest_group {
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu,  1 Apr 2021 16:36:40 +0200
Message-Id: <20210401143643.7867-3-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
References: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 3/6] tests/core_hotunplug: Add 'GEM
 object' variants
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

GEM objects belonging to user file descriptors still open on device
hotunbind / hotunplug may exhibit still more driver issues.  Add
subtests that implements these scenarios.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 85 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index decfcdfda..7f61b4446 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -433,6 +433,13 @@ static void set_filter_from_device(int fd)
 	igt_assert_eq(igt_device_filter_add(filter), 1);
 }
 
+static int local_gem_close(int fd, uint32_t handle)
+{
+	struct drm_gem_close close_bo = { .handle = handle, };
+
+	return igt_ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo) ? -errno : 0;
+}
+
 /* Subtests */
 
 static void unbind_rebind(struct hotunplug *priv)
@@ -655,6 +662,60 @@ static void vm_hotunplug_lateclose(struct hotunplug *priv)
 	igt_assert_eq(priv->fd.drm, -1);
 }
 
+static void gem_hotunbind_lateclose(struct hotunplug *priv)
+{
+	uint32_t handle;
+
+	igt_require(priv->fd.drm = -1);
+	priv->fd.drm = local_drm_open_driver(false, "pre-", " for prerequisites check");
+
+	igt_require_intel(priv->fd.drm);
+	igt_require_gem(priv->fd.drm);
+	priv->fd.drm = close_device(priv->fd.drm, "", "pre-checked ");
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
+
+	local_debug("%s\n", "creating a GEM user object");
+	handle = gem_create(priv->fd.drm, 4096);
+
+	driver_unbind(priv, "hot", 0);
+
+	local_debug("%s\n", "trying to late remove the object");
+	igt_assert_eq(local_gem_close(priv->fd.drm, handle), -ENODEV);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
+	igt_assert_eq(priv->fd.drm, -1);
+}
+
+static void gem_hotunplug_lateclose(struct hotunplug *priv)
+{
+	uint32_t handle;
+
+	igt_require(priv->fd.drm = -1);
+	priv->fd.drm = local_drm_open_driver(false, "pre-", " for prerequisites check");
+
+	igt_require_intel(priv->fd.drm);
+	igt_require_gem(priv->fd.drm);
+	priv->fd.drm = close_device(priv->fd.drm, "", "pre-checked ");
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
+
+	local_debug("%s\n", "creating a GEM user object");
+	handle = gem_create(priv->fd.drm, 4096);
+
+	device_unplug(priv, "hot", 0);
+
+	local_debug("%s\n", "trying to late remove the object");
+	igt_assert_eq(local_gem_close(priv->fd.drm, handle), -ENODEV);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
+	igt_assert_eq(priv->fd.drm, -1);
+}
+
 /* Main */
 
 igt_main
@@ -840,6 +901,30 @@ igt_main
 			recover(&priv);
 	}
 
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if the driver can be cleanly unbound from a device with a still open GEM object, then released");
+		igt_subtest("gem-hotunbind-lateclose")
+			gem_hotunbind_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
+
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if a device with a still open GEM object can be cleanly unplugged, then released");
+		igt_subtest("gem-hotunplug-lateclose")
+			gem_hotunplug_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
+
 	igt_fixture {
 		post_healthcheck(&priv);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

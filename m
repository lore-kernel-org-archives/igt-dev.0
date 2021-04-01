Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu,  1 Apr 2021 16:36:41 +0200
Message-Id: <20210401143643.7867-4-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
References: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 4/6] tests/core_hotunplug: Add 'userptr
 GEM object' variants
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

Verify if userptr GM objects are cleaned up equally well as regular
GEM objects on device hotunbind / hotunplug.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 90 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7f61b4446..6f3b3b3d3 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -716,6 +716,72 @@ static void gem_hotunplug_lateclose(struct hotunplug *priv)
 	igt_assert_eq(priv->fd.drm, -1);
 }
 
+static void userptr_hotunbind_lateclose(struct hotunplug *priv)
+{
+	uint32_t handle;
+	void *ptr;
+
+	igt_require(priv->fd.drm = -1);
+	priv->fd.drm = local_drm_open_driver(false, "pre-", " for prerequisites check");
+
+	igt_require_intel(priv->fd.drm);
+	igt_require_gem(priv->fd.drm);
+	igt_assert_eq(posix_memalign(&ptr, 4096, 4096), 0);
+	igt_require(!__gem_userptr(priv->fd.drm, ptr, 4096, 0, 0, &handle));
+	gem_close(priv->fd.drm, handle);
+	priv->fd.drm = close_device(priv->fd.drm, "", "pre-checked ");
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
+
+	local_debug("%s\n", "creating a userptr GEM object");
+	gem_userptr(priv->fd.drm, ptr, 4096, 0, 0, &handle);
+
+	driver_unbind(priv, "hot ", 0);
+
+	local_debug("%s\n", "trying to late remove the object");
+	igt_assert_eq(local_gem_close(priv->fd.drm, handle), -ENODEV);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	igt_fail_on_f(munmap(ptr, 4096), "Userptr unmap failure!");
+}
+
+static void userptr_hotunplug_lateclose(struct hotunplug *priv)
+{
+	uint32_t handle;
+	void *ptr;
+
+	igt_require(priv->fd.drm = -1);
+	priv->fd.drm = local_drm_open_driver(false, "pre-", " for prerequisites check");
+
+	igt_require_intel(priv->fd.drm);
+	igt_require_gem(priv->fd.drm);
+	igt_assert_eq(posix_memalign(&ptr, 4096, 4096), 0);
+	igt_require(!__gem_userptr(priv->fd.drm, ptr, 4096, 0, 0, &handle));
+	gem_close(priv->fd.drm, handle);
+	priv->fd.drm = close_device(priv->fd.drm, "", "pre-checked ");
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
+
+	local_debug("%s\n", "creating a userptr GEM object");
+	gem_userptr(priv->fd.drm, ptr, 4096, 0, 0, &handle);
+
+	device_unplug(priv, "hot ", 0);
+
+	local_debug("%s\n", "trying to late remove the object");
+	igt_assert_eq(local_gem_close(priv->fd.drm, handle), -ENODEV);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	igt_fail_on_f(munmap(ptr, 4096), "Userptr unmap failure!");
+}
+
 /* Main */
 
 igt_main
@@ -925,6 +991,30 @@ igt_main
 			recover(&priv);
 	}
 
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if the driver can be cleanly unbound from a device with a still open userptr GEM object, then released");
+		igt_subtest("userptr-hotunbind-lateclose")
+			userptr_hotunbind_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
+
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if a device with a still open userptr GEM object can be cleanly unplugged, then released");
+		igt_subtest("userptr-hotunplug-lateclose")
+			userptr_hotunplug_lateclose(&priv);
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

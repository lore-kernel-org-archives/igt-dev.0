Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu,  1 Apr 2021 16:36:42 +0200
Message-Id: <20210401143643.7867-5-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
References: <20210401143643.7867-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 5/6] tests/core_hotunplug: Add 'PRIME
 handle' variants
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

Even if all device file descriptors are closed on device hotunbind /
hotunplug, PRIME exported objects may still exists, referenced by still
open dma-buf file descriptors.  Add subtests that keep such descriptor
open on device hotunbind / hotunplug.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 104 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 6f3b3b3d3..0cb1267ae 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -782,6 +782,86 @@ static void userptr_hotunplug_lateclose(struct hotunplug *priv)
 	igt_fail_on_f(munmap(ptr, 4096), "Userptr unmap failure!");
 }
 
+static void prime_hotunbind_lateclose(struct hotunplug *priv)
+{
+	uint32_t handle;
+	int dmabuf, ret;
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
+	local_debug("%s\n", "creating and PRIME-exporting a GEM object");
+	handle = gem_create(priv->fd.drm, 4096);
+	dmabuf = prime_handle_to_fd(priv->fd.drm, handle);
+
+	ret = local_gem_close(priv->fd.drm, handle);
+	priv->fd.drm = close_device(priv->fd.drm, "", "exported ");
+
+	if (priv->fd.drm != -1) {
+		igt_ignore_warn(close(dmabuf));
+		igt_assert_eq(priv->fd.drm, -1);
+	}
+
+	/* once device close succeeds, take care of open dmabuf like if it was a device fd */
+	priv->fd.drm = dmabuf;
+	igt_assert_f(!ret, "gem_close failed with errno %d\n", ret);
+
+	driver_unbind(priv, "hot ", 0);
+
+	igt_debug("late closing the PRIME file descriptor\n");
+	dmabuf = local_close(dmabuf, "PRIME file descriptor late close failure");
+	priv->fd.drm = dmabuf;
+	igt_assert_eq(dmabuf, -1);
+}
+
+static void prime_hotunplug_lateclose(struct hotunplug *priv)
+{
+	uint32_t handle;
+	int dmabuf, ret;
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
+	local_debug("%s\n", "creating and PRIME-exporting a GEM object");
+	handle = gem_create(priv->fd.drm, 4096);
+	dmabuf = prime_handle_to_fd(priv->fd.drm, handle);
+
+	ret = local_gem_close(priv->fd.drm, handle);
+	priv->fd.drm = close_device(priv->fd.drm, "", "exported ");
+
+	if (priv->fd.drm != -1) {
+		igt_ignore_warn(close(dmabuf));
+		igt_assert_eq(priv->fd.drm, -1);
+	}
+
+	/* once device close succeeds, take care of open dmabuf like if it was a device fd */
+	priv->fd.drm = dmabuf;
+	igt_assert_f(!ret, "gem_close failed with errno %d\n", ret);
+
+	device_unplug(priv, "hot ", 0);
+
+	igt_debug("late closing the PRIME file descriptor\n");
+	dmabuf = local_close(dmabuf, "PRIME file descriptor late close failure");
+	priv->fd.drm = dmabuf;
+	igt_assert_eq(dmabuf, -1);
+}
+
 /* Main */
 
 igt_main
@@ -1015,6 +1095,30 @@ igt_main
 			recover(&priv);
 	}
 
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if the driver can be cleanly unbound from a device with a still open PRIME-exported object, then released");
+		igt_subtest("prime-hotunbind-lateclose")
+			prime_hotunbind_lateclose(&priv);
+
+		igt_fixture
+			recover(&priv);
+	}
+
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if a device with a still open PRIME-exported object can be cleanly unplugged, then released");
+		igt_subtest("prime-hotunplug-lateclose")
+			prime_hotunplug_lateclose(&priv);
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

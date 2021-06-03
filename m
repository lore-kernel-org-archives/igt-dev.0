Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2085.outbound.protection.outlook.com [40.107.212.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD936F49C
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 15:08:23 +0000 (UTC)
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Thu,  3 Jun 2021 11:07:59 -0400
Message-Id: <20210603150800.157685-3-andrey.grodzovsky@amd.com>
In-Reply-To: <20210603150800.157685-1-andrey.grodzovsky@amd.com>
References: <20210603150800.157685-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/3] tests/core_hotunplug: Add hotunplug with
 exported dma-buf test.
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

Unplug a device while an exported BO is still around.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 tests/core_hotunplug.c | 62 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index b553bc87..7cde0157 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -684,6 +684,59 @@ static void hotunplug_rescan(struct hotunplug *priv)
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
+static void hotunplug_with_exported_bo_rescan(struct hotunplug *priv)
+{
+	int r;
+	uint32_t dma_buf_fd;
+	unsigned int *ptr;
+	amdgpu_bo_handle bo_handle;
+	uint32_t major, minor;
+	amdgpu_device_handle device;
+
+	struct amdgpu_bo_alloc_request request = {
+		.alloc_size = 4096,
+		.phys_alignment = 4096,
+		.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
+		.flags = 0,
+	};
+
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug with export");
+
+
+	r = amdgpu_device_initialize(priv->fd.drm, &major, &minor, &device);
+	igt_require(r == 0);
+
+	amdgpu_bo_alloc(device, &request, &bo_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_export(bo_handle, amdgpu_bo_handle_type_dma_buf_fd, &dma_buf_fd);
+	igt_assert(r == 0);
+
+	ptr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd, 0);
+	igt_assert(ptr != MAP_FAILED);
+
+	amdgpu_bo_free(bo_handle);
+	amdgpu_device_deinitialize(device);
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	device_unplug(priv, "hot ", 0);
+
+	*ptr = 0xdeafbeef;
+
+	munmap(ptr, 4096);
+	close (dma_buf_fd);
+	return;
+
+	bus_rescan(priv, 0);
+
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
+}
+
+
+
 static void hotrebind(struct hotunplug *priv)
 {
 	pre_check(priv);
@@ -832,6 +885,15 @@ igt_main
 			recover(&priv);
 	}
 
+	igt_subtest_group {
+			igt_describe("Check if device with exported dma buf can be cleanly unplugged, then released and restored");
+			igt_subtest("hotunplug-with-exported-bo-rescan")
+			hotunplug_with_exported_bo_rescan(&priv);
+
+			igt_fixture
+				recover(&priv);
+	}
+
 	igt_fixture
 		post_healthcheck(&priv);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2050.outbound.protection.outlook.com [40.107.212.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA4A6F49D
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 15:08:24 +0000 (UTC)
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Thu,  3 Jun 2021 11:08:00 -0400
Message-Id: <20210603150800.157685-4-andrey.grodzovsky@amd.com>
In-Reply-To: <20210603150800.157685-1-andrey.grodzovsky@amd.com>
References: <20210603150800.157685-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 3/3] tests/core_hotunplug: Add hotunplug with
 exported sync obj test
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

Unplug a device while an exported sync_obj and it's fence
are  is still around.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 tests/core_hotunplug.c | 102 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7cde0157..16bbbf44 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -735,6 +735,99 @@ static void hotunplug_with_exported_bo_rescan(struct hotunplug *priv)
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
+static void hotunplug_with_exported_fence_rescan(struct hotunplug *priv)
+{
+	amdgpu_bo_handle ib_result_handle;
+	void *ib_result_cpu;
+	uint64_t ib_result_mc_address;
+	uint32_t *ptr, sync_obj_handle, sync_obj_handle2;
+	int i, r;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle;
+	uint32_t major, minor, major2, minor2;
+	amdgpu_device_handle device, device2;
+	amdgpu_context_handle context;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_ib_info ib_info;
+	struct amdgpu_cs_fence fence_status = {0};
+	int shared_fd, second_fd = -1;
+
+	pre_check(priv);
+
+	priv->fd.drm = __drm_open_driver_another(0, DRIVER_AMDGPU);
+	igt_require(priv->fd.drm >= 0);
+	second_fd = __drm_open_driver_another(1, DRIVER_AMDGPU);
+	igt_require(second_fd >= 0);
+
+	r = amdgpu_device_initialize(priv->fd.drm, &major, &minor, &device);
+	igt_require(r == 0);
+
+	r = amdgpu_device_initialize(second_fd, &major2, &minor2, &device2);
+	igt_require(r == 0);
+
+	r = amdgpu_cs_ctx_create(device, &context);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_result_handle, &ib_result_cpu,
+				    &ib_result_mc_address, &va_handle);
+	igt_assert_eq(r, 0);
+
+	ptr = ib_result_cpu;
+	for (i = 0; i < 16; ++i)
+		ptr[i] = GFX_COMPUTE_NOP;
+
+	r = amdgpu_bo_list_create(device, 1, &ib_result_handle, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+	ib_info.ib_mc_address = ib_result_mc_address;
+	ib_info.size = 16;
+
+	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.ring = 0;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.resources = bo_list;
+
+	igt_assert_eq(amdgpu_cs_submit(context, 0, &ibs_request, 1), 0);
+
+	fence_status.context = context;
+	fence_status.ip_type = AMDGPU_HW_IP_GFX;
+	fence_status.ip_instance = 0;
+	fence_status.fence = ibs_request.seq_no;
+
+	igt_assert_eq(amdgpu_cs_fence_to_handle(device, &fence_status,
+						AMDGPU_FENCE_TO_HANDLE_GET_SYNCOBJ,
+						&sync_obj_handle),
+						0);
+
+	igt_assert_eq(amdgpu_cs_export_syncobj(device, sync_obj_handle, &shared_fd), 0);
+
+	igt_assert_eq(amdgpu_cs_import_syncobj(device2, shared_fd, &sync_obj_handle2), 0);
+
+	igt_assert_eq(amdgpu_cs_destroy_syncobj(device, sync_obj_handle), 0);
+	amdgpu_bo_list_destroy(bo_list);
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				 ib_result_mc_address, 4096);
+	amdgpu_cs_ctx_free(context);
+	amdgpu_device_deinitialize(device);
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	device_unplug(priv, "hot ", 0);
+
+	igt_assert_eq(amdgpu_cs_syncobj_wait(device2, &sync_obj_handle2, 1, 100000000, 0, NULL),
+		      0);
+
+	igt_assert_eq(amdgpu_cs_destroy_syncobj(device2, sync_obj_handle2), 0);
+	amdgpu_device_deinitialize(device2);
+	close_device(second_fd, "late ", "removed ");
+
+}
+
 
 
 static void hotrebind(struct hotunplug *priv)
@@ -894,6 +987,15 @@ igt_main
 				recover(&priv);
 	}
 
+	igt_subtest_group {
+			igt_describe("Check if device with exported dma fence can be cleanly unplugged, then released and restored");
+			igt_subtest("hotunplug-with-exported-fence-rescan")
+			hotunplug_with_exported_fence_rescan(&priv);
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

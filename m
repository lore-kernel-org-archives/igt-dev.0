Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA27E6F49A
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 15:08:16 +0000 (UTC)
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Thu,  3 Jun 2021 11:07:58 -0400
Message-Id: <20210603150800.157685-2-andrey.grodzovsky@amd.com>
In-Reply-To: <20210603150800.157685-1-andrey.grodzovsky@amd.com>
References: <20210603150800.157685-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/3] tests/core_hotunplug: Add command submission
 for amdgpu
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

Enables better testing of hot remove

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 tests/Makefile.am      |   3 +
 tests/core_hotunplug.c | 200 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   2 +-
 3 files changed, 204 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.am b/tests/Makefile.am
index a6c807d8..0e6a3f2f 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -150,4 +150,7 @@ amdgpu_amd_prime_LDADD = $(LDADD) $(DRM_AMDGPU_LIBS)
 amdgpu_amd_info_CFLAGS = $(AM_CFLAGS) $(DRM_AMDGPU_CFLAGS)
 amdgpu_amd_info_LDADD = $(LDADD) $(DRM_AMDGPU_LIBS)
 
+core_hotunplug_CFLAGS = $(AM_CFLAGS) $(DRM_AMDGPU_CFLAGS)
+core_hotunplug_LDADD = $(LDADD) $(DRM_AMDGPU_LIBS)
+
 endif
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index e7d2a447..b553bc87 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -60,6 +60,188 @@ struct hotunplug {
 	igt_kmsg(KMSG_DEBUG "%s: " fmt, igt_test_name(), msg); \
 })
 
+/* amdgpu specific code */
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include <pthread.h>
+
+#define GFX_COMPUTE_NOP  0xffff1000
+
+
+static bool do_cs;
+
+static int
+amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned size,
+			unsigned alignment, unsigned heap, uint64_t flags,
+			amdgpu_bo_handle *bo, void **cpu, uint64_t *mc_address,
+			amdgpu_va_handle *va_handle)
+{
+	struct amdgpu_bo_alloc_request request = {
+		.alloc_size = size,
+		.phys_alignment = alignment,
+		.preferred_heap = heap,
+		.flags = flags,
+	};
+	amdgpu_bo_handle buf_handle;
+	amdgpu_va_handle handle;
+	uint64_t vmc_addr;
+	int r;
+
+	r = amdgpu_bo_alloc(dev, &request, &buf_handle);
+	if (r)
+		return r;
+
+	r = amdgpu_va_range_alloc(dev,
+				  amdgpu_gpu_va_range_general,
+				  size, alignment, 0, &vmc_addr,
+				  &handle, 0);
+	if (r)
+		goto error_va_alloc;
+
+	r = amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_MAP);
+	if (r)
+		goto error_va_map;
+
+	r = amdgpu_bo_cpu_map(buf_handle, cpu);
+	if (r)
+		goto error_cpu_map;
+
+	*bo = buf_handle;
+	*mc_address = vmc_addr;
+	*va_handle = handle;
+
+	return 0;
+
+error_cpu_map:
+	amdgpu_bo_cpu_unmap(buf_handle);
+
+error_va_map:
+	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
+
+error_va_alloc:
+	amdgpu_bo_free(buf_handle);
+	return r;
+}
+
+static void
+amdgpu_bo_unmap_and_free(amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
+			 uint64_t mc_addr, uint64_t size)
+{
+	amdgpu_bo_cpu_unmap(bo);
+	amdgpu_bo_va_op(bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP);
+	amdgpu_va_range_free(va_handle);
+	amdgpu_bo_free(bo);
+}
+
+static void amdgpu_cs_sync(amdgpu_context_handle context,
+			   unsigned int ip_type,
+			   int ring,
+			   unsigned int seqno)
+{
+	struct amdgpu_cs_fence fence = {
+		.context = context,
+		.ip_type = ip_type,
+		.ring = ring,
+		.fence = seqno,
+	};
+	uint32_t expired;
+	int err;
+
+	err = amdgpu_cs_query_fence_status(&fence,
+					   AMDGPU_TIMEOUT_INFINITE,
+					   0, &expired);
+}
+
+static void *amdgpu_nop_cs(void *p)
+{
+	int fd = *(int *)p;
+	amdgpu_bo_handle ib_result_handle;
+	void *ib_result_cpu;
+	uint64_t ib_result_mc_address;
+	uint32_t *ptr;
+	int i, r;
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle va_handle;
+	uint32_t major, minor;
+	amdgpu_device_handle device;
+	amdgpu_context_handle context;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_ib_info ib_info;
+
+	r = amdgpu_device_initialize(fd, &major, &minor, &device);
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
+	while (do_cs)
+		amdgpu_cs_submit(context, 0, &ibs_request, 1);
+
+	amdgpu_cs_sync(context, AMDGPU_HW_IP_GFX, 0, ibs_request.seq_no);
+
+	amdgpu_bo_list_destroy(bo_list);
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				 ib_result_mc_address, 4096);
+
+	amdgpu_cs_ctx_free(context);
+
+	amdgpu_device_deinitialize(device);
+
+	return (void *)0;
+}
+
+static pthread_t* amdgpu_create_cs_thread(int *fd)
+{
+	int r;
+	pthread_t *thread = malloc(sizeof(*thread));
+
+	do_cs = true;
+
+	r = pthread_create(thread, NULL, amdgpu_nop_cs, (void *)fd);
+	igt_assert_eq(r, 0);
+
+	/* Give thread enough time to start*/
+	usleep(100000);
+	return thread;
+}
+
+static void amdgpu_destroy_cs_thread(pthread_t *thread)
+{
+	void *status;
+
+	do_cs = false;
+
+	pthread_join(*thread, &status);
+	igt_assert(status == 0);
+
+	free(thread);
+}
+
 /**
  * Subtests must be able to close examined devices completely.  Don't
  * use drm_open_driver() since in case of an i915 device it opens it
@@ -455,12 +637,21 @@ static void unplug_rescan(struct hotunplug *priv)
 
 static void hotunbind_rebind(struct hotunplug *priv)
 {
+	pthread_t *thread = NULL;
+
 	pre_check(priv);
 
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
 
+	if (is_amdgpu_device(priv->fd.drm))
+		thread = amdgpu_create_cs_thread(&priv->fd.drm);
+
 	driver_unbind(priv, "hot ", 0);
 
+	if (thread)
+		amdgpu_destroy_cs_thread(thread);
+
+
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
 	igt_assert_eq(priv->fd.drm, -1);
 
@@ -471,12 +662,20 @@ static void hotunbind_rebind(struct hotunplug *priv)
 
 static void hotunplug_rescan(struct hotunplug *priv)
 {
+	pthread_t *thread = NULL;
+
 	pre_check(priv);
 
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
 
+	if (is_amdgpu_device(priv->fd.drm))
+		thread = amdgpu_create_cs_thread(&priv->fd.drm);
+
 	device_unplug(priv, "hot ", 0);
 
+	if (thread)
+		amdgpu_destroy_cs_thread(thread);
+
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
 	igt_assert_eq(priv->fd.drm, -1);
 
@@ -543,6 +742,7 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
+
 /* Main */
 
 igt_main
diff --git a/tests/meson.build b/tests/meson.build
index 825e0183..1de6cc5a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -243,7 +243,7 @@ i915_progs = [
 	'sysfs_timeslice_duration',
 ]
 
-test_deps = [ igt_deps ]
+test_deps = [ igt_deps + [ libdrm_amdgpu ] ]
 
 if libdrm_nouveau.found()
 	test_progs += [
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

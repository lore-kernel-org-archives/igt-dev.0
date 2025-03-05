Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375CAC28B26
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 23:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD2510E870;
	Wed,  5 Mar 2025 23:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YiwyhISc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D81C10E86C
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 23:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741218016; x=1772754016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e47xEfaJSE5kwAvklC9sRkFn+qP1DEgWeejOjPZYqmc=;
 b=YiwyhIScCEiJVgjmU4FsunilNMt5fwECvLgxoTsSTE4aJUzBDeJ45kB3
 8aKEMcTwWKTrrgx6zCAJ2uWlOGq7S8oAGj+DyIatVRe/Wlg/07x1Oafsl
 IhxJjr/p483wOPaakEh3YTaVBvGNPhIR6rodL8plhDQSmtDme6Cd2rtU3
 REYeKKSkd8MrWljJCna1elkWACCvld44hfjcDqhWR2grEOMunhSnAY104
 piBX5NTKU+FK+8F0pdw7rvv2LE9a13hATxlMIE7PdhomZticzOyzkz5fH
 ZLqcsyMzy9a4lASny+Q7TuIdAqq/g94p6607wndm6BYVffeRmn/z2piaX A==;
X-CSE-ConnectionGUID: piFhWXlhTuKvUa9ApweXZw==
X-CSE-MsgGUID: +xHX4X/9RTiv1+vkp3H3sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41917116"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="41917116"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 15:40:16 -0800
X-CSE-ConnectionGUID: pa29tDYKReG3OBNozFWlWA==
X-CSE-MsgGUID: ue5Y/ef/RGmM493DVYrFIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118849542"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 15:40:16 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 5/6] tests/intel/xe_pxp: Termination tests
Date: Wed,  5 Mar 2025 15:39:46 -0800
Message-ID: <20250305233951.3488609-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
References: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

There are several events that can cause the PXP key to be invalidated
and trigger a PXP termination (suspend, PXP termination irq). After a
termination, we expect the key to be different and the raw encrypted
data to change for the same source data.
Additionally, all PXP objects are invalidated during a termination and
can no longer be used in submission or kept mapped to VMs; we therefore
need to test both the execution and bind ioctls to make sure they work
as expected after a termination.

v2: move igt_require calls inside the subtest
v3: block rpm for tests trying a different type of termination, rework
invalid bind test to try a new vm as well (Alan)
v4: move file open and igt_require() inside the subtest (Kamil)
v5: add documentation for new helpers (Kamil), turn off display in RPM
tests.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_batchbuffer.c |  25 +-
 lib/intel_batchbuffer.h |   1 +
 lib/xe/xe_ioctl.c       |  35 ++-
 lib/xe/xe_ioctl.h       |   2 +
 tests/intel/xe_pxp.c    | 504 +++++++++++++++++++++++++++++++++++++++-
 5 files changed, 554 insertions(+), 13 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index ee499ee7f..16ee0de69 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2428,9 +2428,26 @@ static void update_offsets(struct intel_bb *ibb,
 
 #define LINELEN 76
 
-static int
-__xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
+/*
+ * __xe_bb_exec:
+ * @ibb: pointer to intel_bb
+ * @flags: I915_EXEC_* flags used to select the engine to submit to (internally
+ * converted to DRM_XE_ENGINE_* ones)
+ * @sync: if true wait for execbuf completion, otherwise caller is responsible
+ * to wait for completion
+ *
+ * Submits the intel_bb to HW. If an exec_queue was provided during the creation
+ * of the intel_bb, it will be used for the submission; otherwise, a new
+ * exec_queue will be created targeting the engine specified in the flags. The
+ * exec_queue created in the latter case will be saved internally and re-used
+ * for subsequent submissions to the same engine, but it will be replaced if the
+ * intel_bb is re-submitted to a different engine.
+ *
+ * Returns: 0 on success, otherwise errno.
+ */
+int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 {
+	int ret = 0;
 	uint32_t engine = flags & (I915_EXEC_BSD_MASK | I915_EXEC_RING_MASK);
 	uint32_t engine_id;
 	struct drm_xe_sync syncs[2] = {
@@ -2507,12 +2524,12 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	ibb->engine_syncobj = syncobj_create(ibb->fd, 0);
 	syncs[1].handle = ibb->engine_syncobj;
 
-	xe_exec_sync(ibb->fd, engine_id, ibb->batch_offset, syncs, 2);
+	ret = xe_exec_sync_failable(ibb->fd, engine_id, ibb->batch_offset, syncs, 2);
 
 	if (sync)
 		intel_bb_sync(ibb);
 
-	return 0;
+	return ret;
 }
 
 static int
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 178aaa9d8..6a7e8df4a 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -508,6 +508,7 @@ void intel_bb_dump_cache(struct intel_bb *ibb);
 
 void intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
 		   uint64_t flags, bool sync);
+int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync);
 
 uint64_t intel_bb_get_object_offset(struct intel_bb *ibb, uint32_t handle);
 bool intel_bb_object_offset_to_buf(struct intel_bb *ibb, struct intel_buf *buf);
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 01ab7c758..fb8c4aef1 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -462,8 +462,20 @@ void xe_exec(int fd, struct drm_xe_exec *exec)
 	igt_assert_eq(__xe_exec(fd, exec), 0);
 }
 
-void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
-		  struct drm_xe_sync *sync, uint32_t num_syncs)
+/**
+ * xe_exec_sync_failable:
+ * @fd: xe device fd
+ * @exec_queue: exec_queue id
+ * @addr: address of the batch to execute within the VM used by the exec_queue
+ * @sync: array of drm_xe_sync structs to be used in the exec
+ * @num_syncs: number of entries in the sync array
+ *
+ * Calls the DRM_IOCTL_XE_EXEC ioctl using the provided information.
+ *
+ * Returns 0 on success, -errno of ioctl on error.
+ */
+int xe_exec_sync_failable(int fd, uint32_t exec_queue, uint64_t addr,
+			  struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	struct drm_xe_exec exec = {
 		.exec_queue_id = exec_queue,
@@ -473,7 +485,24 @@ void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
 		.num_batch_buffer = 1,
 	};
 
-	igt_assert_eq(__xe_exec(fd, &exec), 0);
+	return __xe_exec(fd, &exec);
+}
+
+/**
+ * xe_exec_sync:
+ * @fd: xe device fd
+ * @exec_queue: exec_queue id
+ * @addr: address of the batch to execute within the VM used by the exec_queue
+ * @sync: array of drm_xe_sync structs to be used in the exec
+ * @num_syncs: number of entries in the sync array
+ *
+ * Calls the DRM_IOCTL_XE_EXEC ioctl using the provided information. Asserts on
+ * failure.
+ */
+void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
+		  struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	igt_assert_eq(xe_exec_sync_failable(fd, exec_queue, addr, sync, num_syncs), 0);
 }
 
 void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index c8a2d81c5..9bdf73b2b 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -91,6 +91,8 @@ int __xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
 		  struct drm_xe_sync *sync, uint32_t num_syncs);
+int xe_exec_sync_failable(int fd, uint32_t exec_queue, uint64_t addr,
+		  struct drm_xe_sync *sync, uint32_t num_syncs);
 void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr);
 int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		     uint32_t exec_queue, int64_t *timeout);
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index ad414de10..8f83c9a3b 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -3,7 +3,10 @@
  * Copyright © 2024-2025 Intel Corporation
  */
 
+#include <fcntl.h>
+
 #include "igt.h"
+#include "igt_syncobj.h"
 #include "intel_batchbuffer.h"
 #include "intel_bufops.h"
 #include "intel_mocs.h"
@@ -81,6 +84,15 @@ static uint32_t create_pxp_rcs_queue(int fd, uint32_t vm)
 	return q;
 }
 
+static uint32_t create_regular_rcs_queue(int fd, uint32_t vm)
+{
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+	};
+
+	return xe_exec_queue_create(fd, vm, &inst, 0);
+}
+
 static int query_pxp_status(int fd)
 {
 	struct drm_xe_query_pxp_status *pxp_query;
@@ -338,15 +350,25 @@ static void pxp_rendercopy(int fd, uint32_t q, uint32_t vm, uint32_t copy_size,
 	buf_ops_destroy(bops);
 }
 
-/**
- * SUBTEST: regular-src-to-pxp-dest-rendercopy
- * Description: copy from a regular BO to a PXP one and verify the encryption
- */
-static void test_render_regular_src_to_pxp_dest(int fd)
+static void copy_bo_cpu(int fd, uint32_t bo, uint32_t *dst, uint32_t size)
+{
+	uint32_t *src_ptr;
+
+	src_ptr = xe_bo_mmap_ext(fd, bo, size, PROT_READ);
+
+	memcpy(dst, src_ptr, size);
+
+	igt_assert_eq(munmap(src_ptr, size), 0);
+}
+
+static void __test_render_regular_src_to_pxp_dest(int fd, uint32_t *outpixels, int outsize)
 {
 	uint32_t vm, srcbo, dstbo;
 	uint32_t q;
 
+	if (outpixels)
+		igt_assert_lte(TSTSURF_SIZE, outsize);
+
 	vm = xe_vm_create(fd, 0, 0);
 
 	/*
@@ -362,12 +384,24 @@ static void test_render_regular_src_to_pxp_dest(int fd)
 
 	check_bo_color(fd, dstbo, TSTSURF_SIZE, TSTSURF_FILLCOLOR1, false);
 
+	if (outpixels)
+		copy_bo_cpu(fd, dstbo, outpixels, TSTSURF_SIZE);
+
 	gem_close(fd, srcbo);
 	gem_close(fd, dstbo);
 	xe_exec_queue_destroy(fd, q);
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: regular-src-to-pxp-dest-rendercopy
+ * Description: copy from a regular BO to a PXP one and verify the encryption
+ */
+static void test_render_regular_src_to_pxp_dest(int fd)
+{
+	__test_render_regular_src_to_pxp_dest(fd, NULL, 0);
+}
+
 static int bocmp(int fd, uint32_t bo1, uint32_t bo2, uint32_t size)
 {
 	uint32_t *ptr1, *ptr2;
@@ -429,24 +463,459 @@ static void test_render_pxp_protsrc_to_protdest(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
-static void require_pxp_render(bool pxp_supported, uint32_t devid)
+#define PS_OP_TAG_LOW 0x1234fed0
+#define PS_OP_TAG_HI 0x5678cbaf
+static void emit_pipectrl(struct intel_bb *ibb, struct intel_buf *fenceb)
+{
+	uint32_t pipe_ctl_flags = 0;
+
+	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(2));
+	intel_bb_out(ibb, pipe_ctl_flags);
+
+	pipe_ctl_flags = (PIPE_CONTROL_FLUSH_ENABLE |
+			  PIPE_CONTROL_CS_STALL |
+			  PIPE_CONTROL_QW_WRITE);
+	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(6));
+	intel_bb_out(ibb, pipe_ctl_flags);
+
+	intel_bb_emit_reloc(ibb, fenceb->handle, 0, I915_GEM_DOMAIN_COMMAND, 0,
+			    fenceb->addr.offset);
+	intel_bb_out(ibb, PS_OP_TAG_LOW);
+	intel_bb_out(ibb, PS_OP_TAG_HI);
+	intel_bb_out(ibb, MI_NOOP);
+	intel_bb_out(ibb, MI_NOOP);
+}
+
+static void assert_pipectl_storedw_done(int fd, uint32_t bo)
+{
+	uint32_t *ptr;
+
+	ptr = xe_bo_mmap_ext(fd, bo, 4096, PROT_READ|PROT_WRITE);
+	igt_assert_eq(ptr[0], PS_OP_TAG_LOW);
+	igt_assert_eq(ptr[1], PS_OP_TAG_HI);
+
+	igt_assert(munmap(ptr, 4096) == 0);
+}
+
+static int submit_flush_store_dw(int fd, uint32_t q, bool q_is_pxp, uint32_t vm,
+				 uint32_t dst, bool dst_is_pxp)
+{
+	struct intel_buf *dstbuf;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
+	int ret = 0;
+
+	bops = buf_ops_create(fd);
+	igt_assert(bops);
+
+	ibb = intel_bb_create_with_context(fd, q, vm, NULL, 4096);
+	igt_assert(ibb);
+	intel_bb_set_pxp(ibb, q_is_pxp, DISPLAY_APPTYPE, DRM_XE_PXP_HWDRM_DEFAULT_SESSION);
+
+	dstbuf = buf_create(fd, bops, dst, 256, 4, 32, 4096);
+	intel_buf_set_pxp(dstbuf, dst_is_pxp);
+
+	intel_bb_ptr_set(ibb, 0);
+	intel_bb_add_intel_buf(ibb, dstbuf, true);
+	emit_pipectrl(ibb, dstbuf);
+	intel_bb_emit_bbe(ibb);
+	ret = __xe_bb_exec(ibb, 0, false);
+	if (ret == 0)
+		ret = intel_bb_sync(ibb);
+	if (ret == 0)
+		assert_pipectl_storedw_done(fd, dst);
+
+	intel_buf_destroy(dstbuf);
+	intel_bb_destroy(ibb);
+	buf_ops_destroy(bops);
+
+	return ret;
+}
+
+static void trigger_pxp_debugfs_forced_teardown(int xe_fd)
+{
+	char str[32];
+	int ret;
+	int fd;
+
+	fd = igt_debugfs_dir(xe_fd);
+	igt_assert(fd >= 0);
+	ret = igt_debugfs_simple_read(fd, "pxp/terminate", str, 32);
+	igt_assert_f(ret >= 0, "Can't open pxp termination debugfs\n");
+
+	/* give the kernel time to handle the termination */
+	sleep(1);
+}
+
+enum termination_type {
+	PXP_TERMINATION_IRQ,
+	PXP_TERMINATION_RPM,
+	PXP_TERMINATION_SUSPEND
+};
+
+static void trigger_termination(int fd, enum termination_type type)
+{
+	switch (type) {
+	case PXP_TERMINATION_IRQ:
+		trigger_pxp_debugfs_forced_teardown(fd);
+		break;
+	case PXP_TERMINATION_RPM:
+		igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+		break;
+	case PXP_TERMINATION_SUSPEND:
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_DEVICES);
+		break;
+	}
+}
+
+/**
+ * SUBTEST: pxp-termination-key-update-post-termination-irq
+ * Description: Verify key is changed after a termination irq
+ */
+
+/**
+ * SUBTEST: pxp-termination-key-update-post-suspend
+ * Description: Verify key is changed after a suspend/resume cycle
+ */
+
+/**
+ * SUBTEST: pxp-termination-key-update-post-rpm
+ * Description: Verify key is changed after a runtime suspend/resume cycle
+ */
+
+static void test_pxp_teardown_keychange(int fd, enum termination_type type)
+{
+	uint32_t* encrypted_data_before;
+	uint32_t* encrypted_data_after;
+	int matched_after_keychange = 0, loop = 0;
+
+	encrypted_data_before = malloc(TSTSURF_SIZE);
+	encrypted_data_after = malloc(TSTSURF_SIZE);
+	igt_assert(encrypted_data_before && encrypted_data_after);
+
+	__test_render_regular_src_to_pxp_dest(fd, encrypted_data_before, TSTSURF_SIZE);
+
+	trigger_termination(fd, type);
+
+	__test_render_regular_src_to_pxp_dest(fd, encrypted_data_after, TSTSURF_SIZE);
+
+	while (loop < (TSTSURF_SIZE/TSTSURF_BYTESPP)) {
+		if (encrypted_data_before[loop] == encrypted_data_after[loop])
+			++matched_after_keychange;
+		++loop;
+	}
+	igt_assert_eq(matched_after_keychange, 0);
+
+	free(encrypted_data_before);
+	free(encrypted_data_after);
+}
+
+static void pxp_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t addr,
+			     uint64_t size, uint32_t op)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+
+	__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, size, op,
+			    DRM_XE_VM_BIND_FLAG_CHECK_PXP, &sync, 1, 0, 0);
+
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+	syncobj_destroy(fd, sync.handle);
+}
+
+/**
+ * SUBTEST: pxp-stale-bo-bind-post-termination-irq
+ * Description: verify that VM bind on a stale BO (due to a termination irq) is rejected.
+ */
+
+/**
+ * SUBTEST: pxp-stale-bo-bind-post-suspend
+ * Description: verify that VM bind on a stale BO (due to a suspend/resume cycle)
+ *              is rejected.
+ */
+
+/**
+ * SUBTEST: pxp-stale-bo-bind-post-rpm
+ * Description: verify that VM bind on a stale BO (due to a runtime suspend/resume
+ *              cycle) is rejected.
+ */
+
+static void __test_pxp_stale_bo_bind(int fd, enum termination_type type, bool pxp)
+{
+	uint32_t vm, q;
+	uint32_t bo;
+	uint32_t flags = pxp ? DRM_XE_VM_BIND_FLAG_CHECK_PXP : 0;
+	int ret;
+
+	vm = xe_vm_create(fd, 0, 0);
+	q = create_pxp_rcs_queue(fd, vm); /* start PXP session */
+
+	bo = pxp_bo_create(fd, 0, 4096, DRM_XE_PXP_TYPE_HWDRM);
+
+	/* map the BO to the VM to make sure it works */
+	pxp_vm_bind_sync(fd, vm, bo, 0, 4096, DRM_XE_VM_BIND_OP_MAP);
+
+	xe_exec_queue_destroy(fd, q);
+	trigger_termination(fd, type);
+
+	/* map of a stale PXP BO must fail if (and only if) the CHECK_PXP flag is set */
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0, 4096, DRM_XE_VM_BIND_OP_MAP,
+			   flags, NULL, 0, 0, DEFAULT_PAT_INDEX, 0);
+	igt_assert_eq(ret, pxp ? -ENOEXEC : 0);
+
+	/* unmap must always work */
+	pxp_vm_bind_sync(fd, vm, bo, 0, 0, DRM_XE_VM_BIND_OP_UNMAP_ALL);
+
+	xe_vm_destroy(fd, vm);
+
+	/* mapping on a brand new vm should have the same behavior */
+	vm = xe_vm_create(fd, 0, 0);
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0, 4096, DRM_XE_VM_BIND_OP_MAP,
+			   flags, NULL, 0, 0, DEFAULT_PAT_INDEX, 0);
+	igt_assert_eq(ret, pxp ? -ENOEXEC : 0);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+static void test_pxp_stale_bo_bind(int fd, enum termination_type type)
+{
+	__test_pxp_stale_bo_bind(fd, type, true);
+}
+
+static uint32_t create_and_bind_simple_pxp_batch(int fd, uint32_t vm,
+						 uint32_t size, uint64_t addr)
+{
+	uint32_t bo;
+	uint32_t *map;
+	bo = pxp_bo_create(fd, vm, 4096, DRM_XE_PXP_TYPE_HWDRM);
+	pxp_vm_bind_sync(fd, vm, bo, addr, size, DRM_XE_VM_BIND_OP_MAP);
+
+	map = xe_bo_map(fd, bo, 4096);
+	*map = MI_BATCH_BUFFER_END;
+	munmap(map, 4096);
+
+	return bo;
+}
+
+/**
+ * SUBTEST: pxp-stale-bo-exec-post-termination-irq
+ * Description: verify that a submission using VM with a mapped stale BO (due to
+ *              a termination irq) is rejected.
+ */
+
+/**
+ * SUBTEST: pxp-stale-bo-exec-post-suspend
+ * Description: verify that a submission using VM with a mapped stale BO (due to
+ *              a suspend/resume cycle) is rejected.
+ */
+
+/**
+ * SUBTEST: pxp-stale-bo-exec-post-rpm
+ * Description: verify that a submission using VM with a mapped stale BO (due to
+ *              a runtime suspend/resume cycle) is rejected.
+ */
+
+static void __test_pxp_stale_bo_exec(int fd, enum termination_type type, bool pxp)
+{
+	uint32_t vm, q;
+	uint32_t bo;
+	int expected;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	q = create_pxp_rcs_queue(fd, vm); /* start a PXP session */
+	bo = create_and_bind_simple_pxp_batch(fd, vm, 4096, 0);
+
+	xe_exec_queue_destroy(fd, q);
+	trigger_termination(fd, type);
+
+	/* create a clean queue using the VM with the invalid object mapped in */
+	if (pxp) {
+		q = create_pxp_rcs_queue(fd, vm);
+		expected = -ENOEXEC;
+	} else {
+		q = create_regular_rcs_queue(fd, vm);
+		expected = 0;
+	}
+
+	igt_assert_eq(xe_exec_sync_failable(fd, q, 0, NULL, 0), expected);
+
+	/* now make sure we can unmap the stale BO and have a clean exec after */
+	if (pxp) {
+		pxp_vm_bind_sync(fd, vm, 0, 0, 4096, DRM_XE_VM_BIND_OP_UNMAP);
+		gem_close(fd, bo);
+
+		bo = create_and_bind_simple_pxp_batch(fd, vm, 4096, 0);
+		igt_assert_eq(xe_exec_sync_failable(fd, q, 0, NULL, 0), 0);
+	}
+
+	xe_exec_queue_destroy(fd, q);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+static void test_pxp_stale_bo_exec(int fd, enum termination_type type)
+{
+	__test_pxp_stale_bo_exec(fd, type, true);
+}
+
+/**
+ * SUBTEST: pxp-stale-queue-post-termination-irq
+ * Description: verify that submissions on a stale queue (due to a termination
+ *              irq) are cancelled
+ */
+
+/**
+ * SUBTEST: pxp-stale-queue-post-suspend
+ * Description: verify that submissions on a stale queue (due to a suspend/resume
+ *              cycle) are cancelled
+ */
+
+static void test_pxp_stale_queue_execution(int fd, enum termination_type type)
+{
+	uint32_t vm, q;
+	uint32_t dstbo;
+
+	vm = xe_vm_create(fd, 0, 0);
+	q = create_pxp_rcs_queue(fd, vm);
+
+	dstbo = regular_bo_create_and_fill(fd, vm, 4096, 0);
+
+	igt_assert_eq(submit_flush_store_dw(fd, q, true, vm, dstbo, false), 0);
+
+	trigger_termination(fd, type);
+
+	/* when we execute an invalid queue we expect the job to be canceled */
+	igt_assert_eq(submit_flush_store_dw(fd, q, true, vm, dstbo, false), -ECANCELED);
+
+	gem_close(fd, dstbo);
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: pxp-optout
+ * Description: verify that submssions with stale objects/queues are not blocked
+ *              if the user does not opt-in to the PXP checks.
+ */
+static void test_pxp_optout(int fd)
+{
+	__test_pxp_stale_bo_exec(fd, PXP_TERMINATION_IRQ, false);
+	__test_pxp_stale_bo_bind(fd, PXP_TERMINATION_IRQ, false);
+}
+
+static void require_pxp(bool pxp_supported)
 {
 	igt_require_f(pxp_supported, "PXP not supported\n");
+}
+
+static void require_pxp_render(bool pxp_supported, uint32_t devid)
+{
+	require_pxp(pxp_supported);
 	igt_require_f(igt_get_render_copyfunc(devid),
 		      "No rendercopy found for devid=%x\n", devid);
 }
 
+static void dpms_on_off(int fd, drmModeResPtr res, int mode)
+{
+	int i;
+
+	if (!res)
+		return;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		drmModeConnector *connector =
+			drmModeGetConnectorCurrent(fd, res->connectors[i]);
+
+		if (!connector)
+			continue;
+
+		if (connector->connection == DRM_MODE_CONNECTED)
+			kmstest_set_connector_dpms(fd, connector, mode);
+
+		drmModeFreeConnector(connector);
+	}
+}
+
+static void setup_rpm(int fd, drmModeResPtr res)
+{
+	igt_require(igt_setup_runtime_pm(fd));
+
+	dpms_on_off(fd, res, DRM_MODE_DPMS_OFF);
+}
+
+static void restore_rpm(int fd, drmModeResPtr res)
+{
+	dpms_on_off(fd, res, DRM_MODE_DPMS_ON);
+
+	igt_restore_runtime_pm();
+}
+
+static void run_termination_test(int fd, enum termination_type type, drmModeResPtr res,
+				 void (*test)(int fd, enum termination_type type))
+{
+	int fw_handle;
+
+	if (type != PXP_TERMINATION_RPM) {
+		/* avoid rpm entry for non-rpm tests */
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_require(fw_handle >= 0);
+	} else {
+		setup_rpm(fd, res);
+	}
+
+	test(fd, type);
+
+	if (type != PXP_TERMINATION_RPM)
+		close(fw_handle);
+	else
+		restore_rpm(fd, res);
+}
+
+static void termination_tests(int fd, bool pxp_supported, uint32_t devid,
+			      drmModeResPtr res, enum termination_type type,
+			      const char *tag)
+{
+	igt_subtest_f("pxp-termination-key-update-post-%s", tag) {
+		require_pxp_render(pxp_supported, devid);
+		run_termination_test(fd, type, res, test_pxp_teardown_keychange);
+	}
+
+	igt_subtest_f("pxp-stale-bo-bind-post-%s", tag) {
+		require_pxp(pxp_supported);
+		run_termination_test(fd, type, res, test_pxp_stale_bo_bind);
+	}
+
+	igt_subtest_f("pxp-stale-bo-exec-post-%s", tag) {
+		require_pxp(pxp_supported);
+		run_termination_test(fd, type, res, test_pxp_stale_bo_exec);
+	}
+
+	/* An active PXP queue holds an RPM ref, so we can't test RPM with it */
+	if (type != PXP_TERMINATION_RPM)
+		igt_subtest_f("pxp-stale-queue-post-%s", tag) {
+			require_pxp(pxp_supported);
+			run_termination_test(fd, type, res, test_pxp_stale_queue_execution);
+		}
+}
+
 igt_main
 {
 	int xe_fd = -1;
 	bool pxp_supported = true;
 	uint32_t devid = 0;
+	drmModeResPtr res;
 
 	igt_fixture {
 		xe_fd = drm_open_driver(DRIVER_XE);
 		devid = intel_get_drm_devid(xe_fd);
 		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
 		pxp_supported = is_pxp_hw_supported(xe_fd);
+		res = drmModeGetResources(xe_fd);
 	}
 
 	igt_subtest_group {
@@ -470,7 +939,30 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		const struct mode {
+			enum termination_type type;
+			const char *tag;
+		} modes[] = {
+			{ PXP_TERMINATION_IRQ, "termination-irq" },
+			{ PXP_TERMINATION_SUSPEND, "suspend" },
+			{ PXP_TERMINATION_RPM, "rpm" },
+			{ 0, NULL }
+		};
+
+		igt_describe("Verify teardown management");
+
+		for (const struct mode *m = modes; m->tag; m++)
+			termination_tests(xe_fd, pxp_supported, devid, res, m->type, m->tag);
+
+		igt_subtest("pxp-optout") {
+			require_pxp(pxp_supported);
+			test_pxp_optout(xe_fd);
+		}
+	}
+
 	igt_fixture {
+		drmModeFreeResources(res);
 		close(xe_fd);
 	}
 }
-- 
2.43.0


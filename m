Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E2EFCC9C4
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 05:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926DC10E1F0;
	Tue, 10 Mar 2026 05:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtLyMy1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D4D10E64F
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 05:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773119931; x=1804655931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7DXhqZqpS7iFitNxT9r05iguOXgE1+UFDrwU7P+oaGY=;
 b=LtLyMy1VML4Bwzi7lKB5uTYHeGx0kLtnEpjB+elb/stBg9uY1Z7SPsZx
 LEoZtPEnvG+l3gdshINN2zg5oDMXxHDz9suDPeba04O80iy37kPnnzvK9
 i9iHuBQCWm7tdPK48eCqdot+HGOyztiAZSeQM8brrmmAZmkk739z+S90n
 DWmXT5l8MbfVecI4f82c2gkW05AagwUQy8u6vcXy39soAjgRZdk4QAo0K
 dQ34wFKJmPRJGa5nCxcnRDaM/qQp3/wOGhElFyvjqNxpDuHglPYqrHHHh
 4usiK8kjWUbW+GxKiv2CtZ2xOpFDMJTcJHfOW4WkKil/vNqRZ47haxm55 A==;
X-CSE-ConnectionGUID: y0NFCIoCQBy0qec8fwEBKA==
X-CSE-MsgGUID: LQk+y+A6R8Wcsjut2N/IKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="77763964"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="77763964"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 22:18:51 -0700
X-CSE-ConnectionGUID: zhm3UZJpTkSQXWLkEEbI4Q==
X-CSE-MsgGUID: k1FkL+AGRseXPl3u1/wzrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219937061"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa009.jf.intel.com with ESMTP; 09 Mar 2026 22:18:50 -0700
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_non_msix: Test compute walker
 interrupt on non msix
Date: Tue, 10 Mar 2026 10:48:43 +0530
Message-ID: <20260310051840.2885701-6-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310051840.2885701-4-priyanka.dandamudi@intel.com>
References: <20260310051840.2885701-4-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Validate compute walker interrupt notification on non msix mode.
Create 2 threads.
Thread 1:
a. Submit a batch buffer containing CW(short workload followed by computer
interrupt bit enabled with post sync B), CW (loop), PIPE_CONTROL BBE)
without sync.
b. Block the thread using barrier and wait for the signal from thread 1.
c. After the signal from the thread 2, stop the CW loop from CPU.
d. Wait for the signal from user interrupt handler to ensure completion
of batch buffer.
e. Validate short workload, poll and post sync data.

Thread 2:
a. Parallely, wait for the signal from the compute walker interrupt handler
using wait user fence at post sync address.
b. Signal the thread 1 to continue execution.

As the CW's are asynchronous, pipe control is used to ensure completion
of both the CW's. Above process help to validate that the interrupt is
coming from compute walker.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_non_msix.c | 301 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 302 insertions(+)
 create mode 100644 tests/intel/xe_non_msix.c

diff --git a/tests/intel/xe_non_msix.c b/tests/intel/xe_non_msix.c
new file mode 100644
index 000000000..9515dc487
--- /dev/null
+++ b/tests/intel/xe_non_msix.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: Tests for Compute walker interrupt on non msix mode.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Compute walker interrupt
+ * Functionality: Compute walker interrupt on non msix mode
+ * Test category: functionality test
+ */
+#include "gpgpu_shader.h"
+#include "lib/gpu_cmds.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_util.h"
+#include "igt.h"
+
+#define BATCH_STATE_SPLIT 2048
+#define WALKER_X_DIM	1
+#define WALKER_Y_DIM	512
+#define COLOR_C4 0xC4C4C4C4
+#define SHADER_CANARY 0x01010101
+#define STOP_CANARY 0x12345678
+#define SHADER_LOOP 1
+#define SHADER_SIMPLE_DWORD 2
+#define POST_SYNC_ADDR  0x10000ULL
+#define POST_SYNC_VALUE 0x80050004
+#define USER_FENCE_VALUE   0xdeadbeefdeadbeefull
+#define WRITE_IMMEDIATE_OP (1 << 16)
+#define CW_INTERRUPT_ENABLE (1 << 3)
+#define PIPE_CONTROL 0x7a000004
+#define WIDTH 1
+#define HEIGHT 512
+
+struct dim_t {
+	uint32_t x;
+	uint32_t y;
+} w_dim;
+
+struct thread_data {
+	struct intel_buf *post_sync;
+	uint32_t *post_sync_ptr;
+	uint32_t vm;
+	uint32_t exec_queue_id;
+	pthread_barrier_t barrier;
+	int fd;
+};
+
+static struct intel_buf *
+create_buf(int fd, int width, int height, uint32_t color)
+{
+	struct intel_buf *buf;
+	uint32_t *ptr;
+	size_t i;
+
+	buf = intel_buf_create(buf_ops_create(fd), width, height, 32, 0,
+			       I915_TILING_NONE, 0);
+
+	ptr = xe_bo_map(fd, buf->handle, buf->size);
+	igt_assert(ptr != MAP_FAILED);
+
+	for (i = 0; i < buf->size / sizeof(uint32_t); i++)
+		ptr[i] = color;
+
+	munmap(ptr, buf->size);
+
+	return buf;
+}
+
+static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint32_t vm,
+					       uint64_t offset, uint32_t size)
+{
+	struct intel_bb *ibb;
+
+	ibb = intel_bb_create_with_context(fd, exec_queue, vm, NULL, size);
+
+	/* update intel bb offset */
+	intel_bb_remove_object(ibb, ibb->handle, ibb->batch_offset, ibb->size);
+	intel_bb_add_object(ibb, ibb->handle,
+			    ibb->size, offset, ibb->alignment, false);
+	ibb->batch_offset = offset;
+
+	return ibb;
+}
+
+static struct gpgpu_shader *get_non_msix_shader(int fd, const uint64_t flags)
+{
+	static struct gpgpu_shader *shader;
+
+	shader = gpgpu_shader_create(fd);
+
+	if (flags & SHADER_LOOP) {
+		gpgpu_shader__label(shader, 0);
+		gpgpu_shader__jump_neq(shader, 0, 0, STOP_CANARY);
+	} else {
+		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+	}
+
+	gpgpu_shader__eot(shader);
+
+	return shader;
+}
+
+static void *thread1_fn(void *arg)
+{
+	const uint64_t bb_offset = 0x1b000000;
+	const size_t bb_size = 4096;
+	struct thread_data *t_data = arg;
+	struct xe3p_interface_descriptor_data idd1, idd2;
+	struct gpgpu_shader *shader1, *shader2;
+	struct intel_buf *short_buf, *poll_buf;
+	struct intel_bb *ibb;
+	struct xe3p_cw2_interrupt_data intdata;
+	uint32_t *inline_data1, *inline_data2;
+	uint32_t *short_ptr, *poll_ptr;
+	unsigned int width;
+	uint64_t engine;
+	int ret = 0;
+
+	w_dim.x = WALKER_X_DIM;
+	w_dim.y = WALKER_Y_DIM;
+
+	ibb = xe_bb_create_on_offset(t_data->fd, t_data->exec_queue_id, t_data->vm,
+				     bb_offset, bb_size);
+	short_buf = create_buf(t_data->fd, WIDTH, HEIGHT, (uint8_t)COLOR_C4);
+	poll_buf = create_buf(t_data->fd, WIDTH, HEIGHT, (uint8_t)COLOR_C4);
+
+	short_ptr = xe_bo_mmap_ext(t_data->fd, short_buf->handle,
+				   short_buf->size, PROT_READ | PROT_WRITE);
+	poll_ptr = xe_bo_mmap_ext(t_data->fd, poll_buf->handle,
+				  poll_buf->size, PROT_READ | PROT_WRITE);
+
+	intel_bb_add_intel_buf(ibb, short_buf, true);
+	intel_bb_add_intel_buf(ibb, t_data->post_sync, true);
+	intel_bb_add_intel_buf(ibb, poll_buf, true);
+
+	shader1 = get_non_msix_shader(t_data->fd, SHADER_SIMPLE_DWORD);
+	shader2 = get_non_msix_shader(t_data->fd, SHADER_LOOP);
+
+	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
+
+	xe3p_fill_interface_descriptor(ibb, short_buf, shader1->instr,
+				       4 * shader1->size, &idd1);
+	xe3p_fill_interface_descriptor(ibb, poll_buf, shader2->instr,
+				       4 * shader2->size, &idd2);
+
+	intel_bb_ptr_set(ibb, 0);
+	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
+		     PIPELINE_SELECT_GPGPU);
+
+	xe3p_emit_state_base_address(ibb);
+	xehp_emit_state_compute_mode(ibb, shader1->vrt != VRT_DISABLED);
+
+	inline_data1 = intel_bb_ptr(ibb) + 4 * 32;
+	width = w_dim.x * 16;
+
+	intdata.post_sync_op = WRITE_IMMEDIATE_OP | CW_INTERRUPT_ENABLE;
+	intdata.post_sync_addr = xe_canonical_va(t_data->fd,
+						 t_data->post_sync->addr.offset);
+	intdata.post_sync_val = POST_SYNC_VALUE;
+	xe3p_emit_compute_walk2(ibb, 0, 0, width, w_dim.y, &idd1,
+				w_dim.x * w_dim.y, &intdata);
+	fill_inline_data(inline_data1,
+			 xe_canonical_va(t_data->fd, short_buf->addr.offset),
+			 short_buf, w_dim.x);
+
+	xehp_emit_state_compute_mode(ibb, shader2->vrt != VRT_DISABLED);
+	inline_data2 = intel_bb_ptr(ibb) + 4 * 32;
+	xe3p_emit_compute_walk2(ibb, 0, 0, width, w_dim.y, &idd2,
+				w_dim.x * w_dim.y, NULL);
+	fill_inline_data(inline_data2,
+			 xe_canonical_va(t_data->fd, poll_buf->addr.offset),
+			 poll_buf, w_dim.x);
+
+	intel_bb_out(ibb, PIPE_CONTROL);
+	intel_bb_out(ibb, 0x00100000);
+	intel_bb_out(ibb, 0x00000000);
+	intel_bb_out(ibb, 0x00000000);
+	intel_bb_out(ibb, 0x00000000);
+	intel_bb_out(ibb, 0x00000000);
+	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
+	intel_bb_ptr_align(ibb, 32);
+
+	engine = I915_EXEC_DEFAULT;
+
+	intel_bb_exec(ibb, engine | I915_EXEC_NO_RELOC, false, false);
+
+	gpgpu_shader_destroy(shader1);
+	gpgpu_shader_destroy(shader2);
+
+	igt_assert_neq(poll_ptr[0], STOP_CANARY);
+
+	/* Wait for the signal from thread 2 to stop the CW loop.
+	 * Also ensure User interrupt is not generated before
+	 * Compute walker interrupt.
+	 */
+	ret = pthread_barrier_wait(&t_data->barrier);
+	igt_assert_f(ret == 0 || ret == PTHREAD_BARRIER_SERIAL_THREAD,
+		     "Barrier synchronization failed: %s\n", strerror(ret));
+	/* Stop the CW loop. */
+	poll_ptr[0] = STOP_CANARY;
+
+	intel_bb_sync(ibb);
+
+	igt_assert_eq(short_ptr[0], SHADER_CANARY);
+	igt_assert_eq(poll_ptr[0], STOP_CANARY);
+	igt_assert_eq(t_data->post_sync_ptr[0], POST_SYNC_VALUE);
+
+	munmap(short_ptr, short_buf->size);
+	munmap(poll_ptr, poll_buf->size);
+
+	intel_buf_destroy(short_buf);
+	intel_buf_destroy(poll_buf);
+	intel_bb_destroy(ibb);
+
+	return NULL;
+}
+
+static void *thread2_fn(void *arg)
+{
+	struct thread_data *t_data = arg;
+	int ret = 0;
+
+	/* Wait for the signal from the compute walker interrupt handler. */
+	xe_wait_ufence(t_data->fd, (uint64_t *)t_data->post_sync_ptr,
+		       POST_SYNC_VALUE, t_data->exec_queue_id, NSEC_PER_MSEC * 50000);
+
+	ret = pthread_barrier_wait(&t_data->barrier);
+	igt_assert_f(ret == 0 || ret == PTHREAD_BARRIER_SERIAL_THREAD,
+		     "Barrier synchronization failed: %s\n", strerror(ret));
+
+	return NULL;
+}
+
+/**
+ * SUBTEST: walker-interrupt-notification-non-msix
+ * Description: Validate walker interrupt notification in non msix mode.
+ * Run type: FULL
+ */
+static void test_walker_notification(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	pthread_t t1, t2;
+	struct thread_data t_data;
+	int r = 0;
+
+	t_data.fd = fd;
+	t_data.vm = xe_vm_create(fd,  0, 0);
+	t_data.exec_queue_id = xe_exec_queue_create(fd, t_data.vm, hwe, 0);
+	t_data.post_sync = create_buf(fd, WIDTH, HEIGHT, (uint8_t)COLOR_C4);
+	t_data.post_sync_ptr = xe_bo_mmap_ext(fd, t_data.post_sync->handle,
+					      t_data.post_sync->size,
+					      PROT_READ | PROT_WRITE);
+
+	r = pthread_barrier_init(&t_data.barrier, NULL, 2);
+	igt_assert_eq(r, 0);
+
+	r = pthread_create(&t1, NULL, thread1_fn, &t_data);
+	igt_assert_eq(r, 0);
+
+	r = pthread_create(&t2, NULL, thread2_fn, &t_data);
+	igt_assert_eq(r, 0);
+
+	r = pthread_join(t1, NULL);
+	igt_assert_eq(r, 0);
+
+	r = pthread_join(t2, NULL);
+	igt_assert_eq(r, 0);
+
+	pthread_barrier_destroy(&t_data.barrier);
+	munmap(t_data.post_sync_ptr, t_data.post_sync->size);
+	intel_buf_destroy(t_data.post_sync);
+}
+
+int igt_main()
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) == IP_VER(35, 11));
+	}
+
+	igt_subtest_with_dynamic("walker-interrupt-notification-non-msix") {
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
+				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_walker_notification(fd, hwe);
+				break;
+			}
+		}
+	}
+
+	igt_fixture() {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 79f21c018..bdf2eda96 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -318,6 +318,7 @@ intel_xe_progs = [
         'xe_module_load',
         'xe_multigpu_svm',
 	'xe_noexec_ping_pong',
+        'xe_non_msix',
 	'xe_oa',
 	'xe_pat',
 	'xe_peer2peer',
-- 
2.43.0


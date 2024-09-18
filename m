Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E03CCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2951110E584;
	Wed, 18 Sep 2024 11:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/MB4H2V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E22810E584
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726659097; x=1758195097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HUhBo1sGYZLBTy1P/ONIjnDpY73vLxKqqK06gN6LcVs=;
 b=N/MB4H2VljFGD5h0IY9qoBGhWy7hYWVSb23WIvlbHLjBI5HWp1KKT+ic
 C4cDl673sn+PSiKjwWH7DeU2nCUzkTBT8shY5rVDf7qQXMrot7ZSW7e9+
 zCEVaLQdQe2DPGe3J/MccA0+lvfnNsVN7WSe45EO4ME/hyamE4N1MEejc
 x6+X91AlABSlIgqgN27+wkLHCM3BH8X/DmrQ/pFNxv53cpaD+MQSzrrX1
 5X7fpxICvIDUzdOE5Ag4s3Rd5aW9Ts4f38S6K8i1TX3+m66oPaZpZI3dD
 eU/YieG/8lwfMRmVAz6DZtgbO2OUx6vH+KEVBC9mvdtYsTN+rkskIp/Kw g==;
X-CSE-ConnectionGUID: MiV/RD7EQBW2MYq0l2BB9Q==
X-CSE-MsgGUID: grSn2nUWTpqQvq5++hUx9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="28470118"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="28470118"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:37 -0700
X-CSE-ConnectionGUID: fC0u74G6SpeeEamkKkYD4A==
X-CSE-MsgGUID: NLa02naJTXKLgBTUPLURkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="106972729"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:32 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH i-g-t v7 14/16] tests/xe_exec_sip_eudebug: Port tests for
 shaders and sip
Date: Wed, 18 Sep 2024 13:30:15 +0200
Message-Id: <20240918113017.144687-15-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918113017.144687-1-christoph.manszewski@intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
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

SIP is a System Instruction Pointer, which the hardware will except/jump
into when some defined event occurs and pipeline setup has included sip
program.

Add xe_exec_sip_eudebug test that checks SIP interaction with hardware
debugging capabilities like breakpoints and software debugging like
attention handling by the KMD.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_exec_sip_eudebug.c | 355 ++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 2 files changed, 356 insertions(+)
 create mode 100644 tests/intel/xe_exec_sip_eudebug.c

diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
new file mode 100644
index 000000000..d056a14a2
--- /dev/null
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: Tests for GPGPU shader and system routine (SIP) execution related to EU debug
+ * Category: Core
+ * Mega feature: EUdebug
+ * Sub-category: EUdebug tests
+ * Functionality: EU debugger SIP interaction
+ * Test category: functionality test
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+#include <stdio.h>
+
+#include "gpgpu_shader.h"
+#include "igt.h"
+#include "igt_sysfs.h"
+#include "xe/xe_eudebug.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define WIDTH 64
+#define HEIGHT 64
+
+#define COLOR_C4 0xc4
+
+#define SHADER_CANARY 0x01010101
+#define SIP_CANARY 0x02020202
+
+enum shader_type {
+	SHADER_BREAKPOINT,
+	SHADER_WAIT,
+	SHADER_WRITE,
+};
+
+enum sip_type {
+	SIP_HEAVY,
+	SIP_NULL,
+	SIP_WAIT,
+	SIP_WRITE,
+};
+
+#define F_SUBMIT_TWICE	(1 << 0)
+
+static struct intel_buf *
+create_fill_buf(int fd, int width, int height, uint8_t color)
+{
+	struct intel_buf *buf;
+	uint8_t *ptr;
+
+	buf = calloc(1, sizeof(*buf));
+	igt_assert(buf);
+
+	intel_buf_init(buf_ops_create(fd), buf, width / 4, height, 32, 0,
+		       I915_TILING_NONE, 0);
+
+	ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
+	memset(ptr, color, buf->surface[0].size);
+	munmap(ptr, buf->surface[0].size);
+
+	return buf;
+}
+
+static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
+{
+	static struct gpgpu_shader *shader;
+
+	shader = gpgpu_shader_create(fd);
+	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+
+	switch (shader_type) {
+	case SHADER_WAIT:
+		gpgpu_shader__wait(shader);
+		break;
+	case SHADER_WRITE:
+		break;
+	case SHADER_BREAKPOINT:
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__breakpoint(shader);
+		break;
+	}
+
+	gpgpu_shader__eot(shader);
+
+	return shader;
+}
+
+static struct gpgpu_shader *get_sip(int fd, enum sip_type sip_type, enum shader_type shader_type,
+				    unsigned int y_offset)
+{
+	static struct gpgpu_shader *sip;
+
+	if (sip_type == SIP_NULL)
+		return NULL;
+
+	sip = gpgpu_shader_create(fd);
+	gpgpu_shader__write_dword(sip, SIP_CANARY, y_offset);
+
+	switch (sip_type) {
+	case SIP_WAIT:
+		gpgpu_shader__wait(sip);
+		break;
+	case SIP_HEAVY:
+		/* Depending on the generation, the production sip
+		 * executes between 145 to 157 instructions.
+		 * It performs at most 45 data port writes and 5 data port reads.
+		 * Make sure our heavy sip is at least twice heavy as production one.
+		 */
+		gpgpu_shader__loop_begin(sip, 0);
+		gpgpu_shader__write_dword(sip, 0xdeadbeef, y_offset);
+		gpgpu_shader__write_dword(sip, SIP_CANARY, y_offset);
+		gpgpu_shader__loop_end(sip, 0, 45);
+
+		gpgpu_shader__loop_begin(sip, 1);
+		gpgpu_shader__jump_neq(sip, 1, y_offset, SIP_CANARY);
+		gpgpu_shader__loop_end(sip, 1, 10);
+
+		gpgpu_shader__wait(sip);
+		break;
+	default:
+		break;
+	}
+
+	gpgpu_shader__end_system_routine(sip, shader_type == SHADER_BREAKPOINT);
+
+	return sip;
+}
+
+static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shader_type,
+			     enum sip_type sip_type, unsigned int threads, unsigned int width,
+			     unsigned int height)
+{
+	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
+	struct gpgpu_shader *sip = get_sip(fd, sip_type, shader_type, height / 2);
+	struct gpgpu_shader *shader = get_shader(fd, shader_type);
+
+	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
+
+	if (sip)
+		gpgpu_shader_destroy(sip);
+	gpgpu_shader_destroy(shader);
+
+	return buf->handle;
+}
+
+static void check_fill_buf(uint8_t *ptr, const int width, const int x,
+			   const int y, const uint8_t color)
+{
+	const uint8_t val = ptr[y * width + x];
+
+	igt_assert_f(val == color,
+		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
+		     color, val, x, y);
+}
+
+static void check_buf(int fd, uint32_t handle, int width, int height,
+		      enum sip_type sip_type, uint8_t poison_c)
+{
+	unsigned int sz = ALIGN(width * height, 4096);
+	int thread_count = 0, sip_count = 0;
+	uint32_t *ptr;
+	int i, j;
+
+	ptr = xe_bo_mmap_ext(fd, handle, sz, PROT_READ);
+
+	for (i = 0, j = 0; j < height / 2; ++j) {
+		if (ptr[j * width / 4] == SHADER_CANARY) {
+			++thread_count;
+			i = 4;
+		}
+
+		for (; i < width; i++)
+			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
+
+		i = 0;
+	}
+
+	for (i = 0, j = height / 2; j < height; ++j) {
+		if (ptr[j * width / 4] == SIP_CANARY) {
+			++sip_count;
+			i = 4;
+		}
+
+		for (; i < width; i++)
+			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
+
+		i = 0;
+	}
+
+	igt_assert(thread_count);
+	if (sip_type != SIP_NULL && xe_eudebug_debugger_available(fd))
+		igt_assert_f(thread_count == sip_count,
+			     "Thread and SIP count mismatch, %d != %d\n",
+			     thread_count, sip_count);
+	else
+		igt_assert(sip_count == 0);
+
+	munmap(ptr, sz);
+}
+
+static uint64_t
+xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	int engine_fd = -1;
+	uint64_t ret;
+
+	engine_fd = xe_sysfs_engine_open(fd, eci->gt_id, eci->engine_class);
+	ret = igt_sysfs_get_u64(engine_fd, "job_timeout_ms");
+	close(engine_fd);
+
+	return ret;
+}
+
+/**
+ * SUBTEST: wait-writesip-nodebug
+ * Description: verify that we don't enter SIP after wait with debugging disabled.
+ *
+ * SUBTEST: breakpoint-writesip-nodebug
+ * Description: verify that we don't enter SIP after hitting breakpoint in shader
+ *		when debugging is disabled.
+ *
+ * SUBTEST: breakpoint-writesip
+ * Description: Test that we enter SIP after hitting breakpoint in shader.
+ *
+ * SUBTEST: breakpoint-writesip-twice
+ * Description: Test twice that we enter SIP after hitting breakpoint in shader.
+ *
+ * SUBTEST: breakpoint-waitsip
+ * Description: Test that we reset after seeing the attention without the debugger.
+ *
+ * SUBTEST: breakpoint-waitsip-heavy
+ * Description:
+ *	Test that we reset after seeing the attention from heavy SIP, that resembles
+ *	the production one, without the debugger.
+ */
+static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
+		     struct drm_xe_engine_class_instance *eci, uint32_t flags)
+{
+	unsigned int threads = 512;
+	unsigned int height = max_t(threads, HEIGHT, threads * 2);
+	unsigned int width = WIDTH;
+	struct drm_xe_ext_set_property ext = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG,
+		.value = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE,
+	};
+	struct timespec ts = { };
+	uint32_t exec_queue_id, handle, vm_id;
+	bool debugger_enabled;
+	struct intel_bb *ibb;
+	uint64_t timeout;
+	int done, fd;
+
+	igt_debug("Using %s\n", xe_engine_class_string(eci->engine_class));
+
+	fd = drm_open_driver(DRIVER_XE);
+	xe_device_get(fd);
+
+	debugger_enabled = xe_eudebug_debugger_available(fd);
+	vm_id = xe_vm_create(fd, debugger_enabled ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
+
+	/* Get timeout for job, and add 4s to ensure timeout processes in subtest. */
+	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 4ull * MSEC_PER_SEC;
+	timeout *= NSEC_PER_MSEC;
+	timeout *= igt_run_in_simulation() ? 10 : 1;
+
+	exec_queue_id = xe_exec_queue_create(fd, vm_id, eci,
+					     debugger_enabled ? to_user_pointer(&ext) : 0);
+
+	done = flags & F_SUBMIT_TWICE ? 2 : 1;
+	do {
+		ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
+		intel_bb_set_lr_mode(ibb, debugger_enabled);
+
+		igt_nsec_elapsed(&ts);
+		handle = gpgpu_shader(fd, ibb, shader_type, sip_type, threads, width, height);
+
+		intel_bb_sync(ibb);
+		igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
+
+		check_buf(fd, handle, width, height, sip_type, COLOR_C4);
+
+		gem_close(fd, handle);
+		intel_bb_destroy(ibb);
+	} while (--done);
+
+	xe_exec_queue_destroy(fd, exec_queue_id);
+	xe_vm_destroy(fd, vm_id);
+	xe_device_put(fd);
+	close(fd);
+}
+
+#define test_render_and_compute(t, __fd, __eci) \
+	igt_subtest_with_dynamic(t) \
+		xe_for_each_engine(__fd, __eci) \
+			if (__eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
+			    __eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) \
+				igt_dynamic_f("%s%d", xe_engine_class_string(__eci->engine_class), \
+					      __eci->engine_instance)
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *eci;
+	bool was_enabled;
+	int fd;
+
+	igt_fixture
+		fd = drm_open_driver(DRIVER_XE);
+
+	/* Debugger disabled (TD_CTL not set) */
+	igt_subtest_group {
+		igt_fixture {
+			was_enabled = xe_eudebug_enable(fd, false);
+			igt_require(!xe_eudebug_debugger_available(fd));
+		}
+
+		test_render_and_compute("wait-writesip-nodebug", fd, eci)
+			test_sip(SHADER_WAIT, SIP_WRITE, eci, 0);
+
+		test_render_and_compute("breakpoint-writesip-nodebug", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, 0);
+
+		igt_fixture
+			xe_eudebug_enable(fd, was_enabled);
+	}
+
+	/* Debugger enabled (TD_CTL set) */
+	igt_subtest_group {
+		igt_fixture {
+			was_enabled = xe_eudebug_enable(fd, true);
+		}
+
+		test_render_and_compute("breakpoint-writesip", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, 0);
+
+		test_render_and_compute("breakpoint-writesip-twice", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, F_SUBMIT_TWICE);
+
+		test_render_and_compute("breakpoint-waitsip", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_WAIT, eci, 0);
+
+		test_render_and_compute("breakpoint-waitsip-heavy", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_HEAVY, eci, 0);
+
+		igt_fixture
+			xe_eudebug_enable(fd, was_enabled);
+	}
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 0f996fdc8..43e8516f4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -320,6 +320,7 @@ intel_xe_progs = [
 
 intel_xe_eudebug_progs = [
 	'xe_eudebug',
+	'xe_exec_sip_eudebug',
 ]
 
 if build_xe_eudebug
-- 
2.34.1


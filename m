Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AAEC43327
	for <igt-dev@archiver.kernel.org>; Wed,  1 Jul 2026 12:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59C310E38A;
	Wed,  1 Jul 2026 12:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLxUIrBH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB2410E9EE
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2026 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782907926; x=1814443926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fad2y7Q8WR7V1Iv1EPxlbkEeRmvaF6VXNOUEykpFD2Q=;
 b=XLxUIrBH232/A+qgJpcyWvs+7jMbqdaYcU7GRyO6Hg0/YkTIsoxh7xqM
 9cw/UHtS8eOVik6zRdw3/9gW8+4mUfNeQVImrr1X17k6GDAQNimMoq1Yz
 DlpI1BRS3nOWxlCAyp3urDVZzzIEkVnSxYDkqYnMvHSo456j+bv+9J+Za
 2tzcF1tGn/E8G14RN8qORazj0VRrUVcgyNysjQKksrjLHcn8UKLAuh0gc
 GQ+mLtGQl9GjReYH9B8WV+h81Xfc6Js4L/Kfv1jgVe1d6HinrIdcrU7OM
 0I7xiTWpDB1suaNhZWFABsQMrAB9hQG2LjKw2QSPgChPgxEH5QQlwrga6 A==;
X-CSE-ConnectionGUID: nSTo1F3nRSqEBypd3cbEjg==
X-CSE-MsgGUID: R5BvqJZMTFioenCspzgSlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83414362"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="83414362"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 05:12:05 -0700
X-CSE-ConnectionGUID: 7Lv3RqGPTRWjUHl0XjgaXA==
X-CSE-MsgGUID: 1WuO30oLT2mTIXKrC3FqAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="254477209"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.244.55])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 05:12:04 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v4 i-g-t 2/8] tests/xe_exec_sip_eudebug: Remove
 xe_exec_sip_eudebug test
Date: Wed,  1 Jul 2026 14:11:43 +0200
Message-Id: <20260701121149.16639-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701121149.16639-1-dominik.karol.piatkowski@intel.com>
References: <20260701121149.16639-1-dominik.karol.piatkowski@intel.com>
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

Remove xe_exec_sip_eudebug test due to lack of upstream kernel with
EUdebug feature to be supported by this test.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_exec_sip_eudebug.c | 367 ------------------------------
 tests/meson.build                 |   1 -
 2 files changed, 368 deletions(-)
 delete mode 100644 tests/intel/xe_exec_sip_eudebug.c

diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
deleted file mode 100644
index 20c2a1d82..000000000
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ /dev/null
@@ -1,367 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2024 Intel Corporation
- */
-
-/**
- * TEST: Tests for GPGPU shader and system routine (SIP) execution related to EU debug
- * Category: Core
- * Mega feature: EUdebug
- * Sub-category: EUdebug tests
- * Functionality: EU debugger SIP interaction
- * Test category: functionality test
- */
-
-#include <dirent.h>
-#include <fcntl.h>
-#include <stdio.h>
-
-#include "gpgpu_shader.h"
-#include "igt.h"
-#include "igt_sysfs.h"
-#include "xe/xe_eudebug.h"
-#include "xe/xe_ioctl.h"
-#include "xe/xe_query.h"
-
-#define WIDTH 64
-#define HEIGHT 64
-
-#define COLOR_C4 0xc4
-
-#define SHADER_CANARY 0x01010101
-#define SIP_CANARY 0x02020202
-
-enum shader_type {
-	SHADER_BREAKPOINT,
-	SHADER_WAIT,
-	SHADER_WRITE,
-};
-
-enum sip_type {
-	SIP_HEAVY,
-	SIP_NULL,
-	SIP_WAIT,
-	SIP_WRITE,
-};
-
-#define F_SUBMIT_TWICE	(1 << 0)
-
-static struct intel_buf *
-create_fill_buf(int fd, int width, int height, uint8_t color)
-{
-	struct intel_buf *buf;
-	uint8_t *ptr;
-
-	buf = calloc(1, sizeof(*buf));
-	igt_assert(buf);
-
-	intel_buf_init(buf_ops_create(fd), buf, width / 4, height, 32, 0,
-		       I915_TILING_NONE, 0);
-
-	ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
-	memset(ptr, color, buf->surface[0].size);
-	munmap(ptr, buf->surface[0].size);
-
-	return buf;
-}
-
-static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
-{
-	static struct gpgpu_shader *shader;
-
-	shader = gpgpu_shader_create(fd);
-	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
-
-	switch (shader_type) {
-	case SHADER_WAIT:
-		gpgpu_shader__wait(shader);
-		break;
-	case SHADER_WRITE:
-		break;
-	case SHADER_BREAKPOINT:
-		gpgpu_shader__nop(shader);
-		gpgpu_shader__breakpoint(shader);
-		break;
-	}
-
-	gpgpu_shader__eot(shader);
-
-	return shader;
-}
-
-static struct gpgpu_shader *get_sip(int fd, enum sip_type sip_type, enum shader_type shader_type,
-				    unsigned int y_offset)
-{
-	static struct gpgpu_shader *sip;
-
-	if (sip_type == SIP_NULL)
-		return NULL;
-
-	sip = gpgpu_shader_create(fd);
-	gpgpu_shader__write_dword(sip, SIP_CANARY, y_offset);
-
-	switch (sip_type) {
-	case SIP_WAIT:
-		gpgpu_shader__wait(sip);
-		break;
-	case SIP_HEAVY:
-		/* Depending on the generation, the production sip
-		 * executes between 145 to 157 instructions.
-		 * It performs at most 45 data port writes and 5 data port reads.
-		 * Make sure our heavy sip is at least twice heavy as production one.
-		 */
-		gpgpu_shader__loop_begin(sip, 0);
-		gpgpu_shader__write_dword(sip, 0xdeadbeef, y_offset);
-		gpgpu_shader__write_dword(sip, SIP_CANARY, y_offset);
-		gpgpu_shader__loop_end(sip, 0, 45);
-
-		gpgpu_shader__loop_begin(sip, 1);
-		gpgpu_shader__jump_neq(sip, 1, y_offset, SIP_CANARY);
-		gpgpu_shader__loop_end(sip, 1, 10);
-
-		gpgpu_shader__wait(sip);
-		break;
-	default:
-		break;
-	}
-
-	gpgpu_shader__end_system_routine(sip, shader_type == SHADER_BREAKPOINT);
-
-	return sip;
-}
-
-static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shader_type,
-			     enum sip_type sip_type, unsigned int threads, unsigned int width,
-			     unsigned int height)
-{
-	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
-	struct gpgpu_shader *sip = get_sip(fd, sip_type, shader_type, height / 2);
-	struct gpgpu_shader *shader = get_shader(fd, shader_type);
-
-	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
-
-	if (sip)
-		gpgpu_shader_destroy(sip);
-	gpgpu_shader_destroy(shader);
-
-	return buf->handle;
-}
-
-static void check_fill_buf(uint8_t *ptr, const int width, const int x,
-			   const int y, const uint8_t color)
-{
-	const uint8_t val = ptr[y * width + x];
-
-	igt_assert_f(val == color,
-		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
-		     color, val, x, y);
-}
-
-static void check_buf(int fd, uint32_t handle, int width, int height,
-		      enum sip_type sip_type, uint8_t poison_c)
-{
-	unsigned int sz = ALIGN(width * height, 4096);
-	int thread_count = 0, sip_count = 0;
-	uint32_t *ptr;
-	int i, j;
-
-	ptr = xe_bo_mmap_ext(fd, handle, sz, PROT_READ);
-
-	for (i = 0, j = 0; j < height / 2; ++j) {
-		if (ptr[j * width / 4] == SHADER_CANARY) {
-			++thread_count;
-			i = 4;
-		}
-
-		for (; i < width; i++)
-			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
-
-		i = 0;
-	}
-
-	for (i = 0, j = height / 2; j < height; ++j) {
-		if (ptr[j * width / 4] == SIP_CANARY) {
-			++sip_count;
-			i = 4;
-		}
-
-		for (; i < width; i++)
-			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
-
-		i = 0;
-	}
-
-	igt_assert(thread_count);
-	if (sip_type != SIP_NULL && xe_eudebug_debugger_available(fd))
-		igt_assert_f(thread_count == sip_count,
-			     "Thread and SIP count mismatch, %d != %d\n",
-			     thread_count, sip_count);
-	else
-		igt_assert(sip_count == 0);
-
-	munmap(ptr, sz);
-}
-
-static uint64_t
-xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
-{
-	int engine_fd = -1;
-	uint64_t ret;
-
-	engine_fd = xe_sysfs_engine_open(fd, eci->gt_id, eci->engine_class);
-	ret = igt_sysfs_get_u64(engine_fd, "job_timeout_ms");
-	close(engine_fd);
-
-	return ret;
-}
-
-/**
- * SUBTEST: wait-writesip-nodebug
- * Sub-category: EUdebug HW
- * Functionality: EU debugger SIP interaction
- * Description: verify that we don't enter SIP after wait with debugging disabled.
- *
- * SUBTEST: breakpoint-writesip-nodebug
- * Sub-category: EUdebug HW
- * Functionality: EU debugger SIP interaction
- * Description: verify that we don't enter SIP after hitting breakpoint in shader
- *		when debugging is disabled.
- *
- * SUBTEST: breakpoint-writesip
- * Sub-category: EUdebug HW
- * Functionality: EU debugger SIP interaction
- * Description: Test that we enter SIP after hitting breakpoint in shader.
- *
- * SUBTEST: breakpoint-writesip-twice
- * Sub-category: EUdebug HW
- * Functionality: EU debugger SIP interaction
- * Description: Test twice that we enter SIP after hitting breakpoint in shader.
- *
- * SUBTEST: breakpoint-waitsip
- * Sub-category: EUdebug HW
- * Functionality: EU debugger SIP interaction
- * Description: Test that we reset after seeing the attention without the debugger.
- *
- * SUBTEST: breakpoint-waitsip-heavy
- * Sub-category: EUdebug HW
- * Functionality: EU debugger SIP interaction
- * Description:
- *	Test that we reset after seeing the attention from heavy SIP, that resembles
- *	the production one, without the debugger.
- */
-static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
-		     struct drm_xe_engine_class_instance *eci, uint32_t flags)
-{
-	unsigned int threads = 512;
-	unsigned int height = max_t(threads, HEIGHT, threads * 2);
-	unsigned int width = WIDTH;
-	struct drm_xe_ext_set_property ext = {
-		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG,
-		.value = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE,
-	};
-	struct timespec ts = { };
-	uint32_t exec_queue_id, handle, vm_id;
-	bool debugger_enabled;
-	struct intel_bb *ibb;
-	uint64_t timeout;
-	int done, fd;
-
-	igt_debug("Using %s\n", xe_engine_class_string(eci->engine_class));
-
-	fd = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd);
-
-	debugger_enabled = xe_eudebug_debugger_available(fd);
-	vm_id = xe_vm_create(fd, debugger_enabled ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
-
-	/* Get timeout for job, and add 8s for devcoredump processing. */
-	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 8ull * MSEC_PER_SEC;
-	timeout *= NSEC_PER_MSEC;
-	timeout *= igt_run_in_simulation() ? 10 : 1;
-
-	exec_queue_id = xe_exec_queue_create(fd, vm_id, eci,
-					     debugger_enabled ? to_user_pointer(&ext) : 0);
-
-	done = flags & F_SUBMIT_TWICE ? 2 : 1;
-	do {
-		ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
-		intel_bb_set_lr_mode(ibb, debugger_enabled);
-
-		igt_nsec_elapsed(&ts);
-		handle = gpgpu_shader(fd, ibb, shader_type, sip_type, threads, width, height);
-
-		intel_bb_sync(ibb);
-		igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
-
-		check_buf(fd, handle, width, height, sip_type, COLOR_C4);
-
-		gem_close(fd, handle);
-		intel_bb_destroy(ibb);
-	} while (--done);
-
-	xe_exec_queue_destroy(fd, exec_queue_id);
-	xe_vm_destroy(fd, vm_id);
-	xe_device_put(fd);
-	close(fd);
-}
-
-#define test_render_and_compute(t, __fd, __eci) \
-	igt_subtest_with_dynamic(t) \
-		xe_for_each_engine(__fd, __eci) \
-			if (__eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
-			    __eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) \
-				igt_dynamic_f("%s%d", xe_engine_class_string(__eci->engine_class), \
-					      __eci->engine_instance)
-
-int igt_main()
-{
-	struct drm_xe_engine_class_instance *eci;
-	bool was_enabled;
-	int fd;
-
-	igt_fixture()
-		fd = drm_open_driver(DRIVER_XE);
-
-	/* Debugger disabled (TD_CTL not set) */
-	igt_subtest_group() {
-		igt_fixture() {
-			was_enabled = xe_eudebug_enable(fd, false);
-			igt_require(!xe_eudebug_debugger_available(fd));
-		}
-
-		test_render_and_compute("wait-writesip-nodebug", fd, eci)
-			test_sip(SHADER_WAIT, SIP_WRITE, eci, 0);
-
-		test_render_and_compute("breakpoint-writesip-nodebug", fd, eci)
-			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, 0);
-
-		igt_fixture()
-			xe_eudebug_enable(fd, was_enabled);
-	}
-
-	/* Debugger enabled (TD_CTL set) */
-	igt_subtest_group() {
-		igt_fixture() {
-			was_enabled = xe_eudebug_enable(fd, true);
-		}
-
-		test_render_and_compute("breakpoint-writesip", fd, eci)
-			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, 0);
-
-		test_render_and_compute("breakpoint-writesip-twice", fd, eci)
-			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, F_SUBMIT_TWICE);
-
-		test_render_and_compute("breakpoint-waitsip", fd, eci)
-			test_sip(SHADER_BREAKPOINT, SIP_WAIT, eci, 0);
-
-		test_render_and_compute("breakpoint-waitsip-heavy", fd, eci)
-			test_sip(SHADER_BREAKPOINT, SIP_HEAVY, eci, 0);
-
-		igt_fixture()
-			xe_eudebug_enable(fd, was_enabled);
-	}
-
-	igt_fixture()
-		drm_close_driver(fd);
-}
diff --git a/tests/meson.build b/tests/meson.build
index 779adfd71..7e6221b30 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -354,7 +354,6 @@ intel_xe_progs = [
 ]
 
 intel_xe_eudebug_progs = [
-	'xe_exec_sip_eudebug',
 	'xe_eudebug_online',
 	'xe_eudebug_sriov',
 ]
-- 
2.34.1


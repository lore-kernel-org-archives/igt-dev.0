Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C82C52D7C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 12:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB0010E8FA;
	Fri,  9 Aug 2024 12:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2JrmNP7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD8310E8FA
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 12:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723207185; x=1754743185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eMWbxojpsIQplwvtXREdbr14BfSCZKKZpVHJ8k7s4iM=;
 b=P2JrmNP7mNk2OM+Y8FcI9Cp1P7whpwB4tHOWYte/Oc8VKRU9YHCroUiv
 veHkd6GkoHnv8+Qf9HyLRBNZCBF1V3oHvnoipSrhjC30JtOUXnPo/4oJb
 pTtruZr9496g0fkjriNoaTDU+xh/gZdvvR4K6WyvEDebEv6WcJIbnTGWQ
 M9ZQVBIKiLnvutTVtMR6U+ah2kMoiqXYQOV1xc5ZSAnSK9HvjP10dDG8D
 aY9DiT268nQJiED0mka7ck+BQEXzIdpEmcbgx9ixJrQi949BlrwU9Kn3D
 WYCiVX2A4WWjD5LVcQwcYZ+99tlOAA5zXNH1fxgQrMRvRmoCJ8jhgE71+ g==;
X-CSE-ConnectionGUID: IdNfc7ZkSWGGkM3mjxHFcQ==
X-CSE-MsgGUID: NL/+YzJgRPGXH5SBUET1Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32525474"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="32525474"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:39:45 -0700
X-CSE-ConnectionGUID: qZnRw6tiTqqw4Twd11UutQ==
X-CSE-MsgGUID: CEUbCG4TTVapJwCMMHubkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57761544"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.4])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 05:39:41 -0700
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
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH i-g-t v3 11/14] tests/xe_exec_sip: Extend SIP interaction
 testing
Date: Fri,  9 Aug 2024 14:38:10 +0200
Message-Id: <20240809123813.109365-12-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809123813.109365-1-christoph.manszewski@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
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

Extend xe_exec_sip test by adding subtests that check SIP interaction
sanity with regard to resets and hardware debugging capabilities like
breakpoints, and invalid instruction exceptions.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_exec_sip.c | 332 +++++++++++++++++++++++++++++++++++---
 1 file changed, 310 insertions(+), 22 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 4b599e7f6..0db0dc4b8 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -21,6 +21,7 @@
 #include "gpgpu_shader.h"
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "xe/xe_eudebug.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -30,9 +31,29 @@
 #define COLOR_C4 0xc4
 
 #define SHADER_CANARY 0x01010101
+#define SIP_CANARY 0x02020202
 
 #define NSEC_PER_MSEC (1000 * 1000ull)
 
+#define SHADER_BREAKPOINT 0
+#define SHADER_WRITE 1
+#define SHADER_WAIT 2
+#define SHADER_INV_INSTR_DISABLED 3
+#define SHADER_INV_INSTR_THREAD_ENABLED 4
+#define SHADER_INV_INSTR_WALKER_ENABLED 5
+#define SHADER_HANG 6
+#define SIP_WRITE 7
+#define SIP_NULL 8
+#define SIP_WAIT 9
+#define SIP_HEAVY 10
+#define SIP_INV_INSTR 11
+
+#define F_SUBMIT_TWICE	(1 << 0)
+
+/* Control Register cr0.1 bits for exception handling */
+#define ILLEGAL_OPCODE_ENABLE BIT(12)
+#define ILLEGAL_OPCODE_STATUS BIT(28)
+
 static struct intel_buf *
 create_fill_buf(int fd, int width, int height, uint8_t color)
 {
@@ -52,24 +73,109 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
 	return buf;
 }
 
-static struct gpgpu_shader *get_shader(int fd)
+static struct gpgpu_shader *get_shader(int fd, const int shadertype)
 {
 	static struct gpgpu_shader *shader;
+	uint32_t bad;
 
 	shader = gpgpu_shader_create(fd);
+	if (shadertype == SHADER_INV_INSTR_WALKER_ENABLED)
+		shader->illegal_opcode_exception_enable = true;
+
 	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+
+	switch (shadertype) {
+	case SHADER_HANG:
+		gpgpu_shader__label(shader, 0);
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__jump(shader, 0);
+		break;
+	case SHADER_WAIT:
+		gpgpu_shader__wait(shader);
+		break;
+	case SHADER_WRITE:
+		break;
+	case SHADER_BREAKPOINT:
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__breakpoint(shader);
+		break;
+	case SHADER_INV_INSTR_THREAD_ENABLED:
+		gpgpu_shader__set_exception(shader, ILLEGAL_OPCODE_ENABLE);
+		/* fall through */
+	case SHADER_INV_INSTR_DISABLED:
+	case SHADER_INV_INSTR_WALKER_ENABLED:
+		bad = (shadertype == SHADER_INV_INSTR_DISABLED) ? ILLEGAL_OPCODE_ENABLE : 0;
+		gpgpu_shader__write_on_exception(shader, 1, 0, ILLEGAL_OPCODE_ENABLE, bad);
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__nop(shader);
+		/* modify second nop, set only opcode bits[6:0] */
+		shader->instr[shader->size/4 - 1][0] = 0x7f;
+		/* SIP should clear exception bit */
+		bad = ILLEGAL_OPCODE_STATUS;
+		gpgpu_shader__write_on_exception(shader, 2, 0, ILLEGAL_OPCODE_STATUS, bad);
+		break;
+	}
+
 	gpgpu_shader__eot(shader);
 	return shader;
 }
 
-static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, unsigned int threads,
-			     unsigned int width, unsigned int height)
+static struct gpgpu_shader *get_sip(int fd, const int siptype,
+				    const int shadertype, unsigned int y_offset)
+{
+	static struct gpgpu_shader *sip;
+
+	if (siptype == SIP_NULL)
+		return NULL;
+
+	sip = gpgpu_shader_create(fd);
+	gpgpu_shader__write_dword(sip, SIP_CANARY, y_offset);
+
+	switch (siptype) {
+	case SIP_WRITE:
+		break;
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
+	case SIP_INV_INSTR:
+		gpgpu_shader__write_on_exception(sip, 1, y_offset, ILLEGAL_OPCODE_STATUS, 0);
+		break;
+	}
+
+	gpgpu_shader__end_system_routine(sip, shadertype == SHADER_BREAKPOINT);
+	return sip;
+}
+
+static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, const int shadertype, const int siptype,
+			     unsigned int threads, unsigned int width, unsigned int height)
 {
 	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
-	struct gpgpu_shader *shader = get_shader(fd);
+	struct gpgpu_shader *sip = get_sip(fd, siptype, shadertype, height / 2);
+	struct gpgpu_shader *shader = get_shader(fd, shadertype);
 
-	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
+	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
+
+	if (sip)
+		gpgpu_shader_destroy(sip);
 	gpgpu_shader_destroy(shader);
+
 	return buf->handle;
 }
 
@@ -83,11 +189,11 @@ static void check_fill_buf(uint8_t *ptr, const int width, const int x,
 		     color, val, x, y);
 }
 
-static void check_buf(int fd, uint32_t handle, int width, int height,
-		      uint8_t poison_c)
+static int check_buf(int fd, uint32_t handle, int width, int height,
+		      int shadertype, int siptype, uint8_t poison_c)
 {
 	unsigned int sz = ALIGN(width * height, 4096);
-	int thread_count = 0;
+	int thread_count = 0, sip_count = 0;
 	uint32_t *ptr;
 	int i, j;
 
@@ -105,9 +211,87 @@ static void check_buf(int fd, uint32_t handle, int width, int height,
 		i = 0;
 	}
 
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
 	igt_assert(thread_count);
+	if (shadertype == SHADER_INV_INSTR_DISABLED)
+		igt_assert(!sip_count);
+	else if ((siptype != SIP_NULL && xe_eudebug_debugger_available(fd)) ||
+		 (siptype == SIP_INV_INSTR && shadertype != SHADER_INV_INSTR_DISABLED))
+		igt_assert_f(thread_count == sip_count,
+			     "Thread and SIP count mismatch, %d != %d\n",
+			     thread_count, sip_count);
+	else
+		igt_assert(sip_count == 0);
 
 	munmap(ptr, sz);
+
+	return sip_count;
+}
+
+#define USERCOREDUMP_FORMAT "usercoredumps/%d/%d"
+static char *get_latest_usercoredump(int dir)
+{
+	char tmp[256];
+	int i = 1;
+
+	do {
+		snprintf(tmp, sizeof(tmp), USERCOREDUMP_FORMAT, getpid(), i++);
+	} while (igt_sysfs_has_attr(dir, tmp));
+
+	snprintf(tmp, sizeof(tmp), USERCOREDUMP_FORMAT, getpid(), i-2);
+	return igt_sysfs_get(dir, tmp);
+}
+
+static void check_usercoredump(int fd, int sip, int dispatched)
+{
+	int dir = igt_debugfs_dir(fd);
+	char *usercoredump, *str;
+	unsigned int before, after;
+	char match[256];
+
+	if (sip != SIP_WAIT && sip != SIP_HEAVY)
+		return;
+
+	/* XXX reinstate when offline coredumps are implemented */
+#ifndef XXX_ATTENTIONS_THROUGH_COREDUMPS
+	return;
+#endif
+	usercoredump = get_latest_usercoredump(dir);
+	igt_assert(usercoredump);
+	igt_debug("%s\n", usercoredump);
+
+	snprintf(match, sizeof(match), "PID: %d", getpid());
+	str = strstr(usercoredump, match);
+	igt_assert(str);
+
+	snprintf(match, sizeof(match), "Comm: %s", igt_test_name());
+	str = strstr(str, match);
+	igt_assert(str);
+
+	str = strstr(str, "TD_ATT");
+	igt_assert(str);
+	igt_assert_eq(sscanf(str, "TD_ATT before (%d):", &before), 1);
+	str = strstr(str + 1, "TD_ATT");
+	igt_assert_eq(sscanf(str, "TD_ATT after (%d):", &after), 1);
+
+	igt_info("attentions %d before, %d after\n", before, after);
+
+	igt_assert_eq(before, dispatched);
+	igt_assert_eq(after, dispatched);
+
+	free(usercoredump);
+	close(dir);
 }
 
 static uint64_t
@@ -128,17 +312,58 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * Description: check basic shader with write operation
  * Run type: BAT
  *
+ * SUBTEST: sanity-after-timeout
+ * Description: check basic shader execution after job timeout
+ *
+ * SUBTEST: wait-writesip-nodebug
+ * Description: verify that we don't enter SIP after wait with debugging disabled.
+ *
+ * SUBTEST: invalidinstr-disabled
+ * Description: Verify that we don't enter SIP after running into an invalid
+ *		instruction when exception is not enabled.
+ *
+ * SUBTEST: invalidinstr-thread-enabled
+ * Description: Verify that we enter SIP after running into an invalid instruction
+ *              when exception is enabled from thread.
+ *
+ * SUBTEST: invalidinstr-walker-enabled
+ * Description: Verify that we enter SIP after running into an invalid instruction
+ *              when exception is enabled from COMPUTE_WALKER.
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
  */
-static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
+static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *eci, uint32_t flags)
 {
 	unsigned int threads = 512;
 	unsigned int height = max_t(threads, HEIGHT, threads * 2);
-	uint32_t exec_queue_id, handle, vm_id;
 	unsigned int width = WIDTH;
+	struct drm_xe_ext_set_property ext = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG,
+		.value = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE,
+	};
 	struct timespec ts = { };
-	uint64_t timeout;
+	int done = 0;
+	uint32_t exec_queue_id, handle, vm_id;
 	struct intel_bb *ibb;
-	int fd;
+	uint64_t timeout;
+	int dispatched, fd;
 
 	igt_debug("Using %s\n", xe_engine_class_string(eci->engine_class));
 
@@ -152,19 +377,24 @@ static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
 	timeout *= NSEC_PER_MSEC;
 	timeout *= igt_run_in_simulation() ? 10 : 1;
 
-	exec_queue_id = xe_exec_queue_create(fd, vm_id, eci, 0);
-	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
+	exec_queue_id = xe_exec_queue_create(fd, vm_id, eci,
+					     xe_eudebug_debugger_available(fd) ?
+					     to_user_pointer(&ext) : 0);
+	do {
+		ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
 
-	igt_nsec_elapsed(&ts);
-	handle = gpgpu_shader(fd, ibb, threads, width, height);
+		igt_nsec_elapsed(&ts);
+		handle = gpgpu_shader(fd, ibb, shader, sip, threads, width, height);
 
-	intel_bb_sync(ibb);
-	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
+		intel_bb_sync(ibb);
+		igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
 
-	check_buf(fd, handle, width, height, COLOR_C4);
+		dispatched = check_buf(fd, handle, width, height, shader, sip, COLOR_C4);
+		check_usercoredump(fd, sip, dispatched);
 
-	gem_close(fd, handle);
-	intel_bb_destroy(ibb);
+		gem_close(fd, handle);
+		intel_bb_destroy(ibb);
+	} while (!done++ && (flags & F_SUBMIT_TWICE));
 
 	xe_exec_queue_destroy(fd, exec_queue_id);
 	xe_vm_destroy(fd, vm_id);
@@ -183,13 +413,71 @@ static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
 igt_main
 {
 	struct drm_xe_engine_class_instance *eci;
+	bool was_enabled;
 	int fd;
 
 	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
 
 	test_render_and_compute("sanity", fd, eci)
-		test_sip(eci, 0);
+		test_sip(SHADER_WRITE, SIP_NULL, eci, 0);
+
+	test_render_and_compute("sanity-after-timeout", fd, eci) {
+		test_sip(SHADER_HANG, SIP_NULL, eci, 0);
+
+		xe_for_each_engine(fd, eci)
+			if (eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+			    eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+				test_sip(SHADER_WRITE, SIP_NULL, eci, 0);
+	}
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
+		test_render_and_compute("invalidinstr-disabled", fd, eci)
+			test_sip(SHADER_INV_INSTR_DISABLED, SIP_INV_INSTR, eci, 0);
+
+		test_render_and_compute("invalidinstr-thread-enabled", fd, eci)
+			test_sip(SHADER_INV_INSTR_THREAD_ENABLED, SIP_INV_INSTR, eci, 0);
+
+		test_render_and_compute("invalidinstr-walker-enabled", fd, eci)
+			test_sip(SHADER_INV_INSTR_WALKER_ENABLED, SIP_INV_INSTR, eci, 0);
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
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.34.1

